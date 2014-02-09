/*
  Autor: Mihai Cornel
  Email: mhcrnl@gmail.com
  Data:  09/02/2014
  File:  qtquickapp1.qml
  */

import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.0
//import "../ButtonItem.qml"

Rectangle {
    id:parent
    objectName: "Agenda Personala"
    color:"lightyellow"
    width: 360
    height: 360
    //semnal emitere
    signal send()
    onSend: console.log("semnal emis din regtangle parinte")
    Component.onCompleted:{

        salveaza.clicked.connect(send)
    }
//    FileDialog {
//        id: fileDialog
//        title: "Please choose a file"
//        onAccepted: {
//            console.log("You chose: " + fileDialog.fileUrls)
//            Qt.quit()
//        }
//        onRejected: {
//            console.log("Canceled")
//            Qt.quit()
//        }
//        Component.onCompleted: visible = true
//    }
    Rectangle {
        id:despre
        width: 100

        height: 62

    }
    ButtonItem{

    }

    Row{
        id:meniu
        anchors.top: parent.top
        ColorAnimation { from: "white"; to: "black"; duration: 200 }
        Button{
            text:qsTr("Inchide")
            onClicked: Qt.quit()
        }
        Button{
            id:salveaza
            text: qsTr("Salveaza")
            signal trigger
            MouseArea{
                onClicked: console.log("semal emis de button salveaza")
                anchors.fill: salveaza
                onPressed: parent.color="lightgreen"
                onReleased: parent.color="white"
            }
        }
        //onTrigger: console.log("Semnal emis!")
        Button{
            text: qsTr("Deschide", "Open")
            tooltip: "Deschide"
            onClicked: {
                fileDialog.open();

            }
            FileDialog{
                id:fileDialog
            }
        }
        Button{
            text:qsTr("Despre")
            tooltip: "Informatii despre aplicatie"
            onClicked: {
                console.log("Despre a fost apasat")
               // despre1.open()
            }
            Despre{
                id: despre1
            }
        }
    }
    Row{
        id: intdate
        anchors.top: meniu.bottom
        anchors.verticalCenter: parent.verticalCenter
        //anchors.verticalCenter: parent
        //color:"lightblue"
        Label{
            text: qsTr("Nume/Prenume: ")
        }
        TextInput{
            id:numeTi
            text:qsTr(" Nume ")
            color: focus?"red":"green"
            maximumLength: 15
            focus: true
            KeyNavigation.tab: telefonTi
        }
        Label{
            text:qsTr(" Nr. Telefon: ")
        }
        TextInput{
            id:telefonTi
            text: qsTr("Telefon")
            color: focus ? "red" : "green"
            maximumLength: 20
            KeyNavigation.backtab: numeTi

        }


    }
    Row{
        anchors.top: intdate.bottom
        anchors.verticalCenter: parent.verticalCenter

        Label{
            text:numeTi.text+"  "+telefonTi.text
        }
    }
}

