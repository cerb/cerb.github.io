---
title: Mention Bot
excerpt: A bot that sends email notifications to workers when @mentioned in comments.
layout: integration
topic: Packages
permalink: /packages/mention-bot/
jumbotron:
  title: Mention Bot
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

This package adds a new bot (**Mention Bot**) that automatically sends an email notification to a worker when they're `@mentioned` in a comment.

<div class="cerb-screenshot">
<img src="/assets/images/packages/mention-bot/behavior.png" class="screenshot">
</div>

# Importing the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Mention Bot",
    "cerb_version": "8.0.4",
    "revision": 1,
    "requires": {
      "cerb_version": "8.0.0",
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
      "uid": "bot_29",
      "name": "Mention Bot",
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
            "event.macro.worker",
            "event.record.changed"
          ]
        },
        "actions": {
          "mode": "allow",
          "items": [

          ]
        }
      },
      "image": "data:image/png;base64,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",
      "behaviors": [
        {
          "uid": "behavior_168",
          "title": "Relay new @mention notifications to worker email",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.record.changed",
            "label": "Record changed",
            "params": {
              "context": "cerberusweb.contexts.notification"
            }
          },
          "variables": {
            "var_comment": {
              "key": "var_comment",
              "label": "Comment",
              "type": "ctx_cerberusweb.contexts.comment",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Is a new comment notification?",
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
                            "condition": "old_notification_activity_point",
                            "oper": "is",
                            "value": ""
                          },
                          {
                            "condition": "notification_activity_point",
                            "oper": "is",
                            "value": "comment.create"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Load comment",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{% set ctx_url = json_decode(notification_event_json)['urls']['common.commented'] %}\r\n{% set ctx_id = ctx_url|split(':')[2] %}\r\n{{ctx_id}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "comment_id"
                          },
                          {
                            "action": "var_comment",
                            "search_mode": "quick_search",
                            "quick_search": "id:[{{comment_id|round}}]",
                            "limit": "first",
                            "limit_count": "1",
                            "mode": "replace",
                            "worklist_model": null
                          }
                        ]
                      }
                    },
                    {
                      "type": "switch",
                      "title": "Mentions this worker?",
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
                                    "tpl": "{% set comment = var_comment|first %}\r\n{% set mention = \"@\"~notification_assignee_at_mention_name %}\r\n{% if mention in comment.comment %}true{% endif %}",
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
                              "title": "Relay to worker email",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "_run_behavior",
                                    "on": "notification_assignee_id",
                                    "behavior_id": "{{{uid.behavior_169}}}",
                                    "var_subject": "New @mention in Cerb",
                                    "var_body": "{% set comment = var_comment|first %}\r\n{{notification_message}}:\r\n{{comment.comment}}\r\n\r\n{{notification_url_markread}}",
                                    "run_in_simulator": "0",
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
        },
        {
          "uid": "behavior_169",
          "title": "Send email to worker",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.worker",
            "label": "Custom behavior on worker"
          },
          "variables": {
            "var_subject": {
              "key": "var_subject",
              "label": "Subject",
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
              "title": "Send email",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_email",
                    "from_address_id": "0",
                    "to": "{{worker_address_address}}",
                    "cc": "",
                    "bcc": "",
                    "subject": "{{var_subject}}",
                    "html_template_id": "",
                    "format": "",
                    "content": "{{var_body}}",
                    "headers": ""
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

# Customizing the behavior

Click on the **Mention Bot** bubble:

<div class="cerb-screenshot">
<img src="/assets/images/packages/mention-bot/imported.png" class="screenshot">
</div>

Click the **Behaviors** button.

Click on **Relay new @mention notifications to worker email**.

Click on the **Relay to worker email** node and select **Edit** from the menu.

Modify the **Subject:** and **Body:** of the notification to suit your needs.

Click the **Save &amp; Close** button.