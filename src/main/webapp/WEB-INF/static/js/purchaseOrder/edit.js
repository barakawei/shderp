/**
 * Created by baraka on 14-4-6.
 */
$(function(){

    var op = $("#op").val();
    var modelJson = $("#modelJson").val();
    var model = JSON.parse(modelJson);

    var purchaseVM = avalon.define("purchase", function (vm) {
        vm.list = [];
        vm.add = function(){
            vm.list.push(_.clone(model,true));
        };
        vm.remove = function(el){
            if(confirm("是否删除?")){
                vm.list.remove(el);
            }
        };

        vm.click = function(){
            var jsonData= JSON.stringify(vm.$model.list);
            $("#jsonData").val(jsonData);
        };
        vm.render= function(action){

            $('#purchase a').editable({
                type: 'text',
                inputclass: 'input-small',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.x-text').editable({
                type: 'text',
                inputclass: 'input-small',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.x-date').editable({
                type: 'date',
                inputclass: 'input-medium',
                format: 'yyyy-mm-dd',
                viewformat: 'yyyy-mm-dd',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    if(newValue == null || newValue == "" || newValue=="null"){
                        input.val("");
                    }else{
                        var val  = moment(newValue).format('YYYY-MM-DD');
                        input.val(val);
                    }
                }
            });


             /**
             $('#purchase .editable').off('hidden');
             $('#purchase .editable').on('hidden', function(e, reason){
                        if(reason === 'save' || reason === 'nochange') {
                            var $next = $(this).closest('td').next().find('.editable');
                                setTimeout(function() {
                                    $next.editable('show');
                                }, 300);
                        }
             });
             **/
             if(op=="查看"){
                 $('.editable').editable('option', 'disabled', true);
                 $(".btn-primary").remove();
                 //查看时隐藏类型列
                 $(".categoryType").each(function(){
                    $(this).remove();
                 });
             }else{
                var permission = $("#permission").val();
                 $('.editable').editable('option', 'disabled', true);
                 if(permission!=""){
                    $('.'+permission+'.editable').editable('option', 'disabled', false);
                 }
             }

             //合并类别
             var category1 = false;
             var category2 = false;
             var category3 = false;
             var category4 = false;
             var category5 = false;
             var category6 = false;
             var category7 = false;
             $(".category").each(function(){
                var td = $(this);
                var category = td.text();
                if(category == "面里料类衣"){
                    if(category1){
                        td.remove()
                    }else{
                        category1 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "辅料类衣" ){
                    if(category2){
                        td.remove()
                    }else{
                        category2 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "面里料类裤" ){
                    if(category3){
                        td.remove()
                    }else{
                        category3 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "辅料类裤" ){
                    if(category4){
                        td.remove()
                    }else{
                        category4 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "标识类" ){
                    if(category5){
                        td.remove()
                    }else{
                        category5 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "包装类" ){
                    if(category6){
                        td.remove()
                    }else{
                        category6 =true;
                        td.removeClass("hide");
                    }
                }
                if(category == "其它" ){
                    if(category7){
                        td.remove()
                    }else{
                        category7 =true;
                        td.removeClass("hide");
                    }
                }
             });

        //$("#purchase").ScrollTable();
        //取得表头每列宽带
                var headWidth = [];
                $(".table-head th").each(function(){
                    headWidth.push($(this).width());
                });
                var content = $(".table-content")[0];
                $(content).find("td").each(function(index,elem){
                    $(elem).width(headWidth[index]);
                });
                $(".ScrollDiv").css("max-height", $(window).height()-320)
                $(".ScrollDiv").css("min-height", $(window).height()-320)

                //点中高亮
                 $(".table tr").click(function(){
                    //移除上一个高亮
                    $(".active").removeClass("active");
                    $(this).addClass("active");
                })
         }

    });

    if(op=="新增"){
        purchaseVM.list.push(_.clone(model,true));
    }else{
        if(op=="查看"){
            $(".operator").remove();
        }
    	var jsonString = $("#jsonData").val();
    	var jsonData = JSON.parse(jsonString);
    	var groupData = _.groupBy(jsonData, function(num){
    	                    return Math.floor(num);
    	                });
    	purchaseVM.list = jsonData;
    }



});

