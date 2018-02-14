# mwm_script hd44780
# 2018

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=hd44780
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/hd44780
 SUBMENU:=Other modules
 TITLE:=I2C HD44780 driver
 FILES:=$(PKG_BUILD_DIR)/hd44780.ko
 AUTOLOAD:=$(call AutoLoad,70,hd44780)
 DEPENDS:=+kmod-i2c-core
 KCONFIG:=
endef

define Package/hd44780/description
library driver untuk hd44780
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)" \
	EXTRA_CFLAGS="$(EXTRA_CFLAGS)"

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,hd44780))
