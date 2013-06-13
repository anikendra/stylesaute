$(document).ready(function(){
	$('ul.pager li a').click(function(event){
		event.preventDefault();
		$.get($(this).attr('href'),null,function(data){
			$('#posts').html(data);
		});
	});	
});