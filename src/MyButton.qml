// Lab 3
//Button.qml

import QtQuick 2.6
import Qt.labs.controls 1.0
import QtMultimedia 5.6

Rectangle {
    id: myButton

    property alias mouseArea: mouseArea
    property bool changeColor: false
    signal clicked

    Audio
    {
        id: clickSound
        source: "../Images/mouse_click.mp3"
    }

    NumberAnimation {
        id: opactiyAnimation
        target: myButton
        property: "opacity"
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.OutSine
    }

    PropertyAnimation {
        id: scaleAnimation
        target: myButton
        property: "scale"
        from: 0
        to: 1
        duration: 400
        easing.type: Easing.OutBack
    }

    opacity: 1
    state: "mouseOut"
    states: [
        State {
            name: "mouseIn"
            PropertyChanges { target: myButton; opacity: 0.65}
        },
        State {
            name: "mouseOut"
            PropertyChanges { target: myButton; opacity: 1 }
        }
    ]

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: myButton.state = "mouseIn"
        onExited: myButton.state = "mouseOut"

        onClicked:{ clickSound.play(); scaleAnimation.start(); opactiyAnimation.start();}
    }
}
