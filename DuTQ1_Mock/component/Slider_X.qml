import QtQuick


Rectangle{
    property real m_X
    property int m_Width
    signal valueXChanged(var valueX)
    id:idrect1
    width: m_Width
    height: 5
    radius: 5
    color: "grey"
    Rectangle{
        id: idrect2
        width: 16
        height: 16
        radius: 8
        color: "blue"
        anchors.verticalCenter: parent.verticalCenter
        x: m_X*idna.drag.maximumX
        onXChanged: {

            if(idna.drag.active){
                parent.valueXChanged(idrect2.x/(idna.drag.maximumX))
            }
        }
        MouseArea{
            id: idna
            anchors.fill: parent
            drag.target: idrect2
            drag.axis: Drag.XAxis
            drag.minimumX : 0
            drag.maximumX: idrect1.width - idrect2.width
        }
    }
    Rectangle{
        height: 5
        width: idrect2.x
        radius: 5
        color: "blue"
    }
}
