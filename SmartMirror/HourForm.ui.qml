import QtQuick 2.4

Item {
    id: hourform
    width: 400
    height: 150
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: hour.text = timehandler.getHour()
    }
    Timer {
        interval: 3600
        running: true
        repeat: true
        onTriggered: date.text = timehandler.getDate()
    }

    Text {
        id: hour
        x: 100
        width: 300
        height: 100
        color: "#ffffff"
        text: timehandler.getHour()
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 90
        font.family: "SFNS Display"
        font.styleName: "UltraLight"
    }

    Text {
        id: date
        x: 0
        width: 400
        height: 50
        color: "#ffffff"
        text: timehandler.getDate()
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 101
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 30
        font.family: "SFNS Display"
        font.styleName: "Thin"
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
