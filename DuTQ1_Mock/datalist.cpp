#include "datalist.h"


DataList::DataList(QObject *parent)
    : QObject{parent}
{
    m_player.setAudioOutput(&m_Audio);
    //conect tin hieu de thong bao da loading thanh cong
    connect(&m_player, SIGNAL(mediaStatusChanged(QMediaPlayer::MediaStatus))
            , this, SLOT( LoadingSource(QMediaPlayer::MediaStatus)));
}
// ham setsource
void DataList::onLoading(){
    if (m_Source.count() == 0) return;
    m_player.setSource(m_Source.front());
    m_Source.pop_front();
}
// luu list vao m_Source
void DataList::onChangeList(QStringList source)
{
    m_Source.append(source );
    onLoading();
}
// sao khi loading thanh cong. lay thong tin ra tu source
void DataList::LoadingSource(QMediaPlayer::MediaStatus loading){

    if (loading == QMediaPlayer::LoadedMedia){
        QStringList content ;
        QMediaMetaData data = m_player.metaData();
        content << data.stringValue(QMediaMetaData::Title)
                << m_player.source().toString()
                << data.stringValue(QMediaMetaData::AlbumTitle)
                << data.stringValue(QMediaMetaData::ContributingArtist);
        onLoading();
        emit sendData(content);//signal : gui thong tin moi duoc lay qua listmodel
    }

}
