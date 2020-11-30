# HevSocks5TProxy for OpenWrt

## 简介

本项目是 [hev-socks5-tproxy](https://github.com/heiher/hev-socks5-tproxy) 在 OpenWrt 上的移植。

## 编译

从 OpenWrt 的 [SDK](https://openwrt.org/docs/guide-developer/obtain.firmware.sdk) 编译

```bash
cd openwrt-sdk

# 获取源码
git clone https://github.com/heiher/openwrt-hev-socks5-tproxy.git package/hev-socks5-tproxy

# 选中 Network -> hev-socks5-tproxy
make menuconfig

# 编译 hev-socks5-tproxy
make package/hev-socks5-tproxy/{clean,compile} V=s
```
