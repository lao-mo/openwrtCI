#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

#Enable WiFi
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#Add adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#Add koolproxy
git clone https://github.com/openwrt-develop/luci-app-koolproxy.git package/luci-app-koolproxy

#Add vlmcsd
#git clone https://github.com/openwrt-develop/openwrt-vlmcsd.git package/openwrt-vlmcsd
#git clone https://github.com/openwrt-develop/luci-app-vlmcsd.git package/luci-app-vlmcsd

#Add k3screen
git clone https://github.com/lwz322/k3screenctrl.git package/k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/luci-app-k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/k3screenctrl_build

#Add leanpackage
git clone https://github.com/coolsnowwolf/lede.git
mv ./lede/package/lean  ./package/lean
rm -rf ./package/lean/k3screenctrl
rm -rf ./lede

#Add lienol
#git clone https://github.com/lienol/openwrt-package.git
#mv ./openwrt-package ./package/openwrt-package

#update
./scripts/feeds update -a
./scripts/feeds install -a
