---
title: "Send automatic replies from bots"
excerpt: Bots can send personalized automatic responses to clients. They can even predict the sender's intent and offer suggestions before you've read the message.
layout: integration
topic: Bots
subtopic: Mail
jumbotron:
  title: Send automatic replies from bots
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

It's a common practice in professional environments to send an automatic response to new messages. This acknowledges that you received them, and it lets you set expectations up front about office hours and response times. You can note the obligations of a service level agreement if the client has one, and if they don't you can briefly make the case for purchasing one.

Most email management applications support automatic responses in some form.  The simplest feature just responds with a fixed message like _"Thanks for your message. We'll respond soon."_ or _"I'm out of the office this week and will return next Monday"_.  Sophisticated implementations, like Cerb, can send highly personalized automatic responses by considering everything you know about the client and their organization, their history, your team's schedules, your current workload, etc. Bots can even predict a client's intent and send them suggestions before you've even read their message.

In this example, we'll create a behavior that sends an automatic response for every incoming email message that opens a new conversation.  In other words, when a customer replies to an existing conversation it won't result in them receiving another automated confirmation message.  Our behavior will also attempt to detect when the sender is also automated (including out of office and vacation auto-responders), and avoid sending them a confirmation.  Finally, we'll cover a few advanced topics like sending different responses (based on day, time, SLA, group), detecting intent, and sending rich messages with images and graphical layouts.

<div class="cerb-box note">
	<p>
		In Cerb 8.0+ you can <a href="/packages/auto-reply-bot">import the Auto-Reply Bot package</a> instead.
	</p>
</div>

# Creating the behavior

From **Search >> Bots**, create a new bot or choose an existing one.

If your bot is owned by Cerb then it will react to all new messages in every group by default using the **Message added to conversation** event. You can use decisions and outcomes to send a different message in various situations (e.g. different groups, SLA plans, office hours).

You can also create a group-owned bot that reacts to only new messages within that group. We won't be covering that in this article; but the concepts are the same, and you would use the **Message added to group conversation** event instead.

Open the bot's card and click on the **Behaviors** button.

Click the **(+)** icon above the worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Select the **Import** option and paste the following behavior:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Send automatic reply",
    "is_disabled": false,
    "is_private": false,
    "priority": 50,
    "event": {
      "key": "event.mail.received",
      "label": "Message added to a conversation"
    },
    "nodes": [
      {
        "type": "switch",
        "title": "First incoming message?",
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
                      "condition": "is_first",
                      "bool": "1"
                    },
                    {
                      "condition": "is_outgoing",
                      "bool": "0"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "switch",
                "title": "Is it an automated message?",
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
                              "condition": "headers",
                              "header": "Auto-Submitted",
                              "oper": "!is",
                              "value": ""
                            },
                            {
                              "condition": "headers",
                              "header": "Auto-Submitted",
                              "oper": "!is",
                              "value": "no"
                            }
                          ]
                        }
                      ]
                    },
                    "nodes": [
                      {
                        "type": "action",
                        "title": "Ignore it and exit",
                        "status": "live",
                        "params": {
                          "actions": [
                            {
                              "action": "_exit",
                              "mode": ""
                            }
                          ]
                        }
                      }
                    ]
                  },
                  {
                    "type": "outcome",
                    "title": "No",
                    "status": "live",
                    "params": {
                      "groups": [
                        {
                          "any": 0,
                          "conditions": []
                        }
                      ]
                    },
                    "nodes": [
                      {
                        "type": "action",
                        "title": "Respond with a confirmation message",
                        "status": "live",
                        "params": {
                          "actions": [
                            {
                              "action": "send_email",
                              "from_address_id": "0",
                              "to": "{{sender_address}}",
                              "subject": "Received: {{ticket_subject}} [#{{ticket_mask}}]",
                              "html_template_id": "",
                              "format": "",
                              "content": "***** THIS IS AN AUTOMATED MESSAGE *****\r\n\r\n{% if sender_contact_first_name %}\r\nHi {{sender_contact_first_name}},\r\n\r\n{% endif %}\r\nThis is a confirmation that we have received your message.\r\n\r\nReference #: {{ticket_mask}}\r\nSubject: {{ticket_subject}}\r\n\r\nWe'll respond as soon as possible.\r\n\r\nThanks for contacting us!\r\n\r\n - Support\r\n",
                              "headers": "Auto-Submitted: auto-replied"
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

If you open the new behavior's [card](/docs/cards/), you'll see the following decision tree:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-replies/autoreply-behavior.png" class="screenshot">
</div>

First, a decision checks if the message is opening a new conversation.  If the outcome is **Yes** then the behavior continues, otherwise is ends.

Next, a second decision checks if the current message is from an automated sender.  If the outcome is **Yes** then the behavior does nothing and exits early.

If the message opens a new conversation and isn't from from an automated sender, then an automatic response is sent back to them.

You can edit the various nodes to see how they work.  The most important one is the final action that sends the automatic response:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/auto-replies/autoreply-action.png" class="screenshot">
</div>

You'll notice that [placeholders](/docs/bots/#dictionaries) are being used to personalize the response.

In the **To:** field we use {% raw %}`{{sender_address}}`{% endraw %} to fill in the client's email address.

In the **Subject:** field, we include the {% raw %}`{{ticket_subject}}`{% endraw %} and {% raw %}`{{ticket_mask}}`{% endraw %} to repeat their subject back to them along with the reference number.  The reference number is useful when the client contacts you again from a different channel about the same issue (phone, Twitter, etc).  You can simply ask them for the first few characters to quickly locate the issue.

The **Content:** field is the body of the email message.  We use several placeholders here.  {% raw %}`{{sender_contact_first_name}}`{% endraw %} addresses a known contact by name.  If we don't know their name then that text isn't included.  We also include the email subject and reference number again.

This example sends a generic message.  You should personalize it to include your company name and any other pertinent details (office hours, response time commitment, link to your site, etc).

Finally, in **Custom Headers:** we add an `Auto-Submitted: auto-replied` header to tell the recipient that a bot sent the message.

We're using the **Send email** action here.  It's worth noting that you could use a different action to send email, like **Send email to recipients**. That action would automatically reply to everyone in the conversation, which may include other `To:` and `Cc:` recipients. It also gives you the option of retaining the auto-reply as part of the conversation history. Neither of those options are very common, so we used the simpler action in the example.

# Improving the detection of automated senders

See the guide on [detecting automated messages](/guides/bots/detect-automated-messages/) for a more sophisticated way to avoid automated responses to those senders.

# Sending messages on company letterhead

See the guide on [using mail templates](/guides/mail/html-templates/) to send automated messages with images and fancy layouts.
