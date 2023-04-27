## clash
下载`clash for windows` linux版本
解压文件`tar -zxvf 文件名`
cd进入文件后`./cfw`

## time synchronization
```shell
sudo timedatectl set-ntp true
```

## fonts
```shell
#英文
yay ttf-liberation (st fonts:Liberation Mono)
#中文
yay -S wqy-microhei
#字符&表情
yay -S ttf-sourcecodepro-nerd noto-fonts-emoji
```

## vimtex probleams
```shell
#目录权限  
sudo chown -R $(whoami):$(whoami) ~/.cache/vimtex 
```



