import QtQuick 2.5

Rectangle {
    height:50
    width: 100

    property alias mouseArea: mouseArea
    property real maximumDragX: 0
    property real maximumDragY: 0
    property alias drag:mouseArea.drag

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        drag.target: parent
        drag.maximumX: maximumDragX
        drag.maximumY: maximumDragY
    }
}
