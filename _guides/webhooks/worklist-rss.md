---
title: Generate an RSS feed for any worklist
excerpt: This page provides a detailed guide on generating an RSS feed for any worklist
  in Cerb using a bot and webhook listener.
summary: This page provides a detailed guide on generating an RSS feed for any worklist
  in Cerb using a bot and webhook listener. It outlines the steps to enable the Webhooks
  plugin, create a bot behavior to handle webhook events, and set up a new webhook
  in Cerb. The guide explains how to configure the bot to output worklist data in
  RSS format, allowing users to monitor updates through third-party tools like RSS
  readers or services like Zapier. The process is designed to simplify monitoring
  worklist records without requiring complex REST API integrations. The page also
  suggests potential applications for this setup, such as creating RSS feeds for notifications
  or daily tasks.
permalink: /guides/webhooks/worklist-rss/
layout: integration
topic: Webhooks
jumbotron:
  title: Generate an RSS feed for any worklist
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Webhooks &raquo;
    url: /resources/guides/#webhooks
---

## Introduction
{:.no_toc}

Let's assume that you want to monitor the records in a Cerb worklist from a third-party app or service.  You could use the REST API, but that requires worker authentication and custom code that you need to host somewhere.

An alternative, simpler approach is to use a Cerb bot to display any worklist in RSS[^rss] format. Many tools already exist to monitor an RSS feed for new content. Zapier[^zapier-rss] can run actions based on new RSS feed items. You can even subscribe to RSS feeds within Outlook.

We'll host this RSS feed on a custom URL in Cerb using a webhook[^webhook] listener.

* TOC
{:toc}

## Enable the Webhooks plugin in Cerb

If the webhooks plugin isn't already enabled, install it from the [Plugin Library](/docs/plugins/#library).

## Create the bot behavior in Cerb

Once the Webhooks plugin is enabled, you'll be able to create new bot behaviors on the **Webhook received** event.

First, let's create a new bot to keep things organized.

Navigate to **Search** &raquo; **Bots** and click the **(+)** icon in the blue bar to add a new record.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/worklist-rss/create_va.png" class="screenshot">
</div>

(You can [find an RSS icon on Google Images](https://images.google.com/?q=rss+icon))

Click the **Save Changes** button.  Then click your new bot in the worklist to view its profile.

On the **Behaviors** tab, click the **Create Behavior** button.

Select the **Import** tab and paste the following behavior to import it:

{% highlight json %}
{% raw %}
{
  "behavior":{
    "title":"New tickets as RSS",
    "is_disabled":false,
    "is_private":false,
    "event":{
      "key":"event.webhook.received",
      "label":"Webhook received"
    },
    "variables":{
      "var_new_tickets":{
        "key":"var_new_tickets",
        "label":"New Tickets",
        "type":"ctx_cerberusweb.contexts.ticket",
        "is_private":"1",
        "params":[
          
        ]
      }
    },
    "nodes":[
      {
        "type":"action",
        "title":"Load a page of new tickets",
        "params":{
          "actions":[
            {
              "action":"var_new_tickets",
              "search_mode":"quick_search",
              "quick_search":"status:o",
              "limit":"first",
              "limit_count":"20",
              "mode":"add",
              "worklist_model":{
                "options":{
                  "disable_recommendations":"1"
                },
                "columns":[
                  "t_group_id",
                  "t_bucket_id",
                  "t_owner_id",
                  "t_updated_date"
                ],
                "params":{
                },
                "limit":10,
                "sort_by":"t_updated_date",
                "sort_asc":false,
                "subtotals":"",
                "context":"cerberusweb.contexts.ticket"
              }
            }
          ]
        }
      },
      {
        "type":"action",
        "title":"Output RSS",
        "params":{
          "actions":[
            {
              "action":"set_http_header",
              "name":"Content-Type",
              "value":"application\/rss+xml; charset=utf-8"
            },
            {
              "action":"set_http_body",
              "value":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<rss version=\"2.0\" xmlns:atom=\"http:\/\/www.w3.org\/2005\/Atom\">\r\n  <channel>\r\n    <title>Recently updated tickets in Cerb<\/title>\r\n    <description>Tickets that need worker attention<\/description>\r\n    <link>https:\/\/example.com\/<\/link>\r\n    <atom:link href=\"https:\/\/example.com\/feed.xml\" rel=\"self\" type=\"application\/rss+xml\"\/>\r\n    <pubDate>{{''|date('r')}}<\/pubDate>\r\n    <lastBuildDate>{{''|date('r')}}<\/lastBuildDate>\r\n    <generator>Cerb<\/generator>\r\n    {% for ticket in var_new_tickets %}\r\n      <item>\r\n        <title>{{ ticket.subject | e }}<\/title>\r\n        <description><![CDATA[\r\n            <p>\r\n              <b>Sender:<\/b> {{ ticket.latest_message_sender__label | e}}\r\n            <\/p>\r\n            <p>\r\n              <b>Bucket:<\/b> {{ticket.group__label | e}}: {{ticket.bucket__label | e}}\r\n            <\/p>\r\n            <p>\r\n              {{ ticket.latest_message_content | e | nl2br}}\r\n            <\/p>\r\n        ]]><\/description>\r\n        <pubDate>{{ ticket.updated | date('r') }}<\/pubDate>\r\n        <link>{{ ticket.url | e }}<\/link>\r\n        <guid isPermaLink=\"true\">{{ ticket.url | e }}<\/guid>\r\n      <\/item>\r\n    {% endfor %}\r\n  <\/channel>\r\n<\/rss>\r\n"
            }
          ]
        }
      }
    ]
  }
}
{% endraw %}
{% endhighlight %}

<div class="cerb-box note">
	<p>
		If you see a <tt>"Invalid event in the provided behavior"</tt> error, that usually means that the Webhooks plugin isn't enabled.
	</p>
</div>

You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/worklist-rss/va_behavior.png" class="screenshot">
</div>

By default, this behavior retrieves the 20 most recently updated open tickets.  You can edit the behavior to change the worklist type or filters.

Now we're ready to create the webhook that triggers this behavior.

## Create the new webhook in Cerb

Navigate to **Setup** &raquo; **Configure** &raquo; **Webhooks**.

Click the **(+)** icon in the blue bar of the worklist to create a new webhook.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/worklist-rss/create_webhook.png" class="screenshot">
</div>

Click the **Save Changes** button.

A new webhook will be added to the worklist.  You can copy the **URL** to your clipboard, since we'll be using it in the next step.

## Subscribe to the RSS feed from your third-party tool

Paste your new URL into an RSS reader (or parse it as XML[^xml] from any script).  You should see a list of records from the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/worklist-rss/newsflow_app.png" class="screenshot">
</div>

## Where to go from here

You can repeat this process to create RSS feeds for your notifications, daily tasks, etc.

## References

[^rss]: <https://en.wikipedia.org/wiki/RSS>
[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
[^zapier-rss]: <https://zapier.com/zapbook/rss/>
[^xml]: <https://en.wikipedia.org/wiki/XML>