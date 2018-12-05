import QtQuick 2.4

Item {
    width: 100
    height: 110
    property string daytext: "Lun"
    property string iconsource: "Sources/01d.png"
    property string temptext: "14°"

    Text {
        id: day
        width: 40
        height: 20
        color: "#ffffff"
        text: daytext
        font.styleName: "Regular"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: "SFNS Display"
        anchors.leftMargin: 30
        verticalAlignment: Text.AlignVCenter
    }

    Image {
        id: icon
        x: -2
        y: -2
        width: 50
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        source: iconsource
        anchors.topMargin: 36
        anchors.leftMargin: 30
    }

    Text {
        id: temp
        x: 8
        y: -9
        width: 40
        height: 20
        color: "#ffffff"
        text: temptext
        font.styleName: "Regular"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 82
        font.family: "SFNS Display"
        anchors.leftMargin: 30
        verticalAlignment: Text.AlignVCenter
    }
}
