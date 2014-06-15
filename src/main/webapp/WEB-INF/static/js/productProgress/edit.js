/**
 * Created by baraka on 14-4-6.
 */
$(function(){

            var dictsJson = $("#dicts").val();
            if(dictsJson !=null && dictsJson!=""){
                var dicts = JSON.parse(dictsJson);
                var orderTypeDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "orderType";}),"name");
                var productStatusDicts = _.pluck(_.filter(dicts, function(dict) {return dict.type === "productStatus";}),"name");
            }

             if(dictsJson !=null && dictsJson!=""){
                        $('.x-text.plan').editable({
                            type:"select",
                            inputclass: 'input-medium',
                            source:orderTypeDicts,
                            success: function(response, newValue) {
                                var self = $(this);
                                var input = self.next().next();
                                input.val(newValue);
                            }
                        });
                         $('.x-text.produce').editable({
                             type:"select",
                             inputclass: 'input-medium',
                             source:productStatusDicts,
                             success: function(response, newValue) {
                                 var self = $(this);
                                 var input = self.next().next();
                                 input.val(newValue);
                             }
                         });
                         }

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


             $('.productProgress.editable').off('hidden');
             $('.productProgress .editable').on('hidden', function(e, reason){
                        if(reason === 'save' || reason === 'nochange') {
                            var $next = $(this).closest('td').next().find('.editable');
                                setTimeout(function() {
                                    $next.editable('show');
                                }, 300);
                        }
             });
                var permission = $("#permission").val();
                 $('.editable').editable('option', 'disabled', true);
                 if(permission!=""){
                    $('.'+permission+'.editable').editable('option', 'disabled', false);
                 }


});

