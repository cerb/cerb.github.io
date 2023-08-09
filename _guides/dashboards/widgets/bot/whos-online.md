---
title: Display currently active workers as a dashboard widget
excerpt: A step-by-step guide for reproducing the old Who's Online functionality using dashboard widgets.
permalink: /guides/dashboards/widgets/bot/whos-online/
layout: integration
topic: Dashboards
subtopic: Bot-powered Widgets
jumbotron:
  title: Display currently active workers as a dashboard widget
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Dashboards &raquo;
    url: /resources/guides/#dashboards
  -
    label: Bot-powered Widgets &raquo;
    url: /resources/guides/#dashboards-bot-powered-widgets
---

# Introduction

Historically, Cerb displayed a list of currently active workers at the bottom of every workspace page. There was no way to customize, move, copy, or disable this content.

This built-in feature was removed in [9.1.4](/releases/9.1.4/) in favor of dashboard widgets, which are completely customizable.

In the simplest implementation, the "Who's Online" widget is just a worker worklist with a filter like:

<pre>
<code class="language-text">
lastActivity:"-30 minutes" sort:firstName,lastName
</code>
</pre>

The exact style of the original feature can be reproduced with a bot-powered dashboard widget.

We've provided a complete example below.

# Import the bot package

The following [package](/docs/packages/) includes a "Who's Online" bot with a "Dashboard render widget" behavior.

Follow [these instructions](/guides/packages/importing/#setup) to import it.

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Who's Online Bot",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.5",
      "plugins": [

      ]
    },
    "configure": {
      "placeholders": [

      ],
      "prompts": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_whos_online",
      "name": "Who's Online Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": null,
        "events": {
          "mode": "allow",
          "items": [
            "event.dashboard.widget.render"
          ]
        },
        "actions": {
          "mode": "all",
          "items": [

          ]
        }
      },
      "image": null,
      "behaviors": [
        {
          "uid": "behavior_render_widget",
          "title": "Render: Currently active workers",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.render",
            "label": "Dashboard render widget"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Load currently active workers",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.bot.action.record.search",
                    "context": "worker",
                    "query": "lastActivity:\"-30 minutes\" isDisabled:n sort:firstName,lastName limit:500",
                    "expand": "",
                    "object_placeholder": "_workers"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Render",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "render_html",
                    "html": "&lt;div id=\"widget{{widget_id}}ActiveWorkers\"&gt;\r\n{% for worker in _workers %}\r\n&lt;span style=\"margin-right:5px;\"&gt;\r\n&lt;span style=\"text-decoration:underline;font-weight:bold;cursor:pointer;\" class=\"cerb-peek-trigger\" data-context=\"worker\" data-context-id=\"{{worker.id}}\"&gt;{{worker._label}}&lt;/span&gt; {% if worker.title %} ({{worker.title}}){% endif %}\r\n&lt;/span&gt;\r\n{% endfor %}\r\n&lt;/div&gt;\r\n\r\n&lt;script type=\"text/javascript\"&gt;\r\n$(function() {\r\n\tvar $div = $('#widget{{widget_id}}ActiveWorkers');\r\n\t$div.find('.cerb-peek-trigger').cerbPeekTrigger();\r\n});\r\n&lt;/script&gt;"
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
{% endraw %}
</code>
</pre>

You should see the following created records:

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/bot-widgets/whos-online/import-package.png" class="screenshot">
</div>

# Create a dashboard widget

You can now display the _"Currently active workers"_ widget on any [dashboard](/docs/dashboards/).

1. Navigate to an existing dashboard, or create one by adding a tab to an existing workspace page.

1. Click the **(+) Add Widget** button at the top.

1. Select the **Build** option at the top.

1. Use the following details:

	|---
	| Field | Value | 
	|-|-|-
	|Name:|`Currently Active Workers`|
	|Type:|**Bot Custom Widget**|
	|Behavior:|**Render: Currently active workers**
	
1. Click the **Save Changes** button.

You should now see a list of the workers who have been active within the past 30 minutes. Clicking on a worker's name will open their [card](/docs/cards/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/bot-widgets/whos-online/whos-online-widget.png" class="screenshot">
</div>

You can customize the widget's output by editing the **Render: Currently active workers** behavior on **Who's Online Bot**.