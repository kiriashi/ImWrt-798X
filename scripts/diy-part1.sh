#!/bin/bash
#
# 版权所有 (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 这是一个自由软件，遵循 MIT 许可证。
# 更多信息请见 /LICENSE 文件。
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名: diy-part1.sh
# 描述: OpenWrt DIY 脚本第一部分 (更新 feeds 之前)

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
git clone https://github.com/EasyTier/luci-app-easytier.git
git clone https://github.com/chenmozhijin/luci-app-socat.git
git clone https://github.com/asvow/luci-app-tailscale.git
git clone https://github.com/sbwml/luci-app-mosdns.git
git clone https://github.com/sirpdboy/luci-app-netspeedtest package/netspeedtest
git clone https://github.com/sbwml/luci-app-openlist2.git
git clone https://github.com/xiaorouji/openwrt-passwall2.git

echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> "feeds.conf.default"
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"

./scripts/feeds update -a
./scripts/feeds install -a



rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
