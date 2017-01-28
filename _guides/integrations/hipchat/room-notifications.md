---
title: Send room notifications to HipChat from a Cerb bot
layout: integration
topic: Integrations
subtopic: HipChat
jumbotron:
  title: Send room notifications to HipChat from a Cerb bot
  tagline: ""
  breadcrumbs:
  -
    label: Guides &raquo; Integrations &raquo; HipChat &raquo;
    url: /guides/#hipchat
---

## Introduction
{:.no_toc}

This article will demonstrate how to send messages to HipChat from a Cerb bot.

When you create a custom integration in [HipChat](https://hipchat.com) you're given a unique URL with a built-in authentication token. This allows you to send messages to the specified room from a third-party application using a simple HTTP POST[^http-post].

Rather than using this URL directly in various actions within a Cerb bot, we're going to create a reusable behavior for sending a notification to HipChat that several other bots can use.  This protects the pre-authenticated HipChat URL, and it also improves maintainability since you make changes to the behavior in a single place.

* TOC
{:toc}

## Add an integration in HipChat

First, we need to create a new custom integration in HipChat to generate the URL we'll use to send messages.

Log in to HipChat from a web browser.

Click **Integrations** in the top navigation.

Select a room and click **Build your own integration**:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/create-integration.png" class="screenshot">
</div>

Name it _Cerb_ and click the **Create** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/name-integration.png" class="screenshot">
</div>

You should see your POST URL:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/post-url.png" class="screenshot">
</div>

With the above URL we can use the HipChat room notification API[^hipchat-notify-api] to send messages from Cerb.  For instance, here's a new message in JSON[^json] format:

<pre style="max-height: 29.25em;">
<code class="language-json">
{
  "color": "random",
  "message": "This is a new message.",
  "notify": false,
  "message_format": "text"
}
</code>
</pre>

## Build the reusable bot behavior in Cerb

Now we'll create the behavior in Cerb that POSTs to this URL when a bot wants to send a message to the HipChat room.

Log in to Cerb as an administrator.

From **Search &raquo; Bots**, click **(+)** in the top right of the worklist to add a new bot.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-new-bot.png" class="screenshot">
</div>

You can find the HipChat logo on their Twitter profile[^hipchat-twitter].

Optionally, you can also restrict **Events** to _Custom bot behavior_ and **Actions** to _Execute an HTTP request_.

Once finished, click the **Save Changes** button.

Open the card for **HipChat Bot** in the worklist.  You can click the link in the yellow notification that appeared above the worklist when you created the record.

Click the **Behaviors** button near the button of the popup.

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/popup-behaviors-button.png" class="screenshot">
</div>

Click the **(+)** icon in the behaviors worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Select **Import** at the top and paste the following behavior:

<pre style="max-height:29.25em;">
<code class="language-json">
{% raw %}
{
  "behavior":{
    "title":"Send a notification to HipChat",
    "is_disabled":false,
    "is_private":false,
    "event":{
      "key":"event.macro.bot",
      "label":"Custom bot behavior"
    },
    "variables":{
      "var_message":{
        "key":"var_message",
        "label":"Message",
        "type":"S",
        "is_private":"0",
        "params":{
          "widget":"multiple"
        }
      },
      "var_color":{
        "key":"var_color",
        "label":"Color",
        "type":"D",
        "is_private":"0",
        "params":{
          "options":"random\r\ngray\r\ngreen\r\npurple\r\nred\r\nyellow"
        }
      }
    },
    "configure": [
      {
        "label": "What is your HipChat POST URL?",
        "path": "behavior.nodes[0].params.actions[0].http_url",
        "type": "S"
      }
    ],    
    "nodes":[
      {
        "type":"action",
        "title":"Send notification to HipChat",
        "params":{
          "actions":[
            {
              "action":"core.va.action.http_request",
              "http_verb":"post",
              "http_url":"",
              "http_headers":"Content-Type: application\/json",
              "http_body":"{% set json = {} %}\r\n{% set json = dict_set(json, 'color', var_color) %}\r\n{% set json = dict_set(json, 'message', var_message) %}\r\n{% set json = dict_set(json, 'notify', true) %}\r\n{% set json = dict_set(json, 'message_format', 'html') %}\r\n{{json|json_encode|json_pretty}}",
              "run_in_simulator":"1",
              "response_placeholder":"_http_response"
            }
          ]
        }
      }
    ]
  }
}
{% endraw %}
</code>
</pre>

Cerb will prompt you for the URL that HipChat generated for you in the first step above.  Paste it into the text box and click the **Continue** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-behavior-import.png" class="screenshot">
</div>

Open the card for the newly created behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-behavior.png" class="screenshot">
</div>

Now let's test the behavior to make sure it's working properly. Click on the **Custom bot behavior** node and select **Simulate Behavior** from the menu:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-behavior-sim-menu.png" class="screenshot">
</div>

In the simulator, type a test message and click the **Simulate** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-behavior-sim.png" class="screenshot">
</div>

You should see the new message in HipChat:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/hipchat-new-message.png" class="screenshot">
</div>

## Use the new behavior from any Cerb bot

In any bot behavior, you can now add a new **Run behavior** action and call this HipChat behavior:

<div class="cerb-screenshot">
<img src="/assets/images/guides/hipchat/room-notifications/cerb-run-behavior.png" class="screenshot">
</div>

Your message can include any placeholders from that event.  For example, if you want to notify a room about new tickets, you can include the mask, subject, and the profile URL.

## References

[^json]: <https://en.wikipedia.org/wiki/JSON>
[^http-post]: <https://en.wikipedia.org/wiki/POST_(HTTP)>
[^hipchat-notify-api]: <https://www.hipchat.com/docs/apiv2/method/send_room_notification>
[^hipchat-twitter]: <https://twitter.com/hipchat>