#ifndef FILEPARSE_H
#define FILEPARSE_H
#include <QThread>
#include <QFile>
#include "mavlink.h"

class FileParse : public QThread
{
    Q_OBJECT
public:
    FileParse();
    ~FileParse();
//    void run() override;
    void setFilePath(const QString& filePath);

signals:
    void mavlinkMessageParse(mavlink_message_t msg, quint64 timestamp, float percentage);
    void openError(int error);

public slots:
    void functiontest();

private:
    QString _filePath;
};
#endif // FILEPARSE_H
