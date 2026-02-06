import QtQuick 6.5
import QtQuick.Controls 2.5
import QtQuick.Layouts 6.5
import org.kde.kirigami 2.20 as Kirigami

Item {
    property alias icon: iconImage.source
    property alias label: labelText.text
    property alias color: labelText.color
    property int iconTextSpacing: Kirigami.Units.smallSpacing
    property int fontSize: 12
    property string fontFamily: ""

    implicitWidth: parent
    implicitHeight: parent

    Row {
        spacing: iconTextSpacing
        anchors.centerIn: parent

        Image {
            id: iconImage

            width: Kirigami.Units.iconSizes.small
            height: Kirigami.Units.iconSizes.small
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: labelText

            verticalAlignment: Text.AlignVCenter
            color: color
            font.pixelSize: fontSize
            font.family: fontFamily !== "" ? fontFamily : undefined
            font.bold: true
        }

    }

}
