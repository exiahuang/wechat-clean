# wechat-clean

[exiahuang/wechat-clean](https://github.com/exiahuang/wechat-clean)
清理微信视频，语音记录，不会删除聊天记录。可以指定删除n天前图片

清理微信数据目录下n天前数据

- $wechat_dir/Download
- $wechat_dir/用户ID/voice2
- $wechat_dir/用户ID/emoji
- $wechat_dir/用户ID/image2
- $wechat_dir/用户ID/attachment
- $wechat_dir/用户ID/sns
- $wechat_dir/用户ID/avatar
- $wechat_dir/用户ID/favorite
- $wechat_dir/用户ID/openapi

删除所有的
- $wechat_dir/xlog

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
./wechat-clean.sh clear_wechat /sdcard/tencent/MicroMsg 8
echo "检查存储空间"
./wechat-clean.sh check_disk /sdcard/tencent/MicroMsg

```


`三星`多开用户

```sh
./wechat-clean.sh clear_wechat /sdcard/DualApp/tencent/MicroMsg/ 8
./wechat-clean.sh check_disk /sdcard/DualApp/tencent/MicroMsg/
```


使用`parallel_lite`的用户

```sh
./wechat-clean.sh clear_wechat /mnt/sdcard/parallel_lite/0/tencent/MicroMsg 8
./wechat-clean.sh check_disk /mnt/sdcard/parallel_lite/0/tencent/MicroMsg
```
