#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include  <QMediaPlayer>
#include  <QAudioOutput>
#include <QString>
#include <QTime>

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal Volume READ Volume WRITE setVolume NOTIFY VolumeChanged)
    Q_PROPERTY(qreal Position READ Position WRITE setposition NOTIFY PositionChanged)
    Q_PROPERTY(qreal Duration READ Duration  NOTIFY DurationChanged)
    Q_PROPERTY(QString DurationStr READ DurationStr NOTIFY DurationChanged)
    Q_PROPERTY(QString PositionStr READ PositionStr  NOTIFY PositionChanged)
    Q_PROPERTY(bool Playing READ Playing WRITE setPlaying NOTIFY PlayingChanged)


public:
    explicit Player(QObject *parent = nullptr);
    void setVolume(qreal vol);
    void setposition (qreal pos);
    qreal Position();
    qreal Duration();
    qreal Volume();
    QString DurationStr();
    QString PositionStr();
    bool Playing();
    void setPlaying(bool);

signals:
    void PlayingChanged();
    void DurationChanged();
    void VolumeChanged(qreal vol);
    void PositionChanged(qreal pos);
    void updateStatus();
public slots:
    void changeMode(QString source, int mode);
    void onDurationChanged(qint64 dura);
    void onPositionChanged(qint64 pos);
    void onvolumeChanged(float vol);
    void onStatusChange();


private:
    qreal m_Position;
    QMediaPlayer *m_play;
    QAudioOutput *m_audio;
    QString mSource;
    QStringList mListImage;
};

#endif // PLAYER_H
