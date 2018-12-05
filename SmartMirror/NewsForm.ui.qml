import QtQuick 2.4

Item {
    id: item1
    width: 540
    height: 360

    Timer {
        interval: 3600000
        running: true
        repeat: true
        onTriggered: {
            newsbox.text = newshandler.getNews()
        }
    }
    Text {
        id: newstitle
        x: 175
        width: 250
        height: 40
        color: "#ffffff"
        text: qsTr("Actualités")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "SFNS Display"
        font.styleName: "Thin"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 4
        font.pixelSize: 35
    }

    Text {
        id: newsbox
        x: 0
        width: 540
        height: 310
        color: "#ffffff"
        text: newshandler.getNews()
        wrapMode: Text.WrapAnywhere
        anchors.top: parent.top
        anchors.topMargin: 50
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        font.family: "SFNS Display"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
    }
}
