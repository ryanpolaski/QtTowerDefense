// Lab 3
#include "tower.h"

Tower::Tower() : m_state(WAITING), m_dragable(true)
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

State Tower::getState()
{
    return m_state;
}

void Tower::setState(State state)
{
    m_state = state;
}
