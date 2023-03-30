# clash
首先要下载对应的`clash for windows` 版本,当前为arch
进入对应的文件下使用解压命令`tar -zxvf 文件名`
解压完成后cd进入文件后`./cfw` 运行

配置代理协议环境变量,我使用的是自定义vim按键
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

