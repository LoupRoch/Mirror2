import QtQuick 2.11

Item {
    id: siricontainer
    width: 1080
    height: 360
    AnimatedImage{
    id: siri
    x: 0
    y: 0
    width : 1080
    height: 360
    source : "Sources/siri.gif"
    playing: true
}

}
