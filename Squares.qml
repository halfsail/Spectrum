import QtQuick 2.0
import Ubuntu.Components 1.1
import QtGraphicalEffects 1.0


/*Item{
    id:set

    function getColor() {
        var colors = ["coral", "lightblue", "red"]
        x=Math.floor(Math.random() * (2 - 0 + 1)) + 0;
        return colors[x];
        }

Rectangle {
    id:square
    width: 100
    height: 100
    anchors.horizontalCenter: parent.horizontalCenter
    opacity:.85
    color:set.getColor()

    PropertyAnimation {
        id:anime
        running:true
        target:square
        properties: "y"
        from: 0
        to:parent.height-1
        duration:4000;
    }
}
}*/


Rectangle {
    id: rect
    width: units.gu(80); height: width; anchors.centerIn: parent
    border.width: units.gu(.3)
    border.color:spriteColor//obitSet.getColor()
    color:"transparent"
    opacity: satilite.visible === true ? 1 : .6;
    radius: units.gu(30)
    antialiasing: true
    property string spriteId;
    property string spriteColor;
    property string spriteColorTwo;


    GaussianBlur {
            width: parent.width+units.gu(3)
            height: width
            source: rect
            deviation: 2
            radius: 8
            samples:1
            transparentBorder : true
        }

    Item{
        id:obitSet
        function getColor() {
            var colors = ["#69eedd", "#009aca","#fb345f","#ff9376"]
            x=Math.floor(Math.random() * (3 - 0 + 1)) + 0;
            return colors[x];
        }
    }



    NumberAnimation on width {
        from: rect.width
        to: 0
        duration:7500

        onRunningChanged: { //when ring size is zero deletes item
            if (!running) {
                console.log("Destroying...")
                rect.destroy();
            }
        }
    }


    Item{
        id:gav
        width:parent.width; height: width
        anchors.centerIn: parent
        Label{
            text:spriteId
        }
    }



    Rectangle{
        id:satilite
        color:spriteColor
        height:units.gu(3)
        width:height
        visible: spriteId === set.sat.toString()? true : false;
        radius:rect.radius
        x:gav.x+(gav.width/2)
        y:gav.y-units.gu(1)
        property string satiId;
        Label{
            text:satilite.satiId
            color:"red"
            anchors.fill: parent
    }

    }

    RotationAnimation on rotation {
        loops: Animation.Infinite
        from: 0
        to: 360
        duration: 4000
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {// moves item to new ring
            //print(spriteColorTwo)
            satilite.color = spriteColorTwo
            //print(satilite.color)
            set.sat = set.sat + 1;
            set.hiScore = set.hiScore + 105
        }
    }

}
