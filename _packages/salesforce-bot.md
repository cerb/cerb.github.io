---
title: Salesforce Bot
excerpt: A bot demonstrating integration between Cerb and Salesforce.
layout: integration
topic: Packages
permalink: /packages/salesforce-bot/
jumbotron:
  title: Salesforce Bot
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

This package creates **Salesforce Bot** for demonstrating integration between Cerb and the [Salesforce API](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/salesforce/plugin/cerb-and-salesforce.png" class="screenshot">
</div>

# Configure the Salesforce service

If you haven't already, follow [these instructions](/guides/integrations/salesforce/) to configure the Salesforce service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Salesforce Bot",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Salesforce Account:",
          "key": "salesforce_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:salesforce"
          }
        },
        {
          "type": "text",
          "label": "Salesforce Instance:",
          "key": "salesforce_instance",
          "params": {
            "placeholder": "(e.g. na55)"
          }
        }
      ],
      "placeholders": [

      ]
    }
  },
  "bots": [
    {
      "uid": "bot_38",
      "name": "Salesforce Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": {
          "instance": "{{{salesforce_instance}}}",
          "api_version": "v40.0"
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
      "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAAk1BMVEX///8AnNsAmtr6/f/+/v/3/P4AmdoRod1WvufP7fgzsOIZpN7o9vzT7vmQ0+9AsuMyreEhqN8LntwFndz0+/3u+f3r9/zk9fur3vOh2vKb2PGAzO13yOtjwelSuuYpqeDg8/vb8frI6vfB5/az4fSW1vCDzu19y+xbvudIt+S+5fa24/Wz3/SY1fCI0e5EteQ7sOLXaIOzAAACLklEQVRo3u3X2XKqQBRG4fU3BGI0jpknMw9nfv+nO21aaKNgBG2qkuK7EKGRJbu0Smm1Wq1W62t7ljOOCeRNHxBAV9bazEgzN9SnIoZMvIObfFWJsrdAdalKYRmtqD61qdYAFaOSU9VDFaorfMO64l0/TZLkKg4U0fK3K0CjyFnIiEeBFyl8RgE0ElEjETUSUSOR1/ARq5GIvk9ETUcOVKws39n4jfXwqkVOAKPN1I5UmW9Rw5Rfza/SqRFRJna7Y2YO55FbrEl2/nwzdRtbjbjHVruLq6uRSBnDsczdo8RIBlzkArIdoxRpCMOhIHLrkX22L8HIGCN40xWsRJS7ZKzchIGykK30/ewge5gQ28ipH6yxB6TVyNIAp35pfx7Zs0DAcR4x4J7aiPx1799PjpcjWmSwUg3g7oePONIJ5DeREBVFIpx1Eesa3CuSPCIPzu3Cs6TiO7lgoEVlP6NLI/uy6OkCk131J/088kduWxBZPvAQg06h02MeMViuFj366hCOcJ8uP5bbbF5rIjqcH3rC2vMzIa+l/oPkTskiit3+COtMmb/AWNWBNoel6m64llchEuxF53UjqoAZhfXQRIQGIjQQiQhfOSN85BfhI9/kX8MRhK7EWCEryTGFOtrebz7T09bYQMiG9y9kw7sM2/Be0kn3CVUTU4c+cd5Z+tqFqLjppkm3zxZSrXPCbmgdCF+B8BUIX4HwFXbtMHxiNUMw0eBg5ppWq9VqfVH/Ab6NHLHV3NfdAAAAAElFTkSuQmCC",
      "behaviors": [
        {
          "uid": "behavior_214",
          "title": "Create account record",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_name": {
              "key": "var_name",
              "label": "Name",
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
              "title": "Execute HTTP request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "{# See: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_sobject_create.htm #}\r\nhttps://{{behavior_bot_config.instance}}.salesforce.com/services/data/{{behavior_bot_config.api_version}}/sobjects/Account/",
                    "http_headers": "Content-Type: application/json",
                    "http_body": "{% set json = {\r\n\t\"name\": var_name\r\n} %}\r\n{{json|json_encode|json_pretty}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
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
          "uid": "behavior_210",
          "title": "Get account record",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_account_id": {
              "key": "var_account_id",
              "label": "Account ID",
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
              "title": "Call to Salesforce API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "fields"
                  },
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "https://{{behavior_bot_config.instance}}.salesforce.com/services/data/{{behavior_bot_config.api_version}}/sobjects/Account/{{var_account_id}}?fields=Id,Name",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
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
          "uid": "behavior_211",
          "title": "Get Salesforce versions info",
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
              "title": "Call to Salesforce API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_versions.htm #}\r\nhttps://{{behavior_bot_config.instance}}.salesforce.com/services/data",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
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
          "uid": "behavior_213",
          "title": "List account records",
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
              "title": "Execute HTTP request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "SELECT id, name FROM Account",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "query"
                  },
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_query.htm #}\r\nhttps://{{behavior_bot_config.instance}}.salesforce.com/services/data/{{behavior_bot_config.api_version}}/query/?q={{query|url_encode}}",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
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
          "uid": "behavior_212",
          "title": "List resources",
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
              "title": "Call to Salesforce API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "get",
                    "http_url": "{# See: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_discoveryresource.htm #}\r\nhttps://{{behavior_bot_config.instance}}.salesforce.com/services/data/v40.0/",
                    "http_headers": "",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
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
          "uid": "behavior_215",
          "title": "Update account record",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_id": {
              "key": "var_id",
              "label": "ID",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_fields_json": {
              "key": "var_fields_json",
              "label": "Fields JSON",
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
              "title": "Execute HTTP request",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "patch",
                    "http_url": "{# See: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_update_fields.htm #}\r\nhttps://{{behavior_bot_config.instance}}.salesforce.com/services/data/{{behavior_bot_config.api_version}}/sobjects/Account/{{var_id}}",
                    "http_headers": "Content-Type: application/json",
                    "http_body": "{{var_fields_json|json_pretty}}",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{salesforce_account_id}}}",
                    "options": {
                      "raw_response_body": "1"
                    },
                    "run_in_simulator": "1",
                    "response_placeholder": "_http_response"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "HTTP Status: {{_http_response.info.http_code}}\r\nBody: \r\n{{_http_response.body}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "response"
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

You'll be prompted to link the Salesforce connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/salesforce-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **Salesforce Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/salesforce-bot/bot.png" class="screenshot">
</div>

Open the card for the **List account records** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/salesforce-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response with account records.

<div class="cerb-screenshot">
<img src="/assets/images/packages/salesforce-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from the [Salesforce API](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest) in your behaviors.