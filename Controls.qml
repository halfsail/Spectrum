import QtQuick 2.0

Row{
    height: units.gu(10)
    spacing:units.gu(5)
    anchors{
        bottom: parent.bottom
        bottomMargin: units.gu(3)
        horizontalCenter: parent.horizontalCenter
    }
    Repeater{
        model: ["#69eedd", "#009aca", "#fb345f","#ff9376"]
        Rectangle {
            height:units.gu(4); width:height
            radius:units.gu(30)
            opacity:.8
            color: modelData

            Rectangle{
                height:units.gu(2); width: height
                anchors.centerIn: parent
                radius:units.gu(50)
                color:parent.color
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{

                    set.sat = set.sat + 1;
                    set.hiScore = set.hiScore + 105

                }
            }
        }
    }
}
