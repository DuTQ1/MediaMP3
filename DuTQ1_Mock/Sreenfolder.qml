import QtQuick
import "./component"

Rectangle{
    property bool m_folder
    signal screeen1()
    width: 150
    height: 200
    visible: m_folder
    Column{
        anchors.fill: parent
        Button{
            width: 70
            height: 25
            name:"Open Folder"

        }
    }
}
