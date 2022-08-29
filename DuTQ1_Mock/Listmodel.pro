QT += quick
QT += core
QT += widgets
QT += multimedia

SOURCES += \
        ListModel.cpp \
        OpenFile.cpp \
        Player.cpp \
        datalist.cpp \
        languagecontrol.cpp \
        main.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources \
    Image.qrc
TRANSLATIONS +=\
               langs/vietnamese.ts\
               langs/english.ts
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH +=\
        Listsong.qml\
        main.qml

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ListModel.h \
    OpenFile.h \
    Player.h \
    datalist.h \
    languagecontrol.h

DISTFILES += \
    langs/english.qm \
    langs/vietnamese.qm
