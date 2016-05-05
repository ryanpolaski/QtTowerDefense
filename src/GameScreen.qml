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


    MyButton
    {
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
            gameScreen.visible = false
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
                startX: -20
                startY: 250
                PathLine{x: 620; y: 250}
            }
        }

        onXChanged:
        {
            if(Main_Tower.getState() === 1)
            {
                //bullet1.visible = true
                //path1.running = true
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

            onYChanged:
            {

            }
        }
    }

    Repeater
    {
        id: bulletRepeater
        model: 5

        Bullet
        {
            id: bullet
            property alias bullet1: bullet
            visible: true
            PathAnimation
            {
                id: path
                property alias path1: path
                target: bullet
                anchorPoint: Qt.point(repeater.itemAt(index).x, repeater.itemAt(index).y)
                loops: Animation.Infinite
                running: true

                duration: 1000

                function path()
                {
                    console.log("1")
                    if(Main_Tower.getState() === 1)
                    {
                        console.log("2")
                        path.running = true
                    }
                }



                path: Path
                {
                    startX: -20//repeater.itemAt(index).x
                    startY: -20//repeater.itemAt(index).y
                    PathLine
                    {
                        id: pathLine
                        x: (enemy.x); y: (enemy.y)
                    }

                    onChanged:
                    {
                        startX = repeater.itemAt(index).x + 20
                        startY = repeater.itemAt(index).y + 20
                        if(Main_Tower.getState() === 1)
                            bullet.visible = true
                        //console.log("Enemy x: " + enemy.x)
                        //console.log("Enemy y: " + enemy.y)
                    }
                }
            }
        }
    }
}
