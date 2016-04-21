import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle
{
    id: tower
    property alias tower: tower
    height: 40
    width: 40
    border.color: "black"
    border.width: 2
    color: "black"
    radius: width * .5
    Drag.active: mouseArea.drag.active


    Rectangle
    {
        id: myArea
        visible: false
        anchors.centerIn: tower
        height: 200
        width: 200
        color: "green"
        opacity: .3
        radius: width * .5
    }

    opacity: 1
    state: "mouseOut"
    states:
    [
        State
        {
            name: "mouseIn"
            PropertyChanges { target: myArea; visible: true }
        },

        State
        {
            name: "mouseOut"
            PropertyChanges { target: myArea; visible: false }
        }
    ]

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed:
        {
            if(tower.x == 460)
            {
               Main_Tower.setDraggable(true);
            }
            if(Main_Tower.getDraggable())
            {
                drag.target = tower
                tower.border.color = "gold"
            }
        }

        onReleased:
        {
            if(Main_Tower.getDraggable())
            {
                drag.target = null
                Main_Tower.setDraggable(false);
            }
            tower.border.color = "black"
        }

        onEntered: tower.state = "mouseIn"
        onExited: tower.state = "mouseOut"
    }
}
