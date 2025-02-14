#!/usr/bin/env bash
# ---------------------------------
# MF Proxy 卸载脚本
# 用于卸载 MF Proxy 及其相关文件
# ---------------------------------

# 1. 检查是否为 root 权限
if [[ $EUID -ne 0 ]]; then
   echo "本脚本需要 root 权限，请使用 sudo 或切换为 root 后再执行。"
   exit 1
fi

# 2. 停止并禁用 MF Proxy 服务
echo "停止并禁用 MF Proxy 服务..."
systemctl stop mf_proxy 2>/dev/null || true
systemctl disable mf_proxy 2>/dev/null || true

# 3. 删除 systemd 服务文件
SERVICE_FILE="/etc/systemd/system/mf_proxy.service"
if [[ -f "$SERVICE_FILE" ]]; then
  echo "删除 systemd 服务文件: $SERVICE_FILE"
  rm -f "$SERVICE_FILE"
else
  echo "未找到 systemd 服务文件: $SERVICE_FILE"
fi

# 4. 删除安装目录
INSTALL_DIR="/opt/mf_proxy"
if [[ -d "$INSTALL_DIR" ]]; then
  echo "删除安装目录: $INSTALL_DIR"
  rm -rf "$INSTALL_DIR"
else
  echo "未找到安装目录: $INSTALL_DIR"
fi

# 5. 刷新 systemd 配置
echo "刷新 systemd 配置..."
systemctl daemon-reload

# 6. 完成提示
echo "===================================================="
echo "MF Proxy 卸载完成！"
echo "===================================================="
