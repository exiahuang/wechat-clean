# wechat-clean

[wechat-clean](https://github.com/exiahuang/wechat-clean)
清理微信视频，语音记录，不会删除聊天记录。可以指定删除n天前图片

## download

```sh
# 下载脚本
curl -O -L -s https://raw.githubusercontent.com/exiahuang/wechat-clean/master/wechat-clean.sh
chmod 770 wechat-clean.sh
```

## usage

清理脚本

```sh
echo "删除8天"
clear_wechat /sdcard/tencent/MicroMsg 8
echo "检查存储空间"
check_disk /sdcard/tencent/MicroMsg

```


`三星`多开

```sh
clear_wechat /sdcard/DualApp/tencent/MicroMsg/ 8
check_disk /sdcard/DualApp/tencent/MicroMsg/
```


使用`parallel_lite`的用户

```sh
clear_wechat /mnt/sdcard/parallel_lite/0/tencent/MicroMsg 8
check_disk /mnt/sdcard/parallel_lite/0/tencent/MicroMsg
```
