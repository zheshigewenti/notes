## clash
下载`clash for windows` linux版本
解压文件`tar -zxvf 文件名`
cd进入文件后`./cfw`
配置环境变量
```shell
cd etc/profile.d/
vim proxy.sh
```
复制下列信息到`proxy.sh` 中
```bash
export http_proxy=http://127.0.0.1:7890/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
```

## time synchronization
```shell
sudo timedatectl set-ntp true
```

## st fonts & dwm fonts
```shell
#英文
yay Source Code Pro
#中文
yay -S wqy-microhei
#字符&表情
yay -S ttf-sourcecodepro-nerd ttf-liberation noto-fonts-emoji

