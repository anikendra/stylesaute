$(document).ready(function(){		
	$('#addCoPublisherButton').click(function(event){
		event.preventDefault();
		$.get($(this).attr('href'),null,function(data){
			$('#teammemberaddform').html(data);
		});
	});
	$('.dropdown-toggle').dropdown();
	/*$('.profileAction').click(function(){		
	    $('#cpModal').modal({
	    	remote: $(this).attr('url')
	    });
	});*/
	$('#myModal').on('hidden', function () {
    	$(this).removeData('modal');
    	document.location = base_url+"users/dashboard";
    });
	$('#cpModal').on('hidden', function () {
    	$(this).removeData('modal');
    	if(refreshPage){
    		document.location = base_url+"users/dashboard";    		
    	}
    });
	$('#inviteButton').click(function(){
		$('#cpModal').find('#modalContent',0).removeClass('h375');		
		// console.log($(this).attr('href'));
	    $('#cpModal').modal({
	    	remote: $(this).attr('href')
	    });
	});
	/*$('#addCoPublisherButton').click(function(){		
		$('#cpModal').modal('hide');
		// $(this).removeData('modal');
		// $('#cpModal').remove();
		// $('#cpModal').find('#modalContent',0).removeClass('h375');		
		console.log($(this).attr('href'));
	    $('#cpModal').modal({
	    	remote: $(this).attr('href')
	    });
	});	*/
	$('#authenticateButton').click(function(){		
		var loadinghtml = '<img id="ajaxloader" src="../img/ajax-loader.gif"/>';
		$('#authenticateButton').attr('disabled',true);
		$('#authenticateButton').after($(loadinghtml));
		$.post($('#ProfileAddpinterestForm').attr('action'),$('#ProfileAddpinterestForm').serialize(),function(data) {
			// console.log(data);
			$('#authenticateButton').attr('disabled',false);
			$('#ajaxloader').hide();
			response = eval('('+data+')');
			var className ="text-error";
			if(response.success){
				className = "text-success";
				$('#modalContent').removeClass('h375');
				$('#formContent').html(response.message).attr('class',className).addClass('successMessage');            				
			}else{			
				$('#addPinterestResponse').html(response.message).attr('class',className);            
			}
		});
	});	
	$('#sendInvite').click(function(){			
		var loadinghtml = '<img id="ajaxloader" src="../img/ajax-loader.gif"/>';
		$('#sendInvite').attr('disabled',true);
		$('#sendInvite').after($(loadinghtml));
		$.post($('#InviteAddForm').attr('action'),$('#InviteAddForm').serialize(),function(data) {
			// console.log(data);
			$('#sendInvite').attr('disabled',false);
			$('#ajaxloader').hide();
			response = eval('('+data+')');
			var className ="text-error";
			if(response.success){
				className = "text-success";				
				// $('#cpModal').find('#modalContent',0).removeClass('h375');
				$('#cpModal').find('#modalContent',0).append(createElement('ajaxResponse', ""));
				$('#ajaxResponse').html(response.message).attr('class',className).addClass('successMessage');            				
			}else{			
				$('#cpModal').find('#modalContent',0).append(createElement('ajaxResponse', ""));
				$('#ajaxResponse').html(response.message).attr('class',className).addClass('successMessage');            				
			}
		});
	});		
	$('#addPublisherButton').click(function(){		
		$.post($('#PublisherAddForm').attr('action'),$('#PublisherAddForm').serialize(),function(data) {
			console.log(data);
			response = eval('('+data+')');
			var className ="text-error";
			if(response.success){
				className = "text-success";
				$('#cpModal').find('#modalContent',0).removeClass('h375');
				$('#cpModal').find('#modalContent',0).append(createElement('ajaxResponse', ""));
				$('#ajaxResponse').html(response.message).attr('class',className).addClass('successMessage');            				
			}else{			
				$('#cpModal').find('#modalContent',0).append(createElement('ajaxResponse', ""));
				$('#ajaxResponse').html(response.message).attr('class',className).addClass('successMessage');            				
				// $('#addPinterestResponse').html(response.message).attr('class',className);            
			}
		});
	});
	$('.socialNetworkName').click(function(e){
		e.stopPropagation();		
		$.get($(this).attr('url'),null,function(data) {			
			$('#formContent').html(data);
		});
	});	

	function createElement(id, value) {
	    return $('<div>', { id: id , text: value});
	}
	/**
	Close the Modal after 5 seconds
	**/	
	function closeProfileAdditionModal() {
		alert('close modal');
		$('#myModal').modal('hide');
	}
});