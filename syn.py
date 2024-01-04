#!/usr/bin python3

import os
import shutil
import filecmp
import sys
import time


def sync_directories(source_dir, destination_dir):
    # 比较两个目录中的文件
    dcmp = filecmp.dircmp(source_dir, destination_dir)

    # 复制新增或修改的文件到目标目录
    for filename in dcmp.diff_files + dcmp.left_only:
        source_path = os.path.join(source_dir, filename)
        dest_path = os.path.join(destination_dir, filename)
        shutil.copy2(source_path, dest_path)
        print(f'Copied: {filename}')


def get_files(directory):
    # 获取目录中的所有文件
    files = []
    for root, _, filenames in os.walk(directory):
        for filename in filenames:
            files.append(os.path.join(root, filename))
    return files


if __name__ == "__main__":
    # 从命令行参数中获取源目录和目标目录
    if len(sys.argv) != 3:
        print("请提供正确的命令行参数，例如：python script.py source_directory dest_directory")
        sys.exit(1)

    source_directory = sys.argv[1]
    dest_directory = sys.argv[2]

    # 检查输入的目录是否存在
    if not os.path.exists(source_directory) or not os.path.exists(dest_directory):
        print("输入的目录不存在，请重新运行脚本并输入有效的目录路径。")
        sys.exit(1)

    # 每秒检测一次并同步目录
    while True:
        sync_directories(source_directory, dest_directory)
        time.sleep(1)
