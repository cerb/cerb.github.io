---
title: Configure webhooks
excerpt: Webhooks provide a way to trigger bot behaviors when external events occur in other applications and services.
layout: integration
topic: Webhooks
redirect_from:
  - /guides/webhooks/
jumbotron:
  title: Configure webhooks
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Webhooks &raquo;
    url: /resources/guides/#webhooks
---

* TOC
{:toc}

# Introduction

With Cerb, you can create [bot](/docs/bots) behaviors to automatically react to events taking place within the system -- a new assignment, a new incoming message, a task being completed, any record changing, etc.

**Webhooks**[^webhook] provide a way to trigger bot behaviors when _external events_ occur in other applications and services.

For instance:

* **Freshbooks** can trigger a webhook when you receive a new payment on an invoice.
* **GitHub** can trigger a webhook when an issue is updated on one of your projects.
* **Twilio** can trigger a webhook when a new call or text message is received.
* **Zapier** can trigger a webhook based on hundreds of different events.

A webhook is simply a special URL that accepts an HTTP POST[^http-post] with some data when an event occurs.

You can create webhook URLs in Cerb and associate them with specific bot behaviors.

# Enable the webhooks plugin

If you haven't already, you need to [install the webhooks plugin](/plugins/cerb.webhooks/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/configure/enable-plugin.png" class="screenshot">
</div>

# Import a bot behavior to handle the webhook

Navigate to **Setup >> Packages >> Import**.

Paste the following into the textbox:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Webhook Bot",
    "revision": 1,
    "requires": {
      "cerb_version": "8.1.4",
      "plugins": [
        "cerb.webhooks"
      ]
    },
    "configure": {
      "prompts": [],
      "placeholders": []
    }
  },
  "bots": [
    {
      "uid": "bot_webhook",
      "name": "Webhook Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": null,
        "events": {
          "mode": "allow",
          "items": [
            "event.webhook.received"
          ]
        },
        "actions": {
          "mode": "all",
          "items": []
        }
      },
      "image": "data:image/png;base64,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",
      "behaviors": [
        {
          "uid": "behavior_respond_webhook",
          "title": "Respond to webhook",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.webhook.received",
            "label": "Webhook received"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Send response",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "set_http_status",
                    "value": "200"
                  },
                  {
                    "action": "set_http_header",
                    "name": "X-Bot",
                    "value": "{{va_name}}"
                  },
                  {
                    "action": "set_http_header",
                    "name": "Content-Type",
                    "value": "application/json; charset=utf-8"
                  },
                  {
                    "action": "set_http_body",
                    "value": "{% set json = {} %}\r\n{% set json = dict_set(json, 'http.verb', http_verb) %}\r\n{% set json = dict_set(json, 'http.path', http_path) %}\r\n{% set json = dict_set(json, 'http.headers', http_headers) %}\r\n{% set json = dict_set(json, 'http.params', http_params) %}\r\n{% set json = dict_set(json, 'client.ip', http_client_ip) %}\r\n{% set json = dict_set(json, 'bot.name', va_name) %}\r\n{{json|json_encode|json_pretty}}"
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

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/configure/import-package.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/configure/import-success.png" class="screenshot">
</div>

# Create the webhook

1. Navigate to **Setup >> Services >> Webhooks**.  In Cerb [8.2](/releases/8.2/) or later you can also use **Search >> Webhooks**.

1. Click the **(+)** icon above the worklist.
	
	Name: `Webhook Example`
	Bot Behavior: **Webhook Bot >> Respond to webhook**
	
1. Click the **Save Changes** button.

1. Copy the webhook **URL** from the worklist.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/webhooks/configure/add-webhook.png" class="screenshot">
	</div>
	
# Test the webhook

### Testing in a web browser

Paste the URL into the location bar of your browser.  You'll see a JSON response.

You can append query parameters to the URL.  Try something like: `?name=Joe+Customer&age=37`

You'll see those keys and values show up in the `http.params` section.

### Testing with cURL

If you have access to the `curl` command at the console, you can send a `POST` request with a custom header and some query parameters:

<pre>
<code class="language-bash">
curl -i -X POST -H "X-CustomHeader: true" \
"https://cerb.example/webhooks/b5d89ded60c1e4da7b7b2750182e026a5b975cf3?key=value"
</code>
</pre>

You'll see these options reflected in the JSON response.

# Next steps

At this point you can do nearly anything with your webhook.

You can add new conditions and actions based on your needs.

You can register the URL with an external app or service so that it automatically triggers based on an external event.

# References

[^http-post]: Wikipedia: HTTP POST - <https://en.wikipedia.org/wiki/POST_(HTTP)>

[^webhook]: Wikipedia: Webhook - <https://en.wikipedia.org/wiki/Webhook>
