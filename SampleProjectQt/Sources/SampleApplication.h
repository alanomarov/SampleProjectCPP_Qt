#pragma once

#include <QtWidgets/QMainWindow>
#include "ui_SampleApplication.h"

class SampleApplication : public QMainWindow
{
	Q_OBJECT

public:
	SampleApplication(QWidget *parent = Q_NULLPTR);

private:
	Ui::SampleApplicationClass ui;
};
