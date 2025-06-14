import "root:/widgets"
import "root:/services"
import Quickshell

Scope {
    id: root

    property bool launcherInterrupted

    CustomShortcut {
        name: "session"
        description: "Toggle session menu"
        onPressed: {
            const visibilities = Visibilities.getForActive();
            visibilities.session = !visibilities.session;
        }
    }
    
    CustomShortcut {
        name: "showall"
        description: "Toggle launcher"
        onPressed: root.launcherInterrupted = false
        onReleased: {
            if (!root.launcherInterrupted) {
                const visibilities = Visibilities.getForActive();
                
                const showLauncher = !visibilities.launcher;
                visibilities.launcher = showLauncher;
                
                if (showLauncher) {
                    // Show session first
                    visibilities.session = false;
                    
                    // Then show dashboard and OSD with a tiny delay
                    Qt.callLater(() => {
                        visibilities.dashboard = true;
                        visibilities.osd = true;
                        
                        // Force focus back to launcher after all panels are shown
                        Qt.callLater(() => {
                            visibilities.launcher = true; // Re-trigger launcher focus
                        });
                    });
                } else {
                    visibilities.session = false;
                    visibilities.dashboard = false;
                    visibilities.osd = false;
                }
            }
            root.launcherInterrupted = false;
        }
    }

    CustomShortcut {
        name: "launcher"
        description: "Toggle launcher"
        onPressed: root.launcherInterrupted = false
        onReleased: {
            if (!root.launcherInterrupted) {
                const visibilities = Visibilities.getForActive();
                visibilities.launcher = !visibilities.launcher;
            }
            root.launcherInterrupted = false;
        }
    }

    CustomShortcut {
        name: "launcherInterrupt"
        description: "Interrupt launcher keybind"
        onPressed: root.launcherInterrupted = true
    }
}
