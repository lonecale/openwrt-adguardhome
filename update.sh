#!/bin/bash -e

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/

# download feeds
git clone https://github.com/sirpdboy/luci-app-adguardhome luci-app-adguardhome -b js --depth 1

# 删除 sirpdboy-package/.git
rm -rf luci-app-adguardhome/.git

# 输出目录列表并保存到 packages.txt
ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
