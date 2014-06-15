/**
 * Created by baraka on 14-4-6.
 */
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


    var productionVM = avalon.define("production", function (vm) {
        vm.list = [];
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
    }

    //$.fn.editable.defaults.mode = 'inline';
});

