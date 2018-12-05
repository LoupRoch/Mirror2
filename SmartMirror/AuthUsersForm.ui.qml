import QtQuick 2.4

Item {
    id: item1
    width: 400
    height: 700

    Image {
        id: netflixicon1
        x: 292
        width: 100
        height: 100
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        source: "Sources/netflixuser3.png"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                logout.visible = true
            }
        }
    }

    Image {
        id: netflixicon2
        x: 292
        width: 100
        height: 100
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 150
        source: "Sources/netflixuser1.png"

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                logout.visible = true
            }
        }
    }

    Image {
        id: netflixicon3
        x: 290
        y: 6
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 290
        source: "Sources/netflixuser5.png"
        anchors.rightMargin: 10

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                logout.visible = true
            }
        }
    }

    Image {
        id: netflixicon4
        x: 281
        y: 1
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 430
        anchors.rightMargin: 10
        source: "Sources/netflixuser4.png"

        MouseArea {
            id: mouseArea3
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                logout.visible = true
            }
        }
    }

    Image {
        id: netflixicon5
        x: 277
        y: 5
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 570
        source: "Sources/netflixuser2.png"
        anchors.rightMargin: 10

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                logout.visible = true
            }
        }
    }

    Text {
        id: netflixuser1
        x: 84
        width: 200
        height: 40
        text: qsTr("Louise")
        font.family: "SFNS Display"
        font.styleName: "Thin"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        anchors.right: parent.right
        anchors.rightMargin: 120
        anchors.top: parent.top
        anchors.topMargin: 40
        font.pixelSize: 40
    }

    Text {
        id: netflixuser2
        x: 84
        y: 3
        width: 200
        height: 40
        text: qsTr("Jean-Loup")
        anchors.top: parent.top
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        font.pixelSize: 40
        anchors.topMargin: 180
        anchors.rightMargin: 116
        horizontalAlignment: Text.AlignRight
        font.family: "SFNS Display"
        font.styleName: "Thin"
    }

    Text {
        id: netflixuser3
        x: 84
        y: 3
        width: 200
        height: 40
        text: qsTr("Jean-Roch")
        anchors.top: parent.top
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        font.pixelSize: 40
        anchors.topMargin: 320
        anchors.rightMargin: 116
        font.family: "SFNS Display"
        font.styleName: "Thin"
        horizontalAlignment: Text.AlignRight
    }

    Text {
        id: netflixuser4
        x: 84
        y: -2
        width: 200
        height: 40
        text: qsTr("Papa")
        anchors.top: parent.top
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        font.pixelSize: 40
        anchors.topMargin: 460
        anchors.rightMargin: 116
        font.family: "SFNS Display"
        font.styleName: "Thin"
        horizontalAlignment: Text.AlignRight
    }

    Text {
        id: netflixuser5
        x: 84
        y: -4
        width: 200
        height: 40
        text: qsTr("Maman")
        anchors.top: parent.top
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        font.pixelSize: 40
        anchors.topMargin: 600
        anchors.rightMargin: 116
        font.family: "SFNS Display"
        font.styleName: "Thin"
        horizontalAlignment: Text.AlignRight
    }

}

/*##^## Designer {
    D{i:2;anchors_y:8}D{i:4;anchors_y:134}D{i:3;anchors_y:134}D{i:6;anchors_y:134}D{i:5;anchors_y:134}
D{i:8;anchors_y:40}D{i:10;anchors_y:40}D{i:9;anchors_y:40}D{i:11;anchors_y:40}D{i:12;anchors_y:40}
D{i:13;anchors_height:100;anchors_width:100;anchors_x:0;anchors_y:0}D{i:14;anchors_height:100;anchors_width:100}
D{i:15;anchors_height:100;anchors_width:100}
}
 ##^##*/
