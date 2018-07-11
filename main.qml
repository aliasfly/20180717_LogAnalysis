import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3

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
                if(mark.checked==true)
                {
                }
                else
                {
                }
            }
        }
//        Rectangle {
//            id:mouserightrectangle
//            anchors.right:haederToolBar.right
//            anchors.rightMargin: 1
//            anchors.top: haederToolBar.top
//            anchors.topMargin: 1
//            anchors.bottom: haederToolBar.bottom
//            anchors.bottomMargin: 1
//            width: 100
//            MouseArea {
//                id:mouseMA
//                anchors.fill: parent
//                acceptedButtons: Qt.RightButton|Qt.LeftButton;
//                onReleased: {
//                    if(mouse.button == Qt.RightButton)
//                    {
//                        console.log("MouseArea RightButton")
//                        loaderRightMenu.x=0                     //mouseMA.mouseX
//                        loaderRightMenu.y=4                     //mouseMA.mouseY
//                        loaderRightMenu.visible=true
//                    }
//                    else
//                    {
//                        console.log("MouseArea LeftButton")
//                        loaderRightMenu.visible=false
//                    }
//                }
//            }
//            Loader {
//                id:loaderRightMenu
//                visible: false
//                sourceComponent: Component {
//                    id:compRightMenu
//                    MenuBar {
//                        Menu {
//                            title:"options"
//                            MenuItem {
//                                text: "debug"
//                                onTriggered: {
////                                    debugmessagerectangle.visible=true
//                                }
//                            }
//                            MenuItem {
//                                text: "release"
//                                onTriggered: {
////                                    debugmessagerectangle.visible=true
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
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
        id: backitem
        anchors.fill:parent
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
