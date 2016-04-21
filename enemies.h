#ifndef ENEMIES_H
#define ENEMIES_H

#include "QObject"

class Enemies
{
public:
    Enemies();
    ~Enemies();

public slots:
    int GetHealth();
    int GetSpeed();
    bool GetRunning();
    void SetHealth(int health);
    void SetSpeed(int speed);
    void SetRunning(bool running);

private:
    int m_health;
    int m_speed = .5;
    bool m_running;

};

#endif // ENEMIES_H
