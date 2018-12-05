import QtQuick 2.4

Item {
    id: weather
    width: 400
    height: 400
    Timer {
        interval: 1
        running: true
        onTriggered: weatherhandler.reloadFore()
    }
    Timer {
        interval: 3600000
        running: true
        repeat: true
        onTriggered: {
            weatherhandler.reloadFore()
            weatherhandler.reloadCurr()
            currenticon1.source = weatherhandler.getcurrIcon()
            currenttemp1.text = weatherhandler.getcurrTemp()
            minmaxtemp1.text = weatherhandler.getminmax()
            currentdesc1.text = weatherhandler.getcurrDesc()
        }
    }
    Image {
        id: currenticon1
        width: 80
        height: 67
        anchors.top: parent.top
        anchors.topMargin: 125
        anchors.left: parent.left
        anchors.leftMargin: 30
        source: weatherhandler.getcurrIcon()
    }

    Text {
        id: currenttemp1
        width: 80
        height: 50
        color: "#ffffff"
        text: weatherhandler.getcurrTemp()
        font.family: "SFNS Display"
        font.styleName: "Thin"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.top: parent.top
        anchors.topMargin: 207
        font.pixelSize: 68
    }

    Text {
        id: minmaxtemp1
        x: -9
        y: -9
        width: 80
        height: 30
        color: "#ffffff"
        text: weatherhandler.getminmax()
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: 270
        anchors.top: parent.top
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
        anchors.leftMargin: 40
        anchors.left: parent.left
        font.family: "SFNS Display"
        font.styleName: "Thin"
    }

    Text {
        id: currentdesc1
        x: -15
        y: -3
        width: 100
        height: 30
        color: "#ffffff"
        text: weatherhandler.getcurrDesc()
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: 313
        anchors.top: parent.top
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 40
        anchors.leftMargin: 40
        anchors.left: parent.left
        font.family: "SFNS Display"
        font.styleName: "Thin"
    }

    ForecastForm {
        id: fore1
        objectName: "fore1"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ForecastForm {
        id: fore2
        objectName: "fore2"
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ForecastForm {
        id: fore3
        objectName: "fore3"
        x: 152
        y: 10
        anchors.left: parent.left
        anchors.leftMargin: 140
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ForecastForm {
        id: fore4
        objectName: "fore4"
        anchors.left: parent.left
        anchors.leftMargin: 210
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ForecastForm {
        id: fore5
        objectName: "fore5"
        x: 0
        y: 6
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.leftMargin: 280
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
