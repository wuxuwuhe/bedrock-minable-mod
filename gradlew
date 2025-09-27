#!/bin/sh

# 确保脚本在遇到错误时退出
set -e

# 查找脚本所在目录
DIRNAME=$(dirname "$0")
if [ "$DIRNAME" = "." ]; then
    DIRNAME=$(pwd)
elif [ "${DIRNAME:0:1}" != "/" ]; then
    DIRNAME=$(pwd)/$DIRNAME
fi

# 定义 Gradle 版本和下载路径（与 gradle-wrapper.properties 一致）
GRADLE_VERSION="8.10"
GRADLE_HOME="$DIRNAME/.gradle/wrapper/dists/gradle-$GRADLE_VERSION-bin/$(echo $GRADLE_VERSION | sed 's/\./_/g')/gradle-$GRADLE_VERSION"

# 检查 Gradle 是否已下载，未下载则提示通过 wrapper 安装
if [ ! -d "$GRADLE_HOME" ]; then
    echo "Gradle $GRADLE_VERSION not found. Please run './gradlew wrapper' to install it."
    exit 1
fi

# 执行 Gradle 命令
exec "$GRADLE_HOME/bin/gradle" "$@"
