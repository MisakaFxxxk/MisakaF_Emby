# VPS一键反代公费服脚本

### 功能

支持常规Emby服务器和MisakaF播放分离，其余播放分离的服务器不支持

支持自动申请SSL证书并续签

支持自定义SSL证书

### 要求

x86的Linux

80、443端口未占用（可以通过 ```lsof -i:80,443``` 检查）

拥有一个域名且反代域名已经解析到了VPS的IP上

### 安装
```bash
bash <(curl -sL https://raw.githubusercontent.com/MisakaFxxxk/MisakaF_Emby/main/mf_proxy/mf_proxy.sh)
```

### 卸载
```bash
bash <(curl -sL https://raw.githubusercontent.com/MisakaFxxxk/MisakaF_Emby/main/mf_proxy/uninstall_mf_proxy.sh)
```

