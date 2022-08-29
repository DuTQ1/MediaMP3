import QtQuick
import"../component"

Rectangle{
    id: idplaylist
    width: idwin.width/4
    height: idwin.height
    Rectangle{
        id: idsort
        height: 25
        width: idwin.width/4
        border.color: "grey"
        ImageButton{
            id: idsort1
            width: 25
            height: idsort.height
            anchors.right: idsort.right
            anchors.topMargin: -10
            source: "qrc:/Image/icons8-sort-alpha-up-32.png"
            onClicked: () => {
                           if(idsort1.source == "qrc:/Image/icons8-sort-alpha-up-32.png"){
                               idsort1.source = "qrc:/Image/icons8-sort-alpha-up-reversed-32.png"
                               list.onClickSort(false);
                           }else{
                               idsort1.source = "qrc:/Image/icons8-sort-alpha-up-32.png"

                               list.onClickSort(true);
                           }

                       }
        }
    }

    // list view hien thi danh sach bai hat


    QListview{
        anchors.top: idsort.bottom
        width: idplaylist.width
        height: idplaylist.height - 25
        color: "lightsteelblue"
        m_Model: list
        m_Delegate: Component{
            Rectangle {
                id: idrecElement
                height: 25
                width: idwin.width/4
                color: idmouse1.containsMouse ? "yellow":"transparent"
                Text {
                    id: name
                    anchors.verticalCenter: idrecElement.verticalCenter
                    anchors.left: idrecElement.left
                    anchors.leftMargin: 10
                    text:Title
                    scale: idmouse1.pressed ? 1.2:1
                    color:  idmouse1.focus ? "white":"black"
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

}





