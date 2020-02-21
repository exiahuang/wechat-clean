#!/bin/bash
# 清理微信视频，语音记录，不会删除聊天记录。可以指定删除n天前图片
# author: exia.huang

function clear_wechat() {
    if [ -z "$1" ] || [ -z "$2" ]
    then
        echo "No argument supplied"
        return
    fi
    echo "wechat_dir : $1"
    echo "deltaTime : clear $2 days before"
	echo "storage:"
	wechat_dir=$1
	deltaTime=+$2
	echo "delete xlog"
	rm -rf $wechat_dir/xlog
	echo "delete download"
	clear_sub_wechat_data $wechat_dir Download $deltaTime
	echo "try to find MicroMsg path"
	array=($(find $wechat_dir -maxdepth 2 -name "image2" -type d))
	echo ${array[@]}
	for i in "${array[@]}"
	do 
		basedir=`dirname $i`
		echo $basedir
		#clear voice2
		#echo "delete voice2"; rm -rf $basedir/voice2
		clear_sub_wechat_data $basedir voice2 $deltaTime
		clear_sub_wechat_data $basedir emoji $deltaTime
		clear_sub_wechat_data $basedir image2 $deltaTime
		clear_sub_wechat_data $basedir attachment $deltaTime
		clear_sub_wechat_data $basedir sns $deltaTime
		clear_sub_wechat_data $basedir avatar $deltaTime
		clear_sub_wechat_data $basedir favorite $deltaTime
		clear_sub_wechat_data $basedir openapi $deltaTime
	done
}

function clear_sub_wechat_data() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
    then
        echo "No argument supplied"
        return
    fi
    echo "basedir : $1"
    echo "subdir : $2"
    echo "deltaTime : clear $3 days before"
	basedir=$1
	subdir=$2
	deltaTime=$3
	echo "start to delete $basedir/$subdir before $deltaTime"
	dir_files=($(find $basedir/$subdir -mtime $deltaTime -type f))
	echo "find files"
	for f in "${dir_files[@]}"
	do 
		echo "delete $f"
		rm -rf $f
	done
	echo "delete $subdir done"
}

function check_disk() {
    if [ -z "$1" ]
    then
        echo "please input path"
        return
    fi
	echo "storage:"
	du -sh $1/* | sort -n
	echo "check_disk done"
}

$*
