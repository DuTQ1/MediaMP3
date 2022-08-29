import QtQuick
import "../component"
// ve man hinh library
Rectangle{
    id: idscreenlibrary
    width: idwin.width
    height:idwin.height
    // ve rect thanh cong cu
    Rectangle{
        id: idtool
        width: idscreenlibrary.width
        height: 30
        color: "lightsteelblue"
        border.color: "grey"
        // ve button click hien menu
        ImageButton {
            id: imagebuttonmenubar
            width: 30
            height:30
            source: "qrc:/Image/icons8-list-64.png"
            onClicked: () =>{
                           screenmenu.vis_menuBar1 = !screenmenu.vis_menuBar1
                           screenmenu.vis_langs = false
                           screenmenu.vis_version = false

                       }
        }
        Text {
            anchors.centerIn: parent
            color: "black"
            text: list.curentSong ? qsTr("Playing:  ") + list.curentSong +"     "+ qsTr("Artist:  ") +list.curentArtist : ""
        }

    }
    // ve menu
    ScreenMenu{
        id: screenmenu
        vis_menuBar1: false
        anchors.top: idtool.bottom
        z:1
    }
    // ve tab
    Rectangle{
        id: idtab
        width: idscreenlibrary.width/6
        height: idscreenlibrary.height - idtool.height
        anchors.top: idtool.bottom
        color: "lightsteelblue"
        border.color: "grey"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                screenmenu.vis_menuBar1 = false
                screenmenu.vis_langs = true//false
                screenmenu.vis_version = true//false
            }
        }
        // button songlist
        Button{
            id:buttonlibrary1
            width: parent.width
            height: 25
            border.color: "grey"
            name:qsTr("Songlist" )
            onClickedtext: ()=>{
                               idscreenlistsong.visible = true
                               idscreenArtist.visible = false
                               idscreenAlbum.visible = false
                           }
        }
        //button album
        Button{
            id: buttonFile1
            width: parent.width
            height: 25
            anchors.top: buttonlibrary1.bottom
            border.color: "grey"
            name:qsTr("Album")
            onClickedtext: ()=>{
                               idscreenAlbum.visible = true
                               idscreenlistsong.visible = false
                               idscreenArtist.visible = false
                           }
        }
        // button artist
        Button{
            id:buttonFolder1
            width: parent.width
            height: 25
            border.color: "grey"
            anchors.top: buttonFile1.bottom
            name:qsTr("Artist")
            onClickedtext: ()=>{
                               idscreenArtist.visible =true
                               idscreenlistsong.visible = false
                               idscreenAlbum.visible = false
                           }
        }


    }
    // khu vuc display list
    Rectangle{
        id: iddisplay
        width: idscreenlibrary.width - idtab.width
        height:idscreenlibrary.height - idtool.height

        anchors.top: idtool.bottom
        anchors.left: idtab.right
        z:0
        MouseArea{
            anchors.fill: parent
            onClicked: {
                screenmenu.vis_menuBar1 = false
                screenmenu.vis_langs = false
                screenmenu.vis_version = false

            }
        }
        // danh sach bai hat
        DisplayListsong{
            id: idscreenlistsong
            visible: true
        }
        // danh sach ca si
        DisplayArtist{
            id: idscreenArtist
            visible: false
        }
        //danh sach album
        DisplayAlbum{
            id: idscreenAlbum
            visible: false
        }

    }


}





