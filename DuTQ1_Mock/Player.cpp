#include "Player.h"
#include <QTime>


Player::Player(QObject *parent)
    : QObject{parent}
{
    m_play = new QMediaPlayer;
    m_audio = new QAudioOutput;
    m_play->setAudioOutput(m_audio);
    connect(m_play, SIGNAL(durationChanged(qint64)),this, SLOT(onDurationChanged(qint64)));
    connect(m_play, SIGNAL(positionChanged(qint64)),this, SLOT(onPositionChanged(qint64)));
    connect(m_play, SIGNAL(mediaStatusChanged(QMediaPlayer::MediaStatus)),this, SLOT(onStatusChange()));
}
void Player::setVolume(qreal vol)
{
    if(m_audio->volume() != vol){

        m_audio->setVolume(vol);
        emit VolumeChanged(m_audio->volume());
    }
}



qreal Player::Duration(){
    return m_play->duration();
}

qreal Player::Volume(){
    return m_audio->volume();
}

QString Player::DurationStr(){
    int s = (m_play->duration()/1000)%60;
    int m = (m_play->duration()/60000)%60;
    QString time = QTime(0,m,s).toString("mm:ss");
    return time;
}

QString Player::PositionStr(){
    int s = (m_play->position()/1000)%60;
    int m = (m_play->position()/60000)%60;
    QString time = QTime(0,m,s).toString("mm:ss");
    return time;
}

bool Player::Playing()
{
    if(m_play->playbackState() == 1){
        return true;
    }
    else
        return false;

}

void Player::setPlaying(bool)
{
    emit PlayingChanged();
}

void Player::changeMode(QString source, int mode)

{
    if(source == "" ) m_play->setSource(QUrl());
    switch (mode) {
    case 0:
        m_play->setSource(source);

        m_play->play();
        break;
    case 1:
        if(m_play->playbackState()== 1){
            m_play->pause();
        }
        else if(m_play->playbackState()== 2)
            m_play->play();
        else{
            m_play->setSource(source);

            m_play->play();
        }

        break;
    case 2:
        m_play->setSource(source);

        m_play->play();
        break;
    case 3:
        m_play->setSource(source);
        m_play->play();
        break;
    default:
        break;
    }
    emit PlayingChanged();
}
void Player::setposition(qreal pos){
    if(m_play->position() != pos){
        m_play->setPosition(pos);
    }

}

qreal Player::Position(){
    return m_play->position();
}

void Player::onDurationChanged(qint64 dura)
{
    //setduration(dura);
    emit DurationChanged();
}

void Player::onPositionChanged(qint64 pos)
{
    // setposition(pos);
    emit PositionChanged(pos);
}

void Player::onvolumeChanged(float vol){
    setVolume(vol);
}
// kiem tra xem da hat het bai hay chua neu het gui signal den listmodel
void Player::onStatusChange()
{
    if(m_play->mediaStatus() == QMediaPlayer::EndOfMedia)
    {
        emit updateStatus();
    }
}




