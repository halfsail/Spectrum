import QtQuick 2.0
import Ubuntu.Components 1.1
import "backend.js" as Logic



Item {
    id:diyHeader
    //anchors.centerIn: parent
    height:diyTitle.height // set in main.qml
    width:parent.width
    Timer{
        id:scoreCounter
        running: true; repeat: true
        interval: 1000
        onTriggered:{
            set.hiScore = set.hiScore + 1;
        }
    }

    Label { //title for app
        id:diyTitle
        fontSize:"x-large"
        font.weight: Font.Light;
        anchors.centerIn: parent;
        text: Logic.displayScore(set.hiScore)
        color:"white"
    }
}

