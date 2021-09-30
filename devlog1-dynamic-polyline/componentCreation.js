var arrayLines=[]
var lineComplete=false

function createElements(point) {

    var theLine

    if(changeMode===0){

        //Polyline

        if(arrayLines.length===0){
            createLine(point)
        }else{
            theLine = arrayLines[arrayLines.length-1]

            theLine.addCoordinate(themap.toCoordinate(point))
        }

    }else{
        //Array of lines

        if(arrayLines.length===0 || !lineComplete){
            createLine(point)
            lineComplete=true
        }else{
            theLine = arrayLines[arrayLines.length-1]

            theLine.addCoordinate(themap.toCoordinate(point))

            lineComplete=false
        }
    }

    createMarker(point)

}

function createLine(point){

    var componentLine = Qt.createComponent("Line.qml")

    if (componentLine.status === Component.Ready) {
        var lineFirstCorner = componentLine.createObject(themap);
        lineFirstCorner.addCoordinate(themap.toCoordinate(point))

        themap.addMapItem(lineFirstCorner)
        arrayLines.push(lineFirstCorner)
    }else{
        console.log("Line not created")
    }
}

function createMarker(point){
    var componentMarker = Qt.createComponent("Marker.qml");

    if (componentMarker.status === Component.Ready) {
        var markerFirstCorner = componentMarker.createObject(themap);
        markerFirstCorner.coordinate = themap.toCoordinate(point)

        themap.addMapItem(markerFirstCorner)
    }else{
        console.log("Marker not created")
    }
}
