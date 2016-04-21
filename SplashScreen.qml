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

    Timer{
        id: startTimer
        interval: 800
        running: false
        repeat: false
        onTriggered:{
            gameScreen.visible = true
            topWindow.visible = false
        }
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
        mouseArea.onClicked:{
            startTimer.start()

        }
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

}
