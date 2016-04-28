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
    int GetHealth();
    void SetHealth(int health);
    void SetSpeed(int speed);
    void SetRunning(bool running);

private:
    int m_health = 20;
    double m_speed = .5;
    bool m_running;

};

#endif // ENEMIES_H
