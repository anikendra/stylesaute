<?php echo $this->Html->css('jquery.datepick');?>
<?php echo $this->Html->css('autocomplete');?>
<style>
    div.pair select{
        margin-left:10px;
    }
</style>
<h2>Edit Profile</h2>
<div id="profile" class="sign_up">
    <div class="subwrap">
        <fieldset><legend>Profile Picture</legend>
            <?php if(!empty($this->data['User']['avatar'])): ?>
            <img src="<?php echo $this->data['User']['avatar'];?>" width="250"
            <?php endif;?>
            <?php echo $this->Form->create('User',array('class'=>'form-inline','action'=>'uploadavatar','enctype'=>'multipart/form-data')); ?>     
            <label for="photoimg">Upload Avatar</label>
            <input type="file" name="photoimg" id="photoimg"/>
            <div class="clear"></div>
            <div id='preview'></div>
            <div class="clear"></div>
            <?php echo $this->Form->end();?>
        </fieldset>
        <?php echo $this->Form->create('User');?>
        <?php echo $this->Form->hidden('id', array('value' => $id)); ?>
        <?php echo $this->Form->input('avatar',array('type' => 'hidden','value'=> $this->data['User']['avatar'])); ?>
        <fieldset><legend>Name and Address</legend>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="first_name" class="mandatory">First Name </label>		
                <?php echo $this->Form->input('first_name',array('label'=>false));?>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="last_name" class="mandatory">Last Name</label>		
                <?php echo $this->Form->input('last_name',array('label'=>false));?>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="first_name" class="mandatory">Address Line 1</label>		
                <?php echo $this->Form->input('address_1',array('label'=>false));?>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="last_name">Address Line 2</label>		
                <?php echo $this->Form->input('address_2',array('label'=>false));?>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="first_name" class="mandatory">City</label>		
                <?php echo $this->Form->input('cityname',array('label'=>false,'value'=>$this->data['User']['city']));?>
                <?php echo $this->Form->hidden('city',array('label'=>false));?>
            </div>		
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="last_name" class="mandatory">State</label>		
                <?php echo $this->Form->input('statename',array('label'=>false,'value'=>$this->data['User']['state']));?>
                <?php echo $this->Form->hidden('state',array('label'=>false));?>
            </div>
            <div class="clear"></div>
            <div class="dropdown" style="margin-left: 17px; width: 150px;"> 
                <label for="first_name" class="mandatory">Country</label>				
                <?php echo $this->Form->input('country',array('options' => $countries,'default' => $this->data['User']['country'],'label'=>false,'class'=>'pad10'));?>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="zip_code" class="mandatory">Zip Code</label>		
                <?php echo $this->Form->input('zipcode',array('label'=>false));?>
            </div>
        </fieldset>
        <fieldset class="personal_info" style="margin-bottom:10px;"><legend>Personal Info</legend>                    
            <div class="dropdown" style="margin-left: 17px; width: 150px;"> 
                <label for="sex" class="mandatory">Sex</label>
                <select name="data[User][gender]" id="UserGender" class="pad10">
                    <option value="">-- Select --</option>
                    <option value="male" <?php if($this->data['User']['gender']=='male')echo "selected='selected'";?>>Male</option>
                    <option value="female" <?php if($this->data['User']['gender']=='female')echo "selected='selected'";?>>Female</option>				
                </select>
            </div>
            <div class="clear"></div>
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="dob" style="width:258px; padding-right:10;" class="mandatory">
                    Your Date of Birth
                </label>
                <input name="data[User][dob]" id="UserDob" autocomplete="false" value="<?php echo $this->data['User']['dob'];?>"/>	
                <span class="date_format">(YYYY-MM-DD)</span>			
            </div>
        </fieldset>
        <fieldset><legend>Email</legend>                    
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="email" class="mandatory">Email</label>		
                <?php echo $this->Form->input('email',array('label'=>false));?>
            </div>            
        </fieldset>	       
        <fieldset><legend>Timezone</legend>                    
            <div class="textInput" style="margin-left: 17px; width: 150px;"> 
                <label for="user_timezone" class="mandatory">Your local timezone</label>      
                <?php echo $this->Form->input('user_timezone',array('label'=>false,'type'=>'select','options'=>$timeZones));?>
            </div>            
        </fieldset>        
        <br />
        <button type="submit" value="submit" class="btn" id="editprofile">Save</button>
    </div>
</div>
</form>

<?php echo $this->Html->script('jquery.datepick');?>
<?php echo $this->Html->script('jquery.autocomplete.min');?>
<script type="text/javascript" src="<?php echo $base_url;?>js/jquery.form.js"></script>
<script>
    var baseUrl = '<?php echo $base_url;?>';
    var cityUrl = "<?php echo $base_url;?>cities/getbyname";
    var countryUrl = "<?php echo $base_url;?>countries/getbyname";
    var regionUrl = "<?php echo $base_url;?>regions/getbyname";
</script>
<?php echo $this->Html->script('jquery.validate');?>
<script src="<?php echo $base_url;?>js/editprofile.js"></script>