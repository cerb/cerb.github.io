---
title: Facebook Page Bot
excerpt: A bot demonstrating integration between Cerb and Facebook Pages.
layout: integration
topic: Packages
permalink: /packages/facebook-page-bot/
jumbotron:
  title: Facebook Page Bot
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

This package creates **Facebook Page Bot** for demonstrating integration between Cerb and Facebook pages using the [Graph API](https://developers.facebook.com/docs/graph-api).

<div class="cerb-screenshot">
<img src="/assets/images/guides/facebook/plugin/cerb-and-facebook.png" class="screenshot">
</div>

# Configure the Facebook service

If you haven't already, follow [these instructions](/guides/integrations/facebook/) to configure the Facebook service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Facebook Page Bot",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Facebook Page:",
          "key": "facebook_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:facebook"
          }
        }
      ],
      "placeholders": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_22",
      "name": "Facebook Page Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": {
          "api_version": "v2.9"
        },
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
          "uid": "behavior_127",
          "title": "Get page info",
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
              "title": "Facebook API Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://graph.facebook.com/{{behavior_bot_config.api_version}}/me?fields=about,fan_count,description,general_info,link,rating_count,overall_star_rating,website",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{facebook_account_id}}}",
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
                    "var": "_response"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_128",
          "title": "Get page posts",
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
              "title": "Facebook API Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://graph.facebook.com/{{behavior_bot_config.api_version}}/me/posts",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{facebook_account_id}}}",
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
                    "var": "_response"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_129",
          "title": "Post to page",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_post_content": {
              "key": "var_post_content",
              "label": "Post Content",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "multiple"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Do we have post content?",
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
                            "condition": "var_post_content",
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
                      "title": "Facebook API Request",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "core.va.action.http_request",
                            "http_verb": "post",
                            "http_url": "https://graph.facebook.com/{{behavior_bot_config.api_version}}/me/feed",
                            "http_headers": "",
                            "http_body": "{% set data = {\r\n \"message\": \"{{var_post_content}}\"\r\n}%}\r\n{{data|url_encode}}",
                            "auth": "connected_account",
                            "auth_connected_account_id": "{{{facebook_account_id}}}",
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
                            "var": "_response"
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

You'll be prompted to link the Facebook Page connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/facebook-page-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Facebook Page Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/facebook-page-bot/bot.png" class="screenshot">
</div>

Open the card for the **Get page info** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/facebook-page-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response with fields from your linked Facebook page.

<div class="cerb-screenshot">
<img src="/assets/images/packages/facebook-page-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other two behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Facebook's Graph API](https://developers.facebook.com/docs/graph-api) in your behaviors.

Use [Facebook's Graph API Explorer](https://developers.facebook.com/tools/explorer/) to build your API calls, and then copy the details into an **Execute HTTP Request** action in your bot behavior.