---
title: Give Cerb bots the power of speech with Amazon Polly
layout: integration
topic: Integrations
subtopic: Amazon Web Services
jumbotron:
  title: Give Cerb bots the power of speech with Amazon Polly
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: AWS &raquo;
    url: /resources/guides/#amazon-web-services
---

# Introduction
{:.no_toc}

In this guide you'll learn how to generate audio streams of speech from arbitrary text using [bots](/docs/bots/) in Cerb.

First, we'll create a new [connected account](/docs/connected-accounts/) to securely integrate with Amazon Polly -- a fast, inexpensive, and lifelike text-to-speech service from Amazon Web Services.

Next, we'll create a [delegate](/docs/bots/#delegation) named _Polly Bot_ to secure your credentials and provide text-to-speech as a simple service for any other bot in Cerb.  Your team's bots will be able to give Polly Bot some text and a preferred voice (gender/accent), and receive back a secure time-limited URL that you can share and play anywhere.

Finally, we'll demonstrate how to use Polly Bot as a delegate from a conversational bot to respond to [workers](/docs/workers/) with speech directly in their web browser.

* TOC
{:toc}

# Log in to Amazon Web Services

First, we need to create a new user in your Amazon Web Services (AWS) account and attach a _policy_ that describes the services that they are allowed to use.  This is accomplished with the Identity Access Management (IAM) service.  This user will receive credentials that you can use to interact with AWS from Cerb.

Log in to the [AWS Management Console](https://console.aws.amazon.com/iam/) and navigate to the IAM service.

If you don't have an AWS account, you can sign up for free at: <https://aws.amazon.com>

## Add a new policy

We're going to create a new IAM policy that provides:

- Read-only access to Amazon Polly
- Read-only access to the user's own account info

Select **Policies** in the navigation on the left.

Click the **Create Policy** button.

In the **Create Your Own Policy** section, click the **Select** button.

Enter the following:

- **Policy Name:** CerbPolly

- **Description:** Programmatic access to AWS Polly from Cerb bots

- **Policy Document:** _(copy and paste the policy below)_

<pre>
<code class="language-json">
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "201701250001",
      "Effect": "Allow",
      "Action": [
        "iam:GetUser"
      ],
      "Resource": [
        "arn:aws:iam::*:user/${aws:username}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "polly:DescribeVoices",
        "polly:GetLexicon",
        "polly:ListLexicons",
        "polly:SynthesizeSpeech"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
</code>
</pre>

Click the blue **Create Policy** button in the bottom right.

## Create a new user

Now that we have a policy, we're ready to create the new user account for our Cerb bot to use.

Select **Users** in the left navigation.

Click the blue **Add user** button at the top of the page.

Type `Cerb` in **User name**.

In **Access type**, check _Programmatic access_.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/aws-iam-create-user.png" class="screenshot">
</div>

Click the blue **Next: Permissions** button in the bottom right.

## Attach existing policies

Let's add the policy we just created.

Select **Attach existing policies directly**.

Type `Cerb` in the search box and select **CerbPolly**.

Click the blue **Next: Review** button in the bottom right.

Verify the new user and click the blue **Create user** button in the bottom right.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/aws-iam-create-confirm.png" class="screenshot">
</div>

## Save your new credentials

Click the **Download .csv** button to save a copy of your new credentials.  You'll need these in a moment when adding a new connected account in Cerb.

That's everything we need to do in AWS. You can close the AWS Management Console.

# Enable the AWS plugin in Cerb

To add the AWS service provider for connected accounts in Cerb, we need to install a plugin.

Click **setup** in the top right of Cerb (you must be an admin).

Hover over the **Plugins** menu and click on **Plugin Library**.

Type `aws` in the search box above the worklist and press `<ENTER>`.
	
Find the **Amazon Web Services (AWS) Integration** plugin in the worklist and click its **Download and install** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-plugin-aws-install.png" class="screenshot">
</div>

On the popup, click **Download and install** again to confirm.

In the **Status:** field, select _Enabled_.

Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create a connected account to securely store our AWS user credentials.

Open the [search menu](/docs/navigation/#search) and select **Connected Accounts**.

Click the **(+)** icon above the worklist to add a new account.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Click on **Amazon Web Services**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-connected-account-add.png" class="screenshot">
</div>

This will open a popup that asks you for your programmatic user credentials.

Enter the following:

- **Name:** `Cerb (Polly)`
- **Access Key ID:** `<the access key you downloaded earlier>`
- **Secret Access Key:** `<the secret key you downloaded earlier>`
	
<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-connected-account-creds.png" class="screenshot">
</div>

Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

## Transfer ownership of the connected account to Cerb

By default, new connected accounts are owned by you.  When something is owned by a worker it's private and only they can see it.  We want Polly Bot to be usable by everyone, so we need to transfer ownership of the new connected account to Cerb.

Open the [card](/docs/records/#cards) for your new connected account.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-connected-account-card.png" class="screenshot">
</div>

Click the **Edit** button at the top of the card.

In the **Owner:** field, remove yourself and select _Cerb_ as the new owner.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-connected-account-card-edit.png" class="screenshot">
</div>

Click the **Save Changes** button.

That's all for connected accounts.  You can close the connected accounts search popup.

# Create Polly Bot in Cerb

Now we're ready to create the bot that interacts with AWS using our connected account.

Open the [search menu](/docs/navigation/#search) and select **Bots**.

Click the **(+)** icon above the worklist to add a new bot.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following details:

- **Name:** Polly Bot
- **Owner:** Cerb
- **Status:** Enabled
- **Image:** (click **Edit** and use an Emoji like 🐦 or 💬)
- **Events:** _Allow only these:_ &raquo; _Custom bot behavior_
- **Action Extensions:** _Allow only these:_ &raquo; _Get Pre-signed URL for AWS_

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-create.png" class="screenshot">
</div>

Click the **Save Changes** button.

## Import the behavior

We've already built the behavior for you, and you can use Cerb's import feature to quickly create it.

Open the [card](/docs/records/#cards) for your new bot.  You can just click its name in the yellow notification above the worklist.

Click the **Behaviors** button on the card.

Click the **(+)** icon above the worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Switch to **Import** mode at the top of the editor popup.

Copy and paste the following behavior into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Get presigned speech URL",
    "is_disabled": false,
    "is_private": false,
    "priority": 1,
    "event": {
      "key": "event.macro.bot",
      "label": "Custom bot behavior"
    },
    "configure": [
      {
        "label": "AWS Account:",
        "path": "behavior.nodes[0].params.actions[0].auth_connected_account_id",
        "type": "chooser",
        "params": {
          "context": "cerberusweb.contexts.connected_account",
          "query": "service:\"wgm.aws.service.provider\"",
          "single": true
        }
      }
    ],
    "variables": {
      "var_text": {
        "key": "var_text",
        "label": "Text",
        "type": "S",
        "is_private": "0",
        "params": {
          "widget": "single"
        }
      },
      "var_voice": {
        "key": "var_voice",
        "label": "Voice",
        "type": "D",
        "is_private": "0",
        "params": {
          "options": "Brian\r\nGeraint\r\nJoanna"
        }
      }
    },
    "nodes": [
      {
        "type": "action",
        "title": "Get presigned URL",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "wgm.aws.bot.action.get_presigned_url",
              "http_verb": "post",
              "http_url": "https://polly.us-west-2.amazonaws.com/v1/speech",
              "http_headers": "Content-Type: application/json",
              "http_body": "{% set json = {} %}\r\n{% set json = dict_set(json, 'OutputFormat', 'mp3') %}\r\n{% set json = dict_set(json, 'VoiceId', var_voice) %}\r\n{% set json = dict_set(json, 'TextType', 'text') %}\r\n{% set json = dict_set(json, 'Text', var_text) %}\r\n{{json|json_encode|json_pretty}}",
              "expires_secs": "60",
              "auth_connected_account_id": "0",
              "response_placeholder": "polly_speech_url"
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

Click the **Save Changes** button.

Cerb will prompt you to link your **AWS Account:** before creating the behavior.  Click the chooser button and select **AWS: Cerb (Polly)**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-behavior-create.png" class="screenshot">
</div>

Click the **Save Changes** button.

You'll see a new behavior named **Get presigned speech URL** was created for you in the _Behavior Search_ [worklist](/docs/workspaces/#worklists) on the search popup.

## Learn how the behavior works

Even though the behavior was automatically created for you, it's useful to understand how everything works so you can make changes and create your own behaviors later.

If you open the card for the new behavior you'll see its _decision tree_ at the bottom.

Click the **Custom bot behavior** _node_ and select **Edit Behavior** from the menu:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-behavior.png" class="screenshot">
</div>

You should see:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-behavior-edit.png" class="screenshot">
</div>

Here we've defined two _public behavior variables_ named **Text** and **Voice**.  These variables will be provided by other bots when they want Polly Bot to generate speech and return a pre-signed URL to the audio stream.

You can close the edit popup without saving it (click the **(x)** icon in the top right of the popup).

So that's the behavior itself.  Let's look at the [action](/docs/bots/#actions) node, where the magic actually happens.

Click on the **Get presigned URL** node in the decision tree.  You should see:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-behavior-action-edit.png" class="screenshot">
</div>

This action uses your **AWS: Cerb (Polly)** connected account to _pre-sign_ a `POST` request to the Amazon Polly API.  In the **Request body:** we're sending a JSON payload that asks for an MP3 audio stream for the text defined in `var_text` using the voice defined in `var_voice`.  We've also set the pre-signed URL to expire in `60` seconds.

Most importantly, the URL for the audio stream will be saved in a new `polly_speech_url` placeholder.

That's it!  Polly Bot is rather straightforward, but it will save you a lot of work when you need to add speech to several other bots.  All of your interaction with AWS Polly is in a single place.

## Test the behavior with the bot simulator

We've clicked around a lot. By now you're probably eager to actually hear a bot speak.

While you still have the action editor popup open, click the **Simulator** button in the bottom toolbar.

Enter some text that you want the bot to say.  You can optionally choose the voice to use.

We've included a few of our favorite voices, but you can use any of the voices or languages supported by Polly[^polly-voices] by [editing the behavior](#understanding-how-the-behavior-works) and adding them to the public behavior variables.  You can even use the SSML[^ssml] format instead for fine-tuning pronunciation, pitch curves, etc.

Click the **Simulate** button.

You won't hear speech yet, but in the log at the bottom of the simulator you should should see the audio stream URL under `>>> Saving pre-signed URL to {% raw %}{{polly_speech_url}}{% endraw %}:`

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-behavior-simulator.png" class="screenshot">
</div>

Copy the (very long) URL to your clipboard and paste it into the location bar in a new browser window or tab.  You should hear the text you typed being spoken in the selected voice.

For example, we received this audio stream for the example above:

<audio controls>
<source src="/assets/audio/guides/aws/polly-speech/polly-speech.mp3" type="audio/mpeg">
Your browser does not support HTML5 audio.
</audio>

You can do anything with the audio stream URL at this point.  For instance:

- A bot could send the URL to a web browser and play it.
- A bot could download it as a new attachment record.
- You could use it in an interactive voice response system during a phone call (e.g. Twilio, Asterisk).

# Using the Polly Bot delegate from a conversational bot

A common use case for audio streams is adding speech responses to conversational bots within Cerb.

For a working example we're going to extend the bot from the [Chat Bot](/packages/chat-bot/) package.  If you haven't already, you should complete that guide before continuing here.

Start a chat with your bot by clicking on the bot icon in the lower right of your browser:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-convo-bubble.png" class="screenshot">
</div>

In the chat window that opens, click on **Cerb**'s name above the first message to open its card:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-chat-card.png" class="screenshot">
</div>

Click on the **Behaviors** button.

Find the **Respond to worker chat** behavior and open its card.

We want to add a new action inside the **say()** subroutine.  Click on it and select **Import** from the menu:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-chat-subroutine-say.png" class="screenshot">
</div>

Copy and paste the following behavior fragment into the large textbox on the import popup:

<pre style="max-height:29.25em;">
<code class="language-json">{% raw %}
{
  "behavior_fragment": {
    "title": "Respond to worker chat",
    "is_disabled": false,
    "is_private": false,
    "priority": 1,
    "event": {
      "key": "event.interaction.chat.worker",
      "label": "[UI] New chat message from worker"
    },
    "configure": [
      {
        "label": "Polly Bot behavior:",
        "path": "behavior_fragment.nodes[0].params.actions[0].behavior_id",
        "type": "chooser",
        "params": {
          "context": "cerberusweb.contexts.behavior",
          "query": "bot:(Polly) presigned",
          "single": true
        }
      }
    ],
    "nodes": [
      {
        "type": "action",
        "title": "Speak the response",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "_run_behavior",
              "on": "_trigger_va_id",
              "behavior_id": "0",
              "var_text": "{{say|split('&lt;!--#stop-speaking--&gt;')|first}}",
              "var_voice": "Brian",
              "run_in_simulator": "0",
              "var": "_behavior"
            },
            {
              "action": "send_script",
              "script": "{% if _behavior.polly_speech_url %}\r\n<script type=\"text\/javascript\">\r\n  Devblocks.playAudioUrl('{{_behavior.polly_speech_url}}');\r\n<\/script>\r\n{% endif %}"
            }
          ]
        }
      }
    ]
  }
}
{% endraw %}</code>
</pre>

Click the **Import** button.

Cerb will ask you to link **Polly Bot:**. Click the chooser button and select **Polly Bot** from the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-chat-action-import.png" class="screenshot">
</div>

Click the **Import** button again.

You should now see two actions in the **say()** subroutine.

Switch back to the chat window and type `hi`.

If everything is configured properly you should hear a voice say hello to you by name.

Try these:

- `what time is it?`
- `show open tickets`

You'll notice that the bot speaks its entire message.  Sometimes this isn't desirable.  For instance, type `help` in the chat window.

That's quite a lot of talking.  It would be better if the bot just said _"Try one of these"_ without reading the entire list.  Fortunately, we've made that very easy to do in the action you just imported.

Switch back to the card for the **Respond to worker chat** behavior.  If you closed it, click on Cerb's name in the chat window again, then click the **Behaviors** button.

In the **ask.help** outcome, click on the **Respond: Help** action and select **Edit** from the menu:

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/polly-speech/cerb-bot-chat-intent-help.png" class="screenshot">
</div>

The **Set custom placeholder** action has the following script:

<pre>
<code class="language-text">
Try one of these: 
- help
- hi
- What time is it?
- find my open tickets
- show waiting tickets from Jan 2015 to now
- find Mara's messages from this year
- search my open tasks
- show my new notifications
</code>
</pre>

Change the first line to:

<pre data-line="1">
<code class="language-text">
Try one of these: &lt;!--#stop-speaking--&gt;
- help
- hi
- What time is it?
- find my open tickets
- show waiting tickets from Jan 2015 to now
- find Mara's messages from this year
- search my open tasks
- show my new notifications
</code>
</pre>

Click the **Save & Close** button.

Switch back to the chat window and type `help` again.

The bot will only speak _"Try one of these"_ and the list of help suggestions will remain in the message's text.

# References

[^polly-voices]: AWS Developer Guide: Polly Voices <http://docs.aws.amazon.com/polly/latest/dg/API_Voice.html>
[^ssml]: AWS: Using SSML - <http://docs.aws.amazon.com/polly/latest/dg/ssml.html>