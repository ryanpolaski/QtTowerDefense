import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.6

Window
{
    id:optionsWindow
    visible: false
    width:640
    height:480
    color: "blue"

    property alias back: backgroundMusic

    Audio
    {
        id: backgroundMusic
        source: "../Images/Incidental-music.mp3"
        autoPlay: true
        loops: 100
        //muted: false
        //volume: .5
    }

    Image
    {
        anchors.fill: parent.fill
        width:640
        height:480
        smooth: true
        source: "Images/homeScreenBackground.png"
    }

    MyButton
    {
        anchors.left : parent.left
        anchors.top: parent.top
        id: homeButton
        height: 50; width: 200
        color: "burlywood"
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
            optionsScreen.visible = false
        }
    }

    Settings
    {
        id: options
        property alias volume: volumeSlider.value
        property alias musicVolume: backgroundMusic.volume
        property alias switchMain: switchMain.checked
        property alias musicOn: backgroundMusic.muted
    }

    Slider
    {
        width: 200
        id: volumeSlider
        anchors.centerIn: parent
        value: .5
        maximumValue: 1.0
        minimumValue: 0.0

        onValueChanged:
        {
            backgroundMusic.volume = volumeSlider.value
        }

        Rectangle
        {
            id:volumeRect
            height: 30; width: 200
            color: "burlywood"
            border.color: "black"
            border.width: 2
            //anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            Text
            {
                text: "MUSIC"
                anchors.top: volumeRect.top
                anchors.topMargin: 6
                anchors.left: volumeRect.left
                anchors.leftMargin: 10

            }

            Switch
            {
                id: switchMain
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: volumeRect.top
                anchors.topMargin: 5
                state: "on"

                onCheckedChanged:
                {
                    if(!switchMain.checked)
                    {
                        //switchMain.state = "off"
                        backgroundMusic.muted = true
                    }
                    else
                    {
                        //switchMain.state = "on"
                        backgroundMusic.muted = false
                    }
                 }


                style: SwitchStyle
                {
                    groove: Rectangle
                    {
                            id: rect
                            implicitWidth: 100
                            implicitHeight: 20
                            radius: 9
                            border.color: control.activeFocus ? "darkblue" : "black"
                            border.width: 1
                            color: "grey"
                            Text{
                                text: "ON"
                                anchors.top: rect.top
                                anchors.topMargin: 1
                                anchors.left: rect.left
                                anchors.leftMargin: 10
                            }

                            Text{
                                text: "OFF"
                                anchors.top: rect.top
                                anchors.topMargin: 1
                                anchors.right: rect.right
                                anchors.rightMargin: 10
                            }

                    }
                }

             }
        }
    }
}
