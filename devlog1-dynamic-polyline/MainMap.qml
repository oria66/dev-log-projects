import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Layouts 1.12

import "qrc:/componentCreation.js" as MyScript

Item {
    id: root

    // This property indicates the mode, if changeMode=0 is a polyline,
    // if changeMode=OtherNumber is an array or single lines
    property int changeMode: 0

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        id: themap
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }

    MouseArea{
        anchors.fill: parent
        z:1
        onClicked: MyScript.createElements(Qt.point(mouse.x,mouse.y))
    }

    ButtonGroup {
        id: childGroup
        buttons: column.children
    }

    Column {
        id: column
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        z: 2

        CheckBox {
            text: qsTr("Polyline")
            font.bold: true
            checked: true
            onCheckedChanged: if(checked)
                                  changeMode = 0
        }

        CheckBox {
            text: qsTr("Array of lines")
            font.bold: true
            onCheckedChanged: if(checked)
                                  changeMode = 1
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
