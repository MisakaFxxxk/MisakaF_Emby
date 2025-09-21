#!/bin/bash
# ---------------------------------
# MF Proxy 卸载脚本
# 用于卸载 MF Proxy 及其相关文件
# ---------------------------------

mf_dir="/root/mf_proxy"
service_file="/etc/systemd/system/mf_proxy.service"

echo "开始彻底卸载 MF_Proxy..."

# 停止并禁用服务
if systemctl is-active --quiet mf_proxy; then
    echo "停止 MF_Proxy 服务..."
    systemctl stop mf_proxy
fi

if systemctl is-enabled --quiet mf_proxy; then
    echo "禁用 MF_Proxy 服务..."
    systemctl disable mf_proxy
fi

# 删除服务文件
if [ -f "$service_file" ]; then
    echo "删除服务文件..."
    rm -f "$service_file"
    systemctl daemon-reload
    systemctl reset-failed
fi

# 删除安装目录
if [ -d "$mf_dir" ]; then
    echo "删除 MF_Proxy 文件..."
    rm -rf "$mf_dir"
fi

# 清理iptables规则
echo "清理 iptables 规则..."
iptables-save | grep -v "MF_Proxy" | iptables-restore
ip6tables-save | grep -v "MF_Proxy" | ip6tables-restore

echo "===================================================="
echo "MF Proxy 卸载完成！"
echo "===================================================="
