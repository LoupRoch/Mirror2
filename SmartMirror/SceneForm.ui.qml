import QtQuick 2.4

Item {
    width: 210
    height: 210
    property string iconOff: "Sources/bulboff.png"
    property string iconOn: "Sources/bulbon.png"
    Rectangle {
        id: lightbackground1
        width: 210
        height: 210
        radius: 25
        color: "#000000"
        opacity: 0.20
        border.width: 0

        Image {
            id: bulbicon1
            width: 125
            height: 125
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.top: parent.top
            anchors.topMargin: 0
            source: iconOff
        }

        Text {
            id: place1
            width: 100
            height: 20
            text: qsTr("Chambre")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 62
            anchors.left: parent.left
            anchors.leftMargin: 13
            font.family: "SFNS Display"
            font.styleName: "Regular"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        Text {
            id: name1
            width: 100
            height: 20
            text: qsTr("Principale")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 35
            anchors.left: parent.left
            anchors.leftMargin: 13
            font.family: "SFNS Display"
            font.styleName: "Thin"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        Text {
            id: state1
            x: 13
            y: 105
            width: 50
            height: 30
            text: qsTr("Off")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            font.family: "SFNS Display"
            font.styleName: "UltraLight"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                if (state1.text === "Off") {
                    lightbackground1.opacity = 1
                    lightbackground1.color = "#ffffff"
                    state1.text = "On"
                    bulbicon1.source = iconOn
                } else {
                    lightbackground1.color = "#000000"
                    lightbackground1.opacity = 0.20
                    state1.text = "Off"
                    bulbicon1.source = iconOff
                }
            }
        }
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
