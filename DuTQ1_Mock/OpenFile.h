#ifndef OPENFILE_H
#define OPENFILE_H

#include <QObject>
#include <QFileDialog>
class OpenFile : public QObject
{
    Q_OBJECT
public:
    explicit OpenFile(QWidget *parentW = nullptr, QObject *parent = nullptr);
    Q_INVOKABLE void open(bool check);

signals:
    void changeList(QStringList list1);
public slots:
    void onSelect();
private:
    QFileDialog path;
    QStringList mylist;
    bool m_check;

};

#endif // OPENFILE_H
