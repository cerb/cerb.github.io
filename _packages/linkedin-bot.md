---
title: LinkedIn Bot
excerpt: A bot demonstrating integration between Cerb and LinkedIn.
layout: integration
topic: Packages
permalink: /packages/linkedin-bot/
jumbotron:
  title: LinkedIn Bot
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

This package creates **LinkedIn Bot** for demonstrating integration between Cerb and the [LinkedIn API](https://developer.linkedin.com/docs/rest-api).

<div class="cerb-screenshot">
<img src="/assets/images/guides/linkedin/plugin/cerb-and-linkedin.png" class="screenshot">
</div>

# Configure the LinkedIn service

If you haven't already, follow [these instructions](/guides/integrations/linkedin/) to configure the LinkedIn service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "LinkedIn Bot",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "LinkedIn Account:",
          "key": "linkedin_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:linkedin"
          }
        }
      ],
      "placeholders": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_37",
      "name": "LinkedIn Bot",
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
      "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAAvVBMVEUAd7X////J4u+62us7lsaCvdvY6vTZ6/QgiL/E4O79/v8Debakz+UOf7plrdNap89Hncr1+vzt9vr6/f4yksQojcEUgrt9utp2tthSo81LoMs/mccbhr33+/zx+Pvn8vjh7/bT6PPi4uLP5vG01+qp0eaTxeAtj8Pd7fX09PTX6vTA3u2Wx+HT09MKfbgGe7erq6vp8/nj8fefzOOey+NytNZustU4lcWv1OiLwd2EvtzLy8vCwsK8vLyzs7NUqY0cAAAB+0lEQVRo3u3a127bMBSA4XPkDInae9qS90rtZne//2MVCBqJFGIEBXiEOuV/KV58gIBDAgQBB0gh/yrCgtUaZFdld4xDmOaZQJC+DDsk8IAmfdQhKxOIcoMWWQNV1bRFgC5NIQppGw4xq6gsn+MDJZI8LhrEyXxVHsmQ9d7Hl9jGNYmQ9RV2FTRIYjEO8UsSpJgg396mQB5QKCgokI2IhCkFgr1uzhZphvhdlogEOQWS+wJiJCTDuGScMfaAAoHomjNckwaBaD7Gl1jtmHRb/eW+RvSnlnekPLT0Ms+LyD7/4/c/RJIiWy0W1tc0j00iJH7wQ8YQkbEwnDqHv0AusY1bukAuBwDM+GaCQjsnkYzYzg77+VYsFTmkAb6RoctEMnwzZtnSkKcUTxS4pizEmOCpFrYshOHJxpEE5N2+DYE0QyCoS0W07CKO3CX2cuUhbOO9rtQolMpD5s/wWnGLfJY0JMi7obMt5DOkIV/4wXaE2byWhnjAVTYkyC3wxTsSxAI+fUqCZPRIf+CO2gAIGCSINwSiK0QhClGIQhTCIdtf9Mj254wemX36/JGRpys++FMkfK1ExOLXRj1k/GM2wC3R9vsZXEUpRCHvIhVQZc9bJAOqvLpF7nSgyb7HFmFLGsV+9DsEw5FbySe8e198S1RrI9kZzUd9FUXcb+/GLmYQp5QlAAAAAElFTkSuQmCC",
      "behaviors": [
        {
          "uid": "behavior_209",
          "title": "Post on company page",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_company_id": {
              "key": "var_company_id",
              "label": "Company ID",
              "type": "N",
              "is_private": "0",
              "params": [

              ]
            },
            "var_comment": {
              "key": "var_comment",
              "label": "Comment",
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
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "{# See: https://developer.linkedin.com/docs/company-pages#company_share #}\r\nhttps://api.linkedin.com/v1/companies/{{var_company_id}}/shares",
                    "http_headers": "Content-Type: application/json\r\nx-li-format: json",
                    "http_body": "{% set json = {} %}\r\n{% set json = dict_set(json, 'visibility.code', 'anyone') %}\r\n{% set json = dict_set(json, 'comment', var_comment) %}\r\n{{json|json_encode|json_pretty}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{linkedin_account_id}}}",
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
          "uid": "behavior_207",
          "title": "Show companies I'm an admin of",
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
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://developer.linkedin.com/docs/company-pages#list_companies #}\r\nhttps://api.linkedin.com/v1/companies?format=json&is-company-admin=true",
                    "http_headers": "x-li-format: json",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{linkedin_account_id}}}",
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
          "uid": "behavior_208",
          "title": "Show company profile",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_company_id": {
              "key": "var_company_id",
              "label": "Company ID",
              "type": "N",
              "is_private": "0",
              "params": [

              ]
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
                    "http_url": "{# See: https://developer.linkedin.com/docs/company-pages#company_profile #}\r\nhttps://api.linkedin.com/v1/companies/{{var_company_id}}:(id,name,description,website-url,logo-url,num-followers)",
                    "http_headers": "x-li-format: json",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{linkedin_account_id}}}",
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
          "uid": "behavior_206",
          "title": "Show my profile",
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
              "title": "Execute HTTP Request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://api.linkedin.com/v1/people/~",
                    "http_headers": "x-li-format: json",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{linkedin_account_id}}}",
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

You'll be prompted to link the LinkedIn connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/linkedin-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **LinkedIn Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/linkedin-bot/bot.png" class="screenshot">
</div>

Open the card for the **Show my profile** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/linkedin-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response with your profile information.

<div class="cerb-screenshot">
<img src="/assets/images/packages/linkedin-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [LinkedIn's API](https://developer.linkedin.com/docs/rest-api) in your behaviors.