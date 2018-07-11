import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 960
    height: 680
    title: qsTr("Log Analysis")
    Item {
        id: backitem
        anchors.fill:parent
        Rectangle {
            id:headrectangle
            height: 50
            border.color: "#888888"
            border.width: 1
            anchors.left: backitem.left
            anchors.leftMargin: 1
            anchors.top: backitem.top
            anchors.topMargin: 1
            anchors.right: backitem.right
            anchors.rightMargin: 1
            Button {
                id:openlog
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top:parent.top
                anchors.topMargin: 5
                text: qsTr("Open Log")
                onClicked: {
                }
            }
            CheckBox {
                id:mark
                anchors.left: openlog.right
                anchors.leftMargin: 10
                anchors.top: openlog.top
                anchors.bottom: openlog.bottom
                text: qsTr("Mark")
                onClicked: {
                    if(mark.checked==true)
                    {
                    }
                }
            }
        }
        Rectangle {
            id:mouserightrectangle
            anchors.right:headrectangle.right
            anchors.rightMargin: 1
            anchors.top: headrectangle.top
            anchors.topMargin: 1
            anchors.bottom: headrectangle.bottom
            anchors.bottomMargin: 1
            width: 100
            MouseArea {
                id:mouseMA
                anchors.fill: parent
                acceptedButtons: Qt.RightButton;
                onReleased: {
                    if(mouse.button == Qt.RightButton)
                    {
                        console.log("MouseArea RightButton")
                        loaderRightMenu.x=mouseMA.mouseX
                        loaderRightMenu.y=mouseMA.mouseY
                        loaderRightMenu.visible=true
                    }
                }
            }
            Loader {
                id:loaderRightMenu
                visible: false
                sourceComponent: Component {
                    id:compRightMenu
                    MenuBar {
                        Menu {
                            title:"options"
                            MenuItem {
                                text: "debug"
                            }
                            MenuItem {
                                text: "release"
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id:debugmessagerectangle
            border.color: "#888888"
            border.width: 1
            anchors.left: backitem.left
            anchors.leftMargin: 1
            anchors.right: backitem.right
            anchors.rightMargin: 1
            anchors.bottom: backitem.bottom
            anchors.bottomMargin: 1
            height: 100
        }
        Rectangle {
            id:namerectangle
            border.color: "#888888"
            border.width: 1
            width: 200
            anchors.left: backitem.left
            anchors.leftMargin: 1
            anchors.top: headrectangle.bottom
            anchors.topMargin: 1
            anchors.bottom: debugmessagerectangle.top
            anchors.bottomMargin: 1
            Button {
                id:resetbutton
                anchors.left: namerectangle.left
                anchors.leftMargin: 1
                anchors.top: namerectangle.top
                anchors.topMargin: 1
                anchors.right: namerectangle.right
                anchors.rightMargin: 1
                text: qsTr("Reset")
            }
            Rectangle {
                id:namelistrectangle
                anchors.top: resetbutton.bottom
                anchors.left: resetbutton.left
                anchors.leftMargin: 1
                anchors.right: resetbutton.right
                anchors.rightMargin: 1
                anchors.bottom: namerectangle.bottom
                anchors.bottomMargin: 1
            }
        }
        Rectangle {
            id:chartrectangle
            border.color: "#888888"
            border.width: 1
            anchors.left: namerectangle.right
            anchors.leftMargin: 1
            anchors.top:namerectangle.top
            anchors.bottom: namerectangle.bottom
            anchors.right: backitem.right
            anchors.rightMargin: 1
        }
    }
}
