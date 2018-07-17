#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "fileparse.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("qml_fileParse", new FileParse);
    engine.load(QUrl(QLatin1String("qrc:///main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
