import QtQuick
import "../component"

// vscreen menu
Rectangle {

    property bool vis_menuBar
    property bool vis_version


    id:menubar
    width: 100
    height: 125
    z:1
    color: "white"
    visible: vis_menuBar
    // ve popup library
    Button{
        id:buttonlibrary
        width: menubar.width
        height: 25
        name:qsTr("Library")
        onClickedtext: ()=>{
                           screen1.vis_menuBar = !screen1.vis_menuBar
                           loadScreen.source = "qrc:/libraryScreen/ScreenLibrary.qml"

                       }
    }
    //ve popup open file
    Button{
        id: buttonFile
        width: menubar.width
        height: 25
        anchors.top: buttonlibrary.bottom
        name:qsTr("Open File")
        onClickedtext: ()=>{
                           screen1.vis_menuBar = false
                           open.open(0)
                           clear()
                       }
    }
    // ve popup open folder
    Button{
        id:buttonFolder
        width: menubar.width
        height: 25
        anchors.top: buttonFile.bottom
        name:qsTr("Open Folder")
        onClickedtext: ()=>{
                           screen1.vis_menuBar = false
                           open.open(1)
                           clear()
                       }
    }
    // ve popup language
    Button{
        id:buttonLanguage
        width: menubar.width
        height: 25
        anchors.top: buttonFolder.bottom
        name:qsTr("Language")

        onClickedtext: ()=>{
                           screen3.m_language = !screen3.m_language
                           screen1.vis_version = false
                       }

    }
    // ve screen hien thi cac ngon ngu de chon
    Screen3{
        id: screen3
        anchors.top: buttonLanguage.top
        anchors.left: buttonLanguage.right
        anchors.leftMargin: 1
        m_language: false



    }
    // ve popup about(thong tin ve ap)
    Button{
        id:buttonAbout
        width: menubar.width
        height: 25
        anchors.top: buttonLanguage.bottom
        name:qsTr("About")
        onClickedtext: ()=>{
                           //version.visible = !version.visible
                           screen1.vis_version = !screen1.vis_version
                           screen3.m_language = false

                       }
    }
    // ve hinh de ghi thong tin ve app
    Rectangle{
        id: version
        width: menubar.width*1.25
        height: 25
        anchors.top: buttonAbout.top
        anchors.left: buttonAbout.right
        anchors.leftMargin: 1
        visible: vis_version
        Text {
            anchors.centerIn: parent
            text: qsTr("version 1.0.0")

        }

    }

}
