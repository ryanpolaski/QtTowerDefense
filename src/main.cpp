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
    Enemies enemies;

//    player = new QMediaPlayer;
//    // ...
//    player->setMedia(QUrl::fromLocalFile("/Users/me/Music/coolsong.mp3"));
//    player->setVolume(50);
//    player->play();

    engine.rootContext()->setContextProperty("Main_Tower", &tower);
    engine.rootContext()->setContextProperty("Main_Enemy", &enemies);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
