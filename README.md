## clash
下载`clash for windows` linux版本
解压文件`tar -zxvf 文件名`
cd进入文件后`./cfw` 

配置代理环境变量
```shell
cd etc/profile.d/
v proxy.sh

```
复制下列信息到`proxy.sh` 中
```
export http_proxy=http://127.0.0.1:7890/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
```
## fonts
```zsh
yay -S adobe-source-code-pro-fonts nerd-fonts-source-code-pro noto-fonts-noto
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```


