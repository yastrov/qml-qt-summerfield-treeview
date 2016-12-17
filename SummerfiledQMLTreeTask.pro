QT += qml quick
QT += quickcontrols2 # Not need, but...

CONFIG += c++11

SOURCES += main.cpp \
    taskitem.cpp \
    treemodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    taskitem.hpp \
    treemodel.hpp \
    global.hpp
