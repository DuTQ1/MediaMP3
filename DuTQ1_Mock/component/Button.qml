import QtQuick

Rectangle{
    id: idbutton
    property string name
    signal clickedtext()
    color: idmousebutton.containsMouse ? "grey":"transparent"
    Text {
        anchors.verticalCenter: parent.verticalCenter
        text:"   " + name
        scale: idmousebutton.pressed ? 1.1:1
        color: idmousebutton.containsMouse ? "white":"black"
    }
    MouseArea{
        id: idmousebutton
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            idbutton.clickedtext()
        }
    }

}
