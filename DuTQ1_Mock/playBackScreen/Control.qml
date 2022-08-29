import QtQuick
import "../component"

Rectangle{
    id: tool
    width: idwin.width * 0.8/2
    height: 50
    radius: width/2
    color: "white"

    Row{
        id: idrow
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter

        // ve button previous
        ImageButton {
            id: idprevious
            width: tool.width/8
            height: tool.height
            source: "qrc:/Image/icons8-go-to-start-64.png"
            onClicked: () =>{


                           changeButton(list.Index , 3)
                           playmusic.Playing
                       }
        }
        // ve button pause/play
        ImageButton {
            id: idplay
            width:  tool.width/8
            height: tool.height
            source: playmusic.Playing ?"qrc:/Image/icons8-pause-64.png":"qrc:/Image/icons8-play-64.png"
            onClicked: () => {

                           if(list.Index <0){
                               list.Index = 0
                           }
                           changeButton(list.Index , 1)
                       }
        }
        // ve button next
        ImageButton {
            id: idnext
            width:  tool.width/8
            height: tool.height
            source: "qrc:/Image/icons8-go-to-end-64.png"
            onClicked: () =>{
                           changeButton(list.Index , 2)
                           playmusic.Playing


                       }
        }
    }
    //ve button shuffle
    ImageButton{
        property bool checked : false
        id: idshuffle
        width: tool.width/8
        height: tool.height
        anchors.left: idrow.right
        anchors.leftMargin: 30
        source: checked ?"qrc:/Image/icons8-shuffle-64-on.png":"qrc:/Image/icons8-shuffle-64-off.png"
        onClicked:()=> {
                      checked = !checked
                      statusShuffle(checked)
                  }
    }
}


