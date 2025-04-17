#!/bin/bash

# 检查是否传入参数
if [ $# -lt 2 ]; then
    echo "Usage: $0 <name> $1 <MNT_DIR> "
    echo "example: bash mount.sh conversationhub_unilm conversationhub"
    exit 1
fi

# 获取传入的参数
NAME=$1
MNT_DIR=$2


echo "start to mount $NAME to /mnt/$MNT_DIR"
# 创建目录
sudo mkdir -p /mnt/$MNT_DIR
sudo chmod 777 /mnt/$MNT_DIR
mkdir -p ./file_cache/$NAME

# 挂载命令
blobfuse2 mount /mnt/$MNT_DIR --config-file=${NAME}.yaml --allow-other
echo "mount $NAME to /mnt/$MNT_DIR success"
echo ""