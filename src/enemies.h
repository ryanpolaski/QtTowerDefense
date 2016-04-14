#ifndef ENEMIES_H
#define ENEMIES_H

class Enemies{
public:
    Enemies();
    ~Enemies();
    int GetHealth();
    int GetSpeed();
    void SetHealth();
    void SetSpeed();

private:
    int m_health;
    int m_speed = .5;

};

#endif // ENEMIES_H
