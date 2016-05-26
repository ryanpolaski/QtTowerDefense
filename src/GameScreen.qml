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
            if(Main_Game.getWave() === 1)
            {
                enemy.visible = true
                pathEnemy.running = true
                Main_Game.setWave(2)
            }
            else if(Main_Game.getWave() === 2)
            {
                enemy.color = "blue"
                enemy.visible = true
                Main_Enemy.resetHealth(25)
                pathEnemy.restart()
                Main_Game.setWave(3)
            }

            else if(Main_Game.getWave() === 3)
            {
                enemy.color = "yellow"
                enemy.visible = true
                Main_Enemy.resetHealth(80)
                pathEnemy.restart()
            }
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

        Timer{

            id: healthTimer
            interval: 1000
            running: false
            repeat: false

            onTriggered:
            {
                if(Main_Tower.getTotal() === 1)
                    Main_Enemy.setHealth(5)
                else if(Main_Tower.getTotal() === 2)
                    Main_Enemy.setHealth(10);
                else if(Main_Tower.getTotal() === 3)
                    Main_Enemy.setHealth(15)
                Main_Game.setScore(5)
                score.text = Main_Game.getScore()

            }
        }

        PathAnimation
        {
            id:pathEnemy
            //property alias pathAnimation: path
            target: enemy
            running: false
            duration: 20000
            path: Path
            {
                startX: -20
                startY: 250
                PathLine{x: 650; y: 250}
            }
        }

        onXChanged:
        {
            if(Main_Game.getWave() === 2)
                pathEnemy.duration = 8000
            else
                pathEnemy.duration = 20000

            if((enemy.x < (Main_Tower.getX() - 150) || enemy.x > (Main_Tower.getX() + 150)))
            {
                Main_Tower.setState(0)
                healthTimer.stop()
            }
            else if(enemy.visible === true)
            {
                Main_Tower.setState(1)
                healthTimer.start()
            }

            if(Main_Enemy.getHealth() === 0)
            {

                enemy.visible = false
                Main_Tower.setState(0)
            }

            if(enemy.x === 650)
            {
                Main_Game.setLives(1);
                console.log(Main_Game.getLives())
                lives2.text = Main_Game.getLives()
            }

            if(Main_Game.getLives() === 0)
            {
                loseText.visible = true
            }


        }
    }


Rectangle
{
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.rightMargin: 285
    anchors.topMargin: 5
    height: 60; width: 80
    color: "gold"
    border.color: "black"
    border.width: 2

}

Image
{
    id: moneySign
    source: "../Images/dollar.png"
    scale: .15
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.rightMargin: 190
    anchors.topMargin: -165
}

Text
{
    id: score
    font.pixelSize: 16
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.rightMargin: 300
    anchors.topMargin: 28
    text: "30"
}

    Text
    {
    id: loseText
    text: "You Lose"
    visible: false
    font.pixelSize: 48
    anchors.centerIn: parent
    }

    Image{
        source: "../Images/heart.resized.png"
        x: 502
        y: 370
        scale: .4
    }

    Text
    {
            id: lives2
            x: 580
            y: 430
            font.pixelSize: 24
            text: "5"
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
                Main_Tower.setX(repeater.itemAt(index).x)
                Main_Tower.setY(repeater.itemAt(index).y)
                console.log(Main_Tower.getX())
                score.text = Main_Game.getScore()
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
            visible: false
            PathAnimation
            {
                id: path
                property alias path1: path
                target: bullet
                anchorPoint: Qt.point(repeater.itemAt(index).x, repeater.itemAt(index).y)
                loops: Animation.Infinite
                running: true

                duration: 900

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
                    startX: -20
                    startY: -20
                    PathLine
                    {
                        id: pathLine
                        x: (enemy.x); y: (enemy.y)
                    }

                    onChanged:
                    {
                        startX = repeater.itemAt(index).x + 20
                        startY = repeater.itemAt(index).y + 20

                        if(Main_Tower.getState() === 1 && Main_Tower.getY() < 400)
                            bulletRepeater.itemAt(index).visible = true

                        else if(Main_Tower.getState() === 0)
                            bullet.visible = false
                    }
                }
            }
        }
    }
}

