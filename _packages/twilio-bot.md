---
title: Twilio Bot
excerpt: A bot demonstrating integration between Cerb and Twilio.
layout: integration
topic: Packages
permalink: /packages/twilio-bot/
jumbotron:
  title: Twilio Bot
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

# Introduction

This package creates **Twilio Bot** for demonstrating integration between Cerb and [Twilio's API](https://www.twilio.com/docs/api/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/twilio/plugin/cerb-and-twilio.png" class="screenshot">
</div>

# Configure the Twilio service

If you haven't already, follow [these instructions](/guides/integrations/twilio/) to configure the Twilio service and add your first connected account.

# Import the package

As of [9.2.2](/releases/9.2.2/):

1. Navigate to **Search >> Bots**.

1. Click **(+)** above the worklist.

1. On the **Library** tab, select **Twilio Bot**.

1. You'll be prompted for some configuration options:
	* **Twilio account:** The Twilio [connected account](/docs/connected-accounts/) you created earlier.
	* **Account SID:** Your Twilio account SID (from your Twilio dashboard).
	* **Default responder phone number:** The default phone number to use when sending SMS messages. This should be formatted as an E.164 number, like `+15551234567`. This number must exist in your Twilio account.

1. Click the **Create** button.

# Test the integration behaviors

Click on **Twilio Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/bot.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/bot-behaviors.png" class="screenshot">
</div>

## Looking up a phone number

You can use Twilio's [Lookup API](https://www.twilio.com/docs/api/lookups) to retrive caller and carrier information about a phone number.

Open the card for the **Look up a number** behavior:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/behavior-lookup.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-lookup.png" class="screenshot">
</div>

Enter your mobile number in **Phone Number:** field (in E.164 format) and click the **Simulate** button.

At the bottom of the simulator output, in the **Set custom placeholder** section, you'll find the results of the lookup:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-lookup-output.png" class="screenshot">
</div>

## Sending a text message

Open the card for the **Send SMS message** behavior:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/behavior-send-sms.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-send-sms.png" class="screenshot">
</div>

Enter your mobile number in **To:**, a message in **Body:**, and then click the **Simulate** button.

You should receive a text message on your mobile phone.

<div class="cerb-box note">
<p>If you don't receive a text message, you can check the logs and debugger in Twilio. The bot simulator also provides debug output.</p>
</div>

## Receiving text messages

The package above automatically created a [webhook](/docs/webhooks/) for you and linked it to the **Respond to Twilio SMS webhook** bot behavior.  Let's copy this URL so we can add it to Twilio:

1. Log in to Cerb.

1. Navigate to **Search >> Webhooks**:

	<div class="cerb-screenshot">
	<img src="/assets/images/packages/twilio-bot/search-webhooks.png" class="screenshot">
	</div>
	
1. Copy the **URL** for the **Twilio SMS Received** webhook. (You can right-click the URL in your browser and select **Copy Link** from the menu.)

When you provision a phone number at Twilio, you can configure a webhook URL to handle inbound text messages.

1. Log in to [Twilio's phone number console](https://www.twilio.com/console/phone-numbers/incoming).

1. Provision a new phone number, or select an existing one.

1. Under the **Configure** tab, in the **Messaging** section, make sure **Webhook** is selected, then paste the Cerb webhook URL from above:

	<div class="cerb-screenshot">
	<img src="/assets/images/packages/twilio-bot/twilio-number-messaging.png" class="screenshot">
	</div>

1. Click the red **Save** button at the bottom of the page.

You should now be able to send text messages to that number and have a Cerb bot respond.

We've set up a few examples. Try sending the following messages:

* `hi`
* `help`
* `link`
* `logo`

The bot will respond:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/twilio-bot-sms.png" class="screenshot">
</div>

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Twilio's API](https://www.twilio.com/docs/api/) in your behaviors.

