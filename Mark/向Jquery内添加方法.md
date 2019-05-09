### 向jquery中添加方法
```
 jQuery.fn.extend({
    HYResize: function (f) {
        var w = this.width(), h = this.height(), oldw, oldh;
        var me = this;
        var timer = setInterval(function () {
            oldw = this.width();
            oldh = this.height();
            if (oldw != w || oldh != h) {
                f();
            }
            w = oldw;
            h = oldh;
        }, 1);
        return timer;
    },
})
```