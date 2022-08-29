#include "languagecontrol.h"

LanguageControl::LanguageControl(QQmlApplicationEngine *engine, QObject *parent)
    : QObject{parent}, m_engine(*engine)
{

}

void LanguageControl::setLanguage(QString m_langs)
{
    QTranslator translator;
    if(translator.load(m_langs, ":/langs/")){
        QCoreApplication::installTranslator(&translator);
    }
    m_engine.retranslate();
}
