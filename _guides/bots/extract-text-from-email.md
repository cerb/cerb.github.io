---
title: "Extract text from email messages using bots"
layout: integration
topic: Bots
jumbotron:
  title: Extract text from email messages using bots
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

Let's assume that you have a web-based form that emails you every time someone submits it.  You want to extract the values from the message and use them in bot behaviors to automatically set custom fields, personalize auto-replies, fulfill new orders, etc.

The responses in your mailbox look something like:

<pre>
<code class="language-text">
Org: Kataflow Neural Implants, Inc.
Email: team@kataflow.example
Color: Robotic Gray
</code>
</pre>

A simple [bot](/docs/bots/) behavior can parse that message and copy each value into a new [placeholder](/docs/bots/#dictionaries). From there you can do almost anything.

# Building the behavior

When building a bot behavior like this, it's helpful to add an action node to the top of the behavior and set its status to _Simulator only_. That way you can override some placeholders during testing without having to find or create a record with the exact content you're looking for.

In this case, we want to replace the value of the `{%raw%}{{content}}{%endraw%}` placeholder in the simulator with a sample form submission:

<div class="cerb-screenshot">
<img src="/assets/images/tips/extract-text-from-email-with-bots/bot-action-setup.png" class="screenshot">
</div>

We'll now always see that message content in the simulator, no matter which target message we test against.  When the behavior is running against live messages it will use the actual message content.

Now a second action node can extract the form values into placeholders using a regular expression[^regexp] filter:

<div class="cerb-screenshot">
<img src="/assets/images/tips/extract-text-from-email-with-bots/bot-action-regexp.png" class="screenshot">
</div>

# Understanding regular expressions

Let's break down this script real quick to understand what it's doing:

<pre>
<code class="language-twig">
{% raw %}
{{content|regexp('#^Org\:(.*?)$#m', 1)}}
{% endraw %}
</code>
</pre>

We're taking the value of the `content` placeholder and applying a `|regexp` filter to it. That filter expects its first argument to be a regular expression pattern, and the optional second argument is a specific capture group to return (opposed to all matches as an array).

In the first argument, we're giving the pattern `#^Org\:(.*?)$#m`:

* `#` is the pattern delimiter, in the format of `#<pattern>#<flags>`.
* `^Org\:` matches text that starts with `Org:`. We're escaping `:`, even though it's not technically necessary.
* `(.*?)` is a "non-greedy" capture group for **any** text after the last match and before the next one. Capture groups are defined with parentheses and you can have many of them. They can also be nested like `((\d)-(\w+))`, in which case they're numbered from the left-most opening parenthesis `(`.  In the previous example, the entire pattern is the first capture group, `(\d)` is the second group, and `(\w+)` is the third group.
* `$` stops matching the capture group when we reach the end of the text.
* `#m` ends the pattern and specifies the `m` flag for line-based matching. This changes the behavior of `^` and `$` so that they match the beginning and end of _lines_, instead of the entire message. That way we don't care what order the lines are in, if they have extra whitespace, etc.

In the second argument, we're asking for the value of capture group `1`, which was `(.*?)` -- everything after `Org:` and before the end of the line `$`.

We save that output to a placeholder named `form_org`.  Then we can do the same thing for any other form fields.

# Running the behavior

This is what the simulator looks like in action:

<div class="cerb-screenshot">
<img src="/assets/images/tips/extract-text-from-email-with-bots/bot-action-simulator.png" class="screenshot">
</div>

# Example

Here's a full example behavior that you can import on any bot and customize to meet your needs:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Extract text from an email-based form",
    "is_disabled": false,
    "is_private": false,
    "priority": 50,
    "event": {
      "key": "event.macro.message",
      "label": "Custom message behavior"
    },
    "nodes": [
      {
        "type": "action",
        "title": "Set simulator values",
        "status": "simulator",
        "params": {
          "actions": [
            {
              "action": "_set_custom_var",
              "value": "Org: Kataflow Neural Implants, Inc.\r\nEmail: team@kataflow.example\r\nColor: Robotic Gray\r\n",
              "format": "",
              "is_simulator_only": "0",
              "var": "content"
            }
          ]
        }
      },
      {
        "type": "action",
        "title": "Extract values",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "_set_custom_var",
              "value": "{{content|regexp('#^Org\\:(.*?)$#m', 1)}}",
              "format": "",
              "is_simulator_only": "0",
              "var": "form_org"
            },
            {
              "action": "_set_custom_var",
              "value": "{{content|regexp('#^Email\\:(.*?)$#m', 1)}}",
              "format": "",
              "is_simulator_only": "0",
              "var": "form_email"
            },
            {
              "action": "_set_custom_var",
              "value": "{{content|regexp('#^Color\\:(.*?)$#m', 1)}}",
              "format": "",
              "is_simulator_only": "0",
              "var": "form_color"
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

# References

[^regexp]: Wikipedia: Regular Expressions - <https://en.wikipedia.org/wiki/Regular_expression>
