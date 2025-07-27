# System Monitor Plasmoid

A sleek and elegant plasmoid for at-a-glance system monitoring on KDE Plasma. Keep an eye on your system's vital signs without sacrificing panel space.

> [!NOTE]
> This plasmoid is inspired by the system monitor widget in GNOME, aiming to bring a similar clean and minimalist design to the KDE Plasma desktop.

![Screenshot of System Monitor Plasmoid](demo.png)

## Features

- **Real-time Monitoring:** Tracks CPU, Memory (RAM), and Swap usage percentages.
- **Network Speeds:** Displays current network upload and download speeds.
- **Compact & Clean UI:** A minimalist design that fits perfectly on any panel.
- **Dynamic Coloring:** Resource usage text changes color at high levels (orange, red) to alert you instantly.
- **Quick Access:** Simply click the plasmoid to launch the default system monitor application (`plasma-systemmonitor`).
- **Internationalization:** Translated into over 30 languages.

## Installation

1.  Go to the [Releases page](https://github.com/PRASSamin/system-monitor/releases) of this repository.
2.  Download the latest `.plasmoid` file.
3.  Right-click on your Plasma Desktop or Panel, select "Add Widgets...", and then click "Install From Local File...".
4.  Select the downloaded `.plasmoid` file to install.

Alternatively, you can install it via the command line:

```bash
plasmapkg2 -i com.github.pras.systemmonitor.plasmoid
```

## Built with Prasmoid

This plasmoid was developed using [**Prasmoid**](https://github.com/PRASSamin/prasmoid), a command-line tool I created to streamline and simplify the development of KDE Plasma applets. If you are a developer interested in creating your own plasmoids, check it out!

## License

This project is licensed under the **GNU General Public License v2.0**. See the [LICENSE.md](LICENSE.md) file for details.

## Contributing & Bug Reports

Found a bug or have a feature request? Please open an issue on the [GitHub Issues page](https://github.com/PRASSamin/system-monitor/issues).
