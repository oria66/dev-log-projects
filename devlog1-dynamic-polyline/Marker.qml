import QtQuick 2.0
import QtLocation 5.15
import QtPositioning 5.15

MapQuickItem {
    id: marker
    sourceItem: Rectangle {
        width: 10
        height: 10
        color: "red"
        smooth: true
        radius: 15
    }
    opacity: 1.0
    anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
}
