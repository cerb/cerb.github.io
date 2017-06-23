---
title: "Break out of a loop in a bot behavior"
excerpt: When certain conditions are met, you may need to immediately stop looping through a collection in a bot behavior. Here's how to accomplish that.
layout: integration
topic: Bots
jumbotron:
  title: Break out of a loop in a bot behavior
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

[Loops](/docs/bots/#loops) are an incredibly useful feature in [bot behaviors](/docs/bots/).

For instance, you can retrieve a list of tweets from the Twitter API using a [connected account](/docs/connected-accounts/) and loop through each tweet for additional processing.  You can do the same thing with any collection of objects.

There are certain situations where you'll want to stop looping through a collection early when certain conditions are met.  Maybe you're only looking for the first match.  Maybe you need to stop a process as soon as the first error occurs.

Most programming languages provide a way to `break` out of a loop in these situations.

Here's a way you can accomplish the same thing in a Cerb behavior.

# Importing the sample behavior

First, let's import a simple example.

Navigate to **Search >> Bots**.

Select an existing bot or create a new one.  The bot should be able to create behaviors on the **Custom bot behavior** event.

Open the bot's [card](/docs/records/#cards) from the [worklist](/docs/workspaces/#worklists).

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
    "title": "Example loop behavior",
    "is_disabled": false,
    "is_private": false,
    "priority": 50,
    "event": {
      "key": "event.macro.bot",
      "label": "Custom bot behavior"
    },
    "nodes": [
      {
        "type": "loop",
        "title": "Loop 50 times",
        "status": "live",
        "params": {
          "foreach_json": "{{range(1,50)|json_encode}}",
          "as_placeholder": "attempts"
        },
        "nodes": [
          {
            "type": "action",
            "title": "Roll a six-sided die",
            "status": "live",
            "params": {
              "actions": [
                {
                  "action": "_set_custom_var",
                  "value": "{{random(5)+1}}",
                  "format": "",
                  "is_simulator_only": "0",
                  "var": "roll"
                }
              ]
            }
          },
          {
            "type": "switch",
            "title": "Did we roll a 6?",
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
                          "condition": "_custom_script",
                          "tpl": "{{roll}}",
                          "oper": "is",
                          "value": "6"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "Stop looping",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "[]",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "attempts__stack"
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
<img src="/assets/images/guides/bots/break-loops/behavior.png" class="screenshot">
</div>

This behavior rolls a six-sided die 50 times.  It stops looping early when it rolls a 6.

In the loop node, we're simply creating a JSON array with 50 elements sequentially numbered `[1,2,3,...,50]`. We use the `range()` function to create the array and then we use the `|json_encode` filter.  We call our loop variable `attempts`.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/break-loops/behavior-loop.png" class="screenshot">
</div>

In the roll action, we set a custom placeholder named `roll` with a random value between 1 and 6 (inclusive).  Since the `random()` function returns an inclusive value between 0 and the given number (5), we add one to the result.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/break-loops/behavior-action-roll.png" class="screenshot">
</div>

In the following decision, the **Yes** outcome just checks if the value of `roll` is `6`.  Otherwise we continue looping.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/break-loops/behavior-outcome-yes.png" class="screenshot">
</div>

The **Stop looping** action is where we use an undocumented trick to stop the loop early.  Each loop variable also creates a second variable with the suffix `__stack` that contains the remaining items to loop through.  Each iteration through the loop pops off the first element and the loop continues until the stack is empty.

We called our loop variable `attempts`, so our stack is at `attempts__stack`.  Using a **Set custom placeholder**, we can change the contents of the stack in the middle of a loop.  In this case, we're emptying the stack by replacing it with a value of `[]` (an empty JSON array).

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/break-loops/behavior-action-break.png" class="screenshot">
</div>

# Testing the behavior

At the top of the decision tree on the behavior's card, click on **Custom bot behavior**.  Select **Simulate Behavior** from the menu.

On the simulator popup, click the **Simulate** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/break-loops/behavior-simulator.png" class="screenshot">
</div>

In the above image, the behavior only looped four times before it rolled a six and stopped early.

You can click the **Simulate** button multiple times to run a new simulation and see the loop stop at different points.

This is a simplified example, but you can use the concepts you learned here to make your loop behaviors much more advanced.