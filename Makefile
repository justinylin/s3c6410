export PRJ_DIR=$(shell pwd)
export TOOLCHAIN_DIR=$(PRJ_DIR)/toolchains
export UBOOT_DIR=$(PRJ_DIR)/uboot1.1.6
export KERNEL_DIR=$(PRJ_DIR)/linux-3.0.1
export SCRIPTS_DIR=$(PRJ_DIR)/scripts
export PRJ_TRUNK_DIR=$(PRJ_DIR)/trunk

all: uboot-256 kernel

clean: uboot-clean kernel-clean
	rm -rf $(PRJ_TRUNK_DIR)

uboot-128:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>> Build Uboot 1.1.6 >>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	test -d $(PRJ_TRUNK_DIR) || mkdir -p $(PRJ_TRUNK_DIR)
	make -C $(UBOOT_DIR) forlinx_nand_ram128_config
	make -C $(UBOOT_DIR)
	cp $(UBOOT_DIR)/u-boot.bin $(PRJ_TRUNK_DIR)/u-boot.bin

uboot-256:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>> Build Uboot 1.1.6 >>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	test -d $(PRJ_TRUNK_DIR) || mkdir -p $(PRJ_TRUNK_DIR)
	make -C $(UBOOT_DIR) forlinx_nand_ram256_config
	make -C $(UBOOT_DIR)
	cp $(UBOOT_DIR)/u-boot.bin $(PRJ_TRUNK_DIR)/u-boot.bin

uboot-clean:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>> Clean Uboot 1.1.6 >>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	make -C $(UBOOT_DIR) clean

kernel:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>> Build Linux 3.0.1 >>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	test -d $(PRJ_TRUNK_DIR) || mkdir -p $(PRJ_TRUNK_DIR)
	make -C $(KERNEL_DIR) zImage
	cp $(KERNEL_DIR)/arch/arm/boot/zImage $(PRJ_TRUNK_DIR)/zImage

kernel-clean:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>> Clean Linux 3.0.1 >>>>>>>>>>>>>>>>>>>"
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	make -C $(KERNEL_DIR) clean

.PYTHON: all clean uboot-128 uboot-256 uboot-clean kernel kernel-clean
