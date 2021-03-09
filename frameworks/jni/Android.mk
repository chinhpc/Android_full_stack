LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    com_softwinner_Gpio.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder \
    libui \
    libcutils \
    libandroid_runtime \
    libnativehelper \
    libgpioservice

# libandroid_runtime_path := $(call intermediates-dir-for,SHARED_LIBRARIES,libandroid_runtime)/libandroid_runtime.so

# libnativehelper_path := $(call intermediates-dir-for,SHARED_LIBRARIES,libnativehelper)/libnativehelper.so

# LOCAL_LDFLAGS += $(libandroid_runtime_path) $(libnativehelper_path)

# LOCAL_ADDITIONAL_DEPENDENCIES := $(libandroid_runtime_path) $(libnativehelper_path)

# LOCAL_STATIC_LIBRARIES :=

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/../libgpio \
    $(JNI_H_INCLUDE) \
    libnativehelper/include/nativehelper
#   frameworks/base/core/jni/ \
#   frameworks/base/core/jni/include \

# LOCAL_CFLAGS +=

LOCAL_MODULE_TAGS := optional

# LOCAL_PROPRIETARY_MODULE := true

# LOCAL_LDLIBS := -lpthread
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

LOCAL_MODULE := libgpio_jni

LOCAL_PRELINK_MODULE:= false

include $(BUILD_SHARED_LIBRARY)

