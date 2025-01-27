#ifndef COMBOBOXEARTHDEVICES_H
#define COMBOBOXEARTHDEVICES_H

#include <QAbstractListModel>

#include "systemprobe.h"

class SystemProbe;

class ComboBoxEarthDevices : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(SystemProbe *list READ list WRITE setList)
public:
    explicit ComboBoxEarthDevices(QObject *parent = nullptr);

    enum {
        textRole
    };


    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
    SystemProbe *list() const;
    void setList(SystemProbe *list);
private:
    SystemProbe *mList;
};

#endif // COMBOBOXEARTHDEVICES_H
