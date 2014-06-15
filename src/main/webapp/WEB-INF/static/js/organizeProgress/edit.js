/**
 * Created by baraka on 14-4-6.
 */
$(function(){

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


             $('.organizeProgress .editable').off('hidden');
             $('.organizeProgress .editable').on('hidden', function(e, reason){
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

