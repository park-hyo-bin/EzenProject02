/**

 
$('document').ready(function(){
	$('modal-footer #detailbutton').on('click',function(event){
		event.preventDefault();
		
		var href = (this).attr('href');
		$.get(href, function(RLi){
			$('#Ruserid').val(RLi.userId);
			$('#RDate').val(RLi.rDate);
			$('#RPDate').val(RLi.svcDate);
			$('#RPublicName').val(RLi.publicName);
		});
		
			$('#detailModal').modal();
	});
	
}); * 
 */