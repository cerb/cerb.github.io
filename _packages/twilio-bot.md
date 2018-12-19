---
title: Twilio Bot
excerpt: A bot demonstrating integration between Cerb and Twilio.
layout: integration
topic: Packages
permalink: /packages/twilio-bot/
jumbotron:
  title: Twilio Bot
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

This package creates **Twilio Bot** for demonstrating integration between Cerb and [Twilio's API](https://www.twilio.com/docs/api/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/twilio/plugin/cerb-and-twilio.png" class="screenshot">
</div>

# Configure the Twilio service

If you haven't already, follow [these instructions](/guides/integrations/twilio/) to configure the Twilio service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Twilio Bot",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Twilio account:",
          "key": "twilio_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:twilio"
          }
        },
        {
          "type": "text",
          "label": "Account SID:",
          "key": "account_sid",
          "params": {
          }
        },
        {
          "type": "text",
          "label": "Default responder phone number:",
          "key": "default_from",
          "params": {
          }
        }
      ],
      "placeholders": [
        {
          "type": "random",
          "key": "webhook_guid",
          "params": {
            "length": 40
          }
        }
      ]
    }
  },
  "bots": [
    {
      "uid": "bot_twilio",
      "name": "Twilio Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": {
          "account_sid": "{{{account_sid}}}",
          "default_from": "{{{default_from}}}"
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
      "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAAq1BMVEX////yL0b//f7yM0nzRFn4hpPzOU/94OT93OD7w8n4i5j80tf5naj4j5z2bH32Znf1YnT0TmH0S1/0R1zzNk3/+/v/+fn+6+7+5+n8zdP6tL36sbn5oaz4k5/3d4b1XW/zQFX+9ff+8/T+6uz95Of81dr7xcz7ucH6tr76q7T5l6L3gI73fIv2dIP1WWv0VGj+7O792d77vsb6qLH3foz2aXn0UmX+7e/zPVLh7snxAAADlElEQVRo3qxW2XaqQBCcYRMRFBI0ARTjFvd9Sf7/y+7hJsr0dENYrNfmUNNbdbGiGJtB2Ldi1zMMz42tfhiYY/ZMTKPNKyfwuommTyFQWo7Hc+A5LaUmxcHGKeCE7EMNinfd54Xg6+8VKd50lReGqr9VoBitDF4KxmpUtt2hxktDC0uNQMPlleA2iqfR93lF+P2CyXxdeQ1cv4pwzDReC9rsb46Tz2vCP/3FMc/ZjY9bJ7bsKLKtuHP7yNmZeT5HM4vjZb04SIqzWL9ksTTzOAKfZhiYjIQ5oHn8IJvD/OYEhk0lZ9ybQ07g28wUK0px9yh1VOI9pcwZUtYj3qRFSoHljTQi/x6jsCakdVzwNhOCvWYEIpxywAojwKWOCE1Eyt4uZRTGbaT9DVRX1BBdKXkddNQW+Q99LsFipWFxCX3pmhty25QKxmYtFwxe/q3cD6WSfZL7shWjLSm4G7FKGO04REsIdiS5FdNUpk37Mlgce2h5j4vBxW5OFbHskjh3MhNRP8Ukh3fmZVek6C7v/xuKz/1Us1KJMwera4lFnAr2WCyM1c0csfghjJDd66UcbVjGxmN1YVnaKUvPg1W5C6UNyYViDWRJ/uXvycI7EAoGIzb7AeRuC/1Asuf8BBwkpUJfYPberz3hAMf0cxfr8vv/GcKa67IHjjAyA89CiZgcY5UEVkTABKmg5L2sjtgcY5cEdkTAFrqC69WAN0RYrQ1lEZIAZTc2wvrC25KM5BmOCRQ0DIUxhRPYsqyhPKNfiS4jpixVEqDMWSy6HkSvAYfFUoCJAB9QZsthKeAHGmMTeA6B1+EYlyRwIQLAOcEjOZH+dAIaSDidIAkEhHcC6nmC/NLdhZZsyWV00tMAsYQ2UbrCOiwfgOJiA0JbG1e6pBrswRU+FGIiFWx+D8ylYk0YAEz1yvaQU0JDnBM1TAOhKo4cclg60G6Y2ApfbUd9pAmcutl5cDvYEaxgEwzYPozJwnKN2+Y8kwOz8+ZmuNYClIoaGQNub8iehBCqBGpsbeDB+FetHdgADMIwENx/a1YAEl2cCSq1JcT/Jg8hr4t8ePILk8NIxgoZkGTUk0uLXL9ikSArEVnuyJoqFm4SHUgIEnGOBFMSsQUsINhDAByCogRUI3hQgE6CbAV8FhhdCAGiNoSkEbpJiDOhAOdlZo+WzRDMdVWeI/1L9YW0IsZnpSSzHPNa88kuLN1Wr3aUyDrqcAepXmBt8Bq5hwAAAABJRU5ErkJggg==",
      "behaviors": [
        {
          "uid": "behavior_42",
          "title": "Look up a number",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_phone_number": {
              "key": "var_phone_number",
              "label": "Phone Number",
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
              "title": "Look up number via API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://lookups.twilio.com/v1/PhoneNumbers/{{var_phone_number|url_encode}}?Type=carrier&amp;Type=caller-name",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twilio_account_id}}}",
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
                    "var": "response"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_43",
          "title": "Respond to Twilio SMS webhook",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.webhook.received",
            "label": "Webhook received"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Command:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "HELP",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "http_param",
                            "name": "body",
                            "oper": "is",
                            "value": "help"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Respond",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_http_body",
                            "value": "{% set msg = \"You can say:\\n* HELP\\n* LOGO\\n* LINK\\n\" %}\r\n&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;\r\n&lt;Response&gt;\r\n    &lt;Message&gt;{{msg|escape}}&lt;/Message&gt;\r\n&lt;/Response&gt;"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "LOGO",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "http_param",
                            "name": "body",
                            "oper": "is",
                            "value": "logo"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Respond",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_http_body",
                            "value": "&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;\r\n&lt;Response&gt;\r\n    &lt;Message&gt;\r\n    \tHere's the Cerb logo:\r\n    &lt;/Message&gt;\r\n    &lt;Message&gt;\r\n    \t&lt;Media&gt;https://cerb.ai/assets/images/home/cerby.png&lt;/Media&gt;\r\n    &lt;/Message&gt;\r\n&lt;/Response&gt;"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "LINK",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "http_param",
                            "name": "body",
                            "oper": "is",
                            "value": "link"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Respond",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_http_body",
                            "value": "&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;\r\n&lt;Response&gt;\r\n    &lt;Message&gt;\r\n    \tVisit https://cerb.ai/ for more info.\r\n    &lt;/Message&gt;\r\n&lt;/Response&gt;"
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
                      "title": "Respond",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_http_body",
                            "value": "{% set msg = \"Hi \" ~ http_params.from ~ \"! You said: \" ~ http_params.body %}\r\n&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;\r\n&lt;Response&gt;\r\n    &lt;Message&gt;{{msg|escape}}&lt;/Message&gt;\r\n&lt;/Response&gt;"
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
          "uid": "behavior_41",
          "title": "Send SMS message",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_to": {
              "key": "var_to",
              "label": "To",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_body": {
              "key": "var_body",
              "label": "Body",
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
              "title": "Send message via API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "https://api.twilio.com/2010-04-01/Accounts/{{behavior_bot_config.account_sid}}/Messages",
                    "http_headers": "",
                    "http_body": "{% set params = {\r\n\t\"To\": var_to,\r\n\t\"From\": behavior_bot_config.default_from,\r\n\t\"Body\": var_body\r\n} %}\r\n{{params|url_encode}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{twilio_account_id}}}",
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
  ],
  "records": [
    {
      "uid": "webhook_twilio_bot",
      "_context": "webhook_listener",
      "name": "Twilio SMS Received",
      "guid": "{{{webhook_guid|lower}}}",
      "extension_id": "cerb.webhooks.listener.engine.va",
      "extension_params": {
        "behavior_id": "{{{uid.behavior_43}}}"
      }
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll be prompted for some configuration options:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/import.png" class="screenshot">
</div>

* **Twilio account:** The Twilio [connected account](/docs/connected-accounts/) you created earlier.
* **Account SID:** Your Twilio account SID (from your Twilio dashboard).
* **Default responder phone number:** The default phone number to use when sending SMS messages. This should be formatted as an E.164 number, like `+15551234567`. This number must exist in your Twilio account.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Twilio Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/bot.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/bot-behaviors.png" class="screenshot">
</div>

## Looking up a phone number

You can use Twilio's [Lookup API](https://www.twilio.com/docs/api/lookups) to retrive caller and carrier information about a phone number.

Open the card for the **Look up a number** behavior:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/behavior-lookup.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-lookup.png" class="screenshot">
</div>

Enter your mobile number in **Phone Number:** field (in E.164 format) and click the **Simulate** button.

At the bottom of the simulator output, in the **Set custom placeholder** section, you'll find the results of the lookup:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-lookup-output.png" class="screenshot">
</div>

## Sending a text message

Open the card for the **Send SMS message** behavior:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/behavior-send-sms.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/simulate-send-sms.png" class="screenshot">
</div>

Enter your mobile number in **To:**, a message in **Body:**, and then click the **Simulate** button.

You should receive a text message on your mobile phone.

<div class="cerb-box note">
<p>If you don't receive a text message, you can check the logs and debugger in Twilio. The bot simulator also provides debug output.</p>
</div>

## Receiving text messages

The package above automatically created a [webhook](/docs/webhooks/) for you and linked it to the **Respond to Twilio SMS webhook** bot behavior.  Let's copy this URL so we can add it to Twilio:

1. Log in to Cerb.

1. Navigate to **Search >> Webhooks**:

	<div class="cerb-screenshot">
	<img src="/assets/images/packages/twilio-bot/search-webhooks.png" class="screenshot">
	</div>
	
1. Copy the **URL** for the **Twilio SMS Received** webhook. (You can right-click the URL in your browser and select **Copy Link** from the menu.)

When you provision a phone number at Twilio, you can configure a webhook URL to handle inbound text messages.

1. Log in to [Twilio's phone number console](https://www.twilio.com/console/phone-numbers/incoming).

1. Provision a new phone number, or select an existing one.

1. Under the **Configure** tab, in the **Messaging** section, make sure **Webhook** is selected, then paste the Cerb webhook URL from above:

	<div class="cerb-screenshot">
	<img src="/assets/images/packages/twilio-bot/twilio-number-messaging.png" class="screenshot">
	</div>

1. Click the red **Save** button at the bottom of the page.

You should now be able to send text messages to that number and have a Cerb bot respond.

We've set up a few examples. Try sending the following messages:

* `hi`
* `help`
* `link`
* `logo`

The bot will respond:

<div class="cerb-screenshot">
<img src="/assets/images/packages/twilio-bot/twilio-bot-sms.png" class="screenshot">
</div>

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [Twilio's API](https://www.twilio.com/docs/api/) in your behaviors.

