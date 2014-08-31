(function ($) {
    $.fn.extend({
        ScrollTable: function (options) {
            var defaults = {
                MaxHeight: 400,
                MaxDataItemIndex: 1 // 固定前MaxDataItemIndex作为固定表头
            };
            options = $.extend(defaults, options);

            return this.each(function () {
                var $this = $(this);

                // 产生表头部分和身体部分
                var $cloneTableHeader = $this.clone();
                var $cloneTableBody = $this.clone();
                $cloneTableHeader.find("tr").filter(function (index) { return index >= options.MaxDataItemIndex }).remove();
                $cloneTableBody.find("tr").filter(function (index) { return index < options.MaxDataItemIndex }).remove();

                //取得表头每列宽带
                var headWidth = [];
                $cloneTableHeader.find("th").each(function(){
                    headWidth.push($(this).width());
                })
                var contentFirstRow = $cloneTableBody[0];
                $(contentFirstRow).find("td").each(function(index,elem){
                    $(elem).width(headWidth[index]);
                })

                // 将产生的表头和身体部分放入Container，并做一些微调
                $this.after("<div class='ScrollTableContainer' style=''></div>");
                $this.next().append("<div class='table-head'></div>");
                //id 设置为head
                $cloneTableHeader.find(".table").attr("id","head");
                $this.next().find("div.table-head").append($cloneTableHeader);
                $this.next().append("<div class='ScrollDiv' style='overflow-y:auto;overflow-x:hidden;'></div>");
                //$this.next().css("width", $(this).width());
                $this.next().find("div.ScrollDiv").css({
                    "max-height": options.MaxHeight,
                    "min-height": options.MaxHeight,
                    "margin-top": -2,
                    "width":$("#table").width()+1
                });
                $this.next().find("div.ScrollDiv").append($cloneTableBody);
                $this.remove();

            });
        }
    });
})(jQuery);