// Lab 3
#ifndef TOWER_H
#define TOWER_H

#include <QObject>

enum State
{
    WAITING = 0,
    SHOOTING
};

class Tower : public QObject
{
   Q_OBJECT

public:
    Tower();
    ~Tower();

public slots:
    bool getDraggable();
    void setDraggable(bool is_draggable);
    State getState();
    void setState(State state);

private:
    State m_state;
    bool m_dragable;
};


#endif // TOWER_H
