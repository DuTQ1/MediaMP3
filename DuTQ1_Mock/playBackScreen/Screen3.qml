import QtQuick
import"../component"

Rectangle{
    property bool m_language
    width: 100
    height: 50
    visible: m_language

    Button{
        id: vietnamese
        width: parent.width
        height: 25
        name:"Vietnamese"
        onClickedtext: ()=>{
                           langs.setLanguage("vietnamese.qm")
                           screen3.m_language = false
                           screen1.vis_menubar = false

                       }
    }
    Button{
        width: parent.width
        height: 25
        name:"English"
        anchors.top: vietnamese.bottom
        onClickedtext: ()=>{
                           langs.setLanguage("enlish.qm")
                           screen3.m_language = false
                           screen1.vis_menubar = false
                       }

    }
}

