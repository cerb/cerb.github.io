---
title: Demo Bot
excerpt: A preconfigured bot for testing conversational interactions.
layout: integration
topic: Packages
permalink: /packages/demo-bot/
jumbotron:
  title: Demo Bot
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

# Introduction

This package adds a preconfigured bot for testing conversational interactions.

# Installing the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Demo Bot",
    "cerb_version": "8.0.1",
    "revision": 1,
    "requires": {
      "cerb_version": "8.0.1",
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
      "uid": "bot_78",
      "name": "Demo Bot",
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
          "uid": "behavior_508",
          "title": "Demonstrate conversational behaviors",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.worker",
            "label": "Conversation with worker"
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
                    "message": "Hi, {{worker_first_name}}!",
                    "format": "",
                    "delay_ms": "1500"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "I'm...",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I'm a conversational bot.",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "send_message",
                    "message": "I'm designed to make your job easier.",
                    "format": "",
                    "delay_ms": "1500"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "I can respond...",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I can **format** my _responses_ and include [links](https://cerb.ai/docs/home/).",
                    "format": "markdown",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "send_message",
                    "message": "I can show you lists like:\r\n\r\n* Item #1\r\n* Item #2\r\n* Item #3",
                    "format": "markdown",
                    "delay_ms": "2000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "I can draw custom HTML",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I can also draw things for you with HTML5, CSS3, and Javascript.  Like:",
                    "format": "",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "send_script",
                    "script": "&lt;div style=\"background-color:rgb(230,230,230);border:1px solid rgb(200,200,200);padding:10px;border-radius:5px;cursor:pointer;\" class=\"cerb-peek-trigger\" data-context=\"cerberusweb.contexts.worker\" data-context-id=\"{{worker_id}}\"&gt;\r\n  &lt;div style=\"float:left;margin-right:5px;\"&gt;\r\n    &lt;img src=\"{{cerb_avatar_url('worker',worker_id,worker_updated)}}\" style=\"border-radius:45px; vertical-align:middle; width:45px; height:45px;\"&gt;\r\n  &lt;/div&gt;\r\n  &lt;div style=\"float:left;\"&gt;\r\n    &lt;b style=\"font-size:1.5em;\"&gt;{{worker__label}}&lt;/b&gt;\r\n&lt;br&gt;\r\n    {{worker_title}}&lt;br&gt;\r\n  &lt;/div&gt;\r\n  &lt;br clear=\"all\"&gt;\r\n&lt;/div&gt;"
                  },
                  {
                    "action": "send_message",
                    "message": "If you click that it will open up your card.",
                    "format": "",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "continue",
                    "color_from": "#ffffff",
                    "color_mid": "#ffffff",
                    "color_to": "#ffffff",
                    "style": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "I can prompt...",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I can ask you for input in many ways.",
                    "format": "markdown",
                    "delay_ms": "1500"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt: text",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "For instance, I'm thinking of a number between **1** and **10**. What's your guess?",
                    "format": "markdown",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{random(range(1,10))}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "secret_number"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(choose a number between 1 and 10)"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "guessNumber()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "guessNumber()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt: buttons",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "To save time, I can give you quick reply buttons.",
                    "format": "",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "send_message",
                    "message": "Who's your favorite virtual assistant?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "{% set r = [\r\n\"Siri\",\r\n\"Cortana\",\r\n\"Alexa\",\r\n\"Google Assistant\",\r\n\"Cerb\"\r\n] %}\r\n{{shuffle(r)|join(\"\\n\")}}",
                    "color_from": "#ffffff",
                    "color_mid": "#ffffff",
                    "color_to": "#ffffff",
                    "style": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "favAssistantReply()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "favAssistantReply()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt: images",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I can prompt you with images to communicate visually.",
                    "format": "",
                    "delay_ms": "2000"
                  },
                  {
                    "action": "send_message",
                    "message": "Which treat would you pick?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_images",
                    "images": [
                      "data:image/png;base64,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",
                      "data:image/png;base64,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",
                      "data:image/png;base64,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",
                      ""
                    ],
                    "labels": [
                      "cookies",
                      "ice cream",
                      "salad",
                      ""
                    ]
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "treatReply()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "treatReply()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Show worklists",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I can open worklists for you. Here are the current open conversations.",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "worklist_open",
                    "context": "cerberusweb.contexts.ticket",
                    "quick_search": "status:o",
                    "worklist_model": null
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "continue",
                    "color_from": "#ffffff",
                    "color_mid": "#ffffff",
                    "color_to": "#ffffff",
                    "style": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "and more",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "These are just the basics.",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "send_message",
                    "message": "The best part is you can teach me to do new things. I'm able to do almost anything you can do within Cerb.",
                    "format": "",
                    "delay_ms": "2500"
                  },
                  {
                    "action": "send_message",
                    "message": "I can talk to other apps and services for you:\r\n\r\n* Check your Google Calendar\r\n* Post an update to Facebook\r\n* Run serverless functions with Amazon Lambda\r\n* Cool down the room with Nest\r\n* and anything else you can think of",
                    "format": "markdown",
                    "delay_ms": "6000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Bye!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "I look forward to working with you.",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "send_message",
                    "message": "Bye, {{worker_first_name}}!",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "bye!",
                    "color_from": "#ffffff",
                    "color_mid": "#ffffff",
                    "color_to": "#ffffff",
                    "style": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Close",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "window_close"
                  }
                ]
              }
            },
            {
              "type": "subroutine",
              "title": "guessNumber()",
              "status": "live",
              "nodes": [
                {
                  "type": "switch",
                  "title": "Correct?",
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
                                "tpl": "{% if message is numeric and message == secret_number %}true{% endif %}",
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
                          "title": "Wow!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Wow! That's the number I was thinking of. I'll leave the magic to you from now on. 🎩 ✨",
                                "format": "",
                                "delay_ms": "2000"
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
                              {
                                "condition": "_custom_script",
                                "tpl": "{% if message is numeric and message != secret_number %}true{% endif %}",
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
                          "title": "Aww...",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Aww! I was thinking of the number **{{secret_number}}**.",
                                "format": "markdown",
                                "delay_ms": "1500"
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "Else",
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
                          "title": "Err",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "The game works better if you actually guess a number.  Anyway, moving on...",
                                "format": "",
                                "delay_ms": "1500"
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
              "title": "treatReply()",
              "status": "live",
              "nodes": [
                {
                  "type": "switch",
                  "title": "Which?",
                  "status": "live",
                  "nodes": [
                    {
                      "type": "outcome",
                      "title": "ice cream",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "ice cream"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Yum!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "⛄️ Yum! ⛄️",
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
                      "title": "cookies",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "cookies"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Yum!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Baker's dozen! 🍪🍪🍪🍪 🍪🍪🍪🍪 🍪🍪🍪🍪 + 🍪",
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
                      "title": "salad",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "salad"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "Wha?",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Wow, life of the party! 🍺 Just kidding.  You'll outlive us all. ❤️",
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
            },
            {
              "type": "subroutine",
              "title": "favAssistantReply()",
              "status": "live",
              "nodes": [
                {
                  "type": "switch",
                  "title": "Which?",
                  "status": "live",
                  "nodes": [
                    {
                      "type": "outcome",
                      "title": "Cerb",
                      "status": "live",
                      "params": {
                        "groups": [
                          {
                            "any": 0,
                            "conditions": [
                              {
                                "condition": "message",
                                "oper": "is",
                                "value": "Cerb"
                              }
                            ]
                          }
                        ]
                      },
                      "nodes": [
                        {
                          "type": "action",
                          "title": "That's nice...",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Aww! You made my day.",
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
                      "title": "Someone else",
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
                          "title": "They're great",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "{{message}} is great. The more bots the better, I say.",
                                "format": "",
                                "delay_ms": "1500"
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
          "uid": "behavior_505",
          "title": "Get interactions",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interactions.get.worker",
            "label": "Conversation get interactions for worker",
            "params": {
              "listen_points": "global\r\n"
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "global",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "point",
                            "oper": "is",
                            "value": "global"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Return interactions",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "return_interaction",
                            "behavior_id": "{{{uid.behavior_506}}}",
                            "name": "What's new with Cerb?",
                            "interaction": "blog.latest",
                            "interaction_params_json": ""
                          },
                          {
                            "action": "return_interaction",
                            "behavior_id": "{{{uid.behavior_506}}}",
                            "name": "Demonstrate conversational behaviors",
                            "interaction": "demo.conversations",
                            "interaction_params_json": ""
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
          "uid": "behavior_506",
          "title": "Handle interaction with worker",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interaction.chat.worker",
            "label": "Conversation handle interaction with worker"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "blog.latest",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "blog.latest"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Run behavior",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "return": "1",
                            "behavior_id": "{{{uid.behavior_507}}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "demo.conversations",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "demo.conversations"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Run behavior",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "return": "1",
                            "behavior_id": "{{{uid.behavior_508}}}",
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
          "uid": "behavior_507",
          "title": "Show Cerb blog posts",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.worker",
            "label": "Conversation with worker"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Get blog posts via RSS",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://cerb.ai/feed.xml",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Respond",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Here are the most recent posts on the Cerb blog:",
                    "format": "html",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "send_message",
                    "message": "{% set xml = xml_decode(_http_response.body) %}\r\n{% set items = xml_xpath(xml,'//item') %}\r\n{% for item in items %}\r\n* [{{item.title}}]({{item.link}})\r\n{% endfor %}",
                    "format": "markdown",
                    "delay_ms": "1500"
                  },
                  {
                    "action": "send_message",
                    "message": "You can read more on the [project website](https://cerb.ai/blog).",
                    "format": "markdown",
                    "delay_ms": "1200"
                  }
                ]
              }
            }
          ]
        }
      ]
    }
  ],
  "classifiers": [
    {
      "uid": "classifier_001",
      "name": "Yes/No",
      "owner": {
        "context": "cerberusweb.contexts.bot",
        "id": "{{{uid.bot_78}}}"
      },
      "params": {
        
      },
      "classes": [
        {
          "uid": "class_001",
          "name": "answer.yes",
          "expressions": [
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I agree",
            "I'm sure",
            "I'm sure",
            "I'm sure",
            "I'm sure",
            "I'm sure",
            "aye aye",
            "carry on",
            "do it",
            "do it",
            "do it",
            "get on with it then",
            "go ahead",
            "i agree",
            "make it happen",
            "make it so",
            "most assuredly",
            "perfect, thanks",
            "please do",
            "rock on",
            "that's correct",
            "that's right",
            "uh huh",
            "yeah, do it",
            "yes, do it",
            "yes, please",
            "you got it",
            "absolutely",
            "absolutely",
            "absolutely",
            "affirmative",
            "alright",
            "assuredly",
            "aye",
            "certainly",
            "confirmed",
            "continue",
            "continue",
            "correct",
            "da",
            "good",
            "hooray",
            "ja",
            "ok",
            "ok",
            "ok",
            "okay",
            "proceed",
            "righto",
            "sure",
            "sure",
            "sure",
            "sure",
            "sure",
            "sure",
            "sure",
            "sure",
            "sure",
            "thanks",
            "totally",
            "true",
            "y",
            "ya",
            "ya",
            "yay",
            "yea",
            "yeah",
            "yeah",
            "yep",
            "yeppers",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes",
            "yes"
          ]
        },
        {
          "uid": "class_002",
          "name": "answer.no",
          "expressions": [
            "I changed my mind",
            "I don't agree",
            "I don't agree",
            "I don't agree",
            "I don't agree",
            "I don't agree",
            "absolutely not",
            "belay that",
            "cut it out",
            "don't do anything",
            "don't do it",
            "forget it",
            "never mind",
            "no thanks",
            "no way",
            "on second thought, don't do it",
            "please don't",
            "scratch that",
            "cancel",
            "denied",
            "disengage",
            "don't",
            "end",
            "exit",
            "halt",
            "n",
            "nah",
            "nay",
            "nay",
            "neg",
            "negative",
            "negatory",
            "nein",
            "nevermind",
            "nevermind",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "no",
            "nope",
            "nope",
            "nyet",
            "quit",
            "skip",
            "stop",
            "stop"
          ]
        },
        {
          "uid": "class_003",
          "name": "answer.maybe",
          "expressions": [
            "I don't have a clue",
            "I don't have a clue",
            "I don't know",
            "I don't know",
            "I have no clue",
            "I have no idea",
            "I may agree",
            "I might agree",
            "I think so",
            "I think so",
            "I'm not sure if I agree",
            "I'm not sure if I agree",
            "I'm not sure if I agree",
            "I'm not sure if I agree",
            "I'm not sure if I agree",
            "I'm not sure",
            "no idea",
            "not sure",
            "not sure",
            "dunno",
            "maybe",
            "maybe",
            "meh",
            "perhaps",
            "possibly",
            "unsure",
            "wait"
          ]
        }
      ]
    }
  ]
}
{% endraw %}
</code>
</pre>

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/demo-bot/imported.png" class="screenshot">
</div>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/packages/demo-bot/train.png" class="screenshot">
</div>
{% endcomment %}

# Testing interactions

Click on the logo in the top left to return to your default page.

You should now see a floating bot icon in the lower right.

Click on it and select **Demo Bot >> Demonstrate conversational behaviors**:

<div class="cerb-screenshot">
<img src="/assets/images/packages/demo-bot/interactions.png" class="screenshot">
</div>

This starts a conversation with Demo Bot to demonstrate interactions:

<div class="cerb-screenshot">
<img src="/assets/images/packages/demo-bot/convo.png" class="screenshot">
</div>
