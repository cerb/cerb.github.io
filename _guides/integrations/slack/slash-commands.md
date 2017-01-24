---
title: Send commands to a Cerb bot using Slack
layout: integration
topic: Integrations
subtopic: Slack
jumbotron:
  title: Send commands to a Cerb bot using Slack
  tagline: ""
  breadcrumbs:
  -
    label: Guides &raquo; Integrations &raquo; Slack &raquo;
    url: /guides/#slack
---

## Introduction

Slack makes it very easy to interact with third-party apps and services using their _slash commands_ feature.

To demonstrate this functionality, we'll add a new chat command named **/cerb** and instruct Slack to send those messages to a webhook[^webhook] that triggers a [bot](/docs/bots) behavior in Cerb.

## Enable the webhooks plugin in Cerb

When a channel member uses our new **/cerb** command, Slack will deliver their message as an HTTP POST[^http-post] request to a URL we provide.

You can use any web-based technology to process these POST requests and send a response back to Slack.

Cerb makes this process really simple with its [webhooks](/docs/webhooks) [plugin](/docs/plugins/).  You can install it from the [Plugin Library](/docs/plugins/#library).  The plugin enables Cerb to listen for arbitrary webhook requests and route them to bots.  Bot behaviors can process a request, perform actions in Cerb or interact with third-party services, and then send an appropriate response back to the caller.

## Create the bot behavior in Cerb

Once the Webhooks plugin is enabled, you'll be able to create new bot behaviors on the **Webhook received** event.

First, let's create a new bot to keep things organized.

Navigate to **Search** >> **Bots** and click the **(+)** icon above the worklist to add a new record.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/create-va.png" class="screenshot">
</div>

(You can find a logo image at <https://brandfolder.com/slack>)

Click the **Save Changes** button.

Click on the name of your new bot in the yellow notification bubble that appears above the worklist to open its [card](/docs/records/#cards).

On the card popup, click the **Behaviors** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/popup-behaviors-button.png" class="screenshot">
</div>

Then click **(+)** above the worklist:

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Select **Import** at the top of the popup and paste the following behavior:

{% gist cerb/d51a3b54eadf29df3286c02490486bf5 %}

You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/va-behavior.png" class="screenshot">
</div>

If so, we're ready to create the webhook that triggers this behavior.

## Create the new webhook in Cerb

Navigate to **Setup** &raquo; **Services** &raquo; **Webhooks**.

Click the **(+)** icon in the blue bar of the worklist to create a new webhook.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/create_webhook.png" class="screenshot">
</div>

Click the **Save Changes** button.

A new webhook will be added to the worklist.  You can copy the **URL** to your clipboard, since we'll be using it in the next step.

## Add the new command in Slack

Now that we have our webhook listener and bot behavior in place, we're ready to hook them up in Slack.

Visit the [Slack App Directory](https://slack.com/apps/build) and click the **Make a Custom Integration** button on the right.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/slack_custom_integration.png" class="screenshot">
</div>

Select **Slash Commands** from the menu.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/slack_slash_commands.png" class="screenshot">
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
<img src="/assets/images/guides/slack/slash-commands/bot_chat.png" class="screenshot">
</div>

## Where to go from here

Your friendly new bot doesn't do much yet, but you have a great starting point with endless possibilities.

You could modify the behavior we created to do anything that bots are capable of (which is a lot): add events to calendars, create reminders, add tasks, report about Cerb metrics, trigger webhooks in other services, post to social media, etc.

You could create a custom fieldset on workers to store their Slack user name, and the bot can use that field to look up a message sender's worker record.  The bot can then personalize its actions to use their calendar, their tasks, and so on.

You could use our [classifiers](/docs/classifiers) feature to support natural language in your Slack bot.  A classifier can convert freeform text into _"intents"_.  For instance, instead of only supporting the _"hi"_ command, your bot could learn the various ways people _intend_ to **say\_hello**: _hi, hello, what's up?, how are you?, hola, allo, yo, hey, etc_.

## References

[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
[^http-post]: <https://en.wikipedia.org/wiki/POST_(HTTP)>