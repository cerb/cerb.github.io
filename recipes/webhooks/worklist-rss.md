---
title: Generate an RSS feed for any worklist
permalink: /examples/webhooks/worklist-rss
layout: integration
jumbotron:
  title: Generate an RSS feed for any worklist
  tagline: ""
  breadcrumbs:
  -
    label: Examples &raquo; Webhooks &raquo;
    url: /examples/webhooks/
---

## Introduction

Let's assume that you want to monitor the records in a Cerb worklist from a third-party app or service.  You could use the REST API, but that requires worker authentication and custom code that you need to host somewhere.

An alternative, simpler approach is to use a Cerb bot to display any worklist in RSS[^rss] format. Many tools already exist to monitor an RSS feed for new content. Zapier[^zapier-rss] can run actions based on new RSS feed items. You can even subscribe to RSS feeds within Outlook.

We'll host this RSS feed on a custom URL in Cerb using a webhook[^webhook] listener.

## Enable the Webhooks plugin in Cerb

If the webhooks plugin isn't already enabled, you can [follow these instructions](/plugins/webhooks#installation) to install it.

## Create the bot behavior in Cerb

Once the Webhooks plugin is enabled, you'll be able to create new bot behaviors on the **Webhook received** event.

First, let's create a new bot to keep things organized.

Navigate to **Search** >> **Virtual Attendant** and click the **(+)** icon in the blue bar to add a new record.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/examples/webhooks/worklist-rss/create_va.png" class="screenshot">
</div>

(You can [find an RSS icon on Google Images](https://images.google.com/?q=rss+icon))

Click the **Save Changes** button.  Then click your new bot in the worklist to view its profile.

On the **Behaviors** tab, click the **Create Behavior** button.

Select the **Import** tab and paste the following behavior to import it:

{% gist cerb/69afc6bc1f43fefb0fa4f75780b7853a %}

<div class="cerb-box note">
	<p>
		If you see a <tt>"Invalid event in the provided behavior"</tt> error, that usually means that the Webhooks plugin isn't enabled.
	</p>
</div>

You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/examples/webhooks/worklist-rss/va_behavior.png" class="screenshot">
</div>

By default, this behavior retrieves the 20 most recently updated open tickets.  You can edit the behavior to change the worklist type or filters.

Now we're ready to create the webhook that triggers this behavior.

## Create the new webhook in Cerb

Navigate to **Setup** &raquo; **Configure** &raquo; **Webhooks**.

Click the **(+)** icon in the blue bar of the worklist to create a new webhook.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/examples/webhooks/worklist-rss/create_webhook.png" class="screenshot">
</div>

Click the **Save Changes** button.

A new webhook will be added to the worklist.  You can copy the **URL** to your clipboard, since we'll be using it in the next step.

## Subscribe to the RSS feed from your third-party tool

Paste your new URL into an RSS reader (or parse it as XML[^xml] from any script).  You should see a list of records from the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/examples/webhooks/worklist-rss/newsflow_app.png" class="screenshot">
</div>

## Where to go from here

You can repeat this process to create RSS feeds for your notifications, daily tasks, etc.

## References

[^rss]: <https://en.wikipedia.org/wiki/RSS>
[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
[^zapier-rss]: <https://zapier.com/zapbook/rss/>
[^xml]: <https://en.wikipedia.org/wiki/XML>