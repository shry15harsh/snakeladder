import QtQuick 1.1

 Item {
     id: dotContainer
     property alias cellColor: dot.color
     signal clicked(color cellColor)

     width: 55; height: 35

     Rectangle{
         id: dot
         //x: 271
         //y: 72
         width: 18
         height: 18
         radius: width/2
     }
 }
