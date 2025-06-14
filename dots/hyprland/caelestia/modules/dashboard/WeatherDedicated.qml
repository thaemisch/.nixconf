import "root:/widgets"
import "root:/services"
import "root:/config"
import "dash"
import QtQuick.Layouts

GridLayout {
    id: root

    required property bool shouldUpdate

    rowSpacing: Appearance.spacing.normal
    columnSpacing: Appearance.spacing.normal


    Rect {
        Layout.row: 0
        Layout.column: 0
        Layout.preferredWidth: dateTime.implicitWidth
        Layout.fillHeight: true

        DateTime {
            id: dateTime
        }
    }

    Rect {
        Layout.row: 0
        Layout.column: 1
        Layout.columnSpan: 3
        Layout.fillWidth: true
        Layout.preferredHeight: calendar.implicitHeight

        Calendar {
            id: calendar
        }
    }

    Rect {
        Layout.row: 0
        Layout.column: 4
        Layout.preferredWidth: resources.implicitWidth
        Layout.fillHeight: true

        Resources {
            id: resources
        }
    }

    component Rect: StyledRect {
        radius: Appearance.rounding.small
        color: Colours.palette.m3surfaceContainer
    }
}
