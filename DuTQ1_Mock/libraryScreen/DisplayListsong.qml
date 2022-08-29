import QtQuick
import"../component"
// hien thi danh sach bai hat
Rectangle{
    color: "grey"
    QListview{
        width: iddisplay.width
        height: iddisplay.height
        m_Model: list
        m_Delegate:Component {
            Rectangle {
                id: idrecElement
                height: 25
                width: iddisplay.width
                color: idmouse1.containsMouse ? "yellow":"transparent"
                Text {
                    id: name
                    anchors.verticalCenter: idrecElement.verticalCenter
                    anchors.left: idrecElement.left
                    anchors.leftMargin: 10
                    text: Title
                    scale: idmouse1.pressed ? 1.2:1
                    color:  idmouse1.focus ? "white":"black"

                }
                MouseArea{
                    id: idmouse1
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        list.Index = index
                        focus: true
                        changeButton(index, 0)
                    }
                }
            }
        }

    }
}



