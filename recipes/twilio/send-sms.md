---
title: Send SMS messages from Cerb bots using Twilio
permalink: /examples/twilio/send-sms
layout: integration
jumbotron:
  title: Send SMS messages from Cerb bots using Twilio
  tagline: ""
  breadcrumbs:
  -
    label: Examples &raquo; Twilio &raquo;
    url: /examples/twilio/
---

## Introduction

...

## Enable the Twilio plugin in Cerb

If the Twilio plugin isn't already enabled, you can [follow these instructions](/plugins/twilio#installation) to install and configure it.

## Create the Virtual Attendant behavior in Cerb

Once the Twilio plugin is enabled, you'll be able to add **Send SMS via Twilio** actions to bot behaviors.

First, let's create a new bot to keep things organized.

Navigate to **Search** >> **Virtual Attendant** and click the **(+)** icon in the blue bar to add a new record.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/examples/twilio/send-sms/create_va.png" class="screenshot">
</div>

(You can find a logo image at <https://demo.twilio.com/logo.png>)

Click the **Save Changes** button.  Then click your new bot in the worklist to view its profile.

On the **Behaviors** tab, click the **Create Behavior** button.

Select the **Import** tab and paste the following behavior to import it:

{% gist cerb/d51a3b54eadf29df3286c02490486bf5 %}

You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/examples/slack/slash-commands/va_behavior.png" class="screenshot">
</div>

## References

[^]: <>
