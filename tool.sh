#!/bin/bash

# Root権限のチェック
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: ルート権限が必要です。"
    exit 1
fi

# Copyright 表示
echo "Copyright © 2023 @16439s All Rights Reserved."
sleep 3

# メニュー表示
echo "1. OSメモリキャッシュ削除"
echo "2. Node.js Install (v21 v20 LTS v18 LTS) ※Ubuntu 20.04 Debian 11 以降の環境のみで実行可能"

# ユーザー入力の取得
read -p "選択してください (1 or 2): " choice

case $choice in
    1)
        # OSメモリキャッシュ削除
        echo "rootユーザーに移動しています..."
        su -c 'echo 3 > /proc/sys/vm/drop_caches' && echo "完了しました。"
        ;;
    2)
        # Node.js Install
        echo "Node.jsをインストールしています..."
        wget -O install.sh https://node.164-67.sbs/install.sh && sudo -E bash ./install.sh && rm ./install.sh
        echo "インストールが完了しました。"
        ;;
    *)
        echo "不正な選択です。"
        ;;
esac
