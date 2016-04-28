// Lab 3
#include "tower.h"

Tower::Tower() : m_state(1), m_dragable(true)
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
