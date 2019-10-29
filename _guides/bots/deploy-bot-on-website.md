---
title: "Add a conversational bot to any website"
excerpt: You can enable conversational bot interactions on your website with a single line of code.
layout: integration
topic: Bots
subtopic: Conversational Bots
jumbotron:
  title: Add a conversational bot to any website
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
  -
    label: Conversational Bots &raquo;
    url: /resources/guides/#bots-conversational-bots
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bots-banner.png" class="screenshot">
</div>

Traditionally, interactivity has been added to websites using forms. This requires front-end developers and designers to create pages, and back-end programmers to process form submissions and interact with other services (email, databases, APIs, etc).

With Cerb, you can build conversational bot behaviors entirely from your web browser, and quickly deploy them to existing websites to assist visitors with:

* Contact methods
* Mailing list subscribe / unsubscribe
* Product explainers
* Signup
* Ordering
* Scheduling and booking
* Attendants
* Troubleshooters
* Surveys
* Feature requests and bug reporting
* ...and much more

This only requires a single line of code on your website.

You can embed bot interactions throughout your website, starting a specific conversation when a visitor clicks a link or button.  There's also a floating chat button in the bottom right of every page where your bots can help visitors discover their options.

You can also share links in email, chats, text messages, or social media posts, that automatically start a bot interaction on any page of your website.

In this guide, we'll import a pre-built Help Bot and demonstrate how to add it to your website.

# Enable the bot portal plugin

The **Conversational Bot Portal for Public Websites** plugin is installed by default in recent Cerb versions.

You can verify it's installed and enabled from **Setup >> Plugins >> Installed**.

# Import the Help Bot package

We've created a **Help Bot** package to demonstrate conversational bots.

Navigate to **Setup >> Packages >> Import**.

Copy and paste the following JSON:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Website Bot",
    "cerb_version": "8.2.8",
    "revision": 1,
    "requires": {
      "cerb_version": "8.2.8",
      "plugins": [

      ]
    },
    "configure": {
      "prompts": [

      ],
      "placeholders": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_3",
      "name": "Website Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": null,
        "events": {
          "mode": "all",
          "items": [

          ]
        },
        "actions": {
          "mode": "all",
          "items": [

          ]
        }
      },
      "image": "data:image/png;base64,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",
      "behaviors": [
        {
          "uid": "behavior_8",
          "title": "Convo: Attendant",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Hi!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Hi there!",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "loop",
              "title": "Repeat the menu",
              "status": "live",
              "params": {
                "foreach_json": "[\"*\"]",
                "as_placeholder": "tries"
              },
              "nodes": [
                {
                  "type": "action",
                  "title": "Prompt",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "send_message",
                        "message": "{% if tries > 1 %}\r\nHow else can I help?\r\n{%- else %}\r\nHow can I help?\r\n{%- endif %}",
                        "format": "",
                        "delay_ms": "1000"
                      },
                      {
                        "action": "prompt_buttons",
                        "options": "Contact me\r\nSubscribe\r\nUnsubscribe\r\nBye!",
                        "color_from": "#4795f7",
                        "color_mid": "#4795f7",
                        "color_to": "#4795f7",
                        "style": ""
                      }
                    ]
                  }
                },
                {
                  "type": "switch",
                  "title": "How can I help?",
                  "status": "live",
                  "nodes": [
                    {
                      "type": "outcome",
                      "title": "Contact me",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "Contact me"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Start interaction",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "switch_behavior",
                                "behavior_id": "{{{uid.behavior_9}}}",
                                "var": "_behavior"
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "Subscribe",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "Subscribe"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Start interaction",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "switch_behavior",
                                "behavior_id": "{{{uid.behavior_12}}}",
                                "var": "_behavior"
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "Unsubscribe",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "Unsubscribe"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Start interaction",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "switch_behavior",
                                "behavior_id": "{{{uid.behavior_13}}}",
                                "var": "_behavior"
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "Bye!",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "Bye!"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Close window",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Bye!",
                                "format": "",
                                "delay_ms": "1000"
                              },
                              {
                                "action": "window_close"
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
        },
        {
          "uid": "behavior_9",
          "title": "Convo: Contact me",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "nodes": [
            {
              "type": "action",
              "title": "What email?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "switch_behavior",
                    "behavior_id": "{{{uid.behavior_11}}}",
                    "var": "_behavior"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Leave a message",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Briefly, what would you would like to discuss?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(e.g. I'm having trouble logging in)",
                    "default": "",
                    "mode": "multiple"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Create ticket",
              "status": "live",
              "params": {
                "actions": [

                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_12",
          "title": "Convo: Subscribe",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_email": {
              "key": "var_email",
              "label": "Email",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Were we given an email address?",
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
                            "condition": "var_email",
                            "oper": "!is",
                            "value": ""
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Set placeholder",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{{var_email}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "prompt_email"
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
                        "conditions": [

                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Prompt for email address",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_11}}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Set placeholder",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{{_behavior.response.email}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "prompt_email"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "type": "action",
              "title": "Look up address",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.bot.action.record.upsert",
                    "context": "address",
                    "query": "email:\"{{prompt_email|replace('\"','')}}\"",
                    "changeset_json": "{\r\n\t\"email\": \"{{prompt_email}}\"\r\n}",
                    "run_in_simulator": "0",
                    "object_placeholder": "_record"
                  }
                ]
              }
            },
            {
              "type": "switch",
              "title": "Exists?",
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
                            "tpl": "{% if _record is not empty and _record.address == prompt_email %}true{% endif %}",
                            "oper": "is",
                            "value": "true"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Verify email address",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_14}}}",
                            "var_email": "{{_record.email}}",
                            "var_scope": "subscribe",
                            "var": "_behavior"
                          }
                        ]
                      }
                    },
                    {
                      "type": "switch",
                      "title": "Verified?",
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
                                    "tpl": "{% if _behavior.response.success %}true{% endif %}",
                                    "oper": "is",
                                    "value": "true"
                                  }
                                ]
                              }
                            ]
                          },
                          "nodes": [
                            {
                              "type": "action",
                              "title": "Set the custom field",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "core.bot.action.record.update",
                                    "context": "address",
                                    "id": "{{_record.id}}",
                                    "changeset_json": "{\r\n\t\"custom_{{{uid.field_mailing_list_opt_in}}}\": 1\r\n}",
                                    "run_in_simulator": "0",
                                    "object_placeholder": "_record"
                                  }
                                ]
                              }
                            },
                            {
                              "type": "action",
                              "title": "You've subscribed...",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "send_message",
                                    "message": "Thanks! You're subscribed.",
                                    "format": "",
                                    "delay_ms": "1000"
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
                                "conditions": [

                                ]
                              }
                            ]
                          },
                          "nodes": [
                            {
                              "type": "action",
                              "title": "Not subscribed",
                              "status": "live",
                              "params": {
                                "actions": [

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
                  "type": "outcome",
                  "title": "No",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [

                        ]
                      }
                    ]
                  }
                }
              ]
            },
            {
              "type": "switch",
              "title": "Caller?",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "No",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction_behavior_has_parent",
                            "bool": "0"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Bye!",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "prompt_buttons",
                            "options": "Bye!",
                            "color_from": "#4795f7",
                            "color_mid": "#4795f7",
                            "color_to": "#4795f7",
                            "style": ""
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Close chat",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "window_close"
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
          "uid": "behavior_13",
          "title": "Convo: Unsubscribe",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_email": {
              "key": "var_email",
              "label": "Email",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Were we given an email address?",
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
                            "condition": "var_email",
                            "oper": "!is",
                            "value": ""
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Set placeholder",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{{var_email}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "prompt_email"
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
                        "conditions": [

                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Prompt for email address",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_29}}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Set placeholder",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{{_behavior.response.email}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "prompt_email"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "type": "action",
              "title": "Look up address",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.bot.action.record.search",
                    "context": "address",
                    "query": "email:\"{{prompt_email|replace('\"','')}}\" mailingList.optIn:y",
                    "expand": "",
                    "object_placeholder": "_records"
                  }
                ]
              }
            },
            {
              "type": "switch",
              "title": "Exists?",
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
                            "tpl": "{% set _record = _records|first %}\r\n{% if _records is not empty and _record.address == prompt_email %}true{% endif %}",
                            "oper": "is",
                            "value": "true"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Remove the custom field",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "core.bot.action.record.update",
                            "context": "address",
                            "id": "{% set _record = _records|first %}{{_record.id}}",
                            "changeset_json": "{\r\n\t\"custom_{{{uid.behavior_3}}}\": 0\r\n}",
                            "run_in_simulator": "0",
                            "object_placeholder": "_record"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "You've been removed...",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "send_message",
                            "message": "You've been removed from our mailing list.",
                            "format": "",
                            "delay_ms": "1000"
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
                        "conditions": [

                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Not subscribed",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "send_message",
                            "message": "You're not subscribed to our mailing list.",
                            "format": "",
                            "delay_ms": "1000"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "type": "switch",
              "title": "Caller?",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "No",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction_behavior_has_parent",
                            "bool": "0"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Bye!",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "prompt_buttons",
                            "options": "Bye!",
                            "color_from": "#4795f7",
                            "color_mid": "#4795f7",
                            "color_to": "#4795f7",
                            "style": ""
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Close chat",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "window_close"
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
          "uid": "behavior_7",
          "title": "Handle interaction with portal visitor",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interaction.chat.portal",
            "label": "Conversation handle interaction with portal visitor"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "contact",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "contact"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Start interaction",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_9}}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "subscribe",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "subscribe"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Start interaction",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_12}}}",
                            "var_email": "{{interaction_params.email}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "unsubscribe",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "unsubscribe"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Start interaction",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_13}}}",
                            "var_email": "{{interaction_params.email}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "(default)",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [

                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Start interaction",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_8}}}",
                            "var": "_behavior"
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
          "uid": "behavior_11",
          "title": "Prompt: Email Address",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "nodes": [
            {
              "type": "loop",
              "title": "Repeat if necessary",
              "status": "live",
              "params": {
                "foreach_json": "[\"*\"]",
                "as_placeholder": "tries"
              },
              "nodes": [
                {
                  "type": "action",
                  "title": "What is your email address?",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "send_message",
                        "message": "What is your email address?",
                        "format": "",
                        "delay_ms": "1000"
                      }
                    ]
                  }
                },
                {
                  "type": "action",
                  "title": "Prompt",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "prompt_text",
                        "placeholder": "(you@example.com)"
                      }
                    ]
                  }
                },
                {
                  "type": "switch",
                  "title": "Valid?",
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
                                "tpl": "{% set emails = message|parse_emails %}\r\n{% if message is not empty and emails|length != 0 and emails|first.host != 'localhost' %}true{% endif %}",
                                "oper": "is",
                                "value": "true"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Return",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "_set_custom_var",
                                "value": "{% set emails = message|parse_emails %}\r\n{{emails|first|json_encode}}",
                                "format": "json",
                                "is_simulator_only": "0",
                                "var": "response"
                              },
                              {
                                "action": "_set_custom_var",
                                "value": "[]",
                                "format": "json",
                                "is_simulator_only": "0",
                                "var": "tries__stack"
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
                            "conditions": [

                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Oops!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Sorry, that doesn't appear to be a valid email address.",
                                "format": "",
                                "delay_ms": "1000"
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
        },
        {
          "uid": "behavior_14",
          "title": "Prompt: Email confirmation",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_email": {
              "key": "var_email",
              "label": "Email",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_scope": {
              "key": "var_scope",
              "label": "Scope",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Check rate limit",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_get_key",
                    "key": "rate-limit:{{var_scope}}:email:{{var_email}}",
                    "var": "rate_limit"
                  }
                ]
              }
            },
            {
              "type": "switch",
              "title": "Rate limited?",
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
                            "tpl": "{{rate_limit}}",
                            "oper": "!is",
                            "value": ""
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Whoops!",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "send_message",
                            "message": "You've already requested a confirmation code in the past 30 minutes.",
                            "format": "",
                            "delay_ms": "1000"
                          },
                          {
                            "action": "send_message",
                            "message": "Please try again later.",
                            "format": "",
                            "delay_ms": "1000"
                          },
                          {
                            "action": "_set_custom_var",
                            "value": "{\r\n\t\"success\": false\r\n}",
                            "format": "json",
                            "is_simulator_only": "0",
                            "var": "response"
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
                        "conditions": [

                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Generate confirmation code",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{{random_string(8)}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "confirm_code"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Send email",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "send_email",
                            "from_address_id": "0",
                            "send_as": "Cerb Bot",
                            "to": "{{var_email}}",
                            "cc": "",
                            "bcc": "",
                            "subject": "Please verify your email address",
                            "headers": "Auto-Submitted: auto-generated",
                            "format": "",
                            "content": "Hi there!\r\n\r\nWe were just chatting.\r\n\r\nI need to verify your email address before continuing.\r\n\r\nPaste this code into our chat: {{confirm_code}}\r\n\r\nIf you did not initiate this request, please disregard this message.\r\n\r\nThanks!\r\n -Cerb",
                            "run_in_simulator": "0"
                          },
                          {
                            "action": "_set_key",
                            "key": "rate-limit:{{var_scope}}:email:{{var_email}}",
                            "value": "{{date('now')|date_modify('+30 mins')|date('U')}}",
                            "expires_at": "{{date('now')|date_modify('+30 mins')|date('U')}}"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "I just sent you...",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "send_message",
                            "message": "I just sent you a confirmation code to **{{var_email}}**. Please check your email.",
                            "format": "markdown",
                            "delay_ms": "1000"
                          }
                        ]
                      }
                    },
                    {
                      "type": "loop",
                      "title": "Verify confirmation code",
                      "status": "live",
                      "params": {
                        "foreach_json": "[\"*\"]",
                        "as_placeholder": "attempts"
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "What was the confirmation code?",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "What was the confirmation code?",
                                "format": "",
                                "delay_ms": "1000"
                              },
                              {
                                "action": "prompt_text",
                                "placeholder": "(enter the confirmation code from your email)"
                              }
                            ]
                          }
                        },
                        {
                          "type": "switch",
                          "title": "Valid?",
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
                                        "tpl": "{% if confirm_code|upper == message|upper %}true{% endif %}",
                                        "oper": "is",
                                        "value": "true"
                                      }
                                    ]
                                  }
                                ]
                              },
                              "nodes": [
                                {
                                  "type": "action",
                                  "title": "Break loop",
                                  "status": "live",
                                  "params": {
                                    "actions": [
                                      {
                                        "action": "_set_custom_var",
                                        "value": "{\r\n\t\"success\": true\r\n}",
                                        "format": "json",
                                        "is_simulator_only": "0",
                                        "var": "response"
                                      },
                                      {
                                        "action": "_set_custom_var",
                                        "value": "[]",
                                        "format": "json",
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
                                    "conditions": [

                                    ]
                                  }
                                ]
                              },
                              "nodes": [
                                {
                                  "type": "action",
                                  "title": "Sorry...",
                                  "status": "live",
                                  "params": {
                                    "actions": [
                                      {
                                        "action": "send_message",
                                        "message": "Sorry, that's not correct.",
                                        "format": "",
                                        "delay_ms": "1000"
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
          ]
        }
      ]
    }
  ],
  "portals": [
    {
      "uid": "portal_bot",
      "extension_id": "cerb.bots.portal",
      "name": "Help Bot",
      "params": {
        "bot_name": "Help Bot",
        "cors_allow_origin": "*",
        "interaction_behavior_id": "{{{uid.behavior_7}}}",
        "page_css": "",
        "page_hide_icon": "0",
        "page_title": ""
      }
    }
  ],
  "records": [
    {
      "uid": "fieldset_mailing_list",
      "_context": "custom_fieldset",
      "context": "address",
      "owner__context": "bot",
      "owner_id": "{{{uid.bot_3}}}",
      "name": "Mailing List"
    },
    {
      "uid": "field_mailing_list_opt_in",
      "_context": "custom_field",
      "context": "address",
      "custom_fieldset_id": "{{{uid.fieldset_mailing_list}}}",
      "name": "Opt-In",
      "type": "C",
      "params": {
      }
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You should see a summary like the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/imported.png" class="screenshot">
</div>

# Deploy the bot portal

Now we need to deploy the bot portal somewhere.  This provides a resource you can link to from your existing website, as well as a test environment.

Navigate to **Setup >> Portals >> Search**.

Click on **Help Bot**.

Deploy the community portal with [Nginx](/guides/portals/nginx-proxy/) or the `index.php` file.

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b> we can deploy the community portal for you.</p>
</div>

# Test the bot portal

Let's test the new bot using the portal website.

Navigate to the URL where you deployed the community portal.

Click on the chat bubble in the lower right:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/bot-chat-bubble.png" class="screenshot">
</div>

You should see a menu of options:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/bot-chat-window.png" class="screenshot">
</div>

* **Contact me** prompts a visitor for information and creates a new ticket.
* **Subscribe** verifies a visitor's email address and adds them to your mailing list.
* **Unsubscribe** removes a visitor's email address from your mailing list.
* **Bye!** closes the chat window.

## Styling

You can style the chat window in the built-in website with CSS.

1. Navigate to **Setup >> Portals >> Search**.

1. Click on **Help Bot**.

1. In the **Custom CSS** section, paste:

	<pre>
	<code class="language-css">
	#cerb-bot-chat-window {
	  width: 600px;
	  left: 50%;
	  right: 50%;
	  margin: 0 0 0 -300px;
	}

	@media (max-width: 600px) {
	  #cerb-bot-chat-window {
	    width: 96%;
	    left: 2%;
	    right: 2%;
	    margin: 0;
	  }
	}
	</code>
	</pre>

1. Then click **Save Changes**.

Click on the chat bubble in the lower right again.

You should now have a larger chat window that's centered on the screen.

You can copy these changes to your website's CSS stylesheet.

# Deploy the bot to your own website

You could send people to the built-in bot portal, but it's much more effective to add the bot to your website.

## CORS

If your bot portal and website use different domain names, you'll need to enable cross-origin resource sharing (CORS):

1. In Cerb, navigate to **Setup >> Portals >> Help Bot**.

1. Add your website domain name to the **Security** section under **Only allow the bot widget to be embedded at this URL**. Format it like: `https://portal.example` (use your own domain name).

## Add the script tag to your website

1. Insert the following script tag to your website before `</body>` (ideally on every page from a layout template):

	<pre>
	<code class="language-html">
	&lt;script src="https://portal.example/assets/embed.js" data-bubble="true" async type="text/javascript" id="cerb-portal" &gt;&lt;/script&gt;
	</code>
	</pre>

1. In the `src` attribute of the `script` tag you just added, replace `portal.example` with your own domain.  For example, on our own website this would be `https://cerb.ai/assets/embed.js`.

If you don't want the bot chat bubble in the lower right of every page, you can hide it by setting `data-bubble="false"`. In this configuration, bot interactions will only start in response to the links or buttons you create.

<div class="cerb-box note">
<p>We recommend testing the bot in your development or staging environment before deploying it to your production website.</p>
</div>

## Custom styling

You can style the Cerb bot chat bubble and window on your website using CSS selectors.

For instance:

<pre>
<code class="language-css">
#cerb-bot-interaction-button > div.cerb-bot-interaction-button-icon {
  /* ... */
}

#cerb-bot-chat-window {
  /* ... */
}
</code>
</pre>

You can change the icon in the chat bubble, change the bubble's size or position, change the colors in the chat window, etc.

We recommend using the developer tools in your browser to build and test new styles.

## Embedding interactions on your website

Right now, visitors to your website can interact with your bot by clicking on the chat bubble in the lower right.

With a little markup you can easily trigger bot interactions on your website from any element (e.g. links, buttons, images).

Cerb looks for any elements with a `data-cerb-bot-interaction` attribute. The value of this attribute is the name of the interaction to start, which is passed to the **Handle interaction with portal visitor** behavior configured in the portal.

For instance:

<pre>
<code class="language-html">
&lt;a href="#" data-cerb-bot-interaction="contact"&gt;Contact us&lt;/a&gt;
</code>
</pre>

When the above link is clicked, the bot chat window will open and the `contact` interaction will begin.

You can also pass parameters to interactions with `data-cerb-bot-param-*` attributes:

<pre>
<code class="language-html">
&lt;a href="#" data-cerb-bot-interaction="buy" data-cerb-bot-param-product="x"&gt;Product X&lt;/a&gt;
&lt;a href="#" data-cerb-bot-interaction="buy" data-cerb-bot-param-product="y"&gt;Product Y&lt;/a&gt;
&lt;a href="#" data-cerb-bot-interaction="buy" data-cerb-bot-param-product="z"&gt;Product Z&lt;/a&gt;
</code>
</pre>

When any of the three links above is clicked, the bot chat window will open and the `buy` interaction will begin. The `product` interaction parameter will be set based on which link was clicked.

## Permalinks to bot interactions

You can also use permalinks to send someone to any page on your website and automatically open a bot interaction (with optional parameters).

This uses the format:

```
<website-url>#bot/<interaction-name>&param1=value1&param2=value2...
```

For instance, if you want to give someone the option to unsubscribe from your mailing list during a broadcast, you could include a link like:

```
https://website.example/#bot/unsubscribe&email=customer@example.com
```

When the recipient clicks the link, they're taken to a page on your website, and the `unsubscribe` bot interaction automatically starts.  You've also pre-filled their email address so the bot doesn't need to tediously prompt them for information you already know.

## Securing permalink URLs with signatures

When generating permalinks, keep in mind that you should never explicitly trust user input.

In the previous example, a user could change the `email` interaction parameter to a different email address and unsubscribe someone else.

When you need to tamper-proof interaction parameters, you should create a signature and append it (or part of it) as another parameter.  It's important to use an HMAC signature with a secret key, rather than a simple MD5 or SHA-1 checksum. Otherwise a user could forge their own checksum.

For instance, if you were generating the unsubscribe URLs from a bot behavior in Cerb, we could do something like:

<pre>
<code class="language-twig">
{% raw %}
{% set email = "customer@example.com" %}
{% set hmac_secret = "a1b2c3d4e5f6abcd1234" %}
{% set signature = [email]|join|hash_hmac(hmac_secret,"sha256") %}
https://website.example/#unsubscribe&email={{email}}&s={{signature}}
{% endraw %}
</code>
</pre>

If you had multiple parameters to sign, you'd append them like `[email,param2,param3]|join` above.

This generates a URL like:

```
https://website.example/#unsubscribe&email=customer@example.com&s=a0cf063304b33ea27f93e22c7dc559958cc126d1a68f0a8049eec5b4c4b8e640
```

Note that a SHA-256 signature is 64 characters long, which can result in unwieldy URLs.

Based on the desired level of security, you can shorten the URL by only including a segment of the signature in the URL.  An 8 character hex string already has 4,294,967,296 possible combinations.  A 16 character hex string has about 18,446,744,070,000,000,000 combinations.  Anything more is likely overkill.

It's a simple change to our URL generation script to use a signature segment instead:

<pre>
<code class="language-twig">
{% raw %}
{% set email = "customer@example.com" %}
{% set hmac_secret = "a1b2c3d4e5f6abcd1234" %}
{% set signature = [email]|join|hash_hmac(hmac_secret,"sha256") %}
https://website.example/#unsubscribe&email={{email}}&s={{signature[24:16]}}
{% endraw %}
</code>
</pre>

The `signature[24:16]` syntax returns the next 16 characters of `signature` starting at the 24th position.  You could use any segment, as long as you're comparing it in the same way later.

This gives us a much shorter URL, like:

```
https://website.example/#unsubscribe&email=customer@example.com&s=7dc559958cc126d1
```

To verify a signature, your bot behavior would need to read the value of the `s` (signature) parameter and compare it to the signature it generates itself using the secret key and the other given parameter values. Essentially, this is just repeating the process of generating the signature above, but testing the user's provided value for the `email` parameter. If using signature segments, make sure you use the same offset and length in your comparison.

We recommend storing the HMAC secret key in the JSON configuration object when you edit the bot's record. This makes it available to all of a bot's behaviors from a single place, while still remaining hidden from end-users.

# Next steps

* Modify **Help Bot** to meet your needs.