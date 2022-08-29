import QtQuick



Rectangle{
    property variant m_Model
    property QtObject m_Delegate
    ListView {
        anchors.fill: parent
        model: m_Model
        delegate: m_Delegate
    }
}

