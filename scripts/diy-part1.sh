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

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/EasyTier/luci-app-easytier.git package/luci-app-easytier
git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat
git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale
git clone https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns
git clone https://github.com/sirpdboy/luci-app-netspeedtest.git package/netspeedtest
git clone https://github.com/sbwml/luci-app-openlist2.git package/luci-app-openlist2
git clone https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-passwall2

echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> "feeds.conf.default"
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"

sed -i 's/msgstr \"Socat\"/msgstr \"端口转发\"/' package/luci-app-socat/luci-app-socat/po/zh-cn/socat.po

./scripts/feeds update -a
./scripts/feeds install -a

rm -rf  ./feeds/packages/net/speedtest-cli
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
