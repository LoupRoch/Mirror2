import QtQuick 2.4

Item {
    width: 540
    height: 360

    Image {
        id: iconnews
        x: 206
        y: 8
        source: "Sources/newspaper.png"
    }

    Text {
        id: currentnews
        x: 0
        y: 160
        width: 540
        height: 200
        color: "#ffffff"
        text: qsTr("Text")
        wrapMode: Text.WrapAnywhere
        verticalAlignment: Text.AlignVCenter
        font.family: "SFNS Display"
        font.styleName: "Thin"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
    }
}
