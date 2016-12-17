import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//Next For TreeView
import QtQuick.Controls 1.4
import org.example 1.0

Item {
    property alias textField1: textField1
    property alias button1: button1

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            placeholderText: qsTr("Text Field")
        }

        Button {
            id: button1
            text: qsTr("Press Me")
        }

        TreeView {
            id: taskTreeView
            model: myModel
            Layout.fillWidth: true
            Layout.fillHeight: true
            //selectionMode: SelectionMode.SingleSelection
            //onExpanded:
            //loadSlowerAfter

            anchors.margins: 30
            TableViewColumn {
                id: nameColumn;
                title: "Name"
                role: "name"
                delegate: Rectangle {
                    TextEdit {
                        property bool hoveredT: false
                        id: nameEditField;
                        anchors.fill: parent;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: model.name;
                        onEditingFinished: if(model.name!==text) model.name = text;

                        //onMouseSelectionModeChanged:
                        MouseArea {
                            id: mouseArea;
                            anchors.fill: parent;
                            propagateComposedEvents: true;
                            onClicked: mouse.accepted = false;
                            onPressed: mouse.accepted = false;
                            onReleased: mouse.accepted = false;
                            onDoubleClicked: mouse.accepted = false;
                            onPositionChanged: mouse.accepted = false;
                            onPressAndHold: mouse.accepted = false;
                            hoverEnabled: true;
//                            onHoveredChanged: nameEditField.hoveredT=(!nameEditField.hoveredT);
    //                        onDoubleClicked: ;
                            onEntered: nameEditField.hoveredT=true;
                            onExited: nameEditField.hoveredT=false;
                        }

                        ToolTip.text: nameEditField.text;
                        ToolTip.visible: mouseArea.containsMouse;//nameEditField.hoveredT;
                        ToolTip.delay: 1000;
                        ToolTip.timeout: 5000;
                       }

                }
//                editable: true
            }
            TableViewColumn {
                title: "Today"
                role: "today"

                ToolTip.text: model.today
                ToolTip.visible: control.hovered
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                delegate: Rectangle {
                    TextEdit {
                        z: 2;
                        inputMethodHints: Qt.ImhDate;
                        anchors.fill: parent;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: model.today;
                        onEditingFinished: model.today = text;
                    }
                    //onMouseSelectionModeChanged:
                }
            }
            TableViewColumn {
                title: "Total"
                role: "total"
                ToolTip.text: model.total
                ToolTip.visible: control.hovered
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
            }
            TableViewColumn {
                title: "Done"
                role: "done"
                delegate: CheckBox {
                    id: idDelegatedCheckbox
                    enabled: true
                    checked: model.done // read from the model when created or recycled
                    onCheckedChanged: model.done = checked // write to the model when checked or unchecked
                }
            }
        }
    }
}
