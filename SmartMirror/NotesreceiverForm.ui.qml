import QtQuick 2.4

Item {
    id: item1
    width: 540
    height: 360

    Text {
        id: notestitle
        x: 125
        width: 400
        height: 40
        color: "#ffffff"
        text: qsTr("Notes :")
        font.family: "SFNS Display"
        font.styleName: "Thin"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 8
        font.pixelSize: 35
    }

    Text {
        id: notesbox
        objectName: "notesbox"
        x: 0
        y: 60
        width: 510
        height: 300
        color: "#ffffff"
        text: qsTr("Test")
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        font.family: "SFNS Display"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 25
    }
}


/*##^## Designer {
    D{i:2;anchors_y:8}
}
 ##^##*/
