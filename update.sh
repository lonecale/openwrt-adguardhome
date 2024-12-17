#!/bin/bash -e

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/

# download feeds
git clone https://github.com/sirpdboy/sirpdboy-package sirpdboy-package -b main --depth 1

# 移动 luci-app-adguardhome 目录到当前目录
mv sirpdboy-package/luci-app-adguardhome ./

# 删除 sirpdboy-package/.git
# rm -rf sirpdboy-package/.git
rm -rf sirpdboy-package


# 如果需要清理 luci-app-adguardhome 中的 .git、LICENSE、README.md，可以取消注释下面这一行
# rm -rf luci-app-adguardhome/{.git,LICENSE,README.md}

# 输出目录列表并保存到 packages.txt
ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
