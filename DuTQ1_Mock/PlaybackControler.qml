import QtQuick
import "./component"

Rectangle{
    id: tool
    width: widthX * 2/3
    height: 50
    radius: width/2
    color: "white"
    Row{
        id: idrow
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter

        ImageButton {
            id: idprevious
            width: tool.height
            height: tool.height
            source: "qrc:/Image/icons8-go-to-start-64.png"
            onClicked: () =>{
                           if(list.Index >= 0){
                               changeButton(list.Index , 3)
                               playmusic.Playing
                           }
                       }
        }
        ImageButton {
            id: idplay
            width: tool.height
            height: tool.height
            source: playmusic.Playing ?"qrc:/Image/icons8-pause-64.png":"qrc:/Image/icons8-play-64.png"
            onClicked: () => {
                           if(list.Index >= 0){
                               changeButton(list.Index , 1)
                               playmusic.Playing
                           }
                       }
        }
        ImageButton {
            id: idnext
            width: tool.height
            height: tool.height
            source: "qrc:/Image/icons8-go-to-end-64.png"
            onClicked: () =>{
                           if(list.Index >= 0){
                               changeButton(list.Index , 2)
                               playmusic.Playing
                           }

                       }
        }


    }






}


