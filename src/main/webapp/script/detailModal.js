/**
 * 
                                              


 */
 
$(document).on("click", ".open-detailModal", function () { 
     var rNum = $(this).data('id'); 
     $(".form-group #rNum").val( rNum ); 
     });
     
