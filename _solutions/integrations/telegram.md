---
title: Telegram
excerpt: A step-by-step guide for integrating Cerb and Telegram.
social_image_url: /assets/images/solutions/integrations/cerb-and-telegram.png
layout: solution
jumbotron:
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Solutions Hub &raquo;
      url: /solutions/
    - label: Integrations &raquo;
      url: /solutions/#integrations
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Telegram. You'll be able to use Telegram's full Bot API in Cerb automations.

# Get a Telegram Bot Token.

Open a Telegram chat with the [BotFather](https://telegram.me/BotFather)

Type the command `/newbot` to create a new bot.

Give the bot a name and username (eg. Example, ExampleBot)

Copy the authorization token for use later.

# Create the Telegram service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Telegram**.

4. Paste the token you copied earlier in the **Bot Token** field.

5. Click the **Create** button.

# Set a Webhook

In order to properly use your new Telegram Bot in Cerb, you need to set up a Webhook.

1. Navigate to **Search >> Webhooks**

2. Click the **(+)** icon in the top right of the list.

3. Name the Webhook.

4. Copy the Webhook URL.

5. Run the following Automation (for more info see <https://core.telegram.org/bots/api#setwebhook>:
{% highlight cerb %}
{% raw %}
start:
  http.request/setwebhook:
    output: http_response
    inputs:
      method: POST
      url: https://api.telegram.org/bot/setWebhook
      authentication: cerb:connected_account:telegram
      headers:
        Content-Type: application/json
      body:
        url: https://cerb.example/webhook/abcdef123456
        allowed_updates@csv: message
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

The webhook will receive requests in the format outlined here: <https://core.telegram.org/bots/api#update>

From here you can set an automation to respond to the webhook however you want.

# Examples

## Test Authorization

<https://core.telegram.org/bots/api#getme>

{% highlight cerb %}
{% raw %}
start:
  http.request/test:
    output: http_response
    inputs:
      method: GET
      url: https://api.Telegram.io/bot/getMe
      authentication: cerb:connected_account:Telegram
      headers:
        Content-Type: application/json
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Send a Message

<https://core.telegram.org/bots/api#sendmessage>

{% highlight cerb %}
{% raw %}
start:
  http.request/chat:
    output: http_response
    inputs:
      method: GET
      url: https://api.Telegram.io/bot/sendMessage
      authentication: cerb:connected_account:Telegram
      headers:
        Content-Type: application/json
      body:
        chat_id: [your chat or group ID]
        text: hello testing testing 123
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}