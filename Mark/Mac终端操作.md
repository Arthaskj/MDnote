# Mac操作指南
## 添加全局变量让自己的Shell脚本在任何目录下都能执行

> 本文只添加用户级全局变量，不添加系统级（为了系统安全）

### 1、在系统`~`目录下找到`.bash_profile`文件，如果不存在创建一个即可`touch .bash_profile`

### 2、`vim .bash_profile`用Vim编辑该文本，在文本中添加路径`export PATH=$PATH:/Users/hostname/demoshell.sh`

### 3、用`source ./.bash_profile`命令更新一下环境变量，这样你就可以在任何目录下执行`demoshell.sh`的shell脚本


## 后记
> 为了管理方便，建议直接在`~`目录建立一个自己的`bin`目录，将所有需要运行的脚本放在这个目录下面，然后PATH路径改成`export PATH=$PATH:/Users/hostname/bin`即可。Linux系统的方法类似，但是文件名可能不同，请另行尝试。

![1](https://arthaskj.github.io/imglib/img/12103.png)
![2](https://arthaskj.github.io/imglib/img/12101.png)
![3](https://arthaskj.github.io/imglib/img/12102.png)


# Mac下终端神器ZSH
### 1、改变终端输入源
`chsh -s /bin/zsh`或`chsh -s /bin/bash`

`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh   //下载安装oh-my-zsh`

```
command + d => 垂直分屏
command + shift+d => 水平分屏
command + option + 上下左右方向键 => 切屏
command + enter => 切换成全屏显示
```
[更多快捷键点此进入 =>                http://www.cr173.com/html/48065_1.html](http://www.cr173.com/html/48065_1.html "快捷键链接")
> 终端从bash更换为zsh之后之前的全局变量都会失效，解决方法是将`~`目录下的`.zshrc`备份一份，然后将原先`.bash_profile`内的内容追加到`.zshrc`中即可。保存`.zshrc`之后记得完全退出***iTerm***，再次进入***iTerm***之后原先的环境变量即可再次使用。

![zsh终端](https://arthaskj.github.io/imglib/img/12104.png "zsh终端")