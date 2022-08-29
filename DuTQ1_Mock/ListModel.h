#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QUrl>
//tao struct de luu data
struct ListItem {
    QString m_Title;
    QString m_Source;
    QString m_AlbumTitle;
    QString m_Artist;
    ListItem( QString title, QString source, QString AlbumTitle, QString Artist );
    QString Title()const;
    QString Source()const;
    QString AlbumTitle() const;
    QString Artist() const;
    void setTitle(QString title);
    void setSource(QString source );
    void setAlbumTitle(QString AlbumTitle);
    void setArtist(QString Artist);
    bool operator>(const ListItem& item)
    {
        return QString::compare(m_Title, item.m_Title) > 0;
    }

    bool operator<(const ListItem& item)
    {
        return QString::compare(m_Title, item.m_Title) < 0;
    }
};

class ListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int Index READ Index WRITE setIndex NOTIFY IndexChanged)
    Q_PROPERTY(QString curentSong READ curentSong NOTIFY IndexChanged)
    Q_PROPERTY(QString curentArtist READ curentArtist NOTIFY IndexChanged)

public:

    explicit ListModel(QObject *parent = nullptr);
    int Index();
    void setIndex(int idx);
    QString curentSong();
    QString curentArtist();
    Q_INVOKABLE void onClickSort(bool);
    enum Songinfor{
        Name = Qt::UserRole+1,
        Source,
        AlbumTitle,
        Artist

    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    void onSendData(const QStringList &list);// nhan data tu signal sendData o datalist
    QHash<int, QByteArray> roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[Name] = "Title";
        roles[Source] = "Source";
        roles[AlbumTitle] = "AlbumTitle";
        roles[Artist] = "Artist";
        return roles;
    }
private:
    QList <ListItem> pList;
    int mIndex;
    bool mcheck;


signals:
    void changeSource(QString source, int mode);// gui signal den listmodel de xu li
    void IndexChanged(int idx);

public slots:
    void onChangeButton(int index1, int mode);
    void atUpdateStatus();
    void onChangeShuffle(bool check);
    void onClear();

};

#endif // LISTMODEL_H
