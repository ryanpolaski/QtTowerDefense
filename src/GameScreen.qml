import QtQuick 2.6
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

Window
{
    id:gameWindow
    visible: false
    width:640
    height:480

    Image
    {
        anchors.fill: parent.fill
        width:640
        height:480
        smooth: true
        source: ":/../Images/map1.jpg"
    }


    MyButton
    {
        anchors.right : parent.right
        anchors.top: parent.top
        id: startButton
        height: 50; width: 200
        color: "gold"
        border.color: "black"
        border.width: 2

        Text
        {
            id: startText
            anchors.centerIn: parent
            text: "START WAVE"
            font.family: "Times"
        }

        mouseArea.onClicked:
        {
            enemy.visible = true
            pathEnemy.running = true
        }
    }


    MyButton{
        anchors.left : parent.left
        anchors.top: parent.top
        id: homeButton
        height: 50; width: 200
        color: "gold"
        border.color: "black"
        border.width: 2

        Text
        {
            id: label
            anchors.centerIn: parent
            text: "RETURN HOME"
            font.family: "Times"
        }


        mouseArea.onClicked:
        {
            splashScreen.visible = true
            gameScreen.visible = fasle
            gameWindow.visible = false
        }
    }

    Enemy
    {
        id:enemy
        visible: false

        PathAnimation
        {
            id:pathEnemy
            //property alias pathAnimation: path
            target: enemy
            running: false
            duration: 28000
            path: Path
            {
                startX: 0
                startY: 250
                PathLine{x: 620; y: 250}
            }
        }

        onXChanged:
        {
              if(Main_Tower.getState() === 1)
              {

              }

//            if(Main_Enemy.getHealth() > 0)
//            {
//                if(enemy.x === bullet.x && enemy.y === bullet.y)
//                {
//                    Main_Enemy.setHealth(5);
//                }
//            }
//            else if(Main_Enemy.getHealth() === 0)
//            {
//                enemy.visible = false
//            }
        }
    }


    Enemy{
        id:enemy1

    }

    Text
    {
        id: name
        x: 450
        y:400
        text: qsTr("Towers")
        font.pixelSize: 24
        font.underline: true
    }

    Repeater
    {
        id:repeater
        property alias test:repeater
        model: 5
        Tower
        {
            id: tower
            x: 460
            y: 430
            property alias bulletVisible: bullet.visible
            property alias bulletPath: path2
            property alias beginX: path2.startX
            property alias beginY: path2.startY
            property alias anchorP: path.anchorPoint

            Bullet
            {
                id: bullet
                visible: true
                PathAnimation
                {
                    id:path
                    property alias pathAnimation: path
                    target: bullet
                    anchorPoint: Qt.point(repeater.itemAt(index).x, repeater.itemAt(index).y)
                    loops: 10000
                    running: true
                    //paused: true
                    duration: 500

                    path: Path
                    {
                        id: path2
                        startX: repeater.itemAt(index).x
                        startY: repeater.itemAt(index).y
                        PathLine{x: (enemy.x); y: (enemy.y)}
                    }
                }
            }

            onXChanged:
            {
                repeater.itemAt(index).beginX = repeater.itemAt(index).x
                repeater.itemAt(index).beginY = repeater.itemAt(index).y
                repeater.itemAt(index).anchorP = Qt.point(repeater.itemAt(index).x, repeater.itemAt(index).y)
            }
        }
   }
}
