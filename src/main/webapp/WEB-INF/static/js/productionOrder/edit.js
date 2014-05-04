/**
 * Created by baraka on 14-4-6.
 */
$(function(){
	
    var colorModel = {
                colorName:"",
                style:"",
                materia:"",
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
        };
        vm.removeOutshell = function(el,data){
            el.outshellSetColorJson.remove(data);
        };
        vm.addLining = function(el){
            el.liningSetColorJson.push(_.clone(colorModel));
        };
        vm.removelining = function(el,data){
            el.liningSetColorJson.remove(data);
        };
        vm.addBagging = function(el){
            el.baggingJson.push(_.clone(colorModel));
        };
        vm.removeBagging = function(el,data){
            el.baggingJson.remove(data);
        };

        vm.click = function(){
            vm.outshellMainColor = JSON.stringify(vm.outshellMainColor);
            vm.liningMainColor = JSON.stringify(vm.liningMainColor);
            vm.outshellSetColorJson = JSON.stringify(vm.outshellSetColorJson);
            vm.liningSetColorJson = JSON.stringify(vm.liningSetColorJson);
            vm.baggingJson = JSON.stringify(vm.baggingJson);
            var jsonData= JSON.stringify(vm.$model.list);
            $("#jsonData").val(jsonData);
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
    


});

