---
title: Slack
excerpt: A step-by-step guide for integrating Cerb and Slack.
summary: This page provides a comprehensive guide on integrating Cerb with Slack,
  detailing the steps to create a new Slack app and configure authentication using
  either bot tokens or OAuth2. It explains how to set up a Slack connected account
  in Cerb, with specific instructions for both authentication methods. The guide also
  includes related resources for further integration, such as setting up Slack notifications
  within Cerb.
social_image_url: /assets/images/solutions/integrations/slack/cerb-and-slack.png
redirect_from:
  - /guides/integrations/slack/
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

In this guide we'll walk through the process of linking Cerb to Slack. You'll be able to use Slack's full API from automations in Cerb.

# Create a new app at Slack

First, you need to create a new app on Slack for Cerb to connect to.

Log in to [Slack's developer portal](https://api.slack.com/apps).

Click the green **Create New App** button.

Select **From scratch**.

Enter the following details:

|---
|-|-
| **App Name:** | Cerb
| **Development Slack Team:** | (your team name)

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/slack/slack-new-app.png" class="screenshot">
</div>

Click the **Create App** button.

## Configure Slack authentication

You can choose to authenticate with either **bot tokens** or **OAuth2**.

### Option 1: Bot Tokens (Recommended)

This is the simplest authentication method. It uses a single OAuth2 token for the bot and doesn't link Slack user accounts.

Select **OAuth & Permissions** from the left sidebar.

Scroll down to **Scopes**.

In **Bot Token Scopes** click the **Add an OAuth Scope** button.

Add the `chat:write` scope.

Scroll up to **OAuth Tokens** and click the **Install** button.

Click **Allow** on the consent screen.

Copy the **Bot User OAuth Token**.

### Option 2: OAuth2

This authentication method links individual Slack users to Cerb connected accounts. Use this if you need to automate a user's account.

Select **Basic Information** in the left sidebar.

Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

Select **OAuth & Permissions** from the left sidebar.

Scroll down to **Redirect URLs**.

Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://YOUR-CERB-HOST/`).

# Create the Slack connected account in Cerb

In Cerb, navigate to **Search >> Connected Services**.

Click the **(+)** icon in the top right of the list.

Select **Slack**.

Enter either the **[Bot Tokens]** or **[OAuth2]** fields depending on your authentication option above. 

Click the **Create** button at the bottom of the popup.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/slack/package-library-service-slack.png" class="screenshot">
</div>

### Bot Tokens

You're done!

### OAuth2

If you're using OAuth2 authentication, you need to link Slack user accounts to Cerb.

Navigate to **Search >> Connected Accounts**.

Click the **(+)** icon in the top right of the list.

Select **Slack**.

Click the blue **Link to Slack** button.

Accept consent on Slack.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/slack/oauth-approve.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Examples:

## Send a simple message to a channel

{% highlight cerb %}
{% raw %}
start:
  http.request:
   output: http_response
   inputs:
      url: https://slack.com/api/chat.postMessage
      method: POST
      authentication: cerb:connected_account:slack
      headers@text:
        Content-Type: application/json; charset=utf8
      body:
        channel: #testing
        text@text:
          Here is an example message.
   on_success:
     set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Send a Block Kit message to a channel

{% highlight cerb %}
{% raw %}
start:
  http.request:
   output: http_response
   inputs:
      url: https://slack.com/api/chat.postMessage
      method: POST
      authentication: cerb:connected_account:slack
      headers@text:
        Content-Type: application/json; charset=utf8
      body:
        channel: #testing
        text@text:
          Here is an example message using Block Kit:
        blocks:
          0:
            type: section
            text:
              text: A message *with some bold text* and _some italicized text_.
              type: mrkdwn
            fields:
              0:
                type: mrkdwn
                text: *Priority*
              1:
                type: mrkdwn
                text: *Type*
              2:
                type: plain_text
                text: High
              3:
                type: plain_text
                text: Silly
          1:
            type: image
            title:
              type: plain_text
              text: a cat
            image_url: https://cataas.com/cat
            alt_text: a cat
   on_success:
     set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## List channels
Requires  `channels:read` scope.
{% highlight cerb %}
{% raw %}
start:
  http.request:
   output: http_response
   inputs:
      url: https://slack.com/api/conversations.list
      method: GET
      authentication: cerb:connected_account:slack
      headers@text:
        Content-Type: application/json; charset=utf8
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## List Users

Requires `users:read` scope.
{% highlight cerb %}
{% raw %}
start:
  http.request:
    output: http_response
    inputs:
      url: https://slack.com/api/conversations.list
      method: GET
      authentication: cerb:connected_account:slack
      headers:
        Content-Type: application/json; charset=utf8
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

# Related Resources

* Guide: [Send commands to a Cerb automations using Slack](guides/integrations/slack/slash-commands/)
* Workflow: [Slack Notifications](/workflows/cerb.integrations.slack.notifications/)