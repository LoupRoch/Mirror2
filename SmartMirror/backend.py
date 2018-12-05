#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, QThread, Signal, Slot, QStringListModel
import sys, time, requests, json, feedparser
import paho.mqtt.client as mqtt
from serial import Serial

class TimeHandler(QObject):
    def __init__(self, context, parent=None):
        super(TimeHandler, self).__init__(parent)
        self.win = parent
    @Slot(result=str)
    def getHour(self):
        return time.strftime("%H:%M")

    @Slot(result=str)
    def getDate(self):
        return time.strftime("%A %d %B")

class WeatherHandler(QObject):
    def __init__(self, context, parent=None):
        super(WeatherHandler, self).__init__(parent)
        self.win= parent
        self.r= requests.get("http://api.openweathermap.org/data/2.5/forecast?q=Sceaux,fr&units=metric&APPID=69637d5982d1c0566ba3bdd463f330d5")
        self.text= json.loads(self.r.text)
        self.liste = [self.text["list"][x] for x in range(0, 40, 8)]
        self.currentr = requests.get("http://api.openweathermap.org/data/2.5/weather?q=Sceaux,fr&units=metric&APPID=69637d5982d1c0566ba3bdd463f330d5")
        self.currenttext= json.loads(self.currentr.text)

    @Slot()
    def reloadFore(self):
        self.r = requests.get("http://api.openweathermap.org/data/2.5/forecast?q=Sceaux,fr&units=metric&APPID=69637d5982d1c0566ba3bdd463f330d5")
        self.text= json.loads(self.r.text)
        self.liste = [self.text["list"][x] for x in range(0, 40, 8)]
        for x in range(1, 6):
            self.win.findChild(QObject, "fore{}".format(x)).setProperty("daytext", self.getDay(x))
            self.win.findChild(QObject, "fore{}".format(x)).setProperty("iconsource", self.getIcon(x))
            self.win.findChild(QObject, "fore{}".format(x)).setProperty("temptext", self.getforeTemp(x))

    @Slot(int, result=str)
    def getIcon(self, id):
        self.icon_list= [x["weather"][0]["icon"] for x in self.liste]
        return "Sources/{}.png".format(self.icon_list[id-1])

    @Slot(int, result=str)
    def getforeTemp(self, id):
        self.weatherlist = [x["main"]["temp"] for x in self.liste]
        return "{}°".format(int(self.weatherlist[id-1]))

    @Slot(int, result=str)
    def getDay(self, id):
        self.daydic = {
            "lundi" : ["Lun", "Mar", "Mer", "Jeu", "Ven"],
            "mardi" : ["Mar", "Mer", "Jeu", "Ven", "Sam"],
            "mercredi" : ["Mer", "Jeu", "Ven", "Sam", "Dim"],
            "jeudi" : ["Jeu", "Ven", "Sam", "Dim", "Lun"],
            "vendredi" : ["Ven", "Sam", "Dim", "Lun", "Mar"],
            "samedi" : ["Sam", "Dim", "Lun", "Mar", "Mer"],
            "dimanche" : ["Dim", "Lun", "Mar", "Mer", "Jeu"],

        }
        return str(self.daydic[time.strftime("%A")][id-1])

    @Slot()
    def reloadCurr(self):
        self.currentr = requests.get("http://api.openweathermap.org/data/2.5/weather?q=Sceaux,fr&units=metric&APPID=69637d5982d1c0566ba3bdd463f330d5")
        self.currenttext= json.loads(self.currentr.text)

    @Slot(result=str)
    def getcurrIcon(self):
        return "Sources/{}.png".format(self.currenttext["weather"][0]["icon"])

    @Slot(result=str)
    def getcurrTemp(self):
        return "{}°".format(int(self.currenttext["main"]["temp"]))

    @Slot(result=str)
    def getminmax(self):
        return "{}°/{}°".format(int(self.currenttext["main"]["temp_min"]), int(self.currenttext["main"]["temp_max"]))

    @Slot(result=str)
    def getcurrDesc(self):
        return self.currenttext["weather"][0]["main"]

class MQTTthread(QThread):
    def run(win):
        mqttclient= mqtt.Client()
        HOTWORD = "hermes/hotword/default/detected"
        INTENT = "hermes/intent/searchWeatherForecast"
        siriON = "hermes/hotword/toggleOff"
        siriOFF = ["hermes/nlu/intentParsed", "hermes/error/nlu", "hermes/nlu/intentNotRecognized"]
        mqttclient.connect("192.168.0.25", 1883, 60)
        mqttclient.subscribe(HOTWORD)
        mqttclient.subscribe(INTENT)
        mqttclient.subscribe(siriON)
        mqttclient.subscribe("testtopic")
        for x in siriOFF:
            mqttclient.subscribe(x)
        def on_message(p, a, message):
            if message.topic == HOTWORD:
                print(message.payload.decode("utf-8"))
                communicate.mqttsignal.emit("Jarvis détecté")
            if message.topic == INTENT:
                print("Intent recognized")
                communicate.mqttsignal.emit("Intent reconu")
            if message.topic == siriON:
                communicate.sirichange.emit(True)
            if message.topic in siriOFF:
                communicate.sirichange.emit(False)
            if message.topic == "testtopic":
                communicate.mqttsignal.emit(message.payload.decode("utf-8"))
        mqttclient.on_message = on_message
        mqttclient.loop_forever()

class Communicate(QObject):
    mqttsignal = Signal(str)
    sirichange = Signal(bool)

class ArduinoHandler(QObject):
    def __init__(self, context, parent=None):
        super(ArduinoHandler, self).__init__(parent)
        self.win = parent
        self.port= Serial("/dev/ttyACM0", 9600)
    @Slot(str)
    def sendCommand(self, code):
        self.port.write(code.encode("utf-8"))

class NewsHandler(QObject):
    def __init__(self, context, parent=None):
        super(NewsHandler, self).__init__(parent)
        self.win = parent
        self.ctx = context

    @Slot(result=str)
    def getNews(self):
        self.headlinesurl = "https://news.google.com/?hl=fr&gl=FR&ceid=FR:fr&output=rss"
        self.feed= feedparser.parse(self.headlinesurl)
        self.newslist =[post.title for post in self.feed.entries[1:6]]
        return "\n".join(self.newslist)

    @Slot()
    def getListNews(self):
        self.headlinesurl = "https://news.google.com/?hl=fr&gl=FR&ceid=FR:fr&output=rss"
        self.feed= feedparser.parse(self.headlinesurl)
        self.newslist =[post.title for post in self.feed.entries[1:6]]
        self.newsmodel = QStringListModel()
        self.newsmodel.setStringList(self.newslist)
        self.ctx.setContextProperty("newsmodel", self.newsmodel)

class TravelHandler(QObject):
    def __init__(self, context, parent=None):
        super(TravelHandler, self).__init__(parent)
        self.win =parent

    @Slot(result=str)
    def getTime(self):
        self.r = requests.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=Sceaux+fr&units=metric&departure_time=now&destinations=Paris+fr&mode=transit&language=fr-FR&key=AIzaSyBhKp3OyRMoWINT5x9vWh5LF3nQQwQZUmU")
        self.res = json.loads(self.r.text)
        return str(self.res["rows"][0]["elements"][0]["duration"]["text"])

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    ctx = engine.rootContext()
    engine.load("main.qml")
    win = engine.rootObjects()[0]
    timehandler = TimeHandler(ctx, win)
    ctx.setContextProperty("timehandler", timehandler)
    weatherhandler= WeatherHandler(ctx, win)
    ctx.setContextProperty("weatherhandler", weatherhandler)
    #arduinohandler = ArduinoHandler(ctx, win)
    #ctx.setContextProperty("arduinohandler", arduinohandler)
    travelhandler= TravelHandler(ctx, win)
    ctx.setContextProperty("travelhandler", travelhandler)
    newshandler= NewsHandler(ctx, win)
    ctx.setContextProperty("newshandler", newshandler)
    def saywords(words):
        win.findChild(QObject, "notesbox").setProperty('text', win.findChild(QObject, "notesbox").property("text")+"\n"+words)
    def sirichanger(state):
        win.findChild(QObject, "siribox").setProperty("siric", state)
    mqttthread= MQTTthread(win)
    communicate = Communicate()
    communicate.mqttsignal.connect(saywords)
    communicate.sirichange.connect(sirichanger)
    mqttthread.start()
    win.showFullScreen()
    sys.exit(app.exec_())
