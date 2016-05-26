#include "game.h"

Game::Game() : m_lives(5), m_wave(1), m_score(30)
{}


void Game::setLives(int lives)
{
    m_lives -= lives;
}

int Game::getLives()
{
    return m_lives;
}

void Game::setWave(int wave)
{
  m_wave = wave;
}

int Game::getWave()
{
  return m_wave;
}

void Game::setScore(int score)
{
  m_score += score;
}

int Game::getScore()
{
  return m_score;
}
