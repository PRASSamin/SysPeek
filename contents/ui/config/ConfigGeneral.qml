import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    property alias cfg_launchCommand: launchCommand.text

    Kirigami.FormLayout {
        id: configItem

        QQC2.TextField {
            id: launchCommand
            Kirigami.FormData.label: i18n("Launch Command")
            placeholderText: i18n("Enter your launch command")
            Layout.fillWidth: true
        }
    }
}