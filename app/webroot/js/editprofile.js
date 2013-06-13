$(document).ready(function(){	
    $("#UserCityname").autocomplete(cityUrl, {max: 15,minChars:3});
    $("#UserCityname").autocomplete().result(function(evt,data,formatted){
        $("#UserCityname").val(data[1]);
        $("#UserCity").val(data[1]);
        $("#UserStatename").val(data[3]);
        $("#UserState").val(data[3]);
        $('#UserCountryname').val(data[5]);
        $('#UserCountry').val(data[7]);
    }); 
    $("#UserStatename").autocomplete(regionUrl, {max: 15,minChars:3});
    $("#UserStatename").autocomplete().result(function(evt,data,formatted){     
        $("#UserStatename").val(data[1]);
        $("#UserState").val(data[1]);
        $('#UserCountryname').val(data[3]);
        $('#UserCountry').val(data[5]);
    }); 
    $("#UserDob").datepick({minDate: '-100y',maxDate: new Date(),dateFormat:'yy-mm-dd'});
    $('#editprofile').bind('click', function(){      
        if($('#imageUrl').val()){
            $('#UserAvatar').val($('#imageUrl').val());                
        }
    });
    $('#photoimg').bind('change', function(){        
        // $('#pickImage').show('slow');
        $("#preview").html('');
        $("#preview").html('<img src="../img/loader.gif" alt="Uploading...."/>');
        $("#UserUploadavatarForm").ajaxForm({target: '#preview'}).submit();        
    });
    var validator = $("#UserEditForm").validate();	
    $("#UserFirstName").rules('add',{
        required: true,								
        messages: {					
            required: "Please enter your first name",														
        }
    });
    $("#UserLastName").rules('add',{
        required: true,								
        messages: {					
            required: "Please enter your last name",														
        }
    });
    $("#UserAddress1").rules('add',{
        required: true,								
        messages: {					
            required: "Please specify your address line 1",					
        }
    }
);
    $("#UserEmail").rules('add',{
        required: true,				
        remote: baseUrl+"/users/checkemail",				
        email: true,
        messages: {
            required: "Please enter your email address",				
            remote: "This email is already in use",					
            email: "Please specify a valid email address",
        }
    }
);
    $("#UserCityname").rules('add',{
        required: true,												
        messages: {
            required: "Please specify your city",									
        }
    }
);	
    $("#UserCell").rules('add',{				
        digits: true,
        minlength: 10,				
        messages: {					
            minlength: "Minimum 10 digits",
            digits: "Only digits are allowed"
        }
    }
);		
    $("#UserHome").rules('add',{				
        digits: true,
        minlength: 10,				
        messages: {					
            minlength: "Minimum 10 digits",
            digits: "Only digits are allowed"
        }
    }
);
    $("#UserWork").rules('add',{				
        digits: true,
        minlength: 10,				
        messages: {					
            minlength: "Minimum 10 digits",
            digits: "Only digits are allowed"
        }
    }
);
    $("#UserZipcode").rules('add',{
        required: true,
        digits: true,
        minlength: 6,
        messages: {
            required: "Please enter your pin code",									
            digits: "Only digits are allowed",
            minlength: "Must be six characters in length"
        }
    }
);	
    $("#UserStatename").rules('add',{
        required: true,								
        messages: {
            required: "Please enter your state"
        }
    }
);	
    $("#UserCountry").rules('add',{
        required: true,								
        messages: {
            required: "Please enter your country"
        }
    }
);	
    $("#UserGender").rules('add',{
        required: true,								
        messages: {
            required: "Please enter your gender"
        }
    }
);
    $("#UserDob").rules('add',{
        required: true,								
        messages: {
            required: "Please enter your Date of Birth"
        }
    }
);
});