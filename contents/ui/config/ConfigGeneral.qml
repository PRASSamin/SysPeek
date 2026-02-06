import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    property alias cfg_launchCommand: launchCommand.text
    property alias cfg_itemSpacing: itemSpacing.value
    property alias cfg_iconTextSpacing: iconTextSpacing.value
    property alias cfg_horizontalPadding: horizontalPadding.value
    property alias cfg_verticalPadding: verticalPadding.value
    property int cfg_fontSize: 12
    property string cfg_fontFamily: ""
    property alias cfg_showCpu: showCpu.checked
    property alias cfg_showRam: showRam.checked
    property alias cfg_showSwap: showSwap.checked
    property alias cfg_showUpload: showUpload.checked
    property alias cfg_showDownload: showDownload.checked
    property alias cfg_widgetWidth: widgetWidth.value

    Kirigami.FormLayout {
        id: configItem

        QQC2.TextField {
            id: launchCommand

            Kirigami.FormData.label: i18n("Launch Command")
            placeholderText: i18n("Enter your launch command")
            Layout.fillWidth: true
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Visibility")
        }

        QQC2.CheckBox {
            id: showCpu

            Kirigami.FormData.label: i18n("Show CPU")
        }

        QQC2.CheckBox {
            id: showRam

            Kirigami.FormData.label: i18n("Show RAM")
        }

        QQC2.CheckBox {
            id: showSwap

            Kirigami.FormData.label: i18n("Show Swap")
        }

        QQC2.CheckBox {
            id: showUpload

            Kirigami.FormData.label: i18n("Show Upload Speed")
        }

        QQC2.CheckBox {
            id: showDownload

            Kirigami.FormData.label: i18n("Show Download Speed")
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Dimensions")
        }

        QQC2.SpinBox {
            id: widgetWidth

            Kirigami.FormData.label: i18n("Widget Width")
            from: 100
            to: 800
            stepSize: 10
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Spacing & Padding")
        }

        QQC2.SpinBox {
            id: itemSpacing

            Kirigami.FormData.label: i18n("Item Spacing")
            from: 0
            to: 50
            stepSize: 1
        }

        QQC2.SpinBox {
            id: iconTextSpacing

            Kirigami.FormData.label: i18n("Icon-Label Spacing")
            from: 0
            to: 20
            stepSize: 1
        }

        QQC2.SpinBox {
            id: horizontalPadding

            Kirigami.FormData.label: i18n("Horizontal Padding")
            from: 0
            to: 50
            stepSize: 1
        }

        QQC2.SpinBox {
            id: verticalPadding

            Kirigami.FormData.label: i18n("Vertical Padding")
            from: 0
            to: 50
            stepSize: 1
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Typography")
        }

        QQC2.SpinBox {
            id: fontSize

            Kirigami.FormData.label: i18n("Font Size")
            from: 6
            to: 48
            stepSize: 1
            value: cfg_fontSize
            onValueModified: cfg_fontSize = value
        }

        QQC2.ComboBox {
            id: fontFamily

            Kirigami.FormData.label: i18n("Font Family")
            Layout.fillWidth: true
            model: Qt.fontFamilies()
            currentIndex: model.indexOf(cfg_fontFamily) >= 0 ? model.indexOf(cfg_fontFamily) : 0
            onActivated: cfg_fontFamily = currentText
            Component.onCompleted: {
                if (cfg_fontFamily === "")
                    cfg_fontFamily = currentText;

            }
        }

    }

}
