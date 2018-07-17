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
    void run() override;
    void setFilePath(const QString& filePath);
    Q_PROPERTY(QString fileName READ fileName WRITE setFileName NOTIFY fileNameChanged)

    QString fileName() const { return _fileName; }
    void setFileName(const QString& fileName);

signals:
    void fileNameChanged();
    void mavlinkMessageParse(mavlink_message_t msg, quint64 timestamp, float percentage);
    void openError(int error);

public slots:
    void functiontest();

private:
    QString _fileName;
    QString _filePath;
};
#endif // FILEPARSE_H
