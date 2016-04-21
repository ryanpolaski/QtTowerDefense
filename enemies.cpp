#include "enemies.h"

Enemies::Enemies() : m_health(30), m_running(false)
{}

Enemies::~Enemies()
{}

void Enemies::SetHealth(int health)
{
    m_health = health;
}

void Enemies::SetSpeed(int speed)
{
    m_speed = speed;
}

void Enemies::SetRunning(bool running)
{
    m_running = running;
}

bool Enemies::GetRunning()
{
    return m_running;
}

int Enemies::GetHealth()
{
    return m_health;
}

int Enemies::GetSpeed()
{
    return m_speed;
}
