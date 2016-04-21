// Lab 3
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QQmlContext"
#include "tower.h"
#include "enemies.h"
#include "game.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Tower tower;

    engine.rootContext()->setContextProperty("Main_Tower", &tower);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
