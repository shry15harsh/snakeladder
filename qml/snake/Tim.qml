import QtQuick 1.1
import "funs.js" as Fun

Item  {
    id: background;
    property int seconds : 5
    width : 50 ; height: 50
    Rectangle {
        id : theTimer
        x : 20; y: 20
        width : 25 ; height: 25
        color: "transparent"
        opacity:1

        Text {
            id:timertext
            x: -240
            y: 2
            text: qsTr("Game starting in "+seconds+" seconds")
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: -104
                font.pointSize: 12; font.bold: true
                font.family: "Courier"
                anchors.centerIn: parent
            }
    }

    Timer {
        id: time
        interval: 1000; running: true; repeat: true;
        onTriggered: seconds=Fun.chktimer(seconds)
    }
}
