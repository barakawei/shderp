/**
 * Created by baraka on 14-4-6.
 */
 // 对Date的扩展，将 Date 转化为指定格式的String
 // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
 // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
 // 例子：
 // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
 // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
 Date.prototype.Format = function(fmt){ //author: meizz
   var o = {
     "M+" : this.getMonth()+1,                 //月份
     "d+" : this.getDate(),                    //日
     "h+" : this.getHours(),                   //小时
     "m+" : this.getMinutes(),                 //分
     "s+" : this.getSeconds(),                 //秒
     "q+" : Math.floor((this.getMonth()+3)/3), //季度
     "S"  : this.getMilliseconds()             //毫秒
   };
   if(/(y+)/.test(fmt))
     fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
   for(var k in o)
     if(new RegExp("("+ k +")").test(fmt))
   fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
   return fmt;
 }


$(function(){
    var dictsJson = $("#dicts").val();
    if(dictsJson !=null && dictsJson!=""){
    var dicts = JSON.parse(dictsJson);
    var nameDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "name";}),"name");
    var brandDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "brand";}),"name");
    var sizeStandardsMaleDicts= _.pluck(_.filter(dicts, function(dict) {return dict.type === "sizeStandardsMale";}),"name");
    var sizeStandardsFemaleDicts= _.pluck(_.filter(dicts, function(dict) {return dict.type === "sizeStandardsFemale";}),"name");
    var styleDicts= _.pluck(_.filter(dicts, function(dict) {return dict.type === "style";}),"name");
    var handleMethodDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "handleMethod";}),"name");
    var sampleStyleDicts= _.pluck(_.filter(dicts, function(dict) {return dict.type === "sampleStyle";}),"name");
    var sampleProviderDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "sampleProvider";}),"name");
    var materialReserveDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "materialReserve";}),"name");
    var outshellStyleDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "outshellStyle";}),"name");
    var outshellMaterialDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "outshellMaterial";}),"name");
    var outshellHandleDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "outshellHandle";}),"name");
    var liningStyleDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "liningStyle";}),"name");
    var liningMaterialDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "liningMaterial";}),"name");
    var liningHandleDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "liningHandle";}),"name");
    var packagingReqDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "packagingReq";}),"name");
    var packingReqDicts= _.pluck(_.filter(dicts, function(dict) {return dict.type === "packingReq";}),"name");
    var sizebeltReqDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "sizebeltReq";}),"name");
    var companylogoReqDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "companylogoReq";}),"name");
    var productionPartsDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "productionParts";}),"name");
    var checkReportDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "checkReport";}),"name");
    }
    var colorModel = {
                colorName:"",
                style:"",
                material:"",
                handle:""
    };


    var productionModel = {
        name:"",
        brand:"",
        styleNumberFemale:"",
        styleNumberMale:"",
        sizeStandardsMale:"",
        sizeStandardsFemale:"",
        style:"",
        handleMethod:"",
        sampleStyle:"",
        sampleStyleNumber:"",
        sampleAmount:"",
        sampleRevisionDesc:"",
        sampleProvider:"",
        materialReserve:"",
        measureSampleVersion:"",
        measureStaff:"",
        archiveStaff:"",
        finishDate:"",
        outshellMainColor:_.clone(colorModel),
        liningMainColor:_.clone(colorModel),
        outshellSetColorJson:[_.clone(colorModel)],
        liningSetColorJson:[_.clone(colorModel)],
        baggingJson:[_.clone(colorModel)],
        //面辅料特殊要求
        	materialSpecialReq:"",
        	//填充物要求
        	packingReq:"",
        	//其他要求
        	otherReq:"",
        	//人数男
        	 peopleNumberMale:"",
        	//人数女
        	 peopleNumberFemale:"",
        	//人数合计
        	 totalPeople:"",
        	//数量男
        	 amountMale:"",
        	//数量女
        	 amountFemale:"",
        	//可利用男
        	 availableMale:"",
        	//可利用女
        	 availableFemale:"",
        	//需生产男
        	 needMale:"",
        	//需生产女
        	 needFemale:"",
        	//订单合计
        	 orderTotal:"",
        	//生产合计
        	 productionTotal:""




    };

    var changeInfoModel = {
        content:"",
        time:new Date().Format("yyyy-MM-dd")
    };

    var productionVM = avalon.define("production", function (vm) {
        vm.list = [];
        vm.changeInfo = [_.clone(changeInfoModel)];
        vm.addChangeInfo = function(){
            vm.changeInfo.push(_.clone(changeInfoModel,true));
        };
        vm.removeChangeInfo = function(el){
            vm.changeInfo.remove(el);
        };
        vm.add = function(){
            vm.list.push(_.clone(productionModel,true));
        };
        vm.remove = function(el){
                    vm.list.remove(el);
                }
        vm.addOutshell = function(el){
            el.outshellSetColorJson.push(_.clone(colorModel));
            vm.render();
        };
        vm.removeOutshell = function(el,data){
            el.outshellSetColorJson.remove(data);
        };
        vm.addLining = function(el){
            el.liningSetColorJson.push(_.clone(colorModel));
            vm.render();
        };
        vm.removeLining = function(el,data){
            el.liningSetColorJson.remove(data);
        };
        vm.addBagging = function(el){
            el.baggingJson.push(_.clone(colorModel));
            vm.render();
        };
        vm.removeBagging = function(el,data){
            el.baggingJson.remove(data);
        };

        vm.click = function(){
            //组织品名数据
            vm.outshellMainColor = JSON.stringify(vm.outshellMainColor);
            vm.liningMainColor = JSON.stringify(vm.liningMainColor);
            vm.outshellSetColorJson = JSON.stringify(vm.outshellSetColorJson);
            vm.liningSetColorJson = JSON.stringify(vm.liningSetColorJson);
            vm.baggingJson = JSON.stringify(vm.baggingJson);
            var jsonData= JSON.stringify(vm.$model.list);
            $("#jsonData").val(jsonData);
            //组织变更信息
            var changeInfoJson = JSON.stringify(vm.$model.changeInfo);
             $("#changeInfoJson").val(changeInfoJson);
            //组织标示图片数据
            $(".tradeMark").each(function(index){
                var obj = $(this);
                var name = obj.attr("data-name");
                var src = obj.attr("data-src");
                var srcInput = $("<input>").attr("name","uploads["+index+"].src").attr("value",src);
                var nameInput = $("<input>").attr("name","uploads["+index+"].name").attr("value",name);
                $(".ajax-upload-input").append(srcInput).append(nameInput);
            });


        };

        vm.render= function(action){

        if(dictsJson !=null && dictsJson!=""){
            $('.name').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: nameDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.brand').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: brandDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.styleNumberMale').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.sizeStandardsMale').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: sizeStandardsMaleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.styleNumberFemale').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.sizeStandardsFemale').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: sizeStandardsFemaleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.style').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: styleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.handleMethod').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: handleMethodDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.sampleStyle').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: sampleStyleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.sampleStyleNumber').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.sampleAmount').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.sampleRevisionDesc').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.sampleProvider').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: sampleProviderDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.materialReserve').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: materialReserveDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.measureSampleVersion').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.measureStaff').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.archiveStaff').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.x-date').editable({
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
            $('.outshellColorName').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.outshellStyle').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: outshellStyleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.outshellMaterial').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: outshellMaterialDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.outshellHandle').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: outshellHandleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.liningColorName').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.liningStyle').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: liningStyleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.liningMaterial').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: liningMaterialDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.liningHandle').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: liningHandleDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.text').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            $('.number').editable({
                inputclass: 'input-medium',
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                },
                validate:function(v){
                     if(isNaN(v)){
                        return '请输入数字!';
                     }
                }
            });
            $('.packagingReq').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: packagingReqDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.packingReq').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: packingReqDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.sizebeltReq').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: sizebeltReqDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });

            $('.companylogoReq').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: companylogoReqDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.productionParts').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: productionPartsDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });


            $('.checkReport').editable({
                inputclass: 'input-medium',
                select2: {
                            tags: checkReportDicts,
                            tokenSeparators: [",", " "]
                },
                success: function(response, newValue) {
                    var self = $(this);
                    var input = self.next().next();
                    input.val(newValue);
                }
            });
            var op = $("#op").val();
            var canEdit= $("#canEdit").val();
            if(op=="查看" || canEdit == "false"){
                $(".btn-primary").remove();
                $(".fileinput-button").remove();
                $(".imgDel").remove();
                $('.editable').editable('option', 'disabled', true);
                $(".operator-btn").remove();
            }
            }
        };


    });
    var op = $("#op").val();
    if(op=="新增"){
    	 //链接单添加页面
        productionVM.list.push(_.clone(productionModel,true));
    }else{
    	//显示链接单编辑页面
    	var jsonString = $("#jsonData").val();
    	var jsonData = JSON.parse(jsonString);
    	_.each(jsonData,function(data){
    		data.outshellMainColor = JSON.parse(data.outshellMainColor);
    		data.liningMainColor = JSON.parse(data.liningMainColor);
    		data.outshellSetColorJson = JSON.parse(data.outshellSetColorJson);
    		data.liningSetColorJson = JSON.parse(data.liningSetColorJson);
    		data.baggingJson = JSON.parse(data.baggingJson);
    	});
    	
    	productionVM.list = jsonData;

    	//变更信息
    	var changeJsonStr = $("#changeInfoJson").val();
        var changeInfoJson = JSON.parse(changeJsonStr);
        productionVM.changeInfo = changeInfoJson;
    }

    //$.fn.editable.defaults.mode = 'inline';
});

