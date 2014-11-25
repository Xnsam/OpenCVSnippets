TEMPLATE    = app
CONFIG      += console
CONFIG      -= app_bundle
QT          -= gui

## OpenCV settings for Unix/Linux
unix:!mac {
    message("* Using settings for Unix/Linux.")
    INCLUDEPATH += /usr/include/opencv2

    LIBS += -L/usr/lib/x86_64-linux-gnu \
        -lopencv_core \
        -lopencv_highgui \
        -lopencv_imgproc
}

## OpenCV settings for Mac OS X
macx {
    message("* Using settings for Mac OS X.")

    INCLUDEPATH += /usr/local/include/opencv

    LIBS += -L/usr/local/lib/ \
        -lopencv_core \
        -lopencv_highgui \
        -lopencv_imgproc
}

## OpenCV settings for Windows and OpenCV 2.4.2
win32 {
    message("* Using settings for Windows.")

    INCLUDEPATH += "C:\\opencv\\build\\include" \
                   "C:\\opencv\\build\\include\\opencv" \
                   "C:\\opencv\\build\\include\\opencv2"

    CONFIG(debug, debug | release) {
        LIBS += -L"C:\\opencv\\build\\x86\\vc10\\lib" \
                -lopencv_core248d \
                -lopencv_highgui248d \
                -lopencv_imgproc248d
        }
    CONFIG(release, debug | release) {
        LIBS += -L"C:\\opencv\\build\\x86\\vc10\\lib" \
                -lopencv_core248 \
                -lopencv_highgui248 \
                -lopencv_imgproc248
    }
}

SOURCES += \
    main.cpp
