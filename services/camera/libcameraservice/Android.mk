LOCAL_PATH:= $(call my-dir)

#
# libcameraservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    CameraService.cpp \
    CameraClient.cpp \
    Camera2Client.cpp \
    Camera2Device.cpp \
    camera2/CameraMetadata.cpp \
    camera2/Parameters.cpp \
    camera2/FrameProcessor.cpp \
    camera2/StreamingProcessor.cpp \
    camera2/JpegProcessor.cpp \
    camera2/CallbackProcessor.cpp \
    camera2/ZslProcessor.cpp \
    camera2/BurstCapture.cpp \
    camera2/JpegCompressor.cpp \
    camera2/CaptureSequencer.cpp

LOCAL_SHARED_LIBRARIES:= \
    libui \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libmedia_native \
    libcamera_client \
    libgui \
    libhardware \
    libsync \
    libcamera_metadata \
    libjpeg

LOCAL_C_INCLUDES += \
    system/media/camera/include \
    external/jpeg

ifeq ($(CAMERA_FC_HACK), true)
LOCAL_CFLAGS     += -DCAMERA_FC_HACK
endif

ifeq ($(BOARD_USES_QCOM_LEGACY_CAM_PARAMS),true)
    LOCAL_CFLAGS += -DQCOM_LEGACY_CAM_PARAMS
endif

ifeq ($(BOARD_HAVE_HTC_FFC), true)
LOCAL_CFLAGS += -DBOARD_HAVE_HTC_FFC
endif

LOCAL_MODULE:= libcameraservice

include $(BUILD_SHARED_LIBRARY)
