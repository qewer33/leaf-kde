import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    color: "#2e2c2f"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    ParallelAnimation {
        id: introAnimation
        OpacityAnimator {
            running: false
            target: content
            from: 0
            to: 1
            duration: 800
            easing.type: Easing.InOutQuad
        }
        ScaleAnimator {
            running: false
            target: content
            from: 0.7
            to: 1
            duration: 500
            easing.type: Easing.InOutQuad
        }
    }

    Item {
        id: content
        anchors.fill: parent

        Image {
            id: logo
            anchors.centerIn: parent
            source: "images/tree_logo.svg"
            sourceSize.height: size
            sourceSize.width: size
        }
    }
}
