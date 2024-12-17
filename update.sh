#!/bin/bash -e

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/

# download feeds
git clone https://github.com/sirpdboy/sirpdboy-package sirpdboy-package -b main --depth 1

rm -rf sirpdboy-package/.git

mv sirpdboy-package/luci-app-adguardhome ./


# 打印当前文件夹的内容
ls -la


# 打印 sirpdboy-package 目录内容，确认删除操作
ls -la sirpdboy-package

# 如果需要清理luci-app-adguardhome中的.git、LICENSE、README.md，可以取消注释下面这一行
# rm -rf luci-app-adguardhome/{.git,LICENSE,README.md}

# 输出目录列表并保存到 packages.txt
ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
