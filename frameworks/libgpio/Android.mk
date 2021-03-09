LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    IGpioService.cpp \
    GpioService.cpp


LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libbinder \
# 	libandroid_runtime

# libandroid_runtime_path := $(call intermediates-dir-for,SHARED_LIBRARIES,libandroid_runtime)/libandroid_runtime.so

# LOCAL_LDFLAGS += $(libandroid_runtime_path)

# LOCAL_ADDITIONAL_DEPENDENCIES := $(libandroid_runtime_path)

LOCAL_C_INCLUDES += \
	libcore/include

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libgpioservice

# LOCAL_PROPRIETARY_MODULE := true

LOCAL_PRELINK_MODULE := false

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(BUILD_SHARED_LIBRARY)