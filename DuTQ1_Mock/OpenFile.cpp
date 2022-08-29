#include "OpenFile.h"



OpenFile::OpenFile(QWidget *parentW, QObject *parent):
    QObject{parent}, path {parentW}
{
    path.setFilter(QDir::AllEntries);
    path.setOption(QFileDialog::ReadOnly, true);
    path.setAcceptMode(QFileDialog::AcceptOpen);
    connect(&path, &QFileDialog::accepted, this, &OpenFile::onSelect);

}
// khi co tin hieu  signal accepted tiep tuc thuc thi lay ten file trong file hoac folder duoc chon luu trong mylist
void OpenFile::onSelect(){
    QString M = path.directoryUrl().toString();
    QDir directory(path.directoryUrl().toLocalFile());
    QStringList mymusic = directory.entryList(QStringList("*mp3").toList());
    QStringList L = path.selectedFiles().toList();

    mylist.clear();
    if(m_check){
        for(const QString& name : mymusic){
            mylist.append(M +"/" +name);
        }
    }
    else{

        for(QString& list : L){
            list = QUrl:: fromLocalFile(list).toString();
            mylist.append(list);
        }

    }
    emit changeList(mylist);// ban signal toi datalist
}
// Mo duong dan file hoac folder
void OpenFile::open(bool check)
{   m_check = check;
    path.setFileMode(check ? QFileDialog::Directory:QFileDialog::ExistingFiles );
    path.setDirectoryUrl(QUrl::fromLocalFile("c:/"));
    path.exec();



}

