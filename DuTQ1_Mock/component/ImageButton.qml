import QtQuick


Image {
    signal clicked()
    scale: idmouse.pressed ? 1.1:1
    MouseArea{
        id: idmouse
        anchors.fill: parent
        onClicked: {
            parent.clicked()
        }
    }

}
