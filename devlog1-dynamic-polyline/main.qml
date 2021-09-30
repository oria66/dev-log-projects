import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Dynamic Polylines")

    header: ToolBar {
        //contentHeight: toolButton.implicitHeight

        Label {
            text: window.title
            anchors.centerIn: parent
        }

    }

    Component{
        id: mainMap

        MainMap{}
    }

    StackView {
        id: stackView
        initialItem: mainMap
        anchors.fill: parent
    }
}
