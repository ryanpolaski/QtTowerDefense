// Lab 3
#include "tower.h"

Tower::Tower() : m_state(WAITING), m_dragable(true), y_coord(450), m_totalOnBoard(0)
{}


Tower::~Tower()
{}

bool Tower::getDraggable()
{
    return m_dragable;
}

void Tower::setDraggable(bool is_draggable)
{
    m_dragable = is_draggable;
}

int Tower::getState()
{
    return m_state;
}

void Tower::setState(int state)
{
    m_state = state;
}

void Tower::setX(int x)
{
  x_coord = x;
}

void Tower::setY(int y)
{
  y_coord = y;
}

int Tower::getX()
{
  return x_coord;
}

int Tower::getY()
{
  return y_coord;
}

int Tower::getTotal()
{
  return m_totalOnBoard;
}

void Tower::incrementTotal()
{
  m_totalOnBoard++;
}



