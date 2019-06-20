![logo](G:/TradeApi/04.Development/TradeWeb/assets/logo.png)



# 海益自动化测试系统

![npm](https://img.shields.io/badge/npm-6.1.0-brightgreen.svg)![node](https://img.shields.io/badge/node-v10.5.0-red.svg)![gulp](https://img.shields.io/badge/java-8.0.13-orange.svg)![babel](https://img.shields.io/badge/nightwatch-6.26.0-blue.svg)![babel](https://img.shields.io/badge/selenium-3.7.1-brightgreen.svg)![babel](https://img.shields.io/badge/chromedriver-74.0.3729.169-blueviolet.svg)

一个基于NightWatch、Selenium、Java和Node的自动化测试系统。



## 为什么要建这个项目

提高测试执行效率，节约时间成本，方便回归测试，解放人力去做更重要的工作。



## 技术栈和主要框架

- [NightWatch](https://nightwatchjs.org/)
- [Selenium](https://www.seleniumhq.org/)(需要翻墙)
- [Java](https://www.java.com/zh_CN/)
- [Node](https://nodejs.org/zh-cn/)



## 安装

项目需要搭配Node和Java环境使用

没有安装过Node环境的请[单击此处](https://www.runoob.com/nodejs/nodejs-install-setup.html)

没有安装过Java环境的请[单击此处](https://www.runoob.com/java/java-environment-setup.html)



## 使用

- 项目启动

  1. 双击运行`runselenium.bat`批处理程序，启动selenium服务
  2. 在根目录下打开终端，执行

  ```shell
  npm start 
  ```

  这条命令会执行`test`文件夹下所有的测试脚本，如果想单独或多个执行测试脚本，请使用下列语句

  ```shell
  //单个测试：
  nightwatch tests/one/firstTest.js
  
  //2个单独的测试：
  nightwatch tests/one/firstTest.js tests/secondTest.js
  
  //1个单独测试和1个文件夹：
  nightwatch tests/one/test.js tests/utils
  ```

  



- 项目配置

  1. nightwatch.json文件配置

     ```json
     {
         "src_folders": [ //存放测试用例的文件夹，文件夹不可嵌套
             "tests"
         ],
         "output_folder": "reports",//存放测试报告文件夹
         "custom_commands_path": "",
         "custom_assertions_path": "",
         "page_objects_path": "",
         "globals_path": "",
         "selenium": {
             "start_process": true,
             "server_path": "./bin/selenium-server-standalone-3.7.1.jar",//selenium包目录
             "log_path": "",
             "port": 4444,//服务默认端口
             "cli_args": {
                 "webdriver.chrome.driver": "./bin/chromedriver"//浏览器驱动目录
             }
         },
         "test_settings": {
             "default": {
                 "launch_url": "http://localhost",
                 "selenium_port": 4444,
                 "selenium_host": "localhost",
                 "silent": true,
                 "screenshots": {
                     "enabled": true,//是否开启截图，若为false，截图不成功
                     "path": ""
                 },
                 "desiredCapabilities": {//目前只支持chrome浏览器，想要支持其他浏览器需要下载对应的浏览器驱动以及进行相应的配置
                     "browserName": "chrome",
                     "marionette": true
                 }
             },
             "chrome": {
                 "desiredCapabilities": {
                     "browserName": "chrome"
                 }
             }
         }
     }
     ```

  2. 测试脚本编写

     > 测试脚本为js文件,更多语法请参考[Nightwatch官方Api文档](https://nightwatchjs.org/api)

     ```js
     module.exports = {
         'Search by baidu': function (client) {
             // 定义页面元素
             const searchInput = '#kw';
             const searchBtn = '#su';
             const resultContainer = '#container';
             // 启动浏览器并打开www.baidu.com
             client.url('http://baidu.com').maximizeWindow()
                 // 确保输入框可以使用.
                 .waitForElementVisible(searchInput, 5000)
                 // 输入"nightwatch"然后搜索.
                 .setValue(searchInput, 'nightwatch')
                 .click(searchBtn)
                 .waitForElementVisible(resultContainer, 1000)
                 // 截屏 
                 .saveScreenshot('reports/answers.png')
                 .end()
         }
     }
     ```

     > 要阻止测试模块运行，只需`disabled`将该模块中的属性设置为`true`，如下所示：

     ```js
     module.exports = {
       '@disabled': true, // This will prevent the test module from running.
     
       'sample test': function (browser) {
         // test code
       }
     };
     ```

  

- 结果展示

  > 测试完成后浏览器会自动显示测试结果

  ![1559028595022](E:\MDnote\Mark\assets\1559028595022.png)

  

