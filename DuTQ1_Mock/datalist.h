#ifndef DATALIST_H
#define DATALIST_H

#include <QObject>
#include <QMediaMetaData>
#include <QMediaPlayer>
#include <QAudioOutput>

class DataList : public QObject
{
    Q_OBJECT
public:
    explicit DataList(QObject *parent = nullptr);
    void onLoading();

private:
    QMediaPlayer m_player;
    QAudioOutput m_Audio;
    QStringList m_Source;

public slots:
    void onChangeList(QStringList source );// slot nhan tu signal changelist
    // slot nhan tu signal mediaStatusChanged check xem da loading source xong chua
    void LoadingSource(QMediaPlayer::MediaStatus );

signals:
    void sendData(QStringList);// gui data den listmodel

};

#endif // DATALIST_H
