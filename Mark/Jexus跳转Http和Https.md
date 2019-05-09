### jexus下http跳转https
```
jexus http to https
一、摘要

1.80端口上只要没有网站使用 hosts=* 这样的配置，jexus会自动将域名跳转到 https 上。也就是说，你把网站默认配置文件default中的hosts=*改成具体的其它的域名，就会有https自动跳转功能。

2.如果多个https站点都要支持http to https，只需写一个default配置文件，port=80，hosts写成一个不存在的域名,root写成一个不存在的路径，“骗”jexus把80端口打开就行；80端口和443端口不能配置相同域名，否则将不会跳转。

原理：对于用户的HTTP访问某个网站时，jexus首先在80端口上查找是否有网站与这个域名匹配，如果有，就使用这个站应答，否则，就在443上查找，如果在443端口上找到了这个域名，就跳转到HTTPS。

```

