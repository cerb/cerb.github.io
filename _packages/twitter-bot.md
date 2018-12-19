---
title: Twitter Bot
excerpt: A bot demonstrating integration between Cerb and Twitter.
layout: integration
topic: Packages
permalink: /packages/twitter-bot/
jumbotron:
  title: Twitter Bot
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

This package creates **Twitter Bot** for demonstrating integration between Cerb and [Twitter's API](https://dev.twitter.com/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/twitter/plugin/cerb-and-twitter.png" class="screenshot">
</div>

# Configure the Twitter service

If you haven't already, follow [these instructions](/guides/integrations/twitter/) to configure the Twitter service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Twitter",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Twitter account:",
          "key": "twitter_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:twitter"
          }
        }
      ]
    },
    "placeholders": []
  },
  "bots": [
    {
      "uid": "bot_2",
      "name": "Twitter",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": null,
        "events": {
          "mode": "all",
          "items": []
        },
        "actions": {
          "mode": "all",
          "items": []
        }
      },
      "image": "data:image/png;base64,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",
      "behaviors": [
        {
          "uid": "behavior_20",
          "title": "API: GET search/tweets",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_query": {
              "key": "var_query",
              "label": "query",
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
              "title": "Make HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.twitter.com/1.1/search/tweets.json?q={{var_query|url_encode}}",
                    "http_headers": "User-Agent: Cerb",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twitter_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_http_response.body|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_18",
          "title": "API: GET statuses/mentions_timeline",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Make API call",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.twitter.com/1.1/statuses/mentions_timeline.json",
                    "http_headers": "User-Agent: Cerb",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twitter_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_http_response.body|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_21",
          "title": "API: GET users/show",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_screen_name": {
              "key": "var_screen_name",
              "label": "screen_name",
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
              "title": "Make API Call",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.twitter.com/1.1/users/show.json?screen_name={{var_screen_name}}",
                    "http_headers": "User-Agent: Cerb",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twitter_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_http_response.body|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_19",
          "title": "API: POST statuses/update",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_status": {
              "key": "var_status",
              "label": "status",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "multiple"
              }
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Make API Call",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "https://api.twitter.com/1.1/statuses/update.json",
                    "http_headers": "Content-Type: application/x-www-form-urlencoded\r\nUser-Agent: Cerb",
                    "http_body": "status={{var_status|url_encode}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twitter_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_http_response.body|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_22",
          "title": "Create Tweet",
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
              "title": "Prompt for tweet?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "What would you like to Tweet?:",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(e.g.  This is a tweet posted from #cerb via a chat bot)"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "prompt_status"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save status and confirm",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "prompt_status"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Create the new Tweet",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "_trigger_va_id",
                    "behavior_id": "{{{behavior_19}}}",
                    "var_status": "{{prompt_status}}",
                    "run_in_simulator": "0",
                    "var": "_behavior"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_behavior.response_json|json_encode|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  },
                  {
                    "action": "send_message",
                    "message": "I created Tweet #{{response_json.id_str}} for you.",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_15",
          "title": "Get Interactions",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interactions.get.worker",
            "label": "Conversation get interactions for worker",
            "params": {
              "listen_points": "global"
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Point:",
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
                      "title": "Interactions",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "return_interaction",
                            "behavior_id": "23",
                            "name": "Post a tweet",
                            "interaction": "twitter.tweet.post",
                            "interaction_params_json": "{}"
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
          "uid": "behavior_23",
          "title": "Handle Interactions",
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
                  "title": "twitter.tweet.post",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "twitter.tweet.post"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Run Create Tweet",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "return": "0",
                            "behavior_id": "{{{behavior_22}}}",
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
        }
      ]
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll be prompted to link the Twitter connected account you created earlier.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/import.png" class="screenshot">
</div>

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Twitter Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/bot.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/behaviors.png" class="screenshot">
</div>

Open the card for the **API: GET search/tweets** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/behavior.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/simulate.png" class="screenshot">
</div>

Type in a search query and click the **Simulate** button.

You should see a JSON response with the results of your Twitter search.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twitter-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Twitter's API](https://dev.twitter.com/) in your behaviors.

