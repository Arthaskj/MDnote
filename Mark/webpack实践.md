**Q**:在配置webpack.config.js自动打包的时候,出现Error: Cannot find module '@babel/core'错误

两种解决方案:

1. 回退低版本

```shell
npm install -D babel-loader@7 babel-core babel-preset-env
```

1. 更新到最高版本:

```shell
npm install -D babel-loader @babel/core @babel/preset-env webpack
```





**Q**:webpack4.26后uglifyjs-webpack-plugin不在使用

使用terser-webpack-plugin 替换原来的uglifyjs-webpack-plugin



**Q**:Error: Chunk.entrypoints: Use Chunks.groupsIterable and filter by instanceof Entrypoint instead

webpack4.0以上用3.x extract-webpack-plugin 打包会不兼容，extract-webpack-plugin升级就可以了

```shell
npm install --save-dev extract-text-webpack-plugin@4.0.0-beta.0
```



**Q**:clean-webpack-plugin only accepts an options object

**clean-webpack-plugin**插件用来清除残留打包文件，特别是文件末尾添加了hash之后，会导致改变文件内容后重新打包时，文件名不同而内容越来越多。

显然是因为版本升级导致的传参不一致，最新版本的参数仅一个对象。

```config
const CleanWebpackPlugin = require("clean-webpack-plugin");
  plugins: [
    ...// 这里是之前配置的其它各种插件
    new CleanWebpackPlugin()
  ]
```

即不传任何参数。