---
title: Block email tracking pixels and beacons
excerpt: Protect your team's privacy by blocking marketing trackers in your email.
permalink: /guides/mail/privacy/block-email-tracking/
layout: integration
topic: Mail
subtopic: Privacy
jumbotron:
  title: Block email tracking pixels and beacons
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Mail &raquo;
    url: /resources/guides/#mail
  -
    label: Privacy &raquo;
    url: /resources/guides/#mail-privacy
---

* TOC
{:toc}

# Introduction

Digital marketing teams frequently use external images to track when you view an email message. This tracking can record your IP address, approximate location, and a timestamp. Images may also set browser cookies used by advertisers to track your behavior across the web.

Cerb protects your privacy by blocking external images by default.

<div class="cerb-screenshot" style="margin-left:20px;">
<img src="/assets/images/guides/mail/privacy/block-email-tracking/images-toolbar.png" class="screenshot">
</div>

When you optionally choose to view images for a specific message, its images are routed (_proxied_) through the server to remove cookies and anonymize worker IPs and locations.

You may also configure a _blocklist_ to always prevent known tracking images from loading, even when other images are displayed.

<div class="cerb-screenshot" style="margin-left:20px;">
<img src="/assets/images/guides/mail/privacy/block-email-tracking/popup-blocked.png" class="screenshot">
</div>

This guide demonstrates a sample blocklist and provides instructions on creating your own rules.

# Importing the sample blocklist

This sample blocklist is not comprehensive, but it will block image tracking from many common sources.

1. Copy this sample blocklist:

	<pre style="max-height:29.5em;">
	<code class="language-text">
	.amazon.com/gp/r.html?
	.amazonaws.com/prod/excess-aws-track-email-open
	.campaign.adobe.com/r/
	.chtah.com/a/
	.com/Default.aspx?open=
	.com/app/?tok
	.com/imp?
	.com/open.aspx
	.com/pixel.gif
	.com/pub/as?
	.com/pub/open.php
	.com/trk
	.com/wf/open
	.demdex.net/event
	.emltrk.com
	.facebook.com/email_open
	.google-analytics.com
	.hana.ondemand.com/data-buffer/sap/public/
	.list-manage.com/track/open.php
	.net/on.jsp?
	.net/pixel.gif
	.paypal-communication.com/O/
	.sendgrid.net/mpss
	.sendgrid.net/wf/open
	ad.doubleclick.net
	ads.perfectaudience.com
	beacon.krxd.net
	click.ngpvan.com
	clicks.att.com
	d.turn.com
	github.com/notifications/beacon/
	pixel.app.returnpath.net/pixel.gif
	pixel.inbox.exacttarget.com/pixel.gif
	secure.adnxs.com/seg
	tags.bluekai.com
	track.sp.actionkit.com
	trk.email.dynect.net
	twitter.com/scribe/
	</code>
	</pre>

1. As an administrator, navigate to **Setup >> Mail >> Incoming Mail >> HTML**.

1. Paste the above blocklist into the **Images >> Blocklist** section.

1. Click the **Save Changes** button.

# Adding your own blocking rules

Blocking rules are patterns that match a URL.

You do not need to include `http://` or `https://` at the start of the URL. Any protocol will be matched.

For efficiency, all rules must include a hostname pattern.

When a hostname begins with a dot (`.`), any number of subdomains will match. For instance, `.google-analytics.com` matches `ssl.google-analytics.com` and `www.google-analytics.com`. This can include just a top-level domain (e.g. `.com`) to match everything with that suffix.

If you provide a partial path (e.g. `/beacon/`) the rule will match any location with that prefix.