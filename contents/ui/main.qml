import QtQuick 6.5
import QtQuick.Controls 2.5
import QtQuick.Layouts 6.5
import org.kde.kirigami 2.20 as Kirigami
import org.kde.ksysguard.sensors 1.0 as Sensors
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    id: root

    property int forcedWidth: 400
    property int globalSpacing: Kirigami.Units.smallSpacing * 2

    function percent(val, total) {
        return total > 0 ? Math.round(val / total * 100) + "%" : "N/A";
    }

    function formatBytes(bytes) {
        if (bytes < 1024)
            return bytes + " B";

        if (bytes < 1.04858e+06)
            return (bytes / 1024).toFixed(1) + " KB";

        if (bytes < 1.07374e+09)
            return (bytes / 1.04858e+06).toFixed(1) + " MB";

        return (bytes / 1.07374e+09).toFixed(1) + " GB";
    }

    function percentColor(val) {
        const v = Math.trunc(val);
        return v >= 95 ? "red" : v >= 80 ? "orange" : Kirigami.Theme.textColor;
    }

    function speedColor(speed) {
        if (speed >= 5 * 1024 * 1024)
            return "lime";

        if (speed >= 1 * 1024 * 1024)
            return "cyan";

        return Kirigami.Theme.textColor;
    }

    width: forcedWidth
    Layout.preferredWidth: forcedWidth
    Layout.minimumWidth: forcedWidth
    Layout.maximumWidth: forcedWidth
    implicitHeight: Kirigami.Units.iconSizes.small + Kirigami.Units.smallSpacing * 2
    Plasmoid.backgroundHints: PlasmaCore.Types.DefaultBackground | PlasmaCore.Types.ConfigurableBackground

    Plasma5Support.DataSource {
        id: executable

        function exec(cmd) {
            disconnectSource(cmd);
            connectSource(cmd);
        }

        engine: "executable"
        onNewData: function(source, data) {
            disconnectSource(source);
        }
    }

    Sensors.Sensor {
        id: cpu

        sensorId: "cpu/all/usage"
    }

    Sensors.Sensor {
        id: ramUsed

        sensorId: "memory/physical/used"
    }

    Sensors.Sensor {
        id: ramTotal

        sensorId: "memory/physical/total"
    }

    Sensors.Sensor {
        id: swapUsed

        sensorId: "memory/swap/used"
    }

    Sensors.Sensor {
        id: swapTotal

        sensorId: "memory/swap/total"
    }

    Sensors.Sensor {
        id: netUp

        sensorId: "network/all/upload"
    }

    Sensors.Sensor {
        id: netDown

        sensorId: "network/all/download"
    }

    RowLayout {
        id: rowLayout

        anchors.fill: parent
        spacing: globalSpacing * 2

        MonitorItem {
            icon: Qt.resolvedUrl("../icons/cpu.svg")
            label: cpu.value !== undefined ? Math.round(cpu.value) + "%" : "N/A"
            color: percentColor(cpu.value)
        }

        MonitorItem {
            icon: Qt.resolvedUrl("../icons/memory.svg")
            label: (ramUsed.value !== undefined && ramTotal.value !== undefined) ? percent(ramUsed.value, ramTotal.value) : "N/A"
            color: percentColor((ramUsed.value / ramTotal.value * 100))
        }

        MonitorItem {
            icon: Qt.resolvedUrl("../icons/swap.svg")
            label: (swapUsed.value !== undefined && swapTotal.value !== undefined) ? percent(swapUsed.value, swapTotal.value) : "N/A"
            color: percentColor((swapUsed.value / swapTotal.value * 100))
        }

        MonitorItem {
            icon: Qt.resolvedUrl("../icons/up.svg")
            label: netUp.value !== undefined && formatBytes(netUp.value || 0)
            color: speedColor(netUp.value)
        }

        MonitorItem {
            icon: Qt.resolvedUrl("../icons/down.svg")
            label: netDown.value !== undefined && formatBytes(netDown.value || 0)
            color: speedColor(netDown.value)
        }

    }

    MouseArea {
        anchors.fill: root
        anchors.margins: -10
        onClicked: executable.exec("plasma-systemmonitor")
    }

}
