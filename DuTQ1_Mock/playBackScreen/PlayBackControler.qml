import QtQuick
import "../component"

// ve khu vuc playback
Rectangle{
    id: idframe
    color: "grey"

    Rectangle{
        id: idcontrol
        width: idwin.width *3/4 - (idwin.height*0.04)
        height: idwin.height -idwin.height/5
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: Gradient {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "black" }

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                screen1.vis_version = false
                volume.visible = false
                screen1.vis_menuBar = false




            }
        }
        //ve button khi click se hien menu
        ImageButton {
            id: imagebuttonmenubar
            width: 30
            height:30
            source: "qrc:/Image/icons8-list-64.png"
            onClicked: () =>{
                           screen1.vis_menuBar = !screen1.vis_menuBar

                       }
        }
        //ve screen hien các popup
        Screen1{
            id: screen1
            vis_menuBar: false
            anchors.top: imagebuttonmenubar.bottom
            anchors.left: imagebuttonmenubar.left

        }
        // ve khung chua cover art Node: van chua du duoc cover art len
        Rectangle{
            width: idwin.width/5
            height: idwin.width/5
            radius: idwin.width/10
            border.color: "red"
            anchors.centerIn: parent
            Image {
                id: dvd
                anchors.fill: parent

                source: "qrc:/Image/icons8-music-record-100.png"
            }
        }
        // hien ten bai hat va ca si đang duoc phat
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: row.top
            anchors.bottomMargin: 20
            text: list.curentSong ? qsTr("Playing:  ") + list.curentSong + '\n'+ qsTr("Artist:  ") +list.curentArtist : ""
            color: "yellow"

        }
        // ve row thoi gian hat, slider(thanh chay baif hat), thoi luong cua bai hat
        Row{
            id: row
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            spacing: 5

            Text {
                id: idposition
                anchors.verticalCenter: slider.verticalCenter
                color: "white"
                text: playmusic.PositionStr
            }
            Slider_X{
                id: slider
                m_Width: idwin.width/2
                m_X: playmusic.Position/playmusic.Duration
                onValueXChanged: (xvalue)=>{
                                     playmusic.Position = xvalue*playmusic.Duration

                                 }
            }
            Text {
                id: idDuration
                anchors.verticalCenter: slider.verticalCenter
                color: "white"
                text: playmusic.DurationStr
            }
        }
        // ve button volume
        Rectangle{
            id: rectvolume
            width: 25
            height: 25
            radius: 5
            anchors.bottom: row.bottom
            anchors.left: row.right
            anchors.leftMargin: 20
            color: "white"
            ImageButton{
                id:idImageVolum
                anchors.fill: parent
                source: "qrc:/Image/icons8-speaker-50.png"
                onClicked: () =>{
                               volume.visible = !volume.visible
                           }
            }
        }
        // ve slider (thanh truot am luong)
        Slider_Y{
            id: volume
            anchors.bottom: rectvolume.top
            anchors.bottomMargin: 5
            anchors.horizontalCenter: rectvolume.horizontalCenter
            visible: false
            m_height: 100
            m_Y: 0.5
            onValueYChanged:   (Y) =>{
                                   playmusic.Volume = Y
                                   console.log(Y)
                                   if( playmusic.Volume == 0)
                                   idImageVolum.source =    "qrc:/Image/icons8-no-audio-50.png"
                                   else

                                   idImageVolum.source =    "qrc:/Image/icons8-speaker-50.png"

                               }

        }
    }
    //ve cac button chuc nang: previous, pau/play, next
    Control{
        anchors.bottom: idframe.bottom
        anchors.bottomMargin: (idwin.height/5 -50 )/2
        anchors.horizontalCenter: idframe.horizontalCenter
    }

}



