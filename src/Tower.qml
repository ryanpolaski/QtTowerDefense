// Lab 3
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

    //property real maximumDragY: 450


    Rectangle
    {
        id: myArea
        visible: false
        anchors.centerIn: tower
        height: 300
        width: 300
        color: "green"
        opacity: .3
        radius: width * .5




    }

    Rectangle
    {
        id: smallCircle
        height: 20
        width: 20
        radius: width * .5
        color: "grey"
        border.color: "blue"
        border.width: 1
        anchors.centerIn: parent
    }

    Rectangle
    {
        id: smallCircle2
        height: 8
        width: 8
        radius: width * .5
        color: "blue"
        border.color: "blue"
        border.width: 1
        anchors.centerIn: parent
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
            if(tower.x == 460 && Main_Game.getScore() > 24)
            {
               Main_Game.setScore(-25)
               Main_Tower.setDraggable(true);

            }
            if(Main_Tower.getDraggable())
            {
                drag.target = tower
                tower.border.color = "gold"
            }


            drag.minimumY = 65
            drag.maximumY = 370
            //drag.maximumY = 200
            drag.minimumX = 120
            drag.maximumX = 520
        }

        onReleased:
        {
            if(Main_Tower.getDraggable())
            {
                Main_Tower.incrementTotal();
                drag.target = null
                Main_Tower.setDraggable(false);
                //Main_Tower.setState(1);
            }
            tower.border.color = "black"
        }

        onEntered: tower.state = "mouseIn"
        onExited: tower.state = "mouseOut"
    }
}
