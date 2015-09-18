import QtQuick 2.0
import Ubuntu.Components 1.1
import QtGraphicalEffects 1.0
import "backend.js" as Logic

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "testgame.username"
    useDeprecatedToolbar: false

    width: units.gu(50)
    height: units.gu(75)

    Item {
        anchors.fill: parent

        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#333333" }
                GradientStop { position: 0.95; color: Logic.displayScore(set.hiScore); ColorAnimation on color {duration: 1000 } }


            }
        }
    }

    Item{
        id:set
        property int rings: 0; //assigned id for ring
        property int sat: 1 //what ring your on
        property int hiScore: 0 // score counter
        property var nextRing: "#69eedd";
        property var nextRingTwo: "#009aca";
        function getColor() {
            var colors = ["#69eedd", "#009aca","#fb345f","#ff9376"]
            x=Math.floor(Math.random() * (2 - 0 + 1)) + 0;
            return colors[x];
        }
    }
    Page {
        id:container
        anchors.fill: parent
        Score{
            width:parent.width
            z:5
            anchors{
                top:parent.top
                topMargin: units.gu(3)
            }
        }
        Controls{
            z:5
        }


        Rectangle{
            height:units.gu(5)
            width:height
            anchors.centerIn: parent
            radius: units.gu(30)
            color:"black"
        }

        Timer{
            id:createRing
            running:true; repeat: true;
            interval: 1000
            onTriggered:{
                var component;
                var sprite;

                component = Qt.createComponent("Squares.qml");
                sprite = component.createObject(container, {id: "sprite"+set.rings+1, "spriteId":set.rings+1, "satiId":set.rings+1, "spriteColor":set.nextRing, "spriteColorTwo":set.nextRing});
                set.nextRing = set.getColor();
                set.nextRingTwo = set.getColor();
                set.rings = set.rings + 1;
            }
        }

       /* Button
        {
            text: i18n.tr("Move");
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            z:5
            onClicked:
            {

                set.sat = set.sat + 1;
                set.hiScore = set.hiScore + 105

            }
        }

        Button
        {
            text: i18n.tr("New Ring");
            anchors.bottom: parent.bottom
            //anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                var component;
                var sprite;
                component = Qt.createComponent("Squares.qml");
                sprite = component.createObject(container, {"x": parent.width, "y": 100, "spriteId":set.rings+1, "satId":set.rings+1});
                set.rings = set.rings + 1;

            }
        }*/

    }
}

