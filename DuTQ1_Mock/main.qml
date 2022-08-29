import QtQuick
import QtQuick.Window
import "./component"
import"./playBackScreen"

Window {
    id: idwin
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")
    signal changeButton(int idx, int mode)
    signal statusShuffle(bool check)
    signal clear();
    Loader{
        id: loadScreen
        source: "qrc:/playBackScreen/ScreenPlayBack.qml"

    }


}
/* node: nhung phan chua lam duoc
    + nhom group
    + chua de quy folder
    +chua hien thi duoc cover art bai hat
    +them favourist
*/
