#include "SampleApplication.h"
#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	SampleApplication w;
	w.show();
	return a.exec();
}
