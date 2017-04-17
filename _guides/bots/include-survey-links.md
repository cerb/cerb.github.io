---
title: "Include survey links on outgoing messages with bots"
excerpt: Let’s assume that you want to include a survey link at the bottom of each outgoing message to measure customer satisfaction.
layout: integration
topic: Bots
jumbotron:
  title: Include survey links on outgoing messages with bots
  tagline: ""
  breadcrumbs:
  -
    label: Guides &raquo; Bots &raquo;
    url: /guides/#bots
---

* TOC
{:toc}

# Introduction

Let's assume that you want to include a survey link at the bottom of each outgoing worker message to measure customer satisfaction ratings.

In this guide, we'll create a Survey Bot that can add survey links to the bottom of every message. This should enable integration with most popular survey and customer satisfaction tools.

# Creating the behavior

Navigate to **Search >> Bots**.

Click the **(+)** icon above the worklist to add a new bot.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

* **Name:** Survey Bot
* **Owner:** Cerb
* **Status:** Enabled

Click the **Save Changes** button.

Click on the **Survey Bot** link in the yellow notification above the worklist.

Click on the **Behaviors** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/survey-links/bot.png" class="screenshot">
</div>

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
    "title": "Add a #survey command to new replies",
    "is_disabled": false,
    "priority": 50,
    "event": {
      "key": "event.mail.reply.pre.ui.worker",
      "label": "[UI] When starting a reply to a message"
    },
    "nodes": [
      {
        "type": "action",
        "title": "Add a #survey command after #signature",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "exec_jquery",
              "jquery_script": "var $reply = $(this);\r\nvar $form = {\r\n\tfields: $reply.find('form:nth(0)'),\r\n\tactions: $reply.find('form:nth(1)')\r\n};\r\n\r\nvar $textarea_reply = $form.actions.find('textarea[name=content]');\r\nvar txt = $textarea_reply.val();\r\n\r\nif(-1 == txt.indexOf('#survey')) {\r\n  var find = \"#signature\";\r\n  var pos = txt.indexOf(find);\r\n  \r\n  $textarea_reply.setCursorLocation(pos + find.length);\r\n  $textarea_reply.insertAtCursor(\"\\n#survey\");\r\n  $textarea_reply.setCursorLocation(0);\r\n}"
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

Click the **(+)** icon above the worklist to add another new behavior.

Select the **Import** option and paste the following behavior:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Replace #survey with a signature link",
    "is_disabled": false,
    "priority": 50,
    "event": {
      "key": "event.mail.before.sent",
      "label": "Before sending worker message"
    },
    "nodes": [
      {
        "type": "action",
        "title": "Add survey link to the outgoing message",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "replace_content",
              "replace": "#survey",
              "with": "How did I do?  https:\/\/example.com\/survey\/{{ticket_mask}}\/{{worker_at_mention_name}}"
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

# Understanding how the behaviors work

When a worker starts a new reply, the **Add a #survey command to new replies** behavior inserts a `#survey` token directly below their `#signature`. The survey token won't be added twice if the message is saved as a draft and later resumed.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/survey-links/reply-token.png" class="screenshot">
</div>

After the worker sends the message, but before Cerb delivers it, the **Replace #survey with a signature link** behavior replaces the `#survey` token with a signature link. This can use placeholders for the message, ticket, and current worker.  It can even make requests to external APIs if you need to create the personalized survey in advance.

You can edit the action in this behavior to generate links for your specific survey software.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/survey-links/action.png" class="screenshot">
</div>

In the example, we generate a link in the format of:

~~~
{% raw %}
https://example.com/survey/{{ticket_mask}}/{{worker_at_mention_name}}
{% endraw %}
~~~

This results in something like:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/survey-links/reply-with-link.png" class="screenshot">
</div>

# Some tips on implementation

* If your survey software has different aliases for your workers, you can store those in a custom field on worker records and insert them into the generated links using placeholders.  We used their @mention name in the example.

* Cerb doesn't currently track customer satisfaction scores (it's in the works). In the meantime, you can use something like [Nicereply](http://help.nicereply.com/article/66-setup-integration-with-almost-any-help-desk-system).

* You can limit survey links to specific kinds of messages. Add conditions to the **Add a #survey command to new replies** behavior to filter by group/bucket, worker, client, etc.  Move the action so that the `#survey` token is only added when those conditions are met.

* You can modify this bot to conditionally insert different tags like `#survey-sales` and `#survey-support`. This also allows different groups to use different customer satisfaction tools.

* An alternative to adding a survey link to every outgoing message is to have a bot send a single survey link when a ticket is closed.