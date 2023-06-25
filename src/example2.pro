QT += core gui svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

################################################################################

DESTDIR = $$PWD/../bin
TARGET = qfi_example2

################################################################################

CONFIG += c++11

################################################################################

win32: CONFIG(release, debug|release): QMAKE_CXXFLAGS += -O2
unix:  CONFIG(release, debug|release): QMAKE_CXXFLAGS += -O2

win32: QMAKE_LFLAGS += /INCREMENTAL:NO

################################################################################

DEFINES += QFI_DLL_IMPORTS

DEFINES += QT_DEPRECATED_WARNINGS

greaterThan(QT_MAJOR_VERSION, 4):win32: DEFINES += USE_QT5

win32: DEFINES += \
    NOMINMAX \
    WIN32 \
    _WINDOWS \
    _CRT_SECURE_NO_DEPRECATE \
    _SCL_SECURE_NO_WARNINGS \
    _USE_MATH_DEFINES

win32: CONFIG(release, debug|release): DEFINES += NDEBUG
win32: CONFIG(debug, debug|release):   DEFINES += _DEBUG

unix: DEFINES += _LINUX_

################################################################################

INCLUDEPATH += ./

################################################################################

LIBS += \
    -L$$PWD/../lib \
    -lqfi

################################################################################

include($$PWD/example/example.pri)
