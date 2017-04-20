---
title: Send JotForm responses to Cerb bots using webhooks
excerpt: This guide demonstrates how to configure webhooks for integration between JotForm and Cerb.
layout: integration
topic: Integrations
subtopic: JotForm
jumbotron:
  title: Send JotForm responses to Cerb bots using webhooks
  tagline: ""
  breadcrumbs:
  -
    label: Guides &raquo; Integrations &raquo; JotForm &raquo;
    url: /guides/#jotform
---

# Introduction
{:.no_toc}

JotForm[^jotform] is an interactive form builder for surveys, contact forms, etc. 

By default it sends new form responses to email. Using webhooks, you can also trigger Cerb bot behaviors when someone fills out the form.

This guide demonstrates how to configure webhooks for integration between JotForm and Cerb.

* TOC
{:toc}

# Creating the bot in Cerb

Navigate to **Search >> Bots**.

* **Name:** JotForm Bot
* **Owner:** Cerb
* **Status:** Enabled
* **Image:** `http://webtoolswiki.com/wp-content/uploads/2014/12/jotform1.png`

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/bot.png" class="screenshot">
</div>

Click the **Save Changes** button.

In the yellow notification above the worklist, click on **JotForm Bot**.

On the bot's card popup, click the **Behaviors** button.

Click on the **(+)** icon above the behaviors worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Switch to **Import** mode and paste the following behavior:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Catch JotForm webhook",
    "is_disabled": false,
    "priority": 50,
    "event": {
      "key": "event.webhook.received",
      "label": "Webhook received"
    },
    "nodes": [
      {
        "type": "action",
        "title": "Create comment",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "_set_custom_var",
              "value": "{{http_params.rawrequest}}",
              "format": "json",
              "is_simulator_only": "0",
              "var": "json"
            },
            {
              "action": "create_comment",
              "on": "_trigger_va_id",
              "content": "{{json|json_encode|json_pretty}}"
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

# Understanding how the behavior works

Each form has different fields, and there are countless actions you can automate from a bot once you receive a new form submission.

For a simple demonstration, this behavior adds each new response as a comment on the bot's record.  You can modify this behavior to meet your specific needs.

# Creating a webhook listener in Cerb

Let's add a webhook listener in Cerb to catch webhooks from JotForm.

You'll need to be an administrator to create a new webhook.

Navigate to **Setup >> Services >> Webhooks**.  If you don't see a _Webhooks_ option in the _Services_ menu then you'll need to [enable that plugin](/docs/plugins/#library).

Click the **(+)** above the webhook listeners worklist.

* **Name:** JotForm new survey response
* **Bot Behavior**: JotForm Bot >> Catch JotForm webhook

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/webhook-listener.png" class="screenshot">
</div>

Click the **Save Changes** button.

Copy the **URL** for the new webhook.  You'll need it in the next section.

# Sending the webhook from JotForm

Create a form in JotForm:

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/jotform-form.png" class="screenshot">
</div>

Click into the **Settings** section in the orange bar at the top, then select **Integrations** on the left, and enable **Webhooks** on the right.

Paste your Cerb webhook listener URL from above:

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/jotform-webhooks.png" class="screenshot">
</div>

Then click the green **Complete Integration** button in the lower right.

JotForm will send data to that URL every time there is a new form submission.

# Testing the behavior

Switch to the **Publish** section on JotForm.  This will give you a public URL for your form.

Fill out your form with some sample data:

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/jotform-response.png" class="screenshot">
</div>

Click the **Submit** button.

The webhook should send data to Cerb nearly instantaneously.

Switch back to Cerb and view JotForm Bot's profile from **Search >> Bots**.

Click on the **Comments** button at the top of the page.

You should see something like the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/bot-comment.png" class="screenshot">
</div>

The comment shows the raw data from your JotForm response in JSON[^json] format.

By modifying the behavior you imported above, you can do anything with the form submission data: create records like tickets and tasks, send email, forward the data to other APIs, etc.

For instance, you can create a ticket like this (refer to the comment created by the bot for your own field names):

<div class="cerb-screenshot">
<img src="/assets/images/guides/jotform/webhooks/create-ticket.png" class="screenshot">
</div>

<div class="cerb-box note">
	<p>
		You may be wondering why you wouldn't just have JotForm send responses to email rather than creating a ticket from a webhook. JotForm sends form responses in HTML format, which is difficult to parse if you have bot behaviors acting on new messages. Their email messages also add wrapping linefeeds to long-text fields.
	</p>
</div>

# References

[^jotform]: JotForm - <https://www.jotform.com/>
[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>