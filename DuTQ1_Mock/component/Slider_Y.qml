import QtQuick


Rectangle{
    property var m_Y
    property int m_height
    signal valueYChanged(real valueY)
    id:idrectY1
    width: 5
    height: m_height
    radius: 5
    color: "blue"
    Rectangle{
        id: idrectY2
        width: 16
        height: 16
        radius: 8
        color: "blue"
        anchors.horizontalCenter: idrectY1.horizontalCenter
        y:m_Y*idna1.drag.maximumY
        onYChanged: {

            if(idna1.drag.active){
                parent.valueYChanged(1-y/(idna1.drag.maximumY))
            }
        }
        MouseArea{
            id: idna1
            anchors.fill: parent
            drag.target: idrectY2
            drag.axis: Drag.YAxis
            drag.minimumY :  0
            drag.maximumY:idrectY1.height - idrectY2.height
        }
    }
    Rectangle{
        height: idrectY2.y
        width: 5
        radius: 5
        color: "white"
    }
}
