// Lab 3
#ifndef GAME_H
#define GAME_H

#include <QObject>

class Game: public QObject
{
    Q_OBJECT

public:
    Game();
    //~Game();

public slots:
    int getWave();
    void setWave(int wave);
    int getLives();
    void setLives(int lives);
    int getScore();
    void setScore(int score);

private:
    int m_wave;
    int m_lives;
    int m_score;
};

#endif // GAME_H
