#ifndef GAME_H
#define GAME_H

class Game{
public:
    Game();
    ~Game();

public slots:
    int GetWave();
    void SetWave();

private:
    int m_wave = 1;

};

#endif // GAME_H
