#include <QApplication>
#include <QQmlApplicationEngine>

#include "ListModel.h"
#include "OpenFile.h"
#include "Player.h"
#include "datalist.h"
#include "languagecontrol.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    OpenFile open;
    ListModel list;
    Player playmusic;
    DataList data;



    QObject::connect(&open, &OpenFile::changeList
                     ,&data, &DataList::onChangeList);
    QObject::connect(&list, &ListModel::changeSource
                     ,&playmusic, &Player::changeMode);
    QObject::connect(&playmusic, &Player::updateStatus
                     ,&list, &ListModel::atUpdateStatus);
    QObject::connect(&data, &DataList::sendData
                     ,&list, &ListModel::onSendData);



    QQmlApplicationEngine engine;
    LanguageControl langs(&engine);
    //    const QUrl url(u"qrc:/Listmodel/main.qml"_qs);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlContext *approot = engine.rootContext();
    approot->setContextProperty("open", &open);
    approot->setContextProperty("list", &list);
    approot->setContextProperty("playmusic", &playmusic);
    approot->setContextProperty("langs", &langs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    QObject *object = engine.rootObjects().at(0);
    QObject::connect(object,SIGNAL(changeButton(int,int)),&list,SLOT (onChangeButton(int,int)));
    QObject::connect(object,SIGNAL(statusShuffle(bool)),&list,SLOT (onChangeShuffle(bool)));
    QObject::connect(object,SIGNAL(clear()),&list,SLOT (onClear()));
    return app.exec();
}
