import QtQuick 1.1

 Item {
     id: container
     property alias cellColor: rectangle.color
     signal clicked(color cellColor)

     width: 55; height: 35

     Rectangle {
         id: rectangle
         border.color: rectangle.color
         anchors.fill: parent
         opacity: 1
     }
     MouseArea {
              anchors.fill: parent
              onClicked: container.clicked(container.cellColor)
          }
 }
