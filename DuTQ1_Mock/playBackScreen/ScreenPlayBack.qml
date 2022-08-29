import QtQuick
// ve screen hien thi playback  screen
Item {

    Row{
        PlayBackControler{
            id:playBackControler
            width: idwin.width *3/4
            height: idwin.height

        }

        PlayList{
            id: idlistsong
            width: idwin.width/4
            height: idwin.height
        }
    }

}
