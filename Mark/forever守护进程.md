```
# 启动
forever start ./bin/www  ＃最简单的启动方式
forever start -l forever.log ./bin/www  #指定forever日志输出文件，默认路径~/.forever
forever start -l forever.log -a ./bin/www  #需要注意，如果第一次启动带日志输出文件，以后启动都需要加上 -a 参数，forever默认不覆盖原文件
forever start -o out.log -e err.log ./bin/www  ＃指定node.js应用的控制台输出文件和错误信息输出文件
forever start -w ./bin/www  #监听当前目录下文件改动，如有改动，立刻重启应用，不推荐的做法！如有日志文件，日志文件是频繁更改的

# 重启
forever restart ./bin/www  ＃重启单个应用
forever restart [pid]  #根据pid重启单个应用
forever restartall  #重启所有应用

# 停止（和重启很类似）
forever stop ./bin/www  ＃停止单个应用
forever stop [pid]  #根据pid停止单个应用
forever stopall  ＃停止所有应用

# 查看forever守护的应用列表
forever list
```