// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "funs.js" as Reqfuns

Rectangle {
    width: 360
    height: 360
    color: "brown"
    MouseArea {
        z: 8

        Cell {
            id: cell1
            x: 153
            y: 269
            z:9
            cellColor: "black"
            Text {
                id: startbutton
                text: qsTr("Start")
                color: "white"
                anchors.centerIn: parent
            }
            onClicked:{
                Reqfuns.newf();
                wel.text= qsTr("Head or Tail");
                cell1.opacity=0;
                head.opacity=1;
                tails.opacity=1;
                head.z=2
                tails.z=2
        }
    }
  }
    Row{
        spacing:3
        x:124
        y:269
        Cell {
        z:0
        id:head
        cellColor: "green"
        opacity: 0
        Text {
            id: headtext
            text: qsTr("Head")
            anchors.centerIn: parent;
        }
        onClicked:{

            Reqfuns.toss(1)
            computer.opacity=1
            player.opacity=1
            tim1.opacity=1
        }
    }
    Cell{
        id:tails
        z:0
        cellColor: "green"
        opacity: 0
        Text {
            id: tailstext
            text: qsTr("Tails")
            anchors.centerIn: parent;
        }
        onClicked:{ Reqfuns.toss(2)
            player.opacity=1
            computer.opacity=1
            tim1.opacity=1
        }
    }
    }
    Cell2{
        id:computer
        x: 27
        y: 215
        height: 22
        z:5
        cellColor: "yellow"
        opacity:1
    }
    Cell2{
        id:player
        x: 27
        y: 197
        //Component.onCompleted:{
         //   x=grid.x+table.itemAt(2).width/2;
           // y=grid.y+table.itemAt(2).height/2;
        //}
        //x:grid.x+table.itemAt(3).width/2;
        //y:grid.y+table.itemAt(3).height/2;
        z:5
        cellColor: "green"
        opacity: 1
    }

    Cell3 {
        id:snake
        x: 45
        y: 156
        width: 37
        height: 66
        transformOrigin: Item.Center
        fillMode: Image.Stretch
        smooth: true
        clip: false
        rotation: -50
        z: 6
    }
    Cell3 {
        id: snake1
        x: 101
        y: 138
        width: 20
        height: 48
        rotation: 0
        z: 6
    }

    Cell3 {
        id: snake2
        x: 227
        y: 147
        width: 30
        height: 67
        transformOrigin: Item.Center
        rotation: 20
        z: 6
    }

    Cell3 {
        id: snake3
        x: 108
        y: 30
        width: 30
        height: 67
        transformOrigin: Item.Center
        rotation: -30
        z: 6
    }

    Cell3 {
        id: snake4
        x: 301
        y: 30
        width: 30
        height: 67
        rotation: 0
        z: 6
    }
    Cell4{
        id:ladder
        x: 171
        y: 126
        width: 18
        height: 107
        rotation: 30
        z: 7
    }
    Grid {
        id: grid
        x: 8;y:8
        clip: true
        smooth: false
        rows: 6; columns: 6; spacing: 3
        Repeater {
            id:table
            model:36
            Cell {
                //id:qsTr(index)
                clip:true
                cellColor:Reqfuns.getnum(index+1) % 2 == 0 ? "gray" : "blue"
                Text {
                    text: Reqfuns.getnum(index+1)
                    font.pointSize: 8
                }
                  }
        }
    }
    Text {
        id: wel
        text: qsTr("Start playing the game")
        x:100;y:240
    }

    Cell4 {
        id: ladder1
        x: 286
        y: 163
        width: 18
        height: 66
        transformOrigin: Item.Center
        rotation: 40
        z: 7
    }

    Cell4 {
        id: ladder2
        x: 88
        y: 42
        width: 18
        height: 114
        rotation: -50
        z: 7
        transformOrigin: Item.Center
    }

    Cell4 {
        id: ladder3
        x: 234
        y: 16
        width: 18
        height: 95
        rotation: 40
        z: 7
        transformOrigin: Item.Center
    }

    Cell4 {
        id: ladder4
        x: 287
        y: 86
        width: 18
        height: 69
        rotation: -40
        z: 7
        transformOrigin: Item.Center
    }

    Cell {
        id: cell2
        x: 19
        y: 293
        smooth: false
        cellColor: "#dbbc1d"
        opacity:0
    }
    Tim {
        id: tim1
        x: 253
        y: 264
        width: 10
        height:10
        opacity:0
    }
    Dice
    {
        id:animdice
        x: 27
        y: 264
        opacity: 0
        z:0
    }
    DiceFace
    {
        id:face
        opacity:0
        x: 27
        y: 264
        z:5
    }
}
