import QtQuick 2.11
import QtQuick.Window 2.11
import QtWebEngine 1.7


Window {
    id: window
    visible: true
    width: 1080
    height: 1920
    title: qsTr("Hello World")
    property bool plein: false
    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        color: "#313131"
        anchors.centerIn: parent

        NewsForm {
            id: newsForm
            x: 540
            y: 1560
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }

        NotesreceiverForm {
            id: notesreceiverForm
            y: 1560
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }


    }
    Item {
        id: travelitem
        x: 830
        width: 200
        height: 100
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 206
        Timer{
            interval : 3600000; running: true; repeat: true;
            onTriggered: {
                traveltext.text = travelhandler.getTime()
            }
        }
        Image {
            id: travelicon
            y: 63
            width: 75
            height: 75
            anchors.verticalCenterOffset: 1
            anchors.left: parent.left
            anchors.leftMargin: -58
            anchors.verticalCenter: parent.verticalCenter
            source: "Sources/bus.png"
        }

        Text {
            id: traveltext
            x: 92
            y: 76
            width: 110
            height: 50
            color: "#ffffff"
            text: travelhandler.getTime()
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.family: "SFNS Display"
            font.styleName: "Thin"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }
    }


    HourForm {
        id: hourForm
        x: 1450
        y: 1050
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 50
    }


    WeatherForm {
        id: weatherForm
        x: 1450
        y: 470
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 50

        Item{
            id: container
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            width : 700; height: 800
            Drag.active: containerdragArea.active
            MouseArea{
                id : containerdragArea
                anchors.fill: parent
                drag.target: parent
            }
        }
        Image {
            id: homekiticon
            x: -35
            y: 922
            width: 100
            height: 100
            source: "Sources/applehomeicon.png"
            Drag.active: dragArea.drag.active
            MouseArea {
                id: dragArea
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                drag.target: homekiticon
                onClicked: {
                    if (plein === false){
                        var component = Qt.createComponent("HomeKit.qml");
                        var object = component.createObject(container)
                        plein = true
                    }
                }
            }
        }
        Siri {
            property bool siric: false
            OpacityAnimator{
                id: onsiri
                target :siri;
                from : 0;
                to: 1;
                duration: 400
                running: true
            }
            OpacityAnimator{
                id: offsiri
                target :siri;
                from : 1;
                to: 0;
                duration: 400
                running: true
            }
            onSiricChanged: {
                if (siric === false){
                    offsiri.start()
                    visible = false
                }
                if (siric === true){
                    onsiri.start()
                    visible = true
                }
            }
            id: siri
            objectName: "siribox"
            visible : false
            x: -470
            y: 650
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }

    Image {
        id: agendaicon
        x: 16
        y: 838
        width: 100
        height: 100
        source: "Sources/agendaicon.png"

        MouseArea {
            id: mouseArea
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked:{
                agenda.visible = !agenda.visible
            }
        }
    }
    Item{
        id : testagenda
        width: 800
        height: 730
        WebEngineView{
            id: agenda
            width: 800
            height: 700
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            url : "https://calendar.google.com/calendar/r"
            settings.javascriptEnabled: true
        }

        Rectangle {
            id: rectangle
            x: 14
            width: 800
            height: 30
            color: "#8b8282"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            Drag.active: dragareaagenda.drag.active
            MouseArea{
                id: dragareaagenda
                drag.target : testagenda
                anchors.fill: parent
            }
        }
    }
}


/*##^## Designer {
    D{i:22;anchors_y:38}D{i:19;anchors_height:100;anchors_width:100;anchors_x:278;anchors_y:"-35"}
}
 ##^##*/
