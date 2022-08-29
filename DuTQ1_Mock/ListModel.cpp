#include "ListModel.h"


ListModel::ListModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

int ListModel::Index()
{
    return mIndex;
}

void ListModel::setIndex(int idx)
{
    if(mIndex != idx){
        mIndex = idx;
        emit IndexChanged(mIndex);
    }
}

QString ListModel::curentSong(){
    if(rowCount()>0){
        QString name = pList.at(mIndex).Title();
        return name;
    }
    else {
        return "";
    }
}

QString ListModel::curentArtist()
{
    return pList.at(mIndex).Artist();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    const ListItem &item = pList[index.row()];
    switch (role) {
    case Name:
        return item.Title() ;
        break;
    case Source:
        return item.Source();
        break;
    case AlbumTitle:
        return item.AlbumTitle();
        break;
    case Artist:
        return item.Artist();
        break;
    default:
        return QVariant();
    }
}
int ListModel::rowCount(const QModelIndex &parent) const
{
    return pList.size();
}
// nhan thong tin data tu signal sendData va luu vao trong pList
void ListModel::onSendData(const QStringList &list)
{

    beginInsertRows(QModelIndex(),rowCount(),rowCount());
    pList.append(ListItem (list.at(0),list.at(1),list.at(2),list.at(3)));
    endInsertRows();
}

//nhan tin hieu tu qml ve xu li index va source
void ListModel::onChangeButton(int index1, int mode)
{
    if(rowCount() == 0) return;
    // nhan tin hieu click button next
    if(mode==2){
        //check xem button shuffle co duoc lick hay khong
        if(!mcheck){
            index1++;
            if(index1 == rowCount()){
                index1 = 0;
            }
        }
        else
            index1 = rand() % (rowCount());
    }
    // nhan tin hieu click button previous
    else if(mode == 3){
        //check xem button shuffle co duoc lick hay khong
        if(!mcheck){
            index1--;
            if(index1 <0){
                index1 = rowCount() - 1;
            }
        }
        else
            index1 = rand() % (rowCount());
    }

    QString source = pList.at(index1).Source();//lay source
    setIndex(index1) ;
    emit changeSource(source,mode);// gui signal den player de xu li
    emit IndexChanged(index1);
}

//nhan signal tu player khi bai hat da ket thuc. setIndex va setsource lai gui den player de hat bai tiep theo
void ListModel::atUpdateStatus()
{
    if(!mcheck){
        mIndex = mIndex + 1;
        if(mIndex == rowCount()){
            mIndex = 0;
        }
    }
    else
        mIndex = rand() % (rowCount());

    setIndex(mIndex) ;
    QString source = pList.at(mIndex).Source();
    emit changeSource(source,0);
    emit IndexChanged(mIndex);
}
//check xem button shuffle co duoc click hay khong
void ListModel::onChangeShuffle(bool check)
{
    mcheck =  check;
}
void ListModel::onClickSort(bool check)
{
    check = !check;
    if (check)
    {
        std::sort(pList.begin(), pList.end(), [](ListItem a, ListItem b)->bool{return a>b;});
    }
    else
    {
        std::sort(pList.begin(), pList.end(),[](ListItem a, ListItem b)->bool{return a<b;});
    }
    emit layoutChanged();
}
// khi button open file hoac open folder duoc click thi onclear() nhan duoc va clear het data duoc luu truoc do
void ListModel::onClear(){
    pList.clear();
    emit layoutChanged();
    mIndex = 0;
    emit changeSource("",0);//gui signal den player de setsource
    emit IndexChanged(mIndex);// gui signal de setIndex

}





ListItem::ListItem( QString title,QString source, QString AlbumTitle, QString Artist  )
{
    m_Title = title;
    m_Source = source;
    m_AlbumTitle = AlbumTitle;
    m_Artist = Artist;

}

QString ListItem::Title() const
{
    return m_Title;
}

QString ListItem::Source() const
{
    return m_Source;
}

QString ListItem::AlbumTitle() const{
    return m_AlbumTitle;
}

QString ListItem::Artist() const{
    return m_Artist;
}

void ListItem::setTitle(QString title)
{
    if(m_Title != title){
        m_Title = title;
    }
}

void ListItem::setSource(QString source )
{
    if(m_Source != source){
        m_Source = source;
    }
}

void ListItem::setAlbumTitle(QString AlbumTitle){
    if(m_AlbumTitle != AlbumTitle)
        m_AlbumTitle = AlbumTitle;
}

void ListItem::setArtist(QString Artist){
    if(m_Artist != Artist)
        m_Artist = Artist;
}


