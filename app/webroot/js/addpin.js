var s;
function validateForm(){
        if($('#imageUrl').val().length==0){
            $('#validationMessage').html('Please pick an image to pin').addClass('text-error');
            return false;
        }
        if($('#boardId').val().length==0){
            $('#validationMessage').html('Please pick the board first').addClass('text-error');   
            return false;
        }
        // console.log($('#url').val());
        if($('#messageId').val().length==0){
            $('#validationMessage').html('Please enter a description').addClass('text-error');   
            return false;
        }
        if($('#messageId').val().length>500){
            $('#validationMessage').html('Maximum 500 characters allowed').addClass('text-error');   
            return false;
        }
        if(validateTimeofpost){            
            if($('#timeofpost').val().length == 0){
                $('#validationMessage').html('Please select time to schedule').addClass('text-error');   
                return false;
            }
        }
        if($('#url').val().length==0){
            $('#url').val($('#PostUrl').val());
        }
        refreshPage = true;
        $('#validationMessage').html('');
        return true;
    }
    $(document).ready(function(){
        $('#tzchanger').live('click',function(){
            $('#tzu').show();
            $('#tzs').html(s);
        })
        tzuUrl = $('#tzu').attr('href');        
        $('#tzu').live('click',function(e){
            $('#tzu').attr('disabled',true);
            e.preventDefault(); 
            // console.log($('#tzsv').val());
            $.get(tzuUrl,{tz:$('#tzsv').val()},function(data) {
                $('#tzu').attr('disabled',false);
                output = eval('('+data+')');      
                if(output.success){
                    $('#tz').html(output.tz);
                    var html = "<button class='btn btn-mini btn-info' type='button' id='tzchanger'>Change</button>";
                    $('#tzs').html(html);
                    $('#tzu').hide();
                }
            });
        });
        $.get(tzUrl,null,function(data) {
            response = eval('('+data+')');      
            s = $("<select id=\"tzsv\" name=\"mytimezone\" class=\"span12\" />");
            for(var val in response) {
                $("<option />", {value: val, text: response[val]}).appendTo(s);
            }
            $('#tzs').html(s);
            if(timezone!='-13.00'){
                timezone = String(parseFloat(timezone));
                userTimezone = response[timezone];
                $('#tz').html(userTimezone);
                var html = "<button class='btn btn-mini btn-info' type='button' id='tzchanger'>Change</button>";
                $('#tzs').html(html);
                $('#tzu').hide();
            }else{
                $('#tz').html("Update Timezone");
            }
        });        
        $('.boardSelector').bind('change',function(){
            // console("here "+$(this).val());
            $('#boardId').val($(this).val());
        });        
        $('#photoimg').live('change', function(){        
            $('#pickImage').show('slow');
            $("#preview").html('');
            $("#preview").html('<img src="../img/loader.gif" alt="Uploading...."/>');
            $("#PostUploadpinForm").ajaxForm({target: '#preview'}).submit();
        });
        $('#cpModalLabel').html("Add Pin");
        $('#cpModal').find('#modalContent',0).removeClass('h375').addClass('h240');
        $('#pinIt').click(function(){    
            if(!validateForm()){return false;}
            var loadinghtml = '<img id="ajaxloader" src="../img/ajax-loader.gif"/>';
            $('#pinIt').attr('disabled',true);
            $('#pinIt').after($(loadinghtml));
            $.post($('#PostAddpinterestForm').attr('action'),$('#PostAddpinterestForm').serialize(),function(data) {
                // console.log(data);
                $('#pinIt').attr('disabled',false);
                $('#ajaxloader').hide();
                response = eval('('+data+')');
                var className ="text-error";
                if(response.success){
                    className = "text-success";
                    $('#validationMessage').html(response.message).attr('class',className).addClass('successMessage');
                }else{          
                    $('#validationMessage').html(response.message).attr('class',className);            
                }
            });
        });
    });
    function launchAviaryEditor() {
        return launchEditor('image_'+currentImage, currentImageSrc);
    }

    function showSchedulerForm(checked){  
        if(checked) {
            $('#pinIt').html('Schedule');
            validateTimeofpost = true;
        }else{
            $('#pinIt').html('Pin');
            validateTimeofpost = false;
        }
        $('#schedulePin').toggle('slow');
    }    
    function shortenUrl(checked){  
        if(checked) {
            console.log($('#messageId').html());
        }else{
            console.log($('#messageId').html()+' no shortening');
        }
    }
    function closedialog(dialogtohide,dialogtoshow) {
        $('#'+dialogtohide).hide('slow');
        $('#'+dialogtoshow).show('slow');
        $('#cpModal').find('#modalContent',0).removeClass('h240');
        if(dialogtoshow=='UploadPin'){
            $('#ScrapePin').show('slow');
            $('#scrapeForm').remove();
            $('#imagePickerDiv').remove();
            $('#imageUrl').remove();
            $('#url').prop('type','text');
            // $('#PostUrl').prop('type','text');
            $('#cpModalLabel').html("Upload Pin");
        }else if(dialogtoshow=='ScrapePin'){
            $('#uploadForm').remove();
            $('#preview').remove();
        }
    }
    $('#scrapePage').click(function(e){      
        // e.preventDefault();
        var loadinghtml = '<img id="ajaxloader2" src="../img/ajax-loader.gif"/>';
        $('#scrapePage').attr('disabled',true);
        $('#PostUrl').after($(loadinghtml));
        $.post($('#PostScrapeForm').attr('action'),$('#PostScrapeForm').serialize(),function(data) {
            $('#scrapePage').attr('disabled',false);
            $('#ajaxloader2').hide();
            response = eval('('+data+')');
            var className ="text-error";
            if(response.success){
                className = "text-success";                
                if(response.images_count == 0){
                    alert('No big images found');
                }else{
                    buildPicker(response);                    
                    $('#pickImage').show();
                }                
                // $('#cpModal').find('#modalContent',0).html(response.message).attr('class',className);
            }else{          
                $('#pickImage').hide();
                $('#addPinterestResponse').html(response.message).attr('class',className);            
            }
        });
    });  
    $('#PostScrapeForm').submit(function(){
        return false;
    });
    function isValidUrl(str) {
        var pattern = new RegExp('^(https?:\/\/)?'+ // protocol
        '((([a-z\d]([a-z\d-]*[a-z\d])*)\.)+[a-z]{2,}|'+ // domain name
        '((\d{1,3}\.){3}\d{1,3}))'+ // OR ip (v4) address
        '(\:\d+)?(\/[-a-z\d%_.~+]*)*'+ // port and path
        '(\?[;&a-z\d%_.~+=-]*)?'+ // query string
        '(\#[-a-z\d_]*)?$','i'); // fragment locater
        if(!pattern.test(str)) {
            return false;
        } else {
            return true;
        }
    }
    function buildPicker(data){
        var className = '';
        var j = 0;
        for(var i in data.message){
            try{
                if(data.message[i].indexOf('?')>0){
                    //we don't want any query parameters
                    data.message[i] = data.message[i].substring(0, data.message[i].indexOf('?'));
                }
                /*if(!isValidUrl(data.message[i])) {
                    //probably a relative path to the url
                    data.message[i] = data.url+data.message[i];
                }*/
                var type = data.message[i].substr( (data.message[i].lastIndexOf('.') +1));
                if(type != 'jpg') {
                    //only jpg images allowed
                    continue;
                } 
                /*
                var img = new Image();
                img.src = data.message[i];
                img.onload = function() {
                    console.log('height: ' + img.height + ' width: ' + img.width);
                };           
                */
                if(j>0){
                    className = 'displaynone';
                }else{
                    $('#imageUrl').val(data.message[i]);
                    currentImageSrc = data.message[i];
                }
                imagelisthtml = '<li style="margin-left:0;" class="imagelist '+className+'" id="pick_'+j+'"><a class="thumbnail" href="#" style="width:100%"><img id="image_'+j+'" src="'+data.message[i]+'" class="masonry" width="175px"/></a></li>';
                imagelist = $(imagelisthtml);                             
                $('#imagePicker').append(imagelist);            
                j++;
            } catch(e){
                console.log(e);
            }
        }           
        countImage = j;
    };
    function pickPrevImage(){
        if(currentImage == 0){
            return false;
        }else{            
            prevImage = currentImage - 1;
            $('.imagelist').hide();
            $('#pick_'+prevImage).show();
            $('#imageUrl').val($('#pick_'+prevImage).find('img',0).attr('src'));
            currentImageSrc = $('#pick_'+prevImage).find('img',0).attr('src');
            currentImage = prevImage;
        }
    };
    function pickNextImage(){
        if(currentImage == countImage){
            return false;
        }else{
            nextImage = currentImage + 1;
            $('.imagelist').hide();
            $('#pick_'+nextImage).show();
            $('#imageUrl').val($('#pick_'+nextImage).find('img',0).attr('src'));
            currentImageSrc = $('#pick_'+nextImage).find('img',0).attr('src');
            currentImage = nextImage;
        }
    };
    function setBoard(obj){
        $('#boardId').val($(obj).val());
    }   
    function isDate(txtDate)
    {
      var currVal = txtDate;
      if(currVal == '')
        return false;
      
      //Declare Regex  
      var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; 
      var dtArray = currVal.match(rxDatePattern); // is format OK?

      if (dtArray == null)
         return false;
     
      //Checks for mm/dd/yyyy format.
      dtMonth = dtArray[1];
      dtDay= dtArray[3];
      dtYear = dtArray[5];

      if (dtMonth < 1 || dtMonth > 12)
          return false;
      else if (dtDay < 1 || dtDay> 31)
          return false;
      else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31)
          return false;
      else if (dtMonth == 2)
      {
         var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
         if (dtDay> 29 || (dtDay ==29 && !isleap))
              return false;
      }
      return true;
    }