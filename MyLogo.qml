import QtQuick 2.5
import QtQuick.Window 2.0
import Qt.labs.controls 1.0

Item{
    width: Screen.width / 2
    height: Screen.height / 10
    Image{
        id: img
        source: "Images/TDlogo.png"
        //anchors.centerIn: parent
        opacity: 1
        state: "mouseOut"
        states: [
            State {
                name: "mouseIn"
                PropertyChanges { target: img; scale: 0.5 }
            },
            State {
                name: "mouseOut"
                PropertyChanges { target: img; scale: 1 }
            }
        ]



        transitions: Transition {
            PropertyAnimation {
                target: img
                property: "scale"
                easing.type: Easing.OutQuart
                duration: 1000
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: img.state = "mouseIn"
            onExited: img.state = "mouseOut"
        }
    }
}
