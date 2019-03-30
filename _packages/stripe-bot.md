---
title: Stripe Bot
excerpt: A bot demonstrating integration between Cerb and Stripe.
layout: integration
topic: Packages
permalink: /packages/stripe-bot/
jumbotron:
  title: Stripe Bot
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

This package creates **Stripe Bot** for demonstrating integration between Cerb and [Stripe's API](https://stripe.com/docs/api/curl).

<div class="cerb-screenshot">
<img src="/assets/images/guides/stripe/plugin/cerb-and-stripe.png" class="screenshot">
</div>

# Configure the Stripe service

If you haven't already, follow [these instructions](/guides/integrations/stripe/) to configure the Stripe service and add your first connected account.

# Import the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Stripe",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Stripe Account:",
          "key": "stripe_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:stripe"
          }
        }
      ]
    },
    "placeholders": []
  },
  "bots": [
    {
      "uid": "bot_2",
      "name": "Stripe",
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
          "uid": "behavior_4",
          "title": "API: Create Coupon",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_customer_id": {
              "key": "var_customer_id",
              "label": "coupon_code",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_duration": {
              "key": "var_duration",
              "label": "duration",
              "type": "D",
              "is_private": "0",
              "params": {
                "options": "forever\r\nonce"
              }
            },
            "var_percent_off": {
              "key": "var_percent_off",
              "label": "percent_off",
              "type": "N",
              "is_private": "0",
              "params": []
            },
            "var_redeem_by": {
              "key": "var_redeem_by",
              "label": "redeem_by",
              "type": "E",
              "is_private": "0",
              "params": []
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "https://api.stripe.com/v1/coupons",
                    "http_headers": "",
                    "http_body": "id={{var_customer_id}}&duration={{var_duration}}&percent_off={{var_percent_off}}{% if var_redeem_by %}&redeem_by={{var_redeem_by}}{% endif %}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{stripe_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_2",
          "title": "API: Get Balance",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.stripe.com/v1/balance",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{stripe_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_3",
          "title": "API: List Charges",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_customer_id": {
              "key": "var_customer_id",
              "label": "customer_id",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_limit": {
              "key": "var_limit",
              "label": "limit",
              "type": "N",
              "is_private": "0",
              "params": []
            },
            "var_created_at": {
              "key": "var_created_at",
              "label": "created_at",
              "type": "E",
              "is_private": "0",
              "params": []
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.stripe.com/v1/charges?limit={{var_limit|default(10)}}{% if customer_id %}&customer={{var_customer_id}}{% endif %}{%if created_at %}&created={{var_created_at}}{% endif %}",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{stripe_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
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

You'll be prompted to link the Stripe connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/stripe-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Stripe Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/stripe-bot/bot.png" class="screenshot">
</div>

Open the card for the **API: Create Coupon** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/stripe-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response saying the coupon was created.

<div class="cerb-screenshot">
<img src="/assets/images/packages/stripe-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Stripe's API](https://stripe.com/docs/api/curl) in your behaviors.
