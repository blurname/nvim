#!/bin/bash

# 切换到目标目录
cd ~/.config/nvim

# 定义源目录
SOURCE_DIR1="."
SOURCE_DIR2="$HOME/.local/share/nvim/lazy"
# 定义目标文件名
TARGET_FILE="nvim_config.tar.gz"

# 打包并排除指定目录
tar -zcvf "$TARGET_FILE" --exclude='.git' --exclude='node_modules' --exclude='.github' --exclude='*.md' --exclude='*.png' --exclude='LICENSE' --exclude='.gitignore' --exclude="__tests__" --exclude="test" --exclude="tests" $SOURCE_DIR1 $SOURCE_DIR2
