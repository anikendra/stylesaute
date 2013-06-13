$(document).ready(function(){
    $('#photoimg').live('change', function(){        
        $('#pickImage').show('slow');
        $("#preview").html('');
        $("#preview").html('<img src="../img/loader.gif" alt="Uploading...."/>');
        $("#PostUploadpinForm").ajaxForm({target: '#preview'}).submit();        
    });
    $('#addButton').live('click', function(){      
    	$('#PostPhotoUrl').val($('#imageUrl').val());
    	if($('#PostMessage').val().length==0){
    		alert('Please enter a message');
    		return false;
    	}
    	if($('#PostPhotoUrl').val().length==0){
    		alert('Please upload an image');
    		return false;
    	}
    	$('#PostAddForm').submit();
    });
});