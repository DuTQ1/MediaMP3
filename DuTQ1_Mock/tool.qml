import QtQuick


Rectangle{
    id: rec
    width: widthX - 50
    height: 10
    radius: 5

    Rectangle{
        id: rec1
        width: 70
        height: 20
        radius: 10
        color: "grey"
        Drag.active: mouse.drag.active
        anchors.verticalCenter: parent.verticalCenter
        x : (playmusic.Position/playmusic.Duration)*(rec.width - rec1.width)
        onXChanged: {
            if(mouse.drag.active) {
                playmusic.Position = rec1.x/(rec.width - rec1.width)*playmusic.Duration
            }
        }
        states: State {
            when: mouse.drag.active
            PropertyChanges{
                target: rec1
                x: mouse.x
            }
        }
        MouseArea{
            id: mouse
            anchors.fill: parent
            drag.target: rec1
            drag.axis: Drag.XAxis
            drag.minimumX : 0
            drag.maximumX: rec.width - rec1.width
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: playmusic.PositionStr + "/" +playmusic.DurationStr
        }

    }
    Rectangle{
        height: 10
        width: rec1.x + 3
        radius: 5
        color: "blue"
    }

}
