// Lab 3
#ifndef ENEMIES_H
#define ENEMIES_H

#include <QObject>

class Enemies : public QObject
{
    Q_OBJECT

public:
    Enemies();
    ~Enemies();

public slots:
    int GetSpeed();
    bool GetRunning();
    int getHealth();
    void setHealth(int health);
    void SetSpeed(int speed);
    void SetRunning(bool running);
    void resetHealth(int health);

private:
    int m_health;
    double m_speed = .5;
    bool m_running;
};

#endif // ENEMIES_H
