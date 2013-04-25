// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
     width: animation.width; height: animation.height + 8

     AnimatedImage { id: animation; source: "pics/dice.png" ;width:40; height:40}
     color:"black"
     Rectangle {
         property int frames: animation.frameCount
         x: (animation.width - width) * animation.currentFrame / frames
         y: animation.height
         //color: "red"
     }
     MouseArea{
         id:diceMouseArea
         anchors.fill: parent
     }
 }
