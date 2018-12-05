import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    width: 700
    height: 800

    Rectangle {
        id: homekitbackground
        width: 700
        height: 800
        color: "#ffffff"
        radius: 45
        border.width: 0
        opacity: 0.90
        anchors.fill: parent

        Image {
            id: homekiticon
            width: 75
            height: 75
            opacity: 0.5
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            source: "Sources/appleticon.png"
        }

        Text {
            id: text1titletext
            width: 200
            height: 30
            text: qsTr("Objets Connectés")
            font.family: "SFNS Display"
            font.styleName: "Bold"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 43
            font.pixelSize: 20
        }
    }

    SceneForm {
        id: sceneForm1
        x: 25
        y: 110
        objectName: "sceneForm1"
        width: 210
        height: 210
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.top: parent.top
        anchors.topMargin: 110
    }

    SceneForm {
        id: sceneForm2
        x: 245
        y: 110
        width: 210
        height: 210
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
        objectName: "sceneForm1"
    }

    SceneForm {
        id: sceneForm3
        x: 465
        y: 110
        width: 210
        height: 210
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.topMargin: 110
        objectName: "sceneForm1"
        anchors.top: parent.top
    }

    SceneForm {
        id: sceneForm4
        x: 25
        y: 335
        width: 210
        height: 210
        anchors.topMargin: 335
        objectName: "sceneForm1"
        anchors.leftMargin: 25
        anchors.top: parent.top
        anchors.left: parent.left
    }

    SceneForm {
        id: sceneForm5
        x: 245
        y: 335
        width: 210
        height: 210
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 335
        objectName: "sceneForm1"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    SceneForm {
        id: sceneForm6
        x: 465
        y: 335
        width: 210
        height: 210
        anchors.topMargin: 335
        objectName: "sceneForm1"
        anchors.top: parent.top
        anchors.rightMargin: 25
        anchors.right: parent.right
    }

    SceneForm {
        id: sceneForm7
        x: 617
        y: 599
        width: 210
        height: 210
        anchors.topMargin: 556
        objectName: "sceneForm1"
        anchors.leftMargin: 25
        anchors.top: parent.top
        anchors.left: parent.left
    }

    SceneForm {
        id: sceneForm8
        x: 245
        y: 556
        width: 210
        height: 210
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 556
        objectName: "sceneForm1"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    SceneForm {
        id: sceneForm9
        x: 465
        y: 556
        width: 210
        height: 210
        anchors.topMargin: 556
        objectName: "sceneForm1"
        anchors.top: parent.top
        anchors.rightMargin: 25
        anchors.right: parent.right
    }

    Rectangle {
        id: scenesbackground
        x: 292
        width: 100
        height: 30
        color: "#ffffff"
        radius: 10
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 43

        Text {
            id: scenestext
            x: 0
            width: 100
            height: 20
            text: qsTr("Scenes")
            font.family: "SFNS Display"
            font.styleName: "Bold"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pixelSize: 15
        }
    }
}


/*##^## Designer {
    D{i:13;anchors_x:20;anchors_y:110}
}
 ##^##*/
