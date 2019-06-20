```js
/**
  * @CreatedTime：2019/06/20 16:34:50
  * @params：
  * @Description：使用浏览器数据库IndexedDB
  */
  indexDB() {
    class indexedDB {
      // 构造
      constructor(opt) {
        if (!opt) return;
        this.onsuccess = opt.onsuccess;
        this.onerror = opt.onerror;
        this.onupgradeneeded = opt.onupgradeneeded;
      }
      open(opt) {
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
        let request = this.indexedDB.open(opt.dbname, opt.version);

        request.onerror = function(e) {
          console.log(e.currentTarget.error.message);
          that.onerror && that.onerror(e);
        };

        request.onsuccess = function(e) {
          if (!this.useupgrad){
            that.db = e.target.result;
          }
          console.log('成功打开DB', e);
          that.onsuccess && that.onsuccess(e);
        };

        request.onupgradeneeded = function(e) {
          that.db = e.target.result;
          that.useupgrad = true;
          console.log('数据库版本更改为： ' + opt.version, e);
          // 创建多个空间
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

          that.onupgradeneeded && that.onupgradeneeded(e);
        };
      }
      createTable(name) {
        let that = this;
        if (!that.db.objectStoreNames.contains(name)) {
          // 如果表格不存在，创建一个新的表格（keyPath，主键 ； autoIncrement,是否自增），会返回一个对象（objectStore）
          let objectStore = that.db.createObjectStore(name, {
            keyPath: "id",
            autoIncrement: true
          });

          // 指定可以被索引的字段，unique字段是否唯一
          objectStore.createIndex("name", "name", {
            unique: false
          });

          objectStore.createIndex("phone", "phone", {
            unique: false
          });
        }
      }
      add(storeName, data, type) {
        let that = this;
        return new Promise((success, error) => {
          // 创建事务
          let request = that.db.transaction([storeName], type || 'readwrite')
            .objectStore(storeName)
            .add(data);

          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })
      }
      delete(storeName, key, type) {
        let that = this;
        return new Promise((success, error) => {
          let request = that.db.transaction(storeName, type || 'readwrite')
            .objectStore(storeName)["delete"](key);

          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })

      }
      find(storeName, value, key, type) {
        let that = this;
        return new Promise((success, error) => {
          let request, store = that.db.transaction(storeName, type || 'readwrite')
            .objectStore(storeName)

          if (key) {
            request = store.index(key || "id").get(value);
          } else {
            request = store.get(value);
          }

          request.onsuccess = (e) => {
            success(e.target.result, e);
          }
          request.onerror = (e) => {
            error(e);
          };
        })
      }
      update(storeName, key, newData, type) {
        let that = this;
        return new Promise((success, error) => {
          let transaction = that.db.transaction(storeName, type || 'readwrite');

          let store = transaction.objectStore(storeName);

          let request = store.get(key);
          request.onsuccess = (e) => {
            var data = e.target.result;
            for (let a in newData) {
              // 除了keypath之外
              data[a] = newData[a];
            }
            store.put(data);
            success(e.target.result, e);
          };
          request.onerror = (e) => {
            error(e);
          };
        })

      }
      closeDB(db) {
        db.close();
      }
      deleteDB(name) {
        this.indexedDB.deleteDatabase(name);
      }
    }
    return new indexedDB;
  }
```

