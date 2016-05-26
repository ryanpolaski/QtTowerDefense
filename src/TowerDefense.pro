TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    tower.cpp \
    enemies.cpp \
    game.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    Bullet.qml \
    Enemy.qml \
    GameScreen.qml \
    main.qml \
    MyButton.qml \
    MyLogo.qml \
    MyTranformations.qml \
    OptionsScreen.qml \
    SplashScreen.qml \
    TextRect.qml \
    Tower.qml

HEADERS += \
    tower.h \
    game.h \
    enemies.h
