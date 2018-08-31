---
title: "Relay worker comment notifications to email"
excerpt: In this guide we'll build a worker-owned bot for instantly relaying new notifications to email. This can be customized to notify in various ways (Slack, SMS, etc).
layout: integration
topic: Bots
subtopic: Mail
jumbotron:
  title: Relay worker comment notifications to email
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Bots &raquo;
    url: /resources/guides/#bots
---

* TOC
{:toc}

# Introduction

[Notifications](/docs/notifications/) keep workers informed about recent activity when they're watching a [record](/docs/records/) or someone `@mentions` them.  Notifications are displayed in the top right when a worker is logged in.  This is great for workers who use Cerb as part of their daily routine, but workers who only log in when they're needed should be notified in real-time a different way.

In this guide we'll build a worker-owned bot for instantly relaying new notifications to email. This can be customized by each worker to notify them in different ways (Slack, SMS, etc).

You'll need at least Cerb [7.3.4](/releases/7.3.4/) to follow along.

# Importing the behavior

First, let's import the pre-built behavior.  We're going to use a worker-owned bot for this, since we want to control the behavior per worker.  Some workers may want email notifications, others may want Slack/SMS notifications, and some may not want external notifications at all.

Navigate to **Search >> Bots**.

Select an existing worker-owned bot or create a new one.  The bot should be able to create behaviors on the **New notification for me** event.

Open the bot's [card](/docs/cards/) from the [worklist](/docs/worklists/).

Click **Behaviors** on the bot's card.

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
    "title": "Send notifications to email",
    "is_disabled": false,
    "is_private": false,
    "priority": 50,
    "event": {
      "key": "event.notification.received.worker",
      "label": "New notification for me"
    },
    "variables": {
      "var_comment": {
        "key": "var_comment",
        "label": "Comment",
        "type": "ctx_cerberusweb.contexts.comment",
        "is_private": "1",
        "params": []
      }
    },
    "nodes": [
      {
        "type": "switch",
        "title": "Is this a comment?",
        "status": "live",
        "nodes": [
          {
            "type": "outcome",
            "title": "Yes",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "message",
                      "oper": "contains",
                      "value": "commented"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Load the comment",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_set_custom_var",
                      "value": "{% set ctx_url = json_decode(event_json)['urls']['common.commented'] %}\r\n{% set ctx_id = ctx_url|split(':')[2] %}\r\n{{ctx_id}}",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "comment_id"
                    },
                    {
                      "action": "var_comment",
                      "search_mode": "quick_search",
                      "quick_search": "id:{{comment_id}}",
                      "limit": "first",
                      "limit_count": "1",
                      "mode": "add",
                      "worklist_model": null
                    },
                    {
                      "action": "_set_custom_var",
                      "value": "{% set comment = var_comment|first %}\r\n{{comment.comment}}",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "comment_content"
                    }
                  ]
                }
              },
              {
                "type": "action",
                "title": "Send email notification",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "send_email_owner",
                      "subject": "[Cerb] Notification: {{message}}",
                      "content": "{{message}}\r\n\r\n{{comment_content}}\r\n\r\nPermalink: {{url}}"
                    }
                  ]
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
{% endraw %}
</code>
</pre>

Click the **Save Changes** button.

# Understanding how the behavior works

Open the new behavior's card from the worklist. You should see:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior.png" class="screenshot">
</div>

The behavior performs a decision to check whether the target notification is about a new comment. If not, it exits without doing anything.  If so, it runs two actions.

The **Load the comment** action uses a bit of script, so let's take a closer look at that:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-action-comment-id.png" class="screenshot">
</div>

The first **Set custom placeholder** action loads the comment referenced by the notification into a behavior variable and sets another placeholder its content.

First, we're creating a `comment_id` placeholder using this script:

<pre>
<code class="language-twig">
{% raw %}
{% set ctx_url = json_decode(event_json)['urls']['common.commented'] %}
{% set ctx_id = ctx_url|split(':')[2] %}
{{ctx_id}}
{% endraw %}
</code>
</pre>

The `event_json` placeholder contains the raw event data for the notification.  We want to pull the new comment ID out of this.

We use the `json_decode()` function to turn the JSON-encoded `event_json` text into an object we can traverse and manipulate.

Then we access the `urls` key of the object to get an array of URLs from the event. We access the `common.commented` key of the URLs array.  This gives us an internal URL like `ctx://cerberusweb.contexts.comment:123`.  We save that as a temporary `ctx_url` variable using `set`.

Next, we `|split` the `ctx_url` variable text using `:` as a delimiter.  That returns an array `['ctx','//cerberus.contexts.comment','123']`, of which we want the third element.  It's zero-based (0,1,2), so we access the ID with `[2]` and save it as another temporary variable named `ctx_id`.

Then we output the {{ctx_id}} temporary variable and save that as a placeholder named `comment_id`.

The **Set (variable) Comment** action loads a comments worklist with the quick search: `id:{% raw %}{{comment_id}}{% endraw %}`

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-action-comment-load.png" class="screenshot">
</div>

We keep only the first result, since there should be one match for a given ID.

The final **Set custom placeholder** takes the first result from the `var_comment` placeholder (the comment worklist we just loaded) and saves it to a `comment` temporary variable.  We then output the comment text using `{% raw %}{{comment.comment}}{% endraw %}` and save that as a `comment_content` placeholder.  This is just a convenience placeholder for our next notification actions.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-action-comment-content.png" class="screenshot">
</div>

The second **Send email notification** action sends an email to the worker using this template:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-action-email.png" class="screenshot">
</div>

If you leave `To:` blank them the worker's default email address will be used.  Otherwise you can choose an alternate email address to use (a mobile device, etc).

# Testing the behavior

At the top of the decision tree on the behavior's card, click on the **Simulator** button.

On the simulator popup, choose a comment notification at the **Target:** at the top:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-simulate-target.png" class="screenshot">
</div>

Now, click the **Simulate** button at the bottom of the popup.

You should see output like:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/comment-notifications/behavior-simulator.png" class="screenshot">
</div>

In the above image, the behavior set `comment_id` to `385`.  It loaded the comment into `var_comment`, and saved _"@Kina Sounds good.  I think.  Thanks."_ to a placeholder named `comment_content`.

Finally, it shows us what the email notification to the worker would look like.

# Next steps

* You can add a **Mark read** action to close notifications after they're relayed by email.

* You can modify the content of the email notification in the **Send email notification** action node.

* Some workers may prefer other notification methods. You can change the **Send email to notified worker** action to do anything else instead.

* As an administrator, you can import this behavior on a bot for each worker who needs email notifications.  It's also possible to do this in one place from an app-owned behavior on the **Record commented on** event, but that's beyond the scope of this guide.  The techniques you learned here can be applied to that variation.