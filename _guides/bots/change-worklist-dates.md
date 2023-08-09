---
title: "Change how dates are displayed in worklists using bots"
excerpt: "This guide demonstrates how to modify the style and content of worklists using bot behaviors."
layout: integration
topic: Bots
subtopic: UI Customization
jumbotron:
  title: Change how dates are displayed in worklists using bots
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

By default, dates in [worklists](/docs/worklists/) throughout Cerb are shown in a _relative_ format.  This means that you see something like `5 mins ago` (relative to the current time) instead of an _absolute_ date like `{{ site.time | date: '%A, %B %d %Y %l:%M%P %Z'}}`.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/worklist-dates/dates_pretty.png" class="screenshot">
</div>

You can hover over relative dates to see the absolute date in your local timezone.  In some environments it's desirable to always see absolute dates in the worklist instead.

In this example we'll build a simple bot behavior to change how [ticket](/docs/tickets/) worklists display the created and updated dates. This approach allows worklists to change depending on what is being displayed or who is viewing it.

# Importing the behavior

From **Search >> Bots**, create a new bot or choose an existing one.  The bot should be able to create new behaviors on the **[UI] While displaying a worklist** event.

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
    "title": "Change worklist dates from relative to absolute",
    "is_disabled": false,
    "is_private": false,
    "priority": 50,
    "event": {
      "key": "event.ui.worklist.render.worker",
      "label": "[UI] While displaying a worklist"
    },
    "nodes": [
      {
        "type": "switch",
        "title": "Is it a ticket worklist?",
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
                      "condition": "context",
                      "oper": "in",
                      "values": [
                        "cerberusweb.contexts.ticket"
                      ]
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Change relative dates to absolute using jQuery",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "exec_jquery",
                      "jquery_script": "var view_id = '{{view_id}}';\r\nvar $view = $('#view' + view_id);\r\nvar $worklist = $view.find('TABLE.worklist');\r\nvar $worklist_rows = $view.find('TABLE.worklistBody');\r\n\r\n$worklist_rows\r\n  .find('td[data-column=t_created_date], td[data-column=t_updated_date]')\r\n  .find('abbr')\r\n  .each(function() {\r\n  var $abbr = $(this);\r\n\r\n  \/\/ Swap the absolute and relative dates in the abbr tag\r\n  var abs = $abbr.attr('title');\r\n  var rel = $abbr.text();\r\n  $abbr.attr('title', rel).text(abs);\r\n  })\r\n;\r\n"
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

# Testing the behavior on a worklist

Navigate to any ticket worklist. For instance, **Search >> Tickets**.

You should now see absolute dates, with relative dates in the tooltip:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/worklist-dates/dates_absolute.png" class="screenshot">
</div>

You'll also see an indication on the worklist that it was modified by a bot behavior:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/worklist-dates/bot_modified.png" class="screenshot">
</div>

# Understanding how the behavior works

The behavior's decision tree is pretty simple to follow:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/worklist-dates/behavior.png" class="screenshot">
</div>

First, a decision checks whether the current worklist is showing tickets. If the outcome is **Yes**, then we run one action.

That action executes a jQuery[^jquery] script in the current worker's browser:

<pre>
<code class="language-javascript line-numbers">
{% raw %}
var view_id = '{{view_id}}';
var $view = $('#view' + view_id);
var $worklist = $view.find('TABLE.worklist');
var $worklist_rows = $view.find('TABLE.worklistBody');

$worklist_rows
  .find('td[data-column=t_created_date], td[data-column=t_updated_date]')
  .find('abbr')
  .each(function() {
    var $abbr = $(this);
    
    // Swap the absolute and relative dates in the abbr tag
    var abs = $abbr.attr('title');
    var rel = $abbr.text();
    $abbr.attr('title', rel).text(abs);
  })
;
{% endraw %}
</code>
</pre>

Lines `1-4` sets variables with references to certain elements in the DOM[^dom].

Line `6` uses the `$worklist_rows` variable to access the rows of the worklist table.

Lines `7-8` finds column cells for specific fields (`t_created_date` and `t_updated_date`) and then locates the `<abbr>` element within them.
	
Line `9` loops through each of the located abbreviation elements.

Line `10` creates an `$abbr` variable to reference the current abbreviation element.

Lines `13-15` swaps the `title` attribute (tooltip) of the abbreviation element with its displayed text content.

That's it!  jQuery makes it really easy to find and modify elements on a web page from a bot.

# References

[^dom]: Wikipedia: Document Object Model - <https://en.wikipedia.org/wiki/Document_Object_Model>
[^jquery]: jQuery - <https://jquery.com>