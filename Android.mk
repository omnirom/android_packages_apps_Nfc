LOCAL_PATH:= $(call my-dir)

########################################
# NCI Configuration
########################################
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
        $(call all-java-files-under, src)

ifneq ($(filter find7,$(TARGET_DEVICE)),)
LOCAL_SRC_FILES += \
        $(call all-java-files-under, nxp)
else
LOCAL_SRC_FILES += \
        $(call all-java-files-under, nci)
endif

ifneq ($(filter find7,$(TARGET_DEVICE)),)
LOCAL_PACKAGE_NAME := Nfc
else
LOCAL_PACKAGE_NAME := NfcNci
endif

LOCAL_CERTIFICATE := platform

ifneq ($(filter find7,$(TARGET_DEVICE)),)
LOCAL_JNI_SHARED_LIBRARIES := libnfc_jni
else
LOCAL_JNI_SHARED_LIBRARIES := libnfc_nci_jni
endif

LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))
