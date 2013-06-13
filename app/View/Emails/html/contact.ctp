<center>
	<table width="600" cellspacing="0" cellpadding="0" border="0" style="margin:10px auto 30px;text-align:left">
        <tbody>
        	<tr>
                <td style="text-align:center;font-size:12px;padding:10px 0 20px;color:#eee;margin:0">
					<p>&nbsp;</p>
				</td>
            </tr>
            <tr>
                <td>
                    <!--<div style="text-align:center"><a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="http://viraliti.com/presignups/register/<?php echo $code;?>"><img src="http://vidoofy.com/img/vidoofy.png" width="300" border="0" height="90" alt="Join viraliti"></a></div>-->
                </td>
            </tr>
            <tr>
                <td style="background:#414f67;border-left:0;border-right:0;color:#ddd;text-align:center;padding:10px 20px;font-size:13px"></td>
            </tr>
            <tr>
                <td style="font-size:13px;background:#eee;color:#444;font-style:normal;font-weight:normal;font-family:Helvetica;line-height:1.4em;padding:10px 30px 30px;vertical-align:top">
                    <table cellspacing="0" cellpadding="0" border="0" style="padding-bottom:20px">
                        <tbody><tr>
                            <td style="font-size:12px;line-height:1.5em;color:#444;padding-bottom:20px;border-bottom:1px solid #ccc;margin-bottom:20px" colspan="3"><h1 style="font-size:22px;font-weight:normal;color:#333;font-family:Georgia;line-height:150%;text-align:left;margin:10px 0px" colspan="2">
								<h1>Congrats!</h1>
									<p>
										Woohoo -- Viraliti is ready for you to sign up! &nbsp;As one of our first users you will get exclusive access to our private site. &nbsp;Here are some things to do once you get there:</p>
									<ol>
										<li>
											<a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="http://viraliti.com/presignups/register/<?php echo $code;?>">Create an account</a></li>
										<li>
											Fill in some details about yourself - the more we know about you the more personalized campaigns you get to pin.</li>										
										<li>
											Once you find an interesting offer, Pin it to your Pinterest board and start earning money for each valid click.</li>
										<li>
											Viraliti will track all clicks from your pin and pay you for unique legitimate traffic.</li>
									</ol>
									Just so you know, we are only letting in a small amount of users at a time, so sign up quick to get access. &nbsp;<br>
									<br>
									<strong><span style="font-size:18px">Sharing = Caring</span></strong><br>
									<br>
									When you share Viraliti with your friends, others sign up. &nbsp;When more people are in Viraliti, advertisers share more. &nbsp;When advertisers share more, you get more offers. More offers = more money in your pocket. &nbsp;<br>
									We have a multi levell referral policy. So you earn a percentage of the earning of every publisher that you refer to Viraliti. You earn a portion of earning of even their referrals. &nbsp;<br>
									<br>
									<a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="http://viraliti.com/presignups/register/<?php echo $code;?>">Join Now!</a><br>
									<?php if(!empty($data['campaigns'])):?>
									<br>									
									<br>
									<strong>Active campaigns of Viraliti :-</strong><br>
									<ul>
										<?php foreach ($data['campaigns'] as $key => $campaign): ?>
										<li style="list-style:none;margin-bottom:5px;">
											<table>
												<tr>
													<td><img src="http://viraliti.com/img/uploads/images/<?php echo $campaign['Campaign']['filename'];?>" width="200px"/></td>
													<td>
														<div>Title : <?php echo $campaign['Campaign']['title'];?></div>
														<div>Target Url : <?php echo $campaign['Campaign']['target_url'];?></div>
														<div>Earning per click : <?php echo 0.7 * $campaign['Campaign']['cpc'];?> (estimated)</div>
													</td>
												</tr>
											</table>
										</li>
										<?php endforeach;?>
									</ul>
									<?php endif;?>
									<br>
									<br>
									<br>
									We would love to hear from you - let us know what you think -&nbsp;<a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="mailto:anikendra@viraliti.com">anikendra@viraliti.com</a><br>
									<br>
									Got social? Connect with us on <a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="http://twitter.com/viralitidotcom">Twitter</a> and <a target="_blank" style="color:#800000;text-decoration:underline;font-weight:normal" href="http://facebook.com/viraliti">Facebook</a>.<br>
									<br>
									Thanks!!!<br>
									<br>
									Viraliti Team!<br>
								</td>
                            </tr>
                            <tr>
                                <td style="font-size:11px;line-height:1.4em;color:#444;width:25%;padding-right:20px;padding-left:0;padding-top:20px;border-right:1px solid #ccc"><h2 style="font-size:18px;font-weight:normal;color:#333;font-style:normal;font-family:Georgia;text-align:left;margin-bottom:15px">
									<h2>Do Tell</h2>
									<p>The more users we have in Viraliti, the more advertisers, the more offers and the more you get paid. Spread your referral link :- <b><?php echo $data['Presignup']['referral_url'];?></b></p>
								</td>
                                <td style="font-size:11px;line-height:1.4em;color:#444;width:28%;padding-right:15px;padding-left:20px;padding-top:20px;border-right:1px solid #ccc;margin-right:15px;border:0"><p style="background:#2d2d2d;border:3px solid #ebebeb">
									<a target="_blank" style="color:#fff;text-decoration:none;font-weight:normal;font-size:26px;font-family:Georgia;text-transform:uppercase;text-align:center;display:block;padding:20px 0" href="http://viraliti.com/presignups/register/<?php echo $code;?>">Come in!</a></p>
									<p>Space is very limited right now - only the first few hundred will get access.</p>
								</td>
    		                </tr>
    		                <tr>
    		                	<td colspan="2" style="font-size:10px;">
    			                	Please add anikendra@pinvertisement.com to your contact list to prevent future mails from going into Junk/Spam folder.
    		                	</td>
    		                </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
	    </tbody>
	</table>
</center>
