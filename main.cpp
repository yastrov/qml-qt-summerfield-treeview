#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "treemodel.hpp"

#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<TreeModel>("org.example", 1, 0, "TreeModel");
    TreeModel model(nullptr);
    model.load(":/tasks.xml");

    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();

    // QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("myModel", &model);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
