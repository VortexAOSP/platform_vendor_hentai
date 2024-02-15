# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/vortex/config/BoardConfigQcom.mk
endif

# Soong
include vendor/vortex/config/BoardConfigSoong.mk
