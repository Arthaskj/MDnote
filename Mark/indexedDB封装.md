# IndexedDB封装

>随着浏览器的功能不断增强，越来越多的网站开始考虑，将大量数据储存在客户端，这样可以减少从服务器获取数据，直接从本地获取数据。
>
>现有的浏览器数据储存方案，都不适合储存大量数据：Cookie 的大小不超过4KB，且每次请求都会发送回服务器；LocalStorage 在 2.5MB 到 10MB 之间（各家浏览器不同），而且不提供搜索功能，不能建立自定义的索引。所以，需要一种新的解决方案，这就是 IndexedDB 诞生的背景。
>
>通俗地说，IndexedDB 就是浏览器提供的本地数据库，它可以被网页脚本创建和操作。IndexedDB 允许储存大量数据，提供查找接口，还能建立索引。这些都是 LocalStorage 所不具备的。就数据库类型而言，IndexedDB 不属于关系型数据库（不支持 SQL 查询语句），更接近 NoSQL 数据库。
>
>IndexedDB 具有以下特点。
>
>**（1）键值对储存。** IndexedDB 内部采用对象仓库（object store）存放数据。所有类型的数据都可以直接存入，包括 JavaScript 对象。对象仓库中，数据以"键值对"的形式保存，每一个数据记录都有对应的主键，主键是独一无二的，不能有重复，否则会抛出一个错误。
>
>**（2）异步。** IndexedDB 操作时不会锁死浏览器，用户依然可以进行其他操作，这与 LocalStorage 形成对比，后者的操作是同步的。异步设计是为了防止大量数据的读写，拖慢网页的表现。
>
>**（3）支持事务。** IndexedDB 支持事务（transaction），这意味着一系列操作步骤之中，只要有一步失败，整个事务就都取消，数据库回滚到事务发生之前的状态，不存在只改写一部分数据的情况。
>
>**（4）同源限制** IndexedDB 受到同源限制，每一个数据库对应创建它的域名。网页只能访问自身域名下的数据库，而不能访问跨域的数据库。
>
>**（5）储存空间大** IndexedDB 的储存空间比 LocalStorage 大得多，一般来说不少于 250MB，甚至没有上限。
>
>**（6）支持二进制储存。** IndexedDB 不仅可以储存字符串，还可以储存二进制数据（ArrayBuffer 对象和 Blob 对象）。

```js
/**
  * @CreatedTime：2019/06/20 16:34:50
  * @params：
  * @Description：使用浏览器数据库IndexedDB
  */
  indexDB(opt) {
    class indexedDB {
      // 构造
      constructor(opt) {
        if (!opt) return;
        this.onsuccess = opt.onsuccess;
        this.onerror = opt.onerror;
        this.onupgradeneeded = opt.onupgradeneeded;
      }

      /**
      * @CreatedTime：2019/06/20 18:24:18
      * @params：
      * @Description：统一对数据库开启，使用回调
      */
      initdb(opt) {
        if (!opt) {
          console.log("缺少配置项");
          return;
        }
        let that = this;
        this.indexedDB = window.indexedDB || window.webkitIndexedDB || window.mozIndexedDB || window.msIndexedDB;
        if (!this.indexedDB) {
          console.log("你的浏览器不支持IndexedDB");
          return;
        }

        return new Promise((success, error) => {
          let request = this.indexedDB.open(opt.dbname, opt.version);

          request.onerror = function(e) {
            console.log(e.currentTarget.error.message);
            that.onerror && that.onerror(e);
            error(e);
          };

          request.onsuccess = function(e) {
            console.log('成功打开DB');
            if (!this.useupgrad) {
              that.db = e.target.result;
              success(e);
            }
            that.onsuccess && that.onsuccess(e);
          };

          request.onupgradeneeded = function(e) {
            that.db = e.target.result;
            that.useupgrad = true;
            console.log('数据库版本更改为： ' + opt.version);
            that.onupgradeneeded && that.onupgradeneeded(e);
            that.deleteStore(opt);
            success(e);
          };
        })
      }

      /**
      * @CreatedTime：2019/06/20 18:19:44
      * @params：{dbname:数据库名称,version:数据库版本号,
      * stores:表信息数组
      * [
      *   {
      *    storename:表名,keys:主键
      *     {
      *       name:主键名称,
      *       unique:是否可重复
      *     }
      *   }
      * ],
      * delstore:表名数组}
      * @Description：数据库开启/创建表/删除表
      */
      open(opt) {
        let that = this;
        this.initdb(opt).then((e)=>{
          if (opt.stores && opt.stores.length) {
            opt.stores.forEach((store) => {
              if (!that.db.objectStoreNames.contains(store.storename)) {
                // 如果表格不存在，创建一个新的表格（keyPath，主键 ； autoIncrement,是否自增），会返回一个对象（objectStore）
                let objectStore = that.db.createObjectStore(store.storename, {
                  keyPath: "id",
                  autoIncrement: true
                });

                // 指定可以被索引的字段，unique字段是否唯一
                if (store.keys && store.keys.length) {
                  store.keys.forEach((key) => {
                    objectStore.createIndex(key.name, key.name, {
                      unique: key.unique
                    });
                  })
                }
              }
            })
          }
        });
      }

      /**
      * @CreatedTime：2019/06/20 18:08:29
      * @params：{storeName:表名， data:添加的数据}
      * @Description：添加数据
      */
      add(opt) {
        let that = this;
        return new Promise((success, error) => {
          // 创建事务
          let request = that.db.transaction([opt.storeName], 'readwrite')
            .objectStore(opt.storeName)
            .add(opt.data);

          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })
      }

      /**
      * @CreatedTime：2019/06/20 18:09:04
      * @params：{storeName:表名，key:主键,value:主键值}
      * @Description：删除数据
      */
      delete(opt) {
        let that = this;
        return new Promise((success, error) => {
          let store = that.db.transaction(opt.storeName, 'readwrite')
            .objectStore(opt.storeName);

          if (opt.key) {
            request = store.index(opt.key || "id")["delete"](opt.value);
          } else {
            request = store["delete"](opt.value);
          }
          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })

      }

      /**
      * @CreatedTime：2019/06/20 18:10:03
      * @params：{storeName:表名，key:主键,value:主键值}
      * @Description：获取数据
      */
      get(opt) {
        let that = this;
        return new Promise((success, error) => {
          let request, store = that.db.transaction(opt.storeName, 'readwrite')
            .objectStore(opt.storeName)

          if (opt.key) {
            request = store.index(opt.key || "id").get(opt.value);
          } else {
            request = store.get(opt.value);
          }

          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })
      }

      /**
      * @CreatedTime：2019/06/20 17:59:33
      * @params：{storeName:表名 key:键值 newData：新数据}
      * @Description：更新数据
      */
      update(opt) {
        let that = this;
        return new Promise((success, error) => {
          let transaction = that.db.transaction(opt.storeName, 'readwrite');

          let request, store = transaction.objectStore(opt.storeName);

          if (opt.key) {
            request = store.index(opt.key || "id").get(opt.value);
          } else {
            request = store.get(opt.value);
          }
          request.onsuccess = (e) => {
            var data = e.target.result;
            for (let a in opt.newData) {
              // 除了keypath之外
              data[a] = opt.newData[a];
            }
            store.put(data);
            success(e.target.result, e);
          };
          request.onerror = (e) => {
            error(e);
          };
        })

      }

      /**
      * @CreatedTime：2019/06/20 17:57:35
      * @params：{delstores:空间名称数组}
      * @Description：删除空间
      */
      deleteStore(opt) {
        let that = this;
        if (opt.delstores && opt.delstores.length) {
          opt.delstores.forEach((store) => {
            if (that.db.objectStoreNames.contains(store)) {
              // 如果存在表格，则删除
              that.db.deleteObjectStore(store);
            }
          })
        }
      }

      /**
      * @CreatedTime：2019/06/20 17:58:27
      * @params：{db:indexedDB对象}
      * @Description：关闭数据库
      */
      closeDB(db) {
        db.close();
      }

      /**
      * @CreatedTime：2019/06/20 17:58:58
      * @params：{name:数据库名称}
      * @Description：删除数据库
      */
      deleteDB(name) {
        this.indexedDB.deleteDatabase(name);
      }
    }
    return new indexedDB(opt);
  }
```

