import QtQuick 2.0

Item {
    FontLoader {
        id: tablerFont
        source: "file:///home/dheer/.config/quickshell/noctalia-shell/Assets/Fonts/tabler/tabler-icons.ttf"
    }

    Component.onCompleted: {
        console.log("Tabler font status:", tablerFont.status)
    }
}

