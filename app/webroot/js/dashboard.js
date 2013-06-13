$(document).ready(function(){	
	$('.ajax').live('click',function(event){
		event.preventDefault();
		// console.log('here '+event.target);
		$.get($(this).attr('href'),null,function(data){
			response = eval('('+data+')');		
			if(response.success){
				console.log($(event.target).parent().attr('class'));
				$('#'+response.divId).hide();
			}
			$('#notification').html(response.message);
		});
	});
	$('.copublishers').each(function(){
		console.log($(this).attr('id'));
		var url = base_url+'publishers/getteam/'+$(this).attr('id');
		$.get(url,null,function(data) {
			response = eval('('+data+')');		
			// console.log(response);
			if(response.publishers){
				var html = '<div class="row-fluid">';
				for(var i in response.publishers){										
					var id = response.profileId+'_'+response.publishers[i].User.id;
					// console.log(response.canDelete);
					createElement(id,null);
					if(response.canDelete){
						actionHtml = '<div class="copublisheractions"><a data-target="#cpModal" role="button" data-toggle="modal" class="ajax" href="'+base_url+'publishers/getposts/'+response.profileId+'/'+response.publishers[i].User.id+'"><i class="icon-zoom-in"></i></a><a class="ajax" href="'+base_url+'publishers/delete/'+response.profileId+'/'+response.publishers[i].User.id+'"><i class="icon-remove-sign"></i></a></div>'; 						
					}else{
						actionHtml = '<div class="copublisheractions"><a data-target="#cpModal" role="button" data-toggle="modal" class="ajax" href="'+base_url+'publishers/getposts/'+response.profileId+'/'+response.publishers[i].User.id+'"><i class="icon-zoom-in"></i></a></div>';
					}
					if(response.publishers[i].User.avatar){
						html += '<div class="span3 copublisher" id="'+id+'"><p><img src="'+response.publishers[i].User.avatar+'" height="100px" alt="'+response.publishers[i].User.email+'"/></p>'+actionHtml+'</div>';
					}else{
						// html += '<div class="span3 copublisher" id="'+id+'"><p><img src="'+silhouette+'" width="100" alt="'+response.publishers[i].User.email+'"/></p><p>'+response.publishers[i].Publisher.role+'</p></div>';	
						html += '<div class="span3 copublisher" id="'+id+'"><p><img src="'+silhouette+'" height="100px" title="'+response.publishers[i].User.email+'" alt="'+response.publishers[i].User.email+'"/></p>'+actionHtml+'</div>';
					}
					// html += '<div class="copublisheractions"><i class="icon-zoom-in"></i></div>'
					if(i%4==3){
						html += '</div><div class="clear mb10"></div><div class="row-fluid">';
					}
				}
				// console.log(html);
				$('#'+response.profileId).html(html);
			}
		});
	});
    $('.copublisher').live('hover',
	    function(event) {
	    	var element = $(this);
	    	if (event.type == 'mouseover' || event.type == 'mouseenter') {
		        element.find('.copublisheractions',0).show();
		    } else {
		        element.find('.copublisheractions',0).hide('slow');
		    }	    	
	    }
	);	
});
function createElement(id, value) {
	return $('<div>', { id: id , text: value});
} 