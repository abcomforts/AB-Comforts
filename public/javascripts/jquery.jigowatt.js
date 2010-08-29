jQuery(document).ready(function(){
	
	$('#registerform').submit(function(){
	
		var action = $(this).attr('action');
		
		$("#message").slideUp(750,function() {
		$('#message').hide();
		
 		$('#submit')
			.after('<img src="/assets/ajax-loader.gif" class="loader" />')
			.attr('disabled','disabled');
		
		$.post(action, { 
			name: $('#name').val(),
			email: $('#email').val()
		},
			function(data){
				document.getElementById('message').innerHTML = data;
				$('#message').slideDown('slow');
				$('#registerform img.loader').fadeOut('slow',function(){$(this).remove()});
				$('#registerform #submit').attr('disabled',''); 
				if(data.match('success') != null) $('#registerform').slideUp('slow');
				
			}
		);
		
		});
		
		return false; 
	
	});
	
});