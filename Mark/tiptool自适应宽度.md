### 自适应中文或英文或符号长度
```javascript
//评级意见显示
    tipTool: function (item,IsText) {
        var me = this;
        if (IsText == "true") {
            if (!item) return "--";
            var str = '<span class="hy_grid_warn" hy_content="' + item + '"><span style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">' + item + '</span></span>';
            return str;
        }
        var spans = $('span.hy_grid_warn');
        //去掉后边的加号，直接鼠标移动到文字上就可以显示详细信息
        Box.each(spans, function (span, index) {
            var sp = $(span);
            if (sp.attr("IsSelect") == "true") return;
            sp.attr("IsSelect", "true");
            var td = sp.closest("td").width();
            var num = td / 12,arr = sp.attr('hy_content').split(""),n = 0,strArr = [];
            arr.forEach(function (i) {
                if (n < td + 20) {
                    if (i.match(/^[\u4E00-\u9FA5]{1,}$/)) {n += 12;} else { n += 6; };
                    strArr.push(i);
                }
            })
            sp.find("span").text(strArr.join(""));
            if (sp.attr('hy_content').length > num) {
                sp.kendoTooltip({
                    content: sp.attr('hy_content'),
                    filter: "span",
                    width: (td<400 ? "auto" : 400),
                }).data("kendoTooltip")
            }
        });
    },
```

