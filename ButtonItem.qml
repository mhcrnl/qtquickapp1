import QtQuick 2.0
import QtQuick.Controls 1.1
Rectangle {
    width: 100
    height: 162
    color: "blue"
    radius: 8

    Button{
        text: qsTr("Inchide")
        onClicked: Qt.quit()

    }
}
