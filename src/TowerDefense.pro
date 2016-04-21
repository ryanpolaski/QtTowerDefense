TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    tower.cpp \
    enemies.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    tower.h \
    game.h \
    enemies.h
