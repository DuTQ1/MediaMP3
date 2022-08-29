import QtQuick
import "../component"
//import"../playBackScreen"



Rectangle{
    id:menubar
    property bool vis_menuBar1
    property bool vis_langs
    property bool vis_version
    width: 100
    height: 125
    z:1
    color: "lightgray"
    visible: vis_menuBar1

    // ve button back
    Button{
        id:buttonlibrary
        width: menubar.width
        height: 25
        name:qsTr("Back")
        onClickedtext: ()=>{
                           screenmenu.vis_menuBar1 = !screenmenu.vis_menuBar1

                           loadScreen.source = "qrc:/playBackScreen/ScreenPlayBack.qml"
                       }
    }
    // ve button open file
    Button{
        id: buttonFile
        width: menubar.width
        height: 25
        anchors.top: buttonlibrary.bottom
        name:qsTr("Open File")
        onClickedtext: ()=>{
                           screenmenu.vis_menuBar1 = false
                           open.open(0)
                           clear()
                       }
    }
    // ve button open folder
    Button{
        id:buttonFolder
        width: menubar.width
        height: 25
        anchors.top: buttonFile.bottom
        name:qsTr("Open Folder")
        onClickedtext: ()=>{
                           screenmenu.vis_menuBar1 = false
                           open.open(1)
                           clear()
                       }
    }
    // ve button language
    Button{
        id:buttonLanguage
        width: menubar.width
        height: 25
        anchors.top: buttonFolder.bottom
        name:qsTr("Language")

        onClickedtext: ()=>{
                           //  languages.visible = !languages.visible
                           screenmenu.vis_langs = !screenmenu.vis_langs
                           screenmenu.vis_version =  false



                       }
    }
    // ve Rectangle chua ngon ngu
    Rectangle{
        id: languages
        anchors.top: buttonLanguage.top
        anchors.left: buttonLanguage.right
        anchors.leftMargin: 1
        color: "lightgray"
        width: 100
        height: 50
        visible: vis_langs
        Button{
            id: vietnamese
            width: parent.width
            height: 25
            name:"Vietnamese"
            onClickedtext: ()=>{
                               langs.setLanguage("vietnamese.qm")
                               screenmenu.vis_menuBar1 = false
                               screenmenu.vis_langs = false



                           }
        }
        Button{
            width: parent.width
            height: 25
            name:"English"
            anchors.top: vietnamese.bottom
            z: 2
            onClickedtext: ()=>{
                               langs.setLanguage("enlish.qm")
                               screenmenu.vis_menuBar1 = false
                               screenmenu.vis_langs = false
                           }

        }
    }
    // ve button about (thong tin ve app)
    Button{
        id:buttonAbout
        width: menubar.width
        height: 25
        anchors.top: buttonLanguage.bottom
        name:qsTr("About")
        onClickedtext: ()=>{
                           screenmenu.vis_version = !screenmenu.vis_version
                           screenmenu.vis_langs = false

                       }
    }
    // ve button hien thi thong tin app
    Rectangle{
        id: version
        width: menubar.width*1.25
        height: 25
        anchors.top: buttonAbout.top
        anchors.left: buttonAbout.right
        anchors.leftMargin: 1
        visible: vis_version
        z :2
        color: mouseVersion.containsMouse ? "grey":"lightgray"
        Text {
            anchors.centerIn: parent
            text: qsTr("version 1.0.0")

        }
        MouseArea{
            id: mouseVersion
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                screenmenu.vis_version =false
            }

        }

    }

}
