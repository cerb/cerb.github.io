---
title: Slack Bot
excerpt: A bot demonstrating integration between Cerb and Slack.
layout: integration
topic: Packages
permalink: /packages/slack-bot/
jumbotron:
  title: Slack Bot
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

This package creates **Slack Bot** for demonstrating integration between Cerb and [Slack's API](https://api.slack.com/web).

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/cerb-and-slack.png" class="screenshot">
</div>

# Configure the Slack service

If you haven't already, follow [these instructions](/guides/integrations/slack/) to configure the Slack service and add your first connected account.

# Import the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Slack Bot",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Slack Account:",
          "key": "slack_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:slack"
          }
        }
      ],
      "placeholders": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_36",
      "name": "Slack Bot",
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
          "mode": "allow",
          "items": [
            "core.va.action.http_request"
          ]
        }
      },
      "image": "data:image/png;base64,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",
      "behaviors": [
        {
          "uid": "behavior_189",
          "title": "API: api.test",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://api.slack.com/methods/api.test #}\r\nhttps://slack.com/api/api.test?example1=value1",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
          "uid": "behavior_190",
          "title": "API: bots.info",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_bot_id": {
              "key": "var_bot_id",
              "label": "Bot ID",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://api.slack.com/methods/bots.info #}\r\nhttps://slack.com/api/bots.info?bot={{var_bot_id|url_encode}}",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
          "uid": "behavior_193",
          "title": "API: channels.list",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://api.slack.com/methods/channels.list #}\r\nhttps://slack.com/api/channels.list",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
          "uid": "behavior_192",
          "title": "API: chat.postMessage",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_channel": {
              "key": "var_channel",
              "label": "Channel",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_message": {
              "key": "var_message",
              "label": "Message",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "{# See: https://api.slack.com/methods/chat.postMessage #}\r\nhttps://slack.com/api/chat.postMessage",
                    "http_headers": "Content-Type: application/x-www-form-urlencoded",
                    "http_body": "{% set params = {\r\n\t\"channel\": var_channel,\r\n\t\"text\": var_message,\r\n\t\"as_user\": \"false\",\r\n\t\"username\": \"Cerb\",\r\n} %}\r\n{{params|url_encode}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
          "uid": "behavior_194",
          "title": "API: users.list",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://api.slack.com/methods/users.list #}\r\nhttps://slack.com/api/users.list",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
          "uid": "behavior_191",
          "title": "API: users.profile.get",
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
              "title": "Execute HTTP request to Slack API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://api.slack.com/methods/users.profile.get #}\r\nhttps://slack.com/api/users.profile.get",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{slack_account_id}}}",
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
        }
      ]
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll be prompted to link the Slack connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/slack-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Slack Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/slack-bot/bot.png" class="screenshot">
</div>

Open the card for the **API: chat.postMessage** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/slack-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response about the sent message.

<div class="cerb-screenshot">
<img src="/assets/images/packages/slack-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

This message should pop up in your Slack channel:

<div class="cerb-screenshot">
<img src="/assets/images/packages/slack-bot/slack-message.png" class="screenshot">
</div>

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Slack's API](https://api.slack.com/web) in your behaviors.