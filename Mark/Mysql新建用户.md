### 新建用户
> 关于mysql8上创建远程连接用户方法
```mysql
mysql8和原来的版本有点不一样，8的安全级别更高，所以在创建远程连接用户的时候，

不能用原来的命令（同时创建用户和赋权）:

mysql>grant all PRIVILEGES on *.* to test@'localhost' identified  by '123456';



必须先创建用户（密码规则：mysql8.0以上密码策略限制必须要大小写加数字特殊符号）：

mysql>create user chenadmin@'%' identified  by 'Chenadmin0.';

再进行赋值：

mysql>grant all privileges on Project.* to chenadmin@'%' with grant option;

最后刷新一下：

mysql>flush privileges;

当你进行远程连接是，会出现这样的错误：

Unable to load authentication plugin 'caching_sha2_password'.

是因为mysql8使用的是caching_sha2_password加密规则，最简单的方法是修改远程连接用户的加密规则：

mysql>ALTER USER 'chenadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Chenadmin0.';
```

### MySQL备份数据库
```mysql
mysqldump -u arthas -h 128.0.0.0 -p Project > Project.sql

mysqldump -u arthas -h 128.0.0.0 -p Project < Project.sql
```