$(warning "################### CROSS COMPILER ARM32 ####################")

CROSS_COMPILE=$(TOOLCHAIN_DIR)/4.3.2/bin/arm-linux-

TOOLCHAIN=$(TOOLCHAIN_DIR)/4.3.2
TB_CC_PREFIX=arm-linux-
PKG_CONFIG_PREFIX=$(TOOLCHAIN)/arm-none-linux-gnueabi

