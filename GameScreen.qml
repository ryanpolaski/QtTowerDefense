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

    MyButton{
        anchors.right : parent.right
        anchors.top: parent.top
        id: startButton
        height: 50; width: 200
        color: "gold"
        border.color: "black"
        border.width: 2

        Text{
            id: startText
            anchors.centerIn: parent
            text: "START WAVE"
            font.family: "Times"
        }

//        mouseArea.onClicked:{
//            enemy1.pathAnimation.running = true
//            enemy1.properties.visible = true
//        }
    }




    MyButton{
        anchors.left : parent.left
        anchors.top: parent.top
        id: homeButton
        height: 50; width: 200
        color: "gold"
        border.color: "black"
        border.width: 2

        Text{
            id: label
            anchors.centerIn: parent
            text: "RETURN HOME"
            font.family: "Times"
        }

        mouseArea.onClicked:{
            splashScreen.visible = true
            gameScreen.visible = fasle
            gameWindow.visible = false
        }
    }

    Enemy{
        id:enemy1

    }

    Text {
        id: name
        x: 450
        y:400
        text: qsTr("Towers")
        font.pixelSize: 24
        font.underline: true
    }

    Bullet{
        id: bullet

        PathAnimation
        {
            id:path
            property alias pathAnimation: path
            target: bullet
            loops: 10000
            running: true
            paused: true
            duration: 300

            path: Path{
                id: path2
                startX: tower.x + 5
                startY: tower.y + 5
                PathLine{x: (enemy1.x + 5); y: (enemy1.y + 5)}
            }
        }

        MouseArea{
            onClicked: path.paused = false
        }
    }

//    Repeater{
//        id:repeater
//        model: 500
        Tower{
            id: tower

            x: 460
            y: 430
        }
    //}
}
