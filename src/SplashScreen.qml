import QtQuick 2.6
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

Window
{
    id:topWindow
    visible: true
    property bool isRotated:false
    property Item itemBeingDragged:null
    width:640
    height:480

    Image
    {
        anchors.fill: parent.fill
        width:640
        height:480
        smooth: true
        source: "Images/homeScreenBackground.png"
    }

    property Item itemDragged: null

    DropArea
    {
        id:dropArea
        width:parent.width
        height: parent.height
        Drag.dragType: Drag.Automatic
    }

    MyLogo
    {
        id: logo
        anchors.bottom : parent.bottom
        anchors.bottomMargin: 150
        anchors.left : parent.left
        anchors.leftMargin: 40
        scale: .5
    }

    MyButton
    {
        id: startButton
        height: 50; width: 200
        color: "burlywood"
        border.color: "black"
        border.width: 2

        anchors.horizontalCenter: exitButton.horizontalCenter
        anchors.bottom : exitButton.top
        anchors.bottomMargin: 100

        Text{
            id: label
            anchors.centerIn: parent
            text: "START"
            font.family: "Times"
        }
        //mouseArea.onClicked: loader.source = "GameScreen.qml"
    }

    MyButton
    {
        id: optionsButton
        height: 50; width: 200
        color: "burlywood"
        border.color: "black"
        border.width: 2

        anchors.horizontalCenter: exitButton.horizontalCenter
        anchors.bottom : exitButton.top
        anchors.bottomMargin: 25

        Text{
            id: options
            anchors.centerIn: parent
            text: "OPTIONS"
            font.family: "Times"
        }
        //mouseArea.onClicked: loader.source = "GameScreen.qml"
    }

    MyButton
    {
        id: exitButton
        height: 50; width: 200
        color: "burlywood"
        border.color: "black"
        border.width: 2
        anchors.centerIn: parent

        Text{
            id: quitText
            anchors.centerIn: parent
            text: "EXIT"
            font.family: "Times"
        }

        mouseArea.onClicked: {
            Qt.quit()
        }
    }
    TextRect
    {
        id: testRect1
        visible: false
        color: "burlywood"
        width: parent.width / 3
        height: parent.height / 3
        radius: 10
        border.width: 2

        Text{
            id: text1
            visible: true
            anchors.centerIn: parent
            text: "Hello from Ryan Polaski"
            font.family: "Times"
            font.pixelSize: 16
        }
        MyButton
        {
            id: textRectButton1
            visible: true
            height: 20; width: 100
            color: "tan"
            border.color: "black"
            border.width: 2
            radius : 10

            anchors.bottom : parent.bottom
            anchors.bottomMargin: 10
            anchors.right : parent.right
            anchors.rightMargin: 20

            Text{
                id: nextText1
                anchors.centerIn: parent
                text: "GOODBYE"
                font.family: "Times"
            }

            mouseArea.onClicked: {
              Qt.quit()
            }
        }
    }


    TextRect
    {
        id: testRect
        visible: true
        color: "burlywood"
        width: parent.width / 1.5
        height: parent.height / 2
        radius: 10
        border.width: 2

        Text{
            id: text
            visible: true
            anchors.centerIn: parent
            text: "Hello Welcome to my project"
            font.family: "Times"
            font.pixelSize: 24
        }
        Text{
            id: text2
            visible: false
            anchors.centerIn: parent
            text: "My project is a tower defense game
based on one I played as a kid.
Currently you can't actually play
the game but that will change shortly"
            font.family: "Times"
            font.pixelSize: 24

        }

        MyButton
        {
            id: textRectButton
            visible: true
            height: 20; width: 100
            color: "tan"
            border.color: "black"
            border.width: 2
            radius : 10

            anchors.bottom : parent.bottom
            anchors.bottomMargin: 10
            anchors.right : parent.right
            anchors.rightMargin: 20

            Text{
                id: nextText
                anchors.centerIn: parent
                text: "OKAY"
                font.family: "Times"
            }

            mouseArea.onClicked: {
                if(text.visible == true)
                {
                    text.visible = false
                    text2.visible = true
                }
                else if(text2.visible == true)
                {
                    textRectButton.visible = false
                    testRect.visible = false
                    testRect1.visible = true
                }
            }
        }

        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        //anchors.top: parent.top
        x: 20
        y: 20
        Drag.hotSpot.x: 32
        Drag.hotSpot.y: 32

        mouseArea.onClicked: {
            topWindow.isRotated = false
        }

        Drag.onActiveChanged: {
            topWindow.itemBeingDragged = testRect
        }
    }
}
