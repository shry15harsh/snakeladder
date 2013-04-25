// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "funs.js" as Fun1

Image {
     id:faceimg
     source: "pics/d1.png"
     width:40
     height:40
     smooth: true
     property int seconds: 1
     MouseArea{
         id: diceFaceMouseArea
         anchors.fill: parent
        onClicked: {
            Fun1.dicefunction(1)

        }
     }
     Timer {
         id: rolltime
         interval: 1000; running: true; repeat: true;
         onTriggered: seconds=Fun1.diceroll(seconds)
     }
 }
