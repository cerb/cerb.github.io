---
title: Create a simple Cerb bot using Slack slash commands
permalink: /integrations/slack/slash-commands
excerpt: |
  Slack makes it very easy to interact with third-party apps and services using their _slash commands_ feature. To demonstrate this functionality, we'll add a new chat command named **/cerb** and instruct Slack to send those messages to a webhook in Cerb where we'll process them in real-time using a Virtual Attendant behavior...
---

# {{ page.title }}

## Introduction

Slack makes it very easy to interact with third-party apps and services using their _slash commands_ feature.

To demonstrate this functionality, we'll add a new chat command named **/cerb** and instruct Slack to send those messages to a webhook[^webhook] in Cerb where we'll process them in real-time using a [Virtual Attendant](/docs/virtual-attendants) behavior.

## Enable the Webhooks plugin in Cerb

When a channel member uses our new **/cerb** command, Slack will deliver their message as an HTTP POST[^http-post] request to a URL we provide.

You could use any web-based technology to process these POST requests, interact with Cerb through the [API](/docs/api), and send a response back to Slack.

Since version 6.9 (Jan 2015), Cerb makes this process even simpler with the introduction of the [Webhooks](/docs/webhooks) plugin.  This plugin enables Cerb to catch webhook requests directly and route them to Virtual Attendant behaviors.  These browser-built behaviors can process a request, perform actions in Cerb or interact with third-party services, and then send an appropriate response.

As an administrator, you can verify that the Webhooks plugin is installed and enabled in your Cerb environment by navigating to **Setup** >> **Plugins** >> **Installed Plugins**.

Search for _"webhooks"_:

* If the plugin exists and is enabled, you're all set.

* If the plugin exists and is disabled, then click **Configure** and enable it.

* If the plugin doesn't exist, install it from the **Plugin Library** tab.

## Create the Virtual Attendant behavior in Cerb

Once the Webhooks plugin is enabled, you'll be able to create new Virtual Attendant behaviors on the **Webhook received** event.

First, let's create a new Virtual Attendant to keep things organized.

Navigate to **Search** >> **Virtual Attendant** and click the **(+)** icon in the blue bar to add a new record.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/create_va.png" class="screenshot">
</div>

(You can find a logo image at <https://brandfolder.com/slack>)

Click the **Save Changes** button.  Then click your new bot in the worklist to view its profile.

On the **Behaviors** tab, click the **Create Behavior** button.

Select the **Import** tab and paste the following behavior to import it:

{% gist cerb/d51a3b54eadf29df3286c02490486bf5 %}

You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/va_behavior.png" class="screenshot">
</div>

If so, we're ready to create the webhook that triggers this behavior.

## Create the new webhook in Cerb

Navigate to **Setup** >> **Configure** >> **Webhooks**.

Click the **(+)** icon in the blue bar of the worklist to create a new webhook.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/create_webhook.png" class="screenshot">
</div>

Click the **Save Changes** button.

A new webhook will be added to the worklist.  You can copy the **URL** to your clipboard, since we'll be using it in the next step.

## Add the new command in Slack

Now that we have our webhook listener and Virtual Attendant behavior in place, we're ready to hook them up in Slack.

Visit the [Slack App Directory](https://slack.com/apps/build) and click the **Make a Custom Integration** button on the right.

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/slack_custom_integration.png" class="screenshot">
</div>

Select **Slash Commands** from the menu.

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/slack_slash_commands.png" class="screenshot">
</div>

Name the command **/cerb** and click the green **Add Slash Command Integration** button.

Scroll down to the **Integration Settings** section.

Paste your webhook URL from the previous step in the **URL** field.

Set the **Customize Name** to **Cerb**.

For **Customize Icon**, you can save the following image and upload it:

<div class="cerb-screenshot">
<img src="/assets/cerb_mascot.png" class="screenshot" style="width:250px;height:auto;">
</div>

If desired, you can add the **/cerb** command to the **Autocomplete help text** in Slack.

Finally, click the green **Save Integration** button at the bottom of the page.

## Test the new /cerb command in Slack

Join one of your Slack channels and try out the new **/cerb** command.

<div class="cerb-screenshot">
<img src="/assets/images/integrations/slack/slash-commands/bot_chat.png" class="screenshot">
</div>

## Where to go from here

Your friendly new bot doesn't do much yet, but you have a great starting point with endless possibilities.

You could modify the behavior we created to do anything that Virtual Attendants are capable of (which is a lot): add events to calendars, create reminders, add tasks, report about Cerb metrics, trigger webhooks in other services, post to social media, etc.

You could create a custom fieldset on workers to store their Slack user name, and the Virtual Attendant can use that field to look up a message sender's worker record.  The bot can then personalize its actions to use their calendar, their tasks, and so on.

You could use our [Wit.ai](/integrations/wit-ai) integration examples to support natural language in your Slack bot.  Wit.ai converts freeform text into _"intents"_.  For instance, instead of only supporting the _"hi"_ command, your bot could learn the various ways people _intend_ to **say\_hello**: _hi, hello, what's up?, how are you?, hola, allo, yo, hey, etc_.

## References

[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
[^http-post]: <https://en.wikipedia.org/wiki/POST_(HTTP)>