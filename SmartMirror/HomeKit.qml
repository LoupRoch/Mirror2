import QtQuick 2.11

HomekitForm{
    id : homekit
    width : 700; height: 800
    opacity: 0
    OpacityAnimator{
        target: homekit;
        from : 0;
        to : 1;
        duration: 400
        running: true
    }

    Image {
        id: image
        x: 652
        width: 30
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 10
        source: "Sources/close.png"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                homekit.destroy();
                plein = false
            }
        }
    }
}

/*##^## Designer {
    D{i:4;anchors_height:35;anchors_width:35;anchors_x:0;anchors_y:3}D{i:3;anchors_y:0}
}
 ##^##*/
