#include <QApplication>
#include <QQmlApplicationEngine>
#include "fileparse.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);



    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:///main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();

//    QQuickView viewer;

//    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));//quit_use

//    viewer.rootContext()->setContextProperty("qml_fileParse", new FileParse);
//    viewer.setSource(QUrl("qrc:///main.qml"));
//    viewer.setResizeMode(QQuickView::SizeRootObjectToView);//default
//    viewer.show();

//    return app.exec();
}
