import QtQuick 2.5

Rectangle {

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
