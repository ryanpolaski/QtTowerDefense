//Button.qml

import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle {
    id: myButton

    property alias mouseArea: mouseArea
    property bool changeColor: false
    signal clicked

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

    transitions: Transition {
        PropertyAnimation {
            target: img
            property: "opacity"
            easing.type: Easing.InCirc
            duration: 200
        }
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

//        onHoveredChanged: {
//            if(changeColor === false)
//                color = "gold"
//            else
//                color = "lightsteelblue"
//            changeColor = !changeColor
//        }

        onEntered: myButton.state = "mouseIn"
        onExited: myButton.state = "mouseOut"

        onClicked:{ scaleAnimation.start(); opactiyAnimation.start()}
    }
}
