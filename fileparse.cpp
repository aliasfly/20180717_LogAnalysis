#include "fileparse.h"
#include <QDebug>
#include <QMutex>



FileParse::FileParse()
{
}
FileParse::~FileParse()
{
}
void FileParse::functiontest()
{
    qDebug()<<"fileparse class called ok~~functiontest";
}
void FileParse::setFilePath(const QString &filePath)
{
    _filePath = filePath;
    qDebug()<<"_filePath is"<<_filePath;
}
void FileParse::setFileName(const QString &fileName)
{
    qDebug()<<"setFileName called";
    QString fileName_t = fileName;
    fileName_t = fileName_t.replace("file://","");
    _fileName = fileName_t;
    setFilePath(_fileName);
    start();
    emit fileNameChanged();
}
void FileParse::run()
{
    qDebug()<<"run() start";
}
