---
layout: page
title: Contact Us
permalink: /contact/
jumbotron: 
  title: Contact Us
  #tagline: ...
---

<script src='https://www.google.com/recaptcha/api.js'></script>

<form id="frmContact" class="cerb-form" action="javascript:;" method="POST" onsubmit="return false;">
	<fieldset>
		<legend>Contact by email</legend>
	
		<label for="email">What email address should we reply to?</label>
		<input type="text" name="email" value="" placeholder="you@example.com" autocomplete="off" spellcheck="false">
	
		<label for="message">How can we help?</label>
		<textarea name="message" placeholder="" autocomplete="off" rows="10"></textarea>
		
		<div class="g-recaptcha" data-sitekey="6LeOPh0TAAAAANiEBFZLURt43IkCTUMOPUSMoxL9"></div>
		
		<div style="margin-top:20px;">
			<input type="button" class="submit" value="Confirm">
			<div class="status"></div>
		</div>
	</fieldset>
</form>

<script type="text/javascript">
$(function() {
	var $frm = $('#frmContact');
	
	$frm.find('input.submit').click(function() {
		// [TODO] Spinner
		
		// Captcha
		$frm.find('textarea[name=g-recaptcha-response]').val(grecaptcha.getResponse());
		
		$.ajax({
			method: 'POST',
			url: 'https://cerb.official.support/forms/cloud/contact',
			crossDomain: true,
			dataType: 'json',
			data: $frm.serialize(),
			success: function(res) {
				if(res && res.error) {
					grecaptcha.reset();
					
					var $warn = $('<div class="warning"/>').text(res.error);
					$frm.find('div.status').html($warn);
					return;
				}
				
				if(res && res.success) {
					var $success = $('<div class="success"/>').text(res.success);
					$frm.find('div.status').html($success);
					$frm.find('input.submit').hide();
				}
			},
			error: function(e) {
				grecaptcha.reset();
				
				var $warn = $('<div class="error"/>').text("An unexpected error occurred. Please try again later.");
				$frm.find('div.status').html($warn);
				return;
			}
		})
	});
});
</script>