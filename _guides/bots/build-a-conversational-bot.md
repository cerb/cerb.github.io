---
title: Build a conversational bot behavior
layout: integration
topic: Bots
permalink: /guides/bots/conversational-bots/
jumbotron:
  title: Build a conversational bot behavior
  tagline: ""
  breadcrumbs:
  -
    label: Guides &raquo; Bots &raquo;
    url: /guides/#bots
---

<iframe width="720" height="405" src="https://www.youtube.com/embed/p0zgNT-tEYU" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

# Introduction
{:.no_toc}

In this guide you'll learn how to create conversational chat [bots](/docs/bots/) in Cerb.  Conversational computing[^chatbot] is a shift toward talking with software using natural language in order to retrieve information and accomplish tasks, rather than pointing and clicking through complex graphical user interfaces.

For instance, these are the steps that have been required to perform a simple search in Cerb (and it's not much different for most other apps):

1. Open your web browser
1. Navigate to a specific URL
1. Move your mouse to a menu and click it
1. Click on a link in the menu
1. Move the cursor to a text box somewhere and click it
1. Type some text to search for
1. Add some filters (much more reading, clicking, and typing)
1. Click a button to start the search
1. Get some results back (finally)
1. Sort, subtotal, and/or paginate the results

That's a very mechanical process -- and you probably do it at least a few dozen times per day.

With conversational computing, you could simply say (or type):

`find open tickets from Ghoux Games since last Monday`

Your chat bot says, _"Here's what I found"_, and a [worklist](/docs/workspaces/#worklists) instantly popups up with exactly what you're looking for. 

A few years ago that would have still been in the realm of science fiction.  Today you probably already converse with virtual personal assistants[^ipa] like Alexa, Siri, Cortana, or Google Assistant.

Conversational bots in Cerb provide you with the same conveniences as those assistants, but with the complete freedom to build new behaviors and add new abilities, to integrate with other services, and to take advantage of all the data you already have in Cerb.  Our bots know who you and your clients are, contact information and organizational relationships, the conversations you've had, open tasks, unread notifications, and so on.

You may have already automated many of your business processes using Cerb bot behaviors.  Let's explore how conversational behaviors can save your workers even more time.

{% comment %}
are you sure? confirmation
{% endcomment %}

* TOC
{:toc}

# Log into Cerb

Log into your Cerb instance.  If you don't have one yet, you can [start a free trial](/cloud/try/).

# Create a new bot

Open the [search menu](/docs/navigation/#search) and select **Bots**.

Click the **(+)** icon above the worklist to add a new bot.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following details:

- **Name:** Cerb
- **Owner:** Cerb
- **Status:** Enabled
- **Image:** {{ "/assets/cerb_mascot.png" | prepend: site.url }}
- **@Mention:** cerb
- **Events:** _Allow all_
- **Action Extensions:** _Allow all_

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-create.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Create an intent classifier

The bot can use a [classifier](/docs/classifiers/) to figure out what the user is trying to accomplish (their _"intent"_).

Since classifiers aren't the focus of this guide, we'll be quickly moving through this section.  For a detailed tutorial on classifiers, read the [Build a yes/no classifier](/guides/classifiers/yes-no/) guide.

Click on _Cerb_ in the yellow notification above the worklist to open our new bot's [card](/docs/records/#cards).

Click the **Classifiers** button on the card.

Click the **(+)** icon above the worklist to add a new classifier.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following:

- **Name:** `Detect Intent`
- **Owner:** Bot >> Cerb

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-classifier-card.png" class="screenshot">
</div>

Click the **Save Changes** button.

In the yellow notification above the classifier search worklist, click on **Detect Intent** to open its card.

Click the **Import** button at the top of the card.

Paste the following training data into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-text">
{% raw %}
ask.help,"Can you help me?"
ask.help,"How does this work?"
ask.help,"I don't understand"
ask.help,"I need help"
ask.help,"I'm confused"
ask.help,"I'm having trouble"
ask.help,"I'm in need of help"
ask.help,"I'm lost"
ask.help,"What can I say?"
ask.help,"You lost me"
ask.help,"a little help, please?"
ask.help,"what can you do?"
ask.help,"what kinds of things can you do?"
ask.help,help
ask.time,"the time?"
ask.time,"time right now?"
ask.time,"time"
ask.time,"what time is it right now?"
ask.time,"what time is it?"
ask.time,"what's the clock say?"
ask.time,"what's the hour?"
ask.time,"what's the time?"
say.hello,"good afternoon"
say.hello,"good evening"
say.hello,"good morning"
say.hello,"hello there"
say.hello,"hey there"
say.hello,"hi hi"
say.hello,"hi there"
say.hello,"hi there"
say.hello,"how's it going?"
say.hello,"what's up?"
say.hello,allo
say.hello,hallo
say.hello,hello
say.hello,hello
say.hello,hello
say.hello,hey
say.hello,heya
say.hello,heya
say.hello,heya
say.hello,heya
say.hello,hi
say.hello,hi
say.hello,hi
say.hello,hiya
say.hello,hiya
say.hello,hola
say.hello,hola
say.hello,howdy
say.hello,howdy
say.hello,howdy
say.hello,sup
say.hello,yo
worklist.search,"show {{worker:Milo}}'s {{status:open}} {{context:tickets}} from {{org:Dobbus}} {{date:since last week}}"
worklist.search,"show {{worker:Janey}}'s {{status:open}} {{context:tickets}} from {{org:Twinton University}}"
worklist.search,"show {{worker:Ned}}'s {{status:waiting}} {{context:tickets}}"
worklist.search,"open {{worker:my}} {{context:notifications}}"
worklist.search,"display {{worker:my}} {{context:notifications}} for {{date:today}}"
worklist.search,"what are {{worker:my}} {{context:notifications}}?"
worklist.search,"list {{worker:my}} {{context:notifications}}"
worklist.search,"show me {{worker:my}} {{context:notifications}} {{date:since last week}}"
worklist.search,"show {{worker:my}} {{context:notifications}}"
worklist.search,"show {{context:notifications}}"
worklist.search,"show {{context:tickets}} from {{org:Ghoux Games}} {{date:since last month}}"
worklist.search,"show {{context:messages}} from {{contact:Giada at Fiaflux}} {{date:in the past 30 days}}"
worklist.search,"open {{context:messages}} from {{org:Ines Lacroix}} {{date:in the past 30 days}}"
worklist.search,"open {{worker:my}} {{status:unread}} {{context:tasks}}"
worklist.search,"display {{worker:my}} {{context:tasks}}"
worklist.search,"what are {{worker:my}} {{context:tasks}} for {{org:Zhang}}?"
worklist.search,"what are {{worker:my}} {{context:tasks}}?"
worklist.search,"show {{worker:Kina}}'s {{context:tickets}} {{date:from March 2016}}"
worklist.search,"show {{worker:Karl}}'s {{context:messages}} {{date:since last Monday}}"
worklist.search,"show {{worker:Mara}}'s {{status:unread}} {{context:notifications}}"
worklist.search,"show {{org:Nechist}}'s {{context:tickets}} from {{date:this week}}"
worklist.search,"list {{worker:my}} {{context:tasks}}"
worklist.search,"show {{worker:my}} {{context:tasks}}"
worklist.search,"show {{worker:my}} {{status:incomplete}} {{context:tasks}}"
worklist.search,"show {{context:tasks}}"
worklist.search,"show {{date:last month}}'s {{context:tickets}}"
worklist.search,"show {{date:last week}}'s {{context:tasks}}"
{% endraw %}
</code>
</pre>

Click the **Import** button.

You should now see **4** classifications and **81** examples.

Type the following messages into the **Train Classifier** text box:

- `I need some help`
- `howdy`
- `what time is it?`
- `find my open tickets`
- `yo`
- `I'm lost`

You'll see that we're currently detecting four intents:

- ask.help
- ask.time
- say.hello
- worklist.search

Now let's create a bot behavior to respond to these intents.

# Import the behavior

Click **Cerb** below **Owner** in the **Properties** section of the classifier card.

Click the **Behaviors** button on the bot card.

Click the **(+)** icon above the worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Switch to **Import** mode at the top of the editor popup.

Paste the following behavior JSON into the large text box:

<pre style="max-height:29.25em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
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
        "label": "Intent Classifier:",
        "path": "behavior.nodes[0].params.actions[0].classifier_id",
        "type": "chooser",
        "params": {
          "context": "cerberusweb.contexts.classifier",
          "query": "\"Detect Intent\"",
          "single": true
        }
      }
    ],
    "nodes": [
      {
        "type": "action",
        "title": "Detect intent from chat message with a classifier",
        "status": "live",
        "params": {
          "actions": [
            {
              "action": "core.va.action.classifier_prediction",
              "classifier_id": "0",
              "content": "{{message}}",
              "object_placeholder": "_prediction"
            }
          ]
        }
      },
      {
        "type": "switch",
        "title": "Intent:",
        "status": "live",
        "nodes": [
          {
            "type": "outcome",
            "title": "(new conversation)",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "message",
                      "oper": "is",
                      "value": ""
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Respond: Welcome",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_set_custom_var",
                      "value": "Hi, {{worker_first_name}}. Say **help** for a list of things I can help you with.",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "say"
                    },
                    {
                      "action": "_run_subroutine",
                      "subroutine": "say()"
                    }
                  ]
                }
              }
            ]
          },
          {
            "type": "outcome",
            "title": "say.hello",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "_custom_script",
                      "tpl": "{{_prediction.classification.name}}",
                      "oper": "is",
                      "value": "say.hello"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Respond: Hello!",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_set_custom_var",
                      "value": "{% set r = [\r\n\"Hello \" ~ worker_first_name,\r\n\"Hi, \" ~ worker_first_name,\r\n\"Hi \" ~ worker_first_name,\r\n\"Howdy \" ~ worker_first_name,\r\n\"Hi there \" ~ worker_first_name,\r\n\"hey \" ~ worker_first_name,\r\n] %}\r\n{{random(r)}}",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "say"
                    },
                    {
                      "action": "_run_subroutine",
                      "subroutine": "say()"
                    }
                  ]
                }
              }
            ]
          },
          {
            "type": "outcome",
            "title": "ask.help",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "_custom_script",
                      "tpl": "{{_prediction.classification.name}}",
                      "oper": "is",
                      "value": "ask.help"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Respond: Help",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_set_custom_var",
                      "value": "Try one of these: \r\n- help\r\n- hi\r\n- What time is it?\r\n- find my open tickets\r\n- show waiting tickets from Jan 2015 to now\r\n- find Mara's messages from this year\r\n- search my open tasks\r\n- show my new notifications",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "say"
                    },
                    {
                      "action": "_run_subroutine",
                      "subroutine": "say()"
                    }
                  ]
                }
              }
            ]
          },
          {
            "type": "outcome",
            "title": "ask.time",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "_custom_script",
                      "tpl": "{{_prediction.classification.name}}",
                      "oper": "is",
                      "value": "ask.time"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Respond: The time is...",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_set_custom_var",
                      "value": "{% set r = [\r\n\"It's \" ~ 'now'|date('g:i a'),\r\n\"The time is \" ~ 'now'|date('g:i a'),\r\n'now'|date('g:i a'),\r\n] %}\r\n{{random(r)}}",
                      "format": "",
                      "is_simulator_only": "0",
                      "var": "say"
                    },
                    {
                      "action": "_run_subroutine",
                      "subroutine": "say()"
                    }
                  ]
                }
              }
            ]
          },
          {
            "type": "outcome",
            "title": "worklist.search",
            "status": "live",
            "params": {
              "groups": [
                {
                  "any": 0,
                  "conditions": [
                    {
                      "condition": "_custom_script",
                      "tpl": "{{_prediction.classification.name}}",
                      "oper": "is",
                      "value": "worklist.search"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "worklistSearch()",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "_run_subroutine",
                      "subroutine": "worklistSearch()"
                    }
                  ]
                }
              }
            ]
          }
        ]
      },
      {
        "type": "subroutine",
        "title": "say()",
        "status": "live",
        "nodes": [
          {
            "type": "action",
            "title": "Respond in text",
            "status": "live",
            "params": {
              "actions": [
                {
                  "action": "send_message",
                  "message": "{{say}}",
                  "format": "markdown"
                }
              ]
            }
          }
        ]
      },
      {
        "type": "subroutine",
        "title": "worklistSearch()",
        "status": "live",
        "nodes": [
          {
            "type": "switch",
            "title": "Context:",
            "status": "live",
            "nodes": [
              {
                "type": "outcome",
                "title": "Tickets",
                "status": "live",
                "params": {
                  "groups": [
                    {
                      "any": 0,
                      "conditions": [
                        {
                          "condition": "_custom_script",
                          "tpl": "{{_prediction.params.context|keys|first}}",
                          "oper": "is",
                          "value": "cerberusweb.contexts.ticket"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "worklistSearchConfirmation()",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_run_subroutine",
                          "subroutine": "worklistSearchConfirmation()"
                        }
                      ]
                    }
                  },
                  {
                    "type": "action",
                    "title": "Open ticket worklist",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% spaceless %}\r\n{% set filters = [] %}\r\n{% set date = _prediction.params.date|first %}\r\n{% set org = _prediction.params.org|first|keys|first %}\r\n{% set owner = _prediction.params.worker|first|keys|first %}\r\n{% set status = _prediction.params.status|keys %}\r\n\r\n{% if owner is not empty %}\r\n  {% set filters = dict_set(filters, '[]', \"owner.id:\" ~ owner) %}\r\n{% endif %}\r\n\r\n{% if status is not empty %}\r\n  {% set filters = dict_set(filters, '[]', \"status:[\" ~ status|join(',') ~ \"]\") %}\r\n{% endif %}\r\n\r\n{% if org is not empty %}\r\n  {% set filters = dict_set(filters, '[]', \"org.id:\" ~ org) %}\r\n{% endif %}\r\n\r\n{% if date is not empty %}\r\n  {% set filters = dict_set(filters, '[]', 'updated:\"' ~ date.date ~ '\"') %}\r\n{% endif %}\r\n\r\n{% endspaceless %}\r\n{{filters|join(' ')}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "_query"
                        },
                        {
                          "action": "worklist_open",
                          "context": "cerberusweb.contexts.ticket",
                          "quick_search": "{{_query}}",
                          "worklist_model": null
                        }
                      ]
                    }
                  }
                ]
              },
              {
                "type": "outcome",
                "title": "Messages",
                "status": "live",
                "params": {
                  "groups": [
                    {
                      "any": 0,
                      "conditions": [
                        {
                          "condition": "_custom_script",
                          "tpl": "{{_prediction.params.context|keys|first}}",
                          "oper": "is",
                          "value": "cerberusweb.contexts.message"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "worklistSearchConfirmation()",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_run_subroutine",
                          "subroutine": "worklistSearchConfirmation()"
                        }
                      ]
                    }
                  },
                  {
                    "type": "action",
                    "title": "Open message worklist",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% spaceless %}\r\n{% set filters = [] %}\r\n{% set date = _prediction.params.date|first %}\r\n{% set worker = _prediction.params.worker|first|keys|first %}\r\n{% set status = _prediction.params.status|keys %}\r\n\r\n{% if worker is not empty %}\r\n  {% set filters = dict_set(filters, '[]', \"worker.id:\" ~ worker) %}\r\n{% endif %}\r\n\r\n{% if status is not empty %}\r\n  {% set filters = dict_set(filters, '[]', \"ticket:(status:[\" ~ status|join(',') ~ \"])\") %}\r\n{% endif %}\r\n\r\n{% if date is not empty %}\r\n  {% set filters = dict_set(filters, '[]', 'created:\"' ~ date.date ~ '\"') %}\r\n{% endif %}\r\n\r\n{% endspaceless %}\r\n{{filters|join(' ')}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "_query"
                        },
                        {
                          "action": "worklist_open",
                          "context": "cerberusweb.contexts.message",
                          "quick_search": "{{_query}}",
                          "worklist_model": null
                        }
                      ]
                    }
                  }
                ]
              },
              {
                "type": "outcome",
                "title": "Activity Logs",
                "status": "live",
                "params": {
                  "groups": [
                    {
                      "any": 0,
                      "conditions": [
                        {
                          "condition": "_custom_script",
                          "tpl": "{{_prediction.params.context|keys|first}}",
                          "oper": "is",
                          "value": "cerberusweb.contexts.activity_log"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "worklistSearchConfirmation()",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_run_subroutine",
                          "subroutine": "worklistSearchConfirmation()"
                        }
                      ]
                    }
                  },
                  {
                    "type": "action",
                    "title": "Open activity log worklist",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% spaceless %}\r\n{% set filters = [] %}\r\n{% set date = _prediction.params.date|first %}\r\n{% set owner = _prediction.params.worker|first|keys|first %}\r\n\r\n{% if owner is not empty %}\r\n{% set filters = dict_set(filters, '[]', \"actor.worker:(id:\" ~ owner ~ \")\") %}\r\n{% endif %}\r\n\r\n{% if date is not empty %}\r\n  {% set filters = dict_set(filters, '[]', 'created:\"' ~ date.date ~ '\"') %}\r\n{% endif %}\r\n\r\n{% endspaceless %}\r\n{{filters|join(' ')}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "_query"
                        },
                        {
                          "action": "worklist_open",
                          "context": "cerberusweb.contexts.activity_log",
                          "quick_search": "{{_query}}",
                          "worklist_model": null
                        }
                      ]
                    }
                  }
                ]
              },
              {
                "type": "outcome",
                "title": "Notifications",
                "status": "live",
                "params": {
                  "groups": [
                    {
                      "any": 0,
                      "conditions": [
                        {
                          "condition": "_custom_script",
                          "tpl": "{{_prediction.params.context|keys|first}}",
                          "oper": "is",
                          "value": "cerberusweb.contexts.notification"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "worklistSearchConfirmation()",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_run_subroutine",
                          "subroutine": "worklistSearchConfirmation()"
                        }
                      ]
                    }
                  },
                  {
                    "type": "action",
                    "title": "Open notification worklist",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% spaceless %}\r\n{% set filters = [] %}\r\n{% set status = _prediction.params.status|keys|first %}\r\n{% set owner = _prediction.params.worker|first|keys|first %}\r\n\r\n{% if owner is not empty %}\r\n{% set filters = dict_set(filters, '[]', \"worker.id:\" ~ owner) %}\r\n{% else %}\r\n{% set filters = dict_set(filters, '[]', \"worker:me\") %}\r\n{% endif %}\r\n\r\n{% if status is not empty and status == 'closed' %}\r\n  {% set filters = dict_set(filters, '[]', \"isRead:1\") %}\r\n{% else %}\r\n  {% set filters = dict_set(filters, '[]', \"isRead:0\") %}\r\n{% endif %}\r\n\r\n{% endspaceless %}\r\n{{filters|join(' ')}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "_query"
                        },
                        {
                          "action": "worklist_open",
                          "context": "cerberusweb.contexts.notification",
                          "quick_search": "{{_query}}",
                          "worklist_model": null
                        }
                      ]
                    }
                  }
                ]
              },
              {
                "type": "outcome",
                "title": "Tasks",
                "status": "live",
                "params": {
                  "groups": [
                    {
                      "any": 0,
                      "conditions": [
                        {
                          "condition": "_custom_script",
                          "tpl": "{{_prediction.params.context|keys|first}}",
                          "oper": "is",
                          "value": "cerberusweb.contexts.task"
                        }
                      ]
                    }
                  ]
                },
                "nodes": [
                  {
                    "type": "action",
                    "title": "worklistSearchConfirmation()",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_run_subroutine",
                          "subroutine": "worklistSearchConfirmation()"
                        }
                      ]
                    }
                  },
                  {
                    "type": "action",
                    "title": "Open task worklist",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% spaceless %}\r\n{% set filters = [] %}\r\n{% set date = _prediction.params.date|first %}\r\n{% set status = _prediction.params.status|keys|first %}\r\n{% set owner = _prediction.params.worker|first|keys|first %}\r\n\r\n{% if owner is not empty %}\r\n{% set filters = dict_set(filters, '[]', \"owner.id:\" ~ owner) %}\r\n{% endif %}\r\n\r\n{% if status is not empty %}\r\n  {% if status == 'closed' %}\r\n  {% set filters = dict_set(filters, '[]', \"isCompleted:1\") %}\r\n  {% else %}\r\n  {% set filters = dict_set(filters, '[]', \"isCompleted:0\") %}\r\n  {% endif %}\r\n{% endif %}\r\n\r\n{% if date is not empty %}\r\n  {% set filters = dict_set(filters, '[]', 'due:\"big bang to ' ~ date.date ~ '\"') %}\r\n{% endif %}\r\n\r\n{% endspaceless %}\r\n{{filters|join(' ')}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "_query"
                        },
                        {
                          "action": "worklist_open",
                          "context": "cerberusweb.contexts.task",
                          "quick_search": "{{_query}}",
                          "worklist_model": null
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
                    "title": "Respond: Sorry...",
                    "status": "live",
                    "params": {
                      "actions": [
                        {
                          "action": "_set_custom_var",
                          "value": "{% set r = [\r\n\"Sorry, I'm not sure what you're looking for.\",\r\n\"Sorry, I'm not able to search \" ~ _prediction.params.context|first|default('for that') ~ \" yet.\",\r\n] %}\r\n{{random(r)}}",
                          "format": "",
                          "is_simulator_only": "0",
                          "var": "say"
                        },
                        {
                          "action": "_run_subroutine",
                          "subroutine": "say()"
                        }
                      ]
                    }
                  }
                ]
              }
            ]
          }
        ]
      },
      {
        "type": "subroutine",
        "title": "worklistSearchConfirmation()",
        "status": "live",
        "nodes": [
          {
            "type": "action",
            "title": "Respond: I've found...",
            "status": "live",
            "params": {
              "actions": [
                {
                  "action": "_set_custom_var",
                  "value": "{% set r = [\r\n\"Certainly. Here you are.\",\r\n\"Certainly. I've located the records you're looking for.\",\r\n\"I've pulled up that worklist for you.\",\r\n\"I ran that search for you.\",\r\n] %}\r\n{{random(r)}}",
                  "format": "",
                  "is_simulator_only": "0",
                  "var": "say"
                },
                {
                  "action": "_run_subroutine",
                  "subroutine": "say()"
                }
              ]
            }
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

Cerb will prompt you to pick the **Intent Classifier**.  Click on the chooser button and select the **Detect Intent** classifier owned by Cerb that you just created a moment ago.  You can click anywhere in its worklist row.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-import.png" class="screenshot">
</div>

Click the **Save Changes** button again.

You should see the new behavior in the search popup:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-worklist.png" class="screenshot">
</div>

Click on **Cerb** in the **Bot** column of the behavior worklist to open its card.

Click the **Edit** button at the top of the card.

In the **Interactions** section, click the chooser button for the **Worker chat:** field.

Select the **Respond to worker chat** behavior that you just created.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-interaction-edit.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Test your conversational bot

Close all your popups and click on the [logo](/docs/navigation/#logo) in the top left to reload the page.

You should now see a floating conversational bot icon in the lower right of the browser window:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-convo-bubble.png" class="screenshot">
</div>

Click on it.  Your new bot will greet you:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-chat-window.png" class="screenshot">
</div>


<div class="cerb-box note">
	<p>
		If there are other conversational bots in your environment, a different one may answer your chat request. You can type <tt>@cerb</tt> to switch to your new bot.
	</p>
</div>

Try typing the following messages:

- `hi`
- `What time is it?`
- `find my open tickets`
- `I need help`

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bot-chat-convo.png" class="screenshot">
</div>

You'll notice that the bot is helpful even when you don't mention _"help"_:

- `I'm lost and have no idea where to even begin`
- `What do I say?`
- `What can you do?`
- `please tell me what to say`

Similarly, you can get the current time with:

- `time`
- `the time?`
- `right now`

If you say `hi` or `time` multiple times you'll get back a few different variations.

# Learn how the behavior works

Click on **Cerb** above one of the bot's messages to open its card.

On the card, click the **Behaviors** button.

Find the **Respond to worker chat** behavior and open its card.

You'll see the decision tree at the bottom of the popup:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree.png" class="screenshot">
</div>

## Using subroutines

At the top of level of the behavior there are three nodes with bold black labels that end with `()`:

- **say()**
- **worklistSearch()**
- **worklistSearchConfirmation()**

These are reusable sub-behaviors called [subroutines](/docs/bots/#subroutines).  Subroutines have access to the same dictionary of placeholders as the overall behavior.  You can _call_ a subroutine any number of times throughout a behavior by using actions, but a subroutine will never run on its own.

Let's take a closer look at the **say()** subroutine.  It has one action:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree-subroutine-say.png" class="screenshot">
</div>

It's pretty simple.  Every time the subroutine is called, it reads the value of the `say` placeholder and sends it to the worker as a chat message using the **Respond with message** action.  We can send a message back to the worker from anywhere in the behavior by writing some text to the `say` placeholder and then invoking `say()`.

You may be wondering why we bother to _wrap_ this simple action in a subroutine instead of using it directly every time we want to respond to the worker.  That will become very clear by the end of this guide.  In short, the `say()` subroutine allows the bot to also perform other actions every time it sends a message.  What you see here is the simplest example to start with.

## Determine intent from the chat message

Now we know how to some some text back to a worker using the `say()` subroutine.  It would be a good idea for our bot to figure out what the worker needs to accomplish.

As a listener on the **[UI] New chat message from worker** [event](/docs/bots/#events), the bot's behavior receives a [dictionary](/docs/bots/#dictionaries) with placeholders for the current worker and the message that they sent.

The first thing that the behavior does is run an [action](/docs/bots/#actions) called **Detect intent from chat message with a classifier**:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree-action-classifier.png" class="screenshot">
</div>

This sends the `{% raw %}message{% endraw %}` placeholder (the worker's chat message) to the **Detect Intent** [classifier](/docs/classifiers/) and receives back a prediction that it saves as `{% raw %}_prediction{% endraw %}`.  This helps us figure out what the worker is trying to accomplish.  We call that their _intent_.

The `_prediction` placeholder is a JSON object with this structure:

<pre>
<code class="language-json">
{% raw %}
{
	"text": "I need some help"
	"classifier": {
		"id": 1,
		"name": "Detect Intent"
	},
	"classification": {
		"id": 1,
		"name": "ask.help"
	},
	"confidence": 0.95,
	"params": [
		// Detected entities: dates, times, workers, contacts, etc.
	]
}
{% endraw %}
</code>
</pre>

## React to the intent

Since we're just interested in the predicted intent right now, we can use the `{% raw %}_prediction.classification.name{% endraw %}` placeholder in a decision.

That's exactly what the behavior does next. It makes a decision called **Intent:** with a few possible outcomes:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree-decision-intent.png" class="screenshot">
</div>

The **(new conversation)** outcome is special -- it matches when the chat message is empty.  This happens when you first open the chat window, and it allows the bot to speak first (letting you know how it can help).

The other outcomes just check the `{% raw %}_prediction.classification.name{% endraw %}` placeholder and compare it to a specific classification name:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree-outcome-intent.png" class="screenshot">
</div>

The first outcome that matches will continue running and the others will be ignored.

Most of the outcomes respond with some text as an action. For example, here's **say.hello**:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-behavior-tree-action-say-hello.png" class="screenshot">
</div>

This may look a little complicated if you haven't used placeholder scripting in Cerb's bots or [snippets](/docs/tickets/#snippets) before, so let's go through what it's doing.

Our goal is to break up the monotony of common responses by adding a few variations.  In this case, the bot may respond with _"hey"_, _"hi"_, _"howdy"_, etc.

To accomplish that, we're creating an _array_ of possible responses in the `r` _variable_ (_'r'_ as in _responses_).  That basic syntax is:

<pre>
<code class="language-twig">
{% raw %}
{% set r = ['hi','hey','hello'] %}
{% endraw %}
</code>
</pre>

For readability, we're putting each array member on a separate line.  For the above example, that looks like:

<pre>
<code class="language-twig">
{% raw %}
{% set r = [
	'hi',
	'hey',
	'hello'
] %}
{% endraw %}
</code>
</pre>

For each of those responses we want to address the worker by their first name.  We already have a dictionary of worker placeholders, so we can use `worker_first_name`.

In scripting, a sequence of text is called a _string_.  The process of joining multiple strings together into a single string is called _concatenation_.  The `~` (tilde) operator is used to concatenate strings in scripts.

Now we have an array named `r` that contains six variations of _"hello"_; each with the worker's first name appended to it.

We want to select one of those responses at random and send it to the worker.  We do that with the `random()` function, which accepts an array as an argument.  We give it our `r` responses array.

The output of that script is then saved to a new placeholder named `say`.

Finally, we call the `say()` subroutine that we talked about earlier, which takes the `say` placeholder we just set and sends its contents back to the worker as a chat message.

# Next steps

## Adding speech

A little earlier we hinted at the future advantages of using the `say()` subroutine every time the bot sends a message back to the worker.  One of those advantages is the ability to also speak the messages that we're sending.  Since all of our messages are routed through a single subroutine it's surprisingly simple to do.

The [Give Cerb bots the power of speech with Amazon Polly](/guides/integrations/aws/polly-speech/) guide uses the conversational bot we just created to demonstrate how to add speech to your bot.  It's a great next step.

# References

[^chatbot]: Wikipedia: Chatbot - <https://en.wikipedia.org/wiki/Chatbot>
[^ipa]: Wikipedia: Intelligent Personal Assistant - <https://en.wikipedia.org/wiki/Intelligent_personal_assistant>