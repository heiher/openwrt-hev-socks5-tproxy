include $(TOPDIR)/rules.mk

PKG_NAME:=hev-socks5-tproxy
PKG_VERSION:=1.7.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-socks5-tproxy.git
PKG_SOURCE_VERSION:=d0681b6284509f9d3b53412658f90df70ec388af
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=hev <r@hev.cc>

include $(INCLUDE_DIR)/package.mk

define Package/hev-socks5-tproxy
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple, lightweight transparent proxy for Linux
	URL:=https://github.com/heiher/hev-socks5-tproxy
endef

define Package/hev-socks5-tproxy/description
A simple, lightweight transparent proxy for Linux.
endef

define Package/hev-socks5-tproxy/conffiles
/etc/config/hs5t
/etc/hs5t.yml
endef

TARGET_CFLAGS += -O3

define Package/hev-socks5-tproxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-socks5-tproxy $(1)/usr/bin/hs5t
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/hs5t.init $(1)/etc/init.d/hs5t
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/hs5t.config $(1)/etc/config/hs5t
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) files/hs5t.yml $(1)/etc
endef

$(eval $(call BuildPackage,hev-socks5-tproxy))
