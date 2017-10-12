---
title: "Close idle tickets with bots"
excerpt: "In this guide we'll create a bot that automatically closes tickets that have been waiting for a client reply for more than 30 days."
layout: integration
topic: Bots
subtopic: Behaviors
jumbotron:
  title: Close idle tickets with bots
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

When [workers](/docs/workers/) reply to [tickets](/docs/tickets/), they can use the _"waiting"_ [status](/docs/tickets/#status) to indicate that a response from the client is needed before continuing.  When a client replies, the ticket status is automatically changed back to _"open"_, and notifications are sent to the owner and [watchers](/docs/records/#watchers).

However, sometimes a client never responds.  Unless the ticket was given a specific _"reopen"_ date, it will remain in the waiting status indefinitely.

In this guide we'll create a bot that automatically closes tickets that have been _waiting_ for a client reply for more than 30 days. Our bot will also send a notification to the customer to let them know their ticket has been closed.

# Creating the bot

You can use an existing bot for these behaviors, but in this guide we'll be creating a new one for this purpose.

Navigate to **Search >> Bots**.

Click on the **(+)** icon above the behaviors worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following details:

* **Name:** Auto-Close Bot
* **Owner:** Cerb
* **Status:** Enabled

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/bot.png" class="screenshot">
</div>

Click on the **Save Changes** button.

# Importing the behaviors

We're going to import two behaviors for the auto-close functionality.

Click on **Auto-Close Bot** in the yellow notification above the worklist to open its card.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/marquee.png" class="screenshot">
</div>

Click **Behaviors** on the bot's card.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/bot-card.png" class="screenshot">
</div>

## Importing the first behavior

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
    "title": "Auto-close an idle waiting ticket",
    "is_disabled": false,
    "is_private": true,
    "priority": 50,
    "event": {
      "key": "event.macro.ticket",
      "label": "Custom ticket behavior"
    },
    "nodes": [
      {
        "type": "switch",
        "title": "Is the ticket waiting with no reopen and idle for >30 days?",
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
                      "condition": "ticket_status",
                      "oper": "in",
                      "values": [
                        "waiting"
                      ]
                    },
                    {
                      "condition": "ticket_reopen_date",
                      "oper": "is",
                      "from": "0",
                      "to": "0"
                    },
                    {
                      "condition": "ticket_updated",
                      "oper": "is",
                      "from": "big bang",
                      "to": "-30 days"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Notify the requesters",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "send_email_recipients",
                      "html_template_id": "",
                      "format": "",
                      "content": "***** THIS IS AN AUTOMATED MESSAGE *****\r\n\r\nWe haven't heard back from you for 30 days.  Your ticket has been automatically closed.\r\n\r\nReference: #{{ticket_mask}}\r\nSubject: {{ticket_subject}}\r\n\r\nYou can reply to this message to re-open the ticket.",
                      "headers": "Auto-Submitted: auto-replied",
                      "is_autoreply": "1"
                    }
                  ]
                }
              },
              {
                "type": "action",
                "title": "Close the ticket",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "set_status",
                      "status": "closed"
                    },
                    {
                      "action": "set_reopen_date",
                      "mode": "",
                      "value": "big bang",
                      "calendar_reldate": "",
                      "calendar_id": ""
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

## Importing the second behavior

Click on the **(+)** icon above the behaviors worklist again to add the second new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Switch to **Import** mode and paste the following behavior:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Schedule auto-close check after a worker replies",
    "is_disabled": false,
    "is_private": false,
    "priority": 1,
    "event": {
      "key": "event.mail.after.sent",
      "label": "After sending worker message"
    },
    "configure": [
      {
        "label": "Auto-close Behavior:",
        "path": "behavior.nodes[0].nodes[0].nodes[0].params.actions[0].behavior_id",
        "type": "chooser",
        "params": {
          "context": "cerberusweb.contexts.behavior",
          "query": "event:event.macro.ticket auto-closed",
          "single": true
        }
      }
    ],
    "nodes": [
      {
        "type": "switch",
        "title": "Did the worker set the ticket waiting with no reopen?",
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
                      "condition": "ticket_status",
                      "oper": "in",
                      "values": [
                        "waiting"
                      ]
                    },
                    {
                      "condition": "ticket_reopen_date",
                      "oper": "is",
                      "from": "0",
                      "to": "0"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Schedule auto-close check after 30 days",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_schedule_behavior",
                      "on": "ticket_id",
                      "behavior_id": "0",
                      "run_date": "31 days",
                      "on_dupe": "last"
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

Cerb will prompt you to link the two new behaviors together.

Click on the chooser button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/import-chooser.png" class="screenshot">
</div>

Click anywhere in the row for the **Auto-close an idle waiting ticket** behavior that you imported earlier.

Click the **Save Changes** button again.

# Understanding how the auto-close behavior works

We just imported two behaviors.  They work together to implement the auto-close functionality.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/behaviors.png" class="screenshot">
</div>

**Auto-close an idle waiting ticket** checks if a ticket has been waiting for more than 30 days without a client response. If so, it closes it and sends the client a notification by email.  It's a _custom ticket behavior_, so it only runs when a worker or bot schedules it on a specific ticket record.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/behavior-auto-close.png" class="screenshot">
</div>

**Schedule auto-close check after a worker replies** triggers every time a worker replies to a ticket. If the worker left the ticket in the _waiting_ status without a specific _reopen_ date, the above _custom ticket behavior_ is scheduled on that ticket for 31 days in the future.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/behavior-schedule-check.png" class="screenshot">
</div>

If a worker sends multiple messages before the client responds, we only keep the latest scheduled auto-close check.  In other words, each worker reply resets the 30 day timer.

# Testing the auto-close behavior

Let's test the behavior.

Reply to a ticket and leave it in the _waiting_ status without a date in **When would you like to resume this conversation?**:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/reply-wait.png" class="screenshot">
</div>

At the top of the ticket profile, you'll see a new scheduled behavior:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/behavior-scheduled.png" class="screenshot">
</div>

Click on the behavior's link (**Auto-close an idle waiting ticket**).

Click on the **Simulator** button at the bottom of the popup.

Set **Ticket updated** to `-40 days`.

Click the **Simulate** button.  You should see something like the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-close/simulator.png" class="screenshot">
</div>

This shows that if the current ticket had been in the _waiting_ status for 40 days, the scheduled behavior would automatically close it.

# Retroactively applying the behavior to existing tickets

The new bot will automatically close any idle waiting tickets from this point forward.  If you also want to apply the auto-close behavior to existing waiting tickets that are idle, follow these steps.

Navigate to **Search >> Tickets**.

In the quick search field, type:

<pre>
<code class="language-text">
status:w updated:"big bang to -30 days"
</code>
</pre>

Then press `<ENTER>`.  This will find any tickets with a status of _waiting_ that haven't been updated in more than 30 days.

Click the **bulk update** button below the worklist.

From this point you have two options:

1. Check **Status:** and choose **Closed**. This won't run your new behavior or send email notifications.  It will just close the tickets.

1. In the **Schedule Behavior** section, on the **Behavior:** field, select your new **Auto-close an idle waiting ticket** behavior. In the **When:** field, use `now`.  This will schedule the new behavior on every ticket in the worklist. The recipients will receive the email notification.

After you've selected one of the two above options, click the **Save Changes** button.

<div class="cerb-box note"><p>If you scheduled the behavior, you won't see the ticket status change right away.  Cerb queues scheduled behaviors and runs them in the background.</p></div>

# Next steps

* You could send a warning notification to the client a few days before the ticket is closed.
