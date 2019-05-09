安装python3.6可能使用相关软件



\# yum groupinstall 'Development Tools'



\# yum install -y ncurses-libs zlib-devel mysql-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel



安装python3.6.5



python官网下载[https://www.python.org](https://www.python.org/)



下载的安装包存放在/usr/local目录



\# cd /usr/local



\# wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz



解压：



\# tar-xfPython-3.6.5.tar.xz



解压后新建文件夹将Python-3.6.5放在/usr/local/python3下



进入该目录····························一定要进去的哈，不然安装会出错

1. \# mkdir python3
2. \# mv Python-3.6.5 python3
3. \# cd python3/Python-3.6.5

执行如下代码安装



安装之前需要安装gcc编译器     By Arthas

yum install gcc



···························--prefix选项是配置安装的路径,执行后所有资源文件放在/usr/local/python3.6的路径中

1. \# ./configure --prefix=/usr/local/python3 --enable-optimizations
2. \# make
3. \# make altinstall

修改软链接：



修改之前一定要对以存在的/usr/bin/python更名，否则出现如下错误



ln: failed to create symbolic link ‘/usr/bin/python’: Fileexists



可修改为：



\# mv python python_old



························当然任意名字都可



终于可以修改软链接了

1. \# ln -s /usr/local/python3/bin/python3 /usr/bin/python
2. \# ln -s /usr/local/python3/bin/pip3 /usr/bin/pip

最后修改yum/gnome-tweak-tool/urlgrabber配置文件，否则之后使用yum可能报错

1. [root@VM_0_8_centos bin]# ls-olyum*
2. -rwxr-xr-x  1 root   802 May 24 23:05yum
3. -rwxr-xr-x  1 root  9430 May 24 23:06yum-builddep
4. -rwxr-xr-x  1 root  9040 May 24 23:05yum-config-manager
5. -rwxr-xr-x  1 root  7610 May 24 23:06yum-debug-dump
6. -rwxr-xr-x  1 root  7904 May 24 23:07yum-debug-restore
7. -rwxr-xr-x. 1 root 10999 Aug 11  2017 yumdownloader
8. -rwxr-xr-x  1 root 11032 May 24 23:07yum-groups-manager

以上文件都要修改文件行首处 #!/usr/bin/python



改为#!/usr/bin/python2



输入：



\# vim yum-builddep



[root@VM_0_8_centos bin]# vim yum-builddep



\#!/usr/bin/python -tt        !!!!!!!!!!!!!!!!!!就是改这里 加个2 ·················哈哈



\# This program is free software; you can redistribute it and/or modify



\# it under the terms of the GNU General Public License as published by



\# the Free Software Foundation; either version 2 of the License, or



\# (at your option) any later version.



····························省略一万字



gnome-tweak-tool/urlgrabber配置文件修改同上 ·········gnome-tweak-tool可能无须配置



最后查看安装版本：

1. \# python -V
2. \# pip -V

![img](E:/youdaoyun/m18326661192@163.com/1d059ff4f0814dc5ada0aaea8074ceee/a48547bc422e4f388fdb1c351acc7f21.png)



