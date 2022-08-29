#ifndef LANGUAGECONTROL_H
#define LANGUAGECONTROL_H

#include <QObject>
#include <QApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>

class LanguageControl : public QObject
{
    Q_OBJECT
public:
    explicit LanguageControl(QQmlApplicationEngine *engine, QObject *parent = nullptr);
    Q_INVOKABLE void setLanguage(QString m_langs);
private:
    QQmlApplicationEngine &m_engine;

};

#endif // LANGUAGECONTROL_H
