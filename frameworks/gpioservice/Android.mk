LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	main_gpioservice.cpp 

LOCAL_SHARED_LIBRARIES := \
	libgpioservice \
	libutils \
	liblog \
	libbinder

LOCAL_C_INCLUDES := \
	system/core/include \
	$(LOCAL_PATH)/../libgpio

LOCAL_MODULE_TAGS := optional

# LOCAL_PROPRIETARY_MODULE := true

LOCAL_MODULE := gpioservice

LOCAL_INIT_RC := gpioservice_daemon.rc

include $(BUILD_EXECUTABLE)