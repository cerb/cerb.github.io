---
layout: page
title: Contact Us
permalink: /contact/
jumbotron: 
  title: Support
  #tagline: ...
  breadcrumbs:
  -
    label: Contact Us
    url: /contact/
---

<script src='https://www.google.com/recaptcha/api.js'></script>

<form id="frmContact" class="cerb-form" action="javascript:;" method="POST" onsubmit="return false;">
	<fieldset>
		<legend>How can we help?</legend>
	
		<label for="name">Name:</label>
		<input type="text" name="name" value="" placeholder="Your Name" autocomplete="off" spellcheck="false">
	
		<label for="email">Email Address:</label>
		<input type="text" name="email" value="" placeholder="you@example.com" autocomplete="off" spellcheck="false">
	
		<label for="message">Message:</label>
		<textarea name="message" placeholder="Please describe your question or issue." autocomplete="off" rows="10"></textarea>
		
		<div class="g-recaptcha" data-sitekey="6LeOPh0TAAAAANiEBFZLURt43IkCTUMOPUSMoxL9"></div>
		
		<div>
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
			url: 'https://cerb.official.support/forms/contact',
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