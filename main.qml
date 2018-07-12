import QtQuick 2.10
import QtCharts 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 960
    height: 680
    title: qsTr("Log Analysis")
    footer: ToolBar {
        id:footerToolBar
        height: 20
            Label {
                text: " Copyright©2018 YUNEEC昊翔 版权所有"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
    }
    header: ToolBar {
        id: headerToolBar
        ToolButton {
            id:toolButton
            text: qsTr("Open Log")
            anchors.left: parent.left
            anchors.leftMargin: 10
            onClicked: {
                fileDialog.open()
            }
        }
        CheckBox {
            id:checkBox
            text:qsTr("Markers")
            anchors.left: toolButton.right
            anchors.leftMargin: 10
            onClicked: {
                if(checkBox.checked==true)
                {
                }
                else
                {
                }
            }
        }
    }

    FileDialog {
        id:fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrl)
//                    LogInterface.fileName = fileDialog.fileUrl
//                                            console.log(fileDialog.fileUrl)
//                    rootLoader.sourceComponent = schedulePlane

        }
        onRejected: {
            console.log("fileDialog.open() Canceled")
        }
    }


    Item {
        id: backItem
        anchors.fill:parent

        Rectangle {
            id:debugMessageRectangle
            border.color: "#888888"
            border.width: 1
            anchors.left: backItem.left
            anchors.leftMargin: 1
            anchors.right: backItem.right
            anchors.rightMargin: 1
            anchors.bottom: backItem.bottom
            anchors.bottomMargin: 1
            height: 100
        }

        Rectangle {
            id:nameRectangle
            border.color: "#888888"
            border.width: 1
            width: 200
            anchors.left: backItem.left
            anchors.leftMargin: 1
            anchors.top: backItem.top
            anchors.bottom: debugMessageRectangle.top
            Button {
                id:resetButton
                anchors.left: nameRectangle.left
                anchors.leftMargin: 1
                anchors.top: nameRectangle.top
                anchors.topMargin: 1
                anchors.right: nameRectangle.right
                anchors.rightMargin: 1
                text: qsTr("Reset")
            }
            Rectangle {
                id:nameListRectangle
                anchors.top: resetButton.bottom
                anchors.left: resetButton.left
                anchors.leftMargin: 1
                anchors.right: resetButton.right
                anchors.rightMargin: 1
                anchors.bottom: nameRectangle.bottom
                anchors.bottomMargin: 1

//                TreeView {
//                      TableViewColumn {
//                          title: "Name"
//                          role: "fileName"
//                          width: 300
//                      }
//                      TableViewColumn {
//                          title: "Permissions"
//                          role: "filePermissions"
//                          width: 100
//                      }
////                      model: fileSystemModel
//                  }
            }
        }

        Rectangle {
            id:chartRectangle
            border.color: "#888888"
            border.width: 1
            anchors.left: nameRectangle.right
            anchors.top:nameRectangle.top
            anchors.bottom: nameRectangle.bottom
            anchors.right: backItem.right
            anchors.rightMargin: 1

            ChartView {
                id:chartView
                title: "Line"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                antialiasing: true

                LineSeries {
                    name: "LineSeries"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { x: 1.1; y: 2.1 }
                    XYPoint { x: 1.9; y: 3.3 }
                    XYPoint { x: 2.1; y: 2.1 }
                    XYPoint { x: 2.9; y: 4.9 }
                    XYPoint { x: 3.4; y: 3.0 }
                    XYPoint { x: 4.1; y: 3.3 }
                }
            }
        }

        Rectangle {
            id:mouseRightRectangle
            anchors.right:debugMessageRectangle.right
            anchors.rightMargin: 5
            anchors.bottom: debugMessageRectangle.bottom
            anchors.bottomMargin: 5
            width: 100
            height: 90

            MouseArea {
                id:mouseMA
                anchors.fill: parent
                acceptedButtons: Qt.RightButton|Qt.LeftButton;
                onReleased: {
                    if(mouse.button == Qt.RightButton)
                    {
                        console.log("MouseArea RightButton")
                        loaderRightMenu.x=0                     //mouseMA.mouseX
                        loaderRightMenu.y=0                     //mouseMA.mouseY
                        loaderRightMenu.visible=true
//                        console.log("mouseMA.mouseX=",mouseMA.mouseX)
//                        console.log("mouseMA.mouseY=",mouseMA.mouseY)
                    }
                    else
                    {
                        console.log("MouseArea LeftButton")
                        loaderRightMenu.visible=false
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
                                onTriggered: {
//                                    debugMessageRectangle.visible=true
                                }
                            }
                            MenuItem {
                                text: "release"
                                onTriggered: {
//                                    debugMessageRectangle.visible=true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
