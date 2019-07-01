#!/bin/bash

#关闭worker进程函数
function stopWorker(){
    pid=`ps -ef | grep /worker所在文件的路径/ | grep -v grep |  awk '{print $2}'`
    kill -9  ${pid}
}
#开启worker进程函数
function startWorker(){
    nohup php workerName1 >/dev/null 2>&1 &
    nohup php workerName2 >/dev/null 2>&1 &
    ........
}

if [ -n "$1" ] 
then
    case "$1" in
        "stop")
            stopWorker
            ;;
        "start")
            startWorker
            ;;
        "restart")
            stopWorker
            startWorker
            ;;
            *)
            echo "请输入命令行参数 start| stop | restart"
            ;;
                                                         
    esac
   
else
    echo "请输入命令行参数 start| stop | restart"    
fi
