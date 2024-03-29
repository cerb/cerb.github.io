---
title: Customer Satisfaction Surveys
excerpt: Gather and monitor customer satisfaction metrics like NPS, CSAT, and CES.
layout: integration
topic: Packages
permalink: /packages/customer-satisfaction/
jumbotron:
  title: Customer Satisfaction Surveys
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

This package adds three custom fieldsets, a dashboard with several widgets, a bot, and a bot-powered community portal for tracking customer satisfaction metrics.

The following metrics are tracked:

- **Net Promoter Score (NPS)** - per contact, how likely your clients are to recommend your product/service to their friends and colleagues.
- **Customer Satisfaction (CSAT)** - at each response, how satisfied a client was with the interaction.
- **Customer Effort Score (CES)** - at resolution, how satisfied a client was with the entire process of resolving their issue.

# Installing the required plugin

Navigate to **Setup >> Plugins >> Plugin Library**.

Search for `bot portal`.

Click the **Download and install** link.

Click the **Download and install** button.

Select **Enabled** and click the **Save Changes** button.

# Importing the customer satisfaction package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Customer Satisfaction Workflow",
    "cerb_version": "9.0.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.0.0",
      "plugins": [
        "cerb.bots.portal.widget"
      ]
    },
    "configure": {
      "prompts": [
        {
          "type": "text",
          "label": "Product Name:",
          "key": "product_name",
          "params": {
            "placeholder": "Cerb"
          }
        }
      ],
      "placeholders": [
        {
          "type": "random",
          "key": "hmac_secret",
          "params": {
            "length": 16
          }
        }
      ]
    }
  },
  "custom_fieldsets": [
    {
      "uid": "fieldset_18",
      "name": "Net Promoter",
      "context": "cerberusweb.contexts.contact",
      "owner": {
        "context": "cerberusweb.contexts.bot",
        "id": "{{{uid.bot_62}}}"
      },
      "fields": [
        {
          "uid": "field_76",
          "name": "Rating",
          "type": "N",
          "params": [

          ]
        },
        {
          "uid": "field_77",
          "name": "Comment",
          "type": "S",
          "params": [

          ]
        },
        {
          "uid": "field_78",
          "name": "Date",
          "type": "E",
          "params": [

          ]
        },
        {
          "uid": "field_89",
          "name": "IP",
          "type": "S",
          "params": [

          ]
        }
      ]
    },
    {
      "uid": "fieldset_19",
      "name": "Customer Effort",
      "context": "cerberusweb.contexts.ticket",
      "owner": {
        "context": "cerberusweb.contexts.bot",
        "id": "{{{uid.bot_62}}}"
      },
      "fields": [
        {
          "uid": "field_83",
          "name": "Rating",
          "type": "N",
          "params": [

          ]
        },
        {
          "uid": "field_91",
          "name": "Comment",
          "type": "S",
          "params": [

          ]
        },
        {
          "uid": "field_80",
          "name": "Date",
          "type": "E",
          "params": [

          ]
        },
        {
          "uid": "field_90",
          "name": "IP",
          "type": "S",
          "params": [

          ]
        }
      ]
    },
    {
      "uid": "fieldset_20",
      "name": "Customer Satisfaction",
      "context": "cerberusweb.contexts.message",
      "owner": {
        "context": "cerberusweb.contexts.bot",
        "id": "{{{uid.bot_62}}}"
      },
      "fields": [
        {
          "uid": "field_82",
          "name": "Rating",
          "type": "N",
          "params": [

          ]
        },
        {
          "uid": "field_85",
          "name": "Comment",
          "type": "S",
          "params": [

          ]
        },
        {
          "uid": "field_84",
          "name": "Date",
          "type": "E",
          "params": [

          ]
        },
        {
          "uid": "field_88",
          "name": "IP",
          "type": "S",
          "params": [

          ]
        }
      ]
    }
  ],
  "bots": [
    {
      "uid": "bot_62",
      "name": "Satisfaction Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "image": "data:image/png;base64,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",
      "is_disabled": false,
      "params": {
        "config": {
          "hmac_secret": "{{{hmac_secret}}}",
          "portal_url": "{{{default.base_url}}}portal/satisfaction/"
        },
        "events": {
          "mode": "allow",
          "items": [
            "event.mail.reply.pre.ui.worker",
            "event.mail.before.sent",
            "event.interaction.chat.portal",
            "event.message.chat.portal",
            "event.macro.contact",
            "event.macro.message",
            "event.macro.ticket",
            "event.dashboard.widget.get_metric",
            "event.record.changed",
            "event.dashboard.widget.render"
          ]
        },
        "actions": {
          "mode": "all",
          "items": [

          ]
        }
      },
      "behaviors": [
        {
          "uid": "behavior_61",
          "title": "NPS: Get survey link for contact",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.macro.contact",
            "label": "Custom behavior on contact"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Return",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{% set hash = [contact_email_address]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{% set json = {} %}\r\n{% set url = behavior_bot_config.portal_url ~ \"nps?e=\" ~ contact_email_address ~ \"&s=\" ~ hash %}\r\n{% set json = dict_set(json, 'url', url) %}\r\n{{json|json_encode|json_pretty}}\r\n",
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
          "uid": "behavior_320",
          "title": "CES: Render recent ratings on dashboard",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.render",
            "label": "Render dashboard widget"
          },
          "variables": {
            "var_ratings": {
              "key": "var_ratings",
              "label": "Ratings",
              "type": "ctx_cerberusweb.contexts.ticket",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Find ratings",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "var_ratings",
                    "search_mode": "quick_search",
                    "quick_search": "customerEffort.rating:!null",
                    "limit": "first",
                    "limit_count": "10",
                    "mode": "replace",
                    "worklist_model": null
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Render",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "render_html",
                    "html": "{% set labels = [\r\n  \"\",\r\n  \"Strongly Disagree\",\r\n  \"Disagree\",\r\n  \"Somewhat Disagree\",\r\n  \"Undecided\",\r\n  \"Somewhat Agree\",\r\n  \"Agree\",\r\n  \"Strongly Agree\"\r\n] %}\r\n{% set colors = [\r\n  '#CF2C1D',\r\n  '#CF2C1D',\r\n  '#DE5714',\r\n  '#EE830C',\r\n  '#FEAF04',\r\n  '#CBAE06',\r\n  '#98AD0B',\r\n  '#66AD11'\r\n] %}\r\n{% for rating in var_ratings %}\r\n<div>\r\n<span style=\"float:left;display:inline-block;background-color:{{colors[rating.custom_{{{uid.field_83}}}]}};padding:5px 10px;text-align:center;font-weight:bold;color:white;border-radius:15px;margin:0px 5px 5px 0px;text-shadow:0px 0px 5px #666666;\">{{labels[rating.custom_{{{uid.field_83}}}]}}</span>\r\n{% if rating.custom_{{{uid.field_91}}} %}\r\n<i>\"{{rating.custom_{{{uid.field_91}}}}}\"</i> - \r\n{% endif %}\r\n<a href=\"javascript:;\" class=\"cerb-peek-trigger no-underline\" data-context=\"{{rating._context}}\" data-context-id=\"{{rating.id}}\"><b>{{rating.subject}}</b></a>\r\n<small style=\"color:gray;\">{{rating.custom_{{{uid.field_80}}}|date_pretty}}</small>\r\n</div>\r\n<br style=\"clear:both;\">\r\n{% endfor %}\r\n<a href=\"javascript:;\" class=\"cerb-search-trigger\" data-context=\"cerberusweb.contexts.ticket\" data-query=\"customerEffort.rating:!null\">see more...</a>\r\n\r\n<script type=\"text/javascript\">\r\n$(function() {\r\n  var $widget = $('#workspaceWidget{{widget_id}}');\r\n  $widget.find('.cerb-peek-trigger').cerbPeekTrigger();\r\n  $widget.find('.cerb-search-trigger').cerbSearchTrigger();\r\n});\r\n</script>"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_302",
          "title": "CES: Send CES survey to closed tickets",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.record.changed",
            "label": "Record changed",
            "params": {
              "context": "cerberusweb.contexts.ticket"
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Is the ticket being closed the first time?",
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
                            "condition": "ticket_status",
                            "oper": "is",
                            "value": "closed"
                          },
                          {
                            "condition": "old_ticket_status",
                            "oper": "!is",
                            "value": "closed"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Send CES survey to ticket opener",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{% set hash = [ticket_mask]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{% set link = behavior_bot_config.portal_url ~ \"ces?m=\" ~ ticket_mask ~ \"&s=\" ~ hash %}\r\n{{link}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "survey_link"
                          },
                          {
                            "action": "send_email",
                            "from_address_id": "0",
                            "to": "{{ticket_initial_message_sender_address}}",
                            "cc": "",
                            "bcc": "",
                            "subject": "How did we do?",
                            "html_template_id": "",
                            "format": "parsedown",
                            "content": "You recently contacted us.\r\n\r\nReference: #{{ticket_mask}}\r\nSubject: {{ticket_subject}}\r\n\r\n[How did we do?]({{survey_link}})\r\n\r\n-- \r\nSupport Team @ {{{product_name}}}",
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
        },
        {
          "uid": "behavior_319",
          "title": "CES: Set custom fieldset on ticket",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.ticket",
            "label": "Custom behavior on ticket"
          },
          "variables": {
            "var_rating": {
              "key": "var_rating",
              "label": "Rating",
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
                "widget": "single"
              }
            },
            "var_ip": {
              "key": "var_ip",
              "label": "IP",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Valid rating?",
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
                            "tpl": "{% if var_rating in range(1,7) %}true{% endif %}",
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
                      "title": "Set",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_cf_ticket_custom_{{{uid.field_83}}}",
                            "value": "{{var_rating}}"
                          },
                          {
                            "action": "set_cf_ticket_custom_{{{uid.field_80}}}",
                            "mode": "",
                            "value": "now",
                            "calendar_reldate": "",
                            "calendar_id": ""
                          },
                          {
                            "action": "set_cf_ticket_custom_{{{uid.field_90}}}",
                            "value": "{{var_ip}}"
                          }
                        ]
                      }
                    },
                    {
                      "type": "switch",
                      "title": "Comment?",
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
                                    "condition": "var_comment",
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
                              "title": "Set",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "set_cf_ticket_custom_{{{uid.field_91}}}",
                                    "value": "{{var_comment}}"
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
          "uid": "behavior_304",
          "title": "CES: Survey",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_mask": {
              "key": "var_mask",
              "label": "Mask",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_ticket": {
              "key": "var_ticket",
              "label": "Ticket",
              "type": "ctx_cerberusweb.contexts.ticket",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "lookupTicket()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "lookupTicket()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Summary",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "{% set ticket = var_ticket|first %}\r\nWe recently resolved your issue: **{{ticket.subject}}**",
                    "format": "markdown",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Made it easy...",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "To what extent do you agree or disagree with the following statement:\r\n\r\n### The {{{product_name}}} team made it easy to resolve my issue.",
                    "format": "markdown",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "Strongly Disagree\r\nDisagree\r\nSomewhat Disagree\r\nUndecided\r\nSomewhat Agree\r\nAgree\r\nStrongly Agree",
                    "color_from": "#FF1500",
                    "color_mid": "#FEAF03",
                    "color_to": "#57970A",
                    "style": "font-weight:500;text-shadow: 0px 0px 5px #444444;"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save rating",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{% set options = { \r\n\"Strongly Disagree\": 1,\r\n\"Disagree\": 2,\r\n\"Somewhat Disagree\": 3,\r\n\"Undecided\": 4,\r\n\"Somewhat Agree\": 5,\r\n\"Agree\": 6,\r\n\"Strongly Agree\": 7\r\n} %}\r\n{{options[message]}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_rating"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Improve?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "What could we improve?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(optional comment)"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save comment",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_comment"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Set custom fieldset on ticket",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "var_ticket",
                    "behavior_id": "{{{uid.behavior_319}}}",
                    "var_rating": "{{survey_rating}}",
                    "var_comment": "{{survey_comment}}",
                    "var_ip": "{{client_ip}}",
                    "run_in_simulator": "0",
                    "var": "_behavior"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Thanks!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Thanks for your feedback!",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "subroutine",
              "title": "lookupTicket()",
              "status": "live",
              "nodes": [
                {
                  "type": "action",
                  "title": "Look up ticket",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "var_ticket",
                        "search_mode": "quick_search",
                        "quick_search": "mask:\"{{var_mask|alphanum('-')|replace({'\"':''})}}\"",
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
                  "title": "Valid?",
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
                                "condition": "var_ticket",
                                "oper": "is",
                                "value": "1"
                              },
                              {
                                "condition": "_custom_script",
                                "tpl": "{% set ticket = var_ticket|first %}\r\n{% if ticket.mask is not empty and ticket.mask == var_mask %}true{% endif %}",
                                "oper": "is",
                                "value": "true"
                              }
                            ]
                          }
                        ]
                      }
                    },
                    {
                      "type": "outcome",
                      "title": "No",
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
                          "title": "Sorry",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Sorry, I can't find the ticket you're referring to.",
                                "format": "",
                                "delay_ms": "1000"
                              },
                              {
                                "action": "_exit",
                                "mode": ""
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
        },
        {
          "uid": "behavior_307",
          "title": "CSAT: Add a #survey-csat command to the outgoing message",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.mail.reply.pre.ui.worker",
            "label": "[UI] Before starting a message reply"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Add a #survey-csat command after #signature",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "exec_jquery",
                    "jquery_script": "var $reply = $(this);\r\nvar $form = {\r\n\tfields: $reply.find('form:nth(0)'),\r\n\tactions: $reply.find('form:nth(1)')\r\n};\r\n\r\nvar $textarea_reply = $form.actions.find('textarea[name=content]');\r\nvar txt = $textarea_reply.val();\r\n\r\nif(-1 == txt.indexOf('#survey-csat')) {\r\n  var find = \"#signature\";\r\n  var pos = txt.indexOf(find);\r\n  \r\n  $textarea_reply.setCursorLocation(pos + find.length);\r\n  $textarea_reply.insertAtCursor(\"\\n#survey-csat\");\r\n  $textarea_reply.setCursorLocation(0);\r\n}"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_318",
          "title": "CSAT: Render recent ratings on dashboard",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.render",
            "label": "Render dashboard widget"
          },
          "variables": {
            "var_ratings": {
              "key": "var_ratings",
              "label": "Ratings",
              "type": "ctx_cerberusweb.contexts.message",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Find recent ratings",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "var_ratings",
                    "search_mode": "quick_search",
                    "quick_search": "customerSatisfaction.rating:!null",
                    "limit": "first",
                    "limit_count": "10",
                    "mode": "replace",
                    "worklist_model": null
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Render",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "render_html",
                    "html": "{% set colors = ['#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#FEAF04','#FEAF04','#FEAF04','#FEAF04','#579709','#579709'] %}\r\n{% for rating in var_ratings %}\r\n<div>\r\n<span style=\"float:left;display:inline-block;background-color:{{colors[rating.custom_{{{uid.field_82}}}]}};line-height:30px;text-align:center;font-size:22px;font-weight:bold;color:white;width:30px;border-radius:15px;margin:0px 5px 5px 0px;\">{{rating.custom_{{{uid.field_82}}}}}</span>\r\n{{cerb_avatar_image('worker',rating.worker_id,rating.worker_updated)}} \r\n<a href=\"javascript:;\" class=\"cerb-peek-trigger no-underline\" data-context=\"{{rating.worker__context}}\" data-context-id=\"{{rating.worker_id}}\"><b>{{rating.worker__label}}</b></a>'s reply on <a href=\"javascript:;\" class=\"cerb-peek-trigger no-underline\" data-context=\"{{rating._context}}\" data-context-id=\"{{rating.id}}\"><b>{{rating.ticket__label}}</b></a>\r\n{% if rating.custom_{{{uid.field_85}}} %}\r\n- <i>\"{{rating.custom_{{{uid.field_85}}}}}\"</i> \r\n{% endif %}\r\n<small style=\"color:gray;\">{{rating.custom_{{{uid.field_84}}}|date_pretty}}</small>\r\n</div>\r\n<br style=\"clear:both;\">\r\n{% endfor %}\r\n<a href=\"javascript:;\" class=\"cerb-search-trigger\" data-context=\"cerberusweb.contexts.message\" data-query=\"customerSatisfaction.rating:!null\">see more...</a>\r\n\r\n<script type=\"text/javascript\">\r\n$(function() {\r\n  var $widget = $('#workspaceWidget{{widget_id}}');\r\n  $widget.find('.cerb-peek-trigger').cerbPeekTrigger();\r\n  $widget.find('.cerb-search-trigger').cerbSearchTrigger();\r\n});\r\n</script>"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_308",
          "title": "CSAT: Replace #survey-csat with a bot chat link",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.mail.before.sent",
            "label": "Before message sent from worker"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Generate survey link",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{% set message_hash = message_id|sha1[0:9] %}\r\n{% set hash = [ticket_mask,message_hash]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{% set link = behavior_bot_config.portal_url ~ \"csat?m=\" ~ ticket_mask ~ \"&i=\" ~ message_hash ~ \"&s=\" ~ hash %}\r\n{{link}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_link"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Add survey link to the outgoing message",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "replace_content",
                    "replace": "#survey-csat",
                    "with": "{% if content_format %}\r\n\r\n~~~~~~~~~~~~~~~~~~~~~~~~~\r\n[How did I do?]({{survey_link}})\r\n{% else %}\r\n\r\n~~~~~~~~~~~~~~~~~~~~~~~~~\r\nHow did I do? {{survey_link}}\r\n{% endif %}"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_316",
          "title": "CSAT: Set survey results on message custom fields",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.message",
            "label": "Custom behavior on message"
          },
          "variables": {
            "var_rating": {
              "key": "var_rating",
              "label": "Rating",
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
                "widget": "single"
              }
            },
            "var_ip": {
              "key": "var_ip",
              "label": "IP",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Have a valid rating?",
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
                            "tpl": "{% if var_rating in range(1,10) %}true{% endif %}",
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
                      "title": "Set",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_cf_custom_{{{uid.field_82}}}",
                            "value": "{{var_rating}}"
                          },
                          {
                            "action": "set_cf_custom_{{{uid.field_88}}}",
                            "value": "{{var_ip}}"
                          },
                          {
                            "action": "set_cf_custom_{{{uid.field_84}}}",
                            "mode": "",
                            "value": "now",
                            "calendar_reldate": "",
                            "calendar_id": ""
                          }
                        ]
                      }
                    },
                    {
                      "type": "switch",
                      "title": "Have a comment?",
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
                                    "condition": "var_comment",
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
                              "title": "Set",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "set_cf_custom_{{{uid.field_85}}}",
                                    "value": "{{var_comment}}"
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
          "uid": "behavior_310",
          "title": "CSAT: Survey",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_ticket_mask": {
              "key": "var_ticket_mask",
              "label": "Ticket Mask",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_message_id": {
              "key": "var_message_id",
              "label": "Message ID",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_message": {
              "key": "var_message",
              "label": "Message",
              "type": "ctx_cerberusweb.contexts.message",
              "is_private": "1",
              "params": [

              ]
            },
            "var_worker": {
              "key": "var_worker",
              "label": "Worker",
              "type": "ctx_cerberusweb.contexts.worker",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Hi!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Let me check my notes...",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_wait"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "loadMessage()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "loadMessage()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Summary",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "{% set message = var_message|first %}\r\n{{message.created|date_pretty}} you were assisted by **{{message.worker_first_name}}** regarding your issue **{{message.ticket_subject}}**.",
                    "format": "markdown",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Rating?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "How satisfied are you with the service you received?",
                    "format": "markdown",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "😀\r\n😐\r\n☹️",
                    "style": "font-size:48px;"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save rating",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{% set responses = {\"😀\":10,\"😐\":5,\"☹️\":1} %}\r\n{{responses[message]|default(0)}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_rating"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Comment?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "How can we improve?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(optional comment)"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save comment",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_comment"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Record answers on message",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "var_message",
                    "behavior_id": "{{{uid.behavior_316}}}",
                    "var_rating": "{{survey_rating}}",
                    "var_comment": "{{survey_comment}}",
                    "var_ip": "{{client_ip}}",
                    "run_in_simulator": "0",
                    "var": "_behavior"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Thanks!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Thanks for your feedback!",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "subroutine",
              "title": "loadMessage()",
              "status": "live",
              "nodes": [
                {
                  "type": "action",
                  "title": "Find message",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "_set_custom_var",
                        "value": "{% set query = {\r\n\"mask\": var_ticket_mask|alphanum('-'),\r\n\"message_id\": var_message_id|replace({'\"':''})\r\n}\r\n%}\r\nticket:(mask:\"{{query.mask}}\") header.messageId:\"{{query.message_id}}*\"",
                        "format": "",
                        "is_simulator_only": "0",
                        "var": "q"
                      },
                      {
                        "action": "var_message",
                        "search_mode": "quick_search",
                        "quick_search": "{{q}}",
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
                  "title": "Found it?",
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
                                "tpl": "{% set message = var_message|first %}\r\n{% if message.ticket_mask is not empty and message.ticket_mask == var_ticket_mask %}true{% endif %}",
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
                          "title": "Set worker",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "var_worker",
                                "search_mode": "quick_search",
                                "quick_search": "{% set message = var_message|first %}\r\nid:{{message.worker_id}}",
                                "limit": "first",
                                "limit_count": "1",
                                "mode": "replace",
                                "worklist_model": {
                                  "options": [

                                  ],
                                  "columns": [
                                    "w_title",
                                    "a_address_email",
                                    "w_is_superuser",
                                    "w_at_mention_name",
                                    "w_language",
                                    "w_timezone"
                                  ],
                                  "params": {
                                    "591363f11e640": {
                                      "field": "w_id",
                                      "operator": "=",
                                      "value": "0"
                                    }
                                  },
                                  "limit": 10,
                                  "sort_by": "w_first_name",
                                  "sort_asc": true,
                                  "subtotals": "",
                                  "context": "cerberusweb.contexts.worker"
                                }
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "No",
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
                          "title": "Oops!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Sorry! I can't find the conversation you're looking for.",
                                "format": "",
                                "delay_ms": "1000"
                              },
                              {
                                "action": "_exit",
                                "mode": ""
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
        },
        {
          "uid": "behavior_298",
          "title": "NPS: Render colored NPS score on dashboard",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.render",
            "label": "Render dashboard widget"
          },
          "variables": {
            "var_contacts": {
              "key": "var_contacts",
              "label": "Contacts",
              "type": "ctx_cerberusweb.contexts.contact",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Calculate NPS",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:!null",
                    "metric_func": "count",
                    "metric_field": "c_id",
                    "var": "total_ratings"
                  },
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:>8",
                    "metric_func": "count",
                    "metric_field": "cf_{{{uid.field_76}}}",
                    "var": "total_promoters"
                  },
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:<7",
                    "metric_func": "count",
                    "metric_field": "c_id",
                    "var": "total_detractors"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{% if total_ratings > 0 %}\r\n{{(((total_promoters / total_ratings) - (total_detractors / total_ratings)) * 100)|round}}\r\n{% else %}\r\n0\r\n{% endif %}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "nps"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Render",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{% if nps < 0 %}\r\nrgb(120,0,0);\r\n{% elseif nps < 50 %}\r\nrgb(245,190,40);\r\n{% else %}\r\nrgb(90,190,0);\r\n{% endif %}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "color"
                  },
                  {
                    "action": "render_html",
                    "html": "<div style=\"font-size:36px;font-weight:bold;text-align:center;color:{{color}};\">\r\n{{nps}}\r\n</div>"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_300",
          "title": "NPS: Render recent ratings on dashboard",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.render",
            "label": "Render dashboard widget"
          },
          "variables": {
            "var_ratings": {
              "key": "var_ratings",
              "label": "Ratings",
              "type": "ctx_cerberusweb.contexts.contact",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "Find recent ratings",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "var_ratings",
                    "search_mode": "quick_search",
                    "quick_search": "netPromoter.rating:!null",
                    "limit": "first",
                    "limit_count": "10",
                    "mode": "replace",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "cf_{{{uid.field_78}}}",
                        "cf_{{{uid.field_76}}}",
                        "cf_{{{uid.field_77}}}"
                      ],
                      "params": {
                        "590a1e055d24e": {
                          "field": "cf_{{{uid.field_76}}}",
                          "operator": "is not null",
                          "value": null
                        }
                      },
                      "limit": 10,
                      "sort_by": "cf_{{{uid.field_78}}}",
                      "sort_asc": false,
                      "subtotals": "",
                      "context": "cerberusweb.contexts.contact"
                    }
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Render",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "render_html",
                    "html": "{% set colors = ['#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#CF2C1D','#FEAF04','#FEAF04','#579709','#579709'] %}\r\n{% for rating in var_ratings %}\r\n<div>\r\n<span style=\"float:left;display:inline-block;background-color:{{colors[rating.custom_{{{uid.field_76}}}]}};line-height:30px;text-align:center;font-size:22px;font-weight:bold;color:white;width:30px;border-radius:15px;margin:0px 5px 5px 0px;\">{{rating.custom_{{{uid.field_76}}}}}</span>\r\n{{cerb_avatar_image('contact',rating.id,rating.updated)}} \r\n<a href=\"javascript:;\" class=\"cerb-peek-trigger no-underline\" data-context=\"{{rating._context}}\" data-context-id=\"{{rating.id}}\"><b>{{rating._label}}</b></a>\r\n{% if rating.custom_{{{uid.field_77}}} %}\r\n said, \r\n<i>\"{{rating.custom_{{{uid.field_77}}}}}\"</i> \r\n{% endif %}\r\n<small style=\"color:gray;\">{{rating.custom_{{{uid.field_78}}}|date_pretty}}</small>\r\n</div>\r\n<br style=\"clear:both;\">\r\n{% endfor %}\r\n<a href=\"javascript:;\" class=\"cerb-search-trigger\" data-context=\"cerberusweb.contexts.contact\" data-query=\"netPromoter.rating:!null\">see more...</a>\r\n\r\n<script type=\"text/javascript\">\r\n$(function() {\r\n  var $widget = $('#workspaceWidget{{widget_id}}');\r\n  $widget.find('.cerb-peek-trigger').cerbPeekTrigger();\r\n  $widget.find('.cerb-search-trigger').cerbSearchTrigger();\r\n});\r\n</script>"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_299",
          "title": "NPS: Return Net Promoter Score for dashboards",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.dashboard.widget.get_metric",
            "label": "Get metric for dashboard widget"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Calculate NPS",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:!null",
                    "metric_func": "count",
                    "metric_field": "c_id",
                    "var": "total_ratings"
                  },
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:>8",
                    "metric_func": "count",
                    "metric_field": "cf_{{{uid.field_76}}}",
                    "var": "total_promoters"
                  },
                  {
                    "action": "_get_worklist_metric",
                    "context": "cerberusweb.contexts.contact",
                    "query": "netPromoter.rating:<7",
                    "metric_func": "count",
                    "metric_field": "c_id",
                    "var": "total_detractors"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{% if total_ratings > 0 %}\r\n{{(((total_promoters / total_ratings) - (total_detractors / total_ratings)) * 100)|round}}\r\n{% else %}\r\n0\r\n{% endif %}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "nps"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Return NPS",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "return_value",
                    "value": "{{nps}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_315",
          "title": "NPS: Set survey custom fields on contact record",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.contact",
            "label": "Custom behavior on contact"
          },
          "variables": {
            "var_score": {
              "key": "var_score",
              "label": "Score",
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
                "widget": "single"
              }
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Rating?",
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
                            "tpl": "{{var_score|length}}",
                            "oper": "!is",
                            "value": "0"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Set rating",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "set_cf_contact_custom_{{{uid.field_76}}}",
                            "value": "{{var_score}}"
                          },
                          {
                            "action": "set_cf_contact_custom_{{{uid.field_78}}}",
                            "mode": "",
                            "value": "now",
                            "calendar_reldate": "",
                            "calendar_id": ""
                          }
                        ]
                      }
                    },
                    {
                      "type": "switch",
                      "title": "Comment?",
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
                                    "tpl": "{{var_comment|length}}",
                                    "oper": "!is",
                                    "value": "0"
                                  }
                                ]
                              }
                            ]
                          },
                          "nodes": [
                            {
                              "type": "action",
                              "title": "Set comment",
                              "status": "live",
                              "params": {
                                "actions": [
                                  {
                                    "action": "set_cf_contact_custom_{{{uid.field_77}}}",
                                    "value": "{{var_comment}}"
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
          "uid": "behavior_297",
          "title": "NPS: Survey",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "variables": {
            "var_email": {
              "key": "var_email",
              "label": "Email",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_contact": {
              "key": "var_contact",
              "label": "Contact",
              "type": "ctx_cerberusweb.contexts.contact",
              "is_private": "1",
              "params": [

              ]
            }
          },
          "nodes": [
            {
              "type": "action",
              "title": "loadContact()",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_subroutine",
                    "subroutine": "loadContact()"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "How likely...?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "How likely are you to recommend {{{product_name}}} to your friends and colleagues?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_rating_number",
                    "range_from": "0",
                    "color_from": "#CF2C1D",
                    "label_from": "Not likely",
                    "range_to": "10",
                    "color_to": "#57970A",
                    "label_to": "Extremely likely",
                    "color_mid": "#FEAF03"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save rating",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message|split('/')|first}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_rating"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Why?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Why do you feel that way?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(optional comment)"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save comment",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "survey_comment"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Set fields on contact",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "var_contact",
                    "behavior_id": "{{{uid.behavior_315}}}",
                    "var_score": "{{survey_rating}}",
                    "var_comment": "{{survey_comment}}",
                    "run_in_simulator": "0",
                    "var": "_behavior"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Thanks",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Thanks! That's all for now.",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "subroutine",
              "title": "loadContact()",
              "status": "live",
              "nodes": [
                {
                  "type": "action",
                  "title": "Look up contact",
                  "status": "live",
                  "params": {
                    "actions": [
                      {
                        "action": "var_contact",
                        "search_mode": "quick_search",
                        "quick_search": "email:(email:\"{{var_email|replace({'\"':''})}}\")",
                        "limit": "first",
                        "limit_count": "10",
                        "mode": "replace",
                        "worklist_model": {
                          "options": [

                          ],
                          "columns": [
                            "c_primary_email_id",
                            "c_title",
                            "c_org_id",
                            "c_username",
                            "c_gender",
                            "c_location",
                            "c_language",
                            "c_timezone",
                            "c_updated_at",
                            "c_last_login_at"
                          ],
                          "params": {
                            "5912575134f7c": {
                              "field": "c_primary_email_id",
                              "operator": "=",
                              "value": "1"
                            }
                          },
                          "limit": 10,
                          "sort_by": "c_updated_at",
                          "sort_asc": false,
                          "subtotals": "",
                          "context": "cerberusweb.contexts.contact"
                        }
                      }
                    ]
                  }
                },
                {
                  "type": "switch",
                  "title": "Valid contact?",
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
                                "tpl": "{% set contact = var_contact|first %}\r\n{% if contact.email_address is not empty and contact.email_address == var_email %}true{% endif %}",
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
                          "title": "Hi!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "{% set contact = var_contact|first %}\r\n{% if contact.first_name %}\r\nHi, {{contact.first_name}}!\r\n{% else %}\r\nHi there!\r\n{% endif %}",
                                "format": "",
                                "delay_ms": "1000"
                              }
                            ]
                          }
                        }
                      ]
                    },
                    {
                      "type": "outcome",
                      "title": "No",
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
                          "title": "Sorry!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "send_message",
                                "message": "Sorry, I think you were given an invalid link.",
                                "format": "",
                                "delay_ms": "1000"
                              },
                              {
                                "action": "_exit",
                                "mode": ""
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
        },
        {
          "uid": "behavior_311",
          "title": "Portal: Sorry, invalid link",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.message.chat.portal",
            "label": "Conversation with portal visitor"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Sorry!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Sorry! It looks like you were given an invalid link.",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_309",
          "title": "Portal: Survey link clicked",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interaction.chat.portal",
            "label": "Conversation requested by portal visitor"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "CES",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "ces"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "verifySignature()",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{% set hash = [interaction_params.m]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{{hash}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "_signature"
                          },
                          {
                            "action": "_run_subroutine",
                            "subroutine": "verifySignature()"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Start CES survey",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_304}}}",
                            "var_mask": "{{interaction_params.m}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "CSAT",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "csat"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "verifySignature()",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{% set hash = [interaction_params.m,interaction_params.i]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{{hash}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "_signature"
                          },
                          {
                            "action": "_run_subroutine",
                            "subroutine": "verifySignature()"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Start CSAT survey",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_310}}}",
                            "var_ticket_mask": "{{interaction_params.m}}",
                            "var_message_id": "{{interaction_params.i}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                },
                {
                  "type": "outcome",
                  "title": "NPS",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "nps"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "verifySignature()",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "_set_custom_var",
                            "value": "{% set hash = [interaction_params.e]|join|hash_hmac(behavior_bot_config.hmac_secret)[26:18] %}\r\n{{hash}}",
                            "format": "",
                            "is_simulator_only": "0",
                            "var": "_signature"
                          },
                          {
                            "action": "_run_subroutine",
                            "subroutine": "verifySignature()"
                          }
                        ]
                      }
                    },
                    {
                      "type": "action",
                      "title": "Start NPS survey",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "behavior_id": "{{{uid.behavior_297}}}",
                            "var_email": "{{interaction_params.e}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "type": "subroutine",
              "title": "verifySignature()",
              "status": "live",
              "nodes": [
                {
                  "type": "switch",
                  "title": "Do signatures match?",
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
                                "tpl": "{% if _signature == interaction_params.s %}true{% endif %}",
                                "oper": "is",
                                "value": "true"
                              }
                            ]
                          }
                        ]
                      }
                    },
                    {
                      "type": "outcome",
                      "title": "No",
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
                          "title": "Sorry!",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "switch_behavior",
                                "behavior_id": "{{{uid.behavior_311}}}",
                                "var": "_behavior"
                              },
                              {
                                "action": "_exit",
                                "mode": ""
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
  ],
  "workspaces": [
    {
      "uid": "workspace_page_18",
      "name": "Satisfaction",
      "extension_id": "core.workspace.page.workspace",
      "tabs": [
        {
          "uid": "workspace_tab_47",
          "name": "NPS",
          "extension_id": "core.workspace.tab.dashboard",
          "params": {
            "layout": "sidebar_left"
          },
          "widgets": [
            {
              "uid": "workspace_widget_48",
              "label": "Net Promoter Score (NPS)",
              "extension_id": "core.workspace.widget.gauge",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 0,
              "params": {
                "metric_min": "-100",
                "threshold_labels": [
                  "Negative",
                  "Neutral",
                  "Positive",
                  ""
                ],
                "threshold_values": [
                  "0",
                  "50",
                  "100"
                ],
                "threshold_colors": [
                  "#CF2C1D",
                  "#FEAF03",
                  "#57970A",
                  "#ffffff"
                ],
                "datasource": "core.workspace.widget.datasource.bot",
                "behavior_id": "{{{uid.behavior_299}}}",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": ""
              }
            },
            {
              "uid": "workspace_widget_41",
              "label": "Net Promoter Score (NPS)",
              "extension_id": "core.workspace.widget.bot",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 1,
              "params": {
                "behavior_id": "{{{uid.behavior_298}}}"
              }
            },
            {
              "uid": "workspace_widget_42",
              "label": "Total Ratings",
              "extension_id": "core.workspace.widget.counter",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 2,
              "params": {
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.contact",
                "search_mode": "quick_search",
                "quick_search": "netPromoter.rating:!null",
                "metric_func": "count",
                "metric_field": "cf_{{{uid.field_76}}}",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": "",
                "color": "#34434E",
                "worklist_model": {
                  "options": [

                  ],
                  "columns": [
                    "c_primary_email_id",
                    "c_title",
                    "c_org_id",
                    "c_username",
                    "c_gender",
                    "c_location",
                    "c_language",
                    "c_timezone",
                    "c_updated_at",
                    "c_last_login_at"
                  ],
                  "params": {
                    "59091970a49ae": {
                      "field": "cf_{{{uid.field_76}}}",
                      "operator": "is not null",
                      "value": null
                    }
                  },
                  "limit": 10,
                  "sort_by": "c_updated_at",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.contact"
                }
              }
            },
            {
              "uid": "workspace_widget_43",
              "label": "Promoters",
              "extension_id": "core.workspace.widget.counter",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 3,
              "params": {
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.contact",
                "search_mode": "quick_search",
                "quick_search": "netPromoter.rating:>8",
                "metric_func": "count",
                "metric_field": "c_id",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": "",
                "color": "#57970A",
                "worklist_model": {
                  "options": [

                  ],
                  "columns": [
                    "c_primary_email_id",
                    "c_title",
                    "c_org_id",
                    "c_username",
                    "c_gender",
                    "c_location",
                    "c_language",
                    "c_timezone",
                    "c_updated_at",
                    "c_last_login_at"
                  ],
                  "params": {
                    "5909156532ff1": {
                      "field": "cf_{{{uid.field_76}}}",
                      "operator": ">",
                      "value": 8
                    }
                  },
                  "limit": 10,
                  "sort_by": "c_updated_at",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.contact"
                }
              }
            },
            {
              "uid": "workspace_widget_44",
              "label": "Detractors",
              "extension_id": "core.workspace.widget.counter",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 4,
              "params": {
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.contact",
                "search_mode": "quick_search",
                "quick_search": "netPromoter.rating:<7",
                "metric_func": "count",
                "metric_field": "c_id",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": "",
                "color": "#CF2C1D",
                "worklist_model": {
                  "options": [

                  ],
                  "columns": [
                    "c_primary_email_id",
                    "c_title",
                    "c_org_id",
                    "c_username",
                    "c_gender",
                    "c_location",
                    "c_language",
                    "c_timezone",
                    "c_updated_at",
                    "c_last_login_at"
                  ],
                  "params": {
                    "5909156532ff1": {
                      "field": "cf_{{{uid.field_76}}}",
                      "operator": ">",
                      "value": 8
                    }
                  },
                  "limit": 10,
                  "sort_by": "c_updated_at",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.contact"
                }
              }
            },
            {
              "uid": "workspace_widget_55",
              "label": "Recent Ratings",
              "extension_id": "core.workspace.widget.bot",
              "zone": "content",
              "width_units": 4,
              "pos": 1,
              "params": {
                "behavior_id": "{{{uid.behavior_300}}}"
              }
            },
            {
              "uid": "workspace_widget_56",
              "label": "Ratings Over Time (YTD)",
              "extension_id": "core.workspace.widget.chart",
              "zone": "content",
              "width_units": 4,
              "pos": 2,
              "params": {
                "chart_type": "bar",
                "chart_display": "",
                "series": [
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Detractors",
                    "context": "cerberusweb.contexts.contact",
                    "search_mode": "quick_search",
                    "quick_search": "netPromoter.rating:<7 AND netPromoter.date:\"Jan 1 to now\"",
                    "xaxis_field": "cf_{{{uid.field_78}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_76}}}",
                    "yaxis_format": "number",
                    "line_color": "#CF2C1D",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "cf_{{{uid.field_78}}}",
                        "cf_{{{uid.field_76}}}",
                        "cf_{{{uid.field_77}}}"
                      ],
                      "params": {
                        "590a7375deff4": {
                          "field": "cf_{{{uid.field_76}}}",
                          "operator": "<",
                          "value": 7
                        },
                        "590a7375df002": {
                          "field": "cf_{{{uid.field_78}}}",
                          "operator": "between",
                          "value": [
                            "jan 1",
                            "now"
                          ]
                        }
                      },
                      "limit": 10,
                      "sort_by": "c_updated_at",
                      "sort_asc": false,
                      "subtotals": "",
                      "context": "cerberusweb.contexts.contact"
                    },
                    "fill_color": "rgba(207,44,29,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Passives",
                    "context": "cerberusweb.contexts.contact",
                    "search_mode": "quick_search",
                    "quick_search": "netPromoter.rating:7...8 AND netPromoter.date:\"Jan 1 to now\"",
                    "xaxis_field": "cf_{{{uid.field_78}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_76}}}",
                    "yaxis_format": "number",
                    "line_color": "#FEAF03",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "c_primary_email_id",
                        "c_title",
                        "c_org_id",
                        "c_username",
                        "c_gender",
                        "c_location",
                        "c_language",
                        "c_timezone",
                        "c_updated_at",
                        "c_last_login_at",
                        "cf_{{{uid.field_76}}}",
                        "cf_{{{uid.field_78}}}"
                      ],
                      "params": {
                        "59091b9648d60": {
                          "field": "cf_{{{uid.field_76}}}",
                          "operator": "between",
                          "value": [
                            7,
                            8
                          ]
                        }
                      },
                      "limit": 10,
                      "sort_by": "c_updated_at",
                      "sort_asc": false,
                      "subtotals": "",
                      "context": "cerberusweb.contexts.contact"
                    },
                    "fill_color": "rgba(254,175,3,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Promoters",
                    "context": "cerberusweb.contexts.contact",
                    "search_mode": "quick_search",
                    "quick_search": "netPromoter.rating:>8 AND netPromoter.date:\"Jan 1 to now\"",
                    "xaxis_field": "cf_{{{uid.field_78}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_76}}}",
                    "yaxis_format": "number",
                    "line_color": "#57970A",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "c_primary_email_id",
                        "c_title",
                        "c_org_id",
                        "c_username",
                        "c_gender",
                        "c_location",
                        "c_language",
                        "c_timezone",
                        "c_updated_at",
                        "c_last_login_at",
                        "cf_{{{uid.field_76}}}",
                        "cf_{{{uid.field_78}}}"
                      ],
                      "params": {
                        "59091c50ef940": {
                          "field": "cf_{{{uid.field_76}}}",
                          "operator": ">",
                          "value": 8
                        }
                      },
                      "limit": 10,
                      "sort_by": "c_updated_at",
                      "sort_asc": false,
                      "subtotals": "",
                      "context": "cerberusweb.contexts.contact"
                    },
                    "fill_color": "rgba(87,151,10,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "workspace_tab_51",
          "name": "CSAT",
          "extension_id": "core.workspace.tab.dashboard",
          "params": {
            "layout": "sidebar_left"
          },
          "widgets": [
            {
              "uid": "workspace_widget_58",
              "label": "Avg. Customer Satisfaction Score (CSAT)",
              "extension_id": "core.workspace.widget.gauge",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 0,
              "params": {
                "metric_min": "1",
                "threshold_labels": [
                  "Unsatisfied",
                  "Neutral",
                  "Satisfied"
                ],
                "threshold_values": [
                  "5",
                  "8",
                  "10"
                ],
                "threshold_colors": [
                  "#CF2C1D",
                  "#FEAF03",
                  "#57970A"
                ],
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.message",
                "search_mode": "quick_search",
                "quick_search": "customerSatisfaction.rating:!null",
                "metric_func": "avg",
                "metric_field": "cf_{{{uid.field_82}}}",
                "metric_type": "decimal",
                "metric_prefix": "",
                "metric_suffix": "",
                "worklist_model": {
                  "options": [

                  ],
                  "columns": [
                    "a_email",
                    "t_group_id",
                    "m_worker_id",
                    "m_created_date",
                    "cf_{{{uid.field_82}}}"
                  ],
                  "params": {
                    "5913a5e28943a": {
                      "field": "cf_{{{uid.field_82}}}",
                      "operator": "is not null",
                      "value": null
                    }
                  },
                  "limit": 10,
                  "sort_by": "m_created_date",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.message"
                }
              }
            },
            {
              "uid": "workspace_widget_59",
              "label": "# Ratings",
              "extension_id": "core.workspace.widget.counter",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 1,
              "params": {
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.message",
                "search_mode": "quick_search",
                "quick_search": "customerSatisfaction.rating:!null",
                "metric_func": "count",
                "metric_field": "cf_{{{uid.field_83}}}",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": "",
                "color": "#34434E",
                "worklist_model": {
                  "options": [

                  ],
                  "columns": [
                    "a_email",
                    "t_group_id",
                    "m_worker_id",
                    "m_created_date"
                  ],
                  "params": {
                    "5913a142618e8": {
                      "field": "cf_{{{uid.field_82}}}",
                      "operator": "is not null",
                      "value": null
                    }
                  },
                  "limit": 10,
                  "sort_by": "m_created_date",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.message"
                }
              }
            },
            {
              "uid": "workspace_widget_60",
              "label": "CSAT Ratings Over Time (90 days)",
              "extension_id": "core.workspace.widget.chart",
              "zone": "content",
              "width_units": 4,
              "pos": 2,
              "params": {
                "chart_type": "bar",
                "chart_display": "",
                "series": [
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Positive",
                    "context": "cerberusweb.contexts.message",
                    "search_mode": "quick_search",
                    "quick_search": "customerSatisfaction.rating:10 customerSatisfaction.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_84}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "number",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_82}}}",
                    "yaxis_format": "number",
                    "line_color": "#57970A",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "a_email",
                        "t_group_id",
                        "m_worker_id",
                        "m_created_date",
                        "cf_{{{uid.field_84}}}",
                        "cf_{{{uid.field_88}}}",
                        "cf_{{{uid.field_82}}}"
                      ],
                      "params": {
                        "5913a6c97f061": {
                          "field": "cf_{{{uid.field_82}}}",
                          "operator": "=",
                          "value": "10"
                        }
                      },
                      "limit": 10,
                      "sort_by": "m_created_date",
                      "sort_asc": false,
                      "subtotals": "",
                      "context": "cerberusweb.contexts.message"
                    },
                    "fill_color": "rgba(87,151,10,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Neutral",
                    "context": "cerberusweb.contexts.message",
                    "search_mode": "quick_search",
                    "quick_search": "customerSatisfaction.rating:5 customerSatisfaction.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_84}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "number",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_83}}}",
                    "yaxis_format": "number",
                    "line_color": "#FEAF03",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "a_email",
                        "t_group_id",
                        "m_worker_id",
                        "m_created_date"
                      ],
                      "params": [

                      ],
                      "limit": 10,
                      "sort_by": "m_created_date",
                      "sort_asc": false,
                      "subtotals": null,
                      "context": "cerberusweb.contexts.message"
                    },
                    "fill_color": "rgba(254,175,3,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Negative",
                    "context": "cerberusweb.contexts.message",
                    "search_mode": "quick_search",
                    "quick_search": "customerSatisfaction.rating:1 customerSatisfaction.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_84}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "number",
                    "yaxis_func": "count",
                    "yaxis_field": "cf_{{{uid.field_83}}}",
                    "yaxis_format": "number",
                    "line_color": "#CF2C1D",
                    "worklist_model": {
                      "options": [

                      ],
                      "columns": [
                        "a_email",
                        "t_group_id",
                        "m_worker_id",
                        "m_created_date"
                      ],
                      "params": [

                      ],
                      "limit": 10,
                      "sort_by": "m_created_date",
                      "sort_asc": false,
                      "subtotals": null,
                      "context": "cerberusweb.contexts.message"
                    },
                    "fill_color": "rgba(207,44,29,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  }
                ]
              }
            },
            {
              "uid": "workspace_widget_61",
              "label": "Recent Ratings",
              "extension_id": "core.workspace.widget.bot",
              "zone": "content",
              "width_units": 4,
              "pos": 1,
              "params": {
                "behavior_id": "{{{uid.behavior_318}}}"
              }
            }
          ]
        },
        {
          "uid": "workspace_tab_50",
          "name": "CES",
          "extension_id": "core.workspace.tab.dashboard",
          "params": {
            "layout": "sidebar_left"
          },
          "widgets": [
            {
              "uid": "workspace_widget_57",
              "label": "\"The {{{product_name}}} team made it easy to resolve my issue\"",
              "extension_id": "core.workspace.widget.gauge",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 0,
              "params": {
                "metric_min": "0",
                "threshold_labels": [
                  "Strongly Disagree",
                  "Disagree",
                  "Somewhat Disagree",
                  "Undecided",
                  "Somewhat Agree",
                  "Agree",
                  "Strongly Agree"
                ],
                "threshold_values": [
                  "1",
                  "2",
                  "3",
                  "4",
                  "5",
                  "6",
                  "7"
                ],
                "threshold_colors": [
                  "#CF2C1D",
                  "#DE5714",
                  "#EE830B",
                  "#FEAF03",
                  "#CBAE07",
                  "#98AD0C",
                  "#66AD11"
                ],
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.ticket",
                "search_mode": "quick_search",
                "quick_search": "customerEffort.rating:!null",
                "metric_func": "avg",
                "metric_field": "cf_{{{uid.field_83}}}",
                "metric_type": "decimal",
                "metric_prefix": "",
                "metric_suffix": "",
                "worklist_model": {
                  "options": {
                    "disable_recommendations": "1"
                  },
                  "columns": [
                    "t_last_wrote_address_id",
                    "t_updated_date",
                    "t_group_id",
                    "t_bucket_id",
                    "t_owner_id"
                  ],
                  "params": {
                    "5913bf6ee8149": {
                      "field": "cf_{{{uid.field_83}}}",
                      "operator": "is not null",
                      "value": null
                    }
                  },
                  "limit": 10,
                  "sort_by": "t_updated_date",
                  "sort_asc": false,
                  "subtotals": "",
                  "context": "cerberusweb.contexts.ticket"
                }
              }
            },
            {
              "uid": "workspace_widget_62",
              "label": "# Ratings",
              "extension_id": "core.workspace.widget.counter",
              "zone": "sidebar",
              "width_units": 4,
              "pos": 1,
              "params": {
                "datasource": "core.workspace.widget.datasource.worklist.metric",
                "context": "cerberusweb.contexts.ticket",
                "search_mode": "quick_search",
                "quick_search": "customerEffort.rating:!null",
                "metric_func": "count",
                "metric_field": "t_num_messages",
                "metric_type": "number",
                "metric_prefix": "",
                "metric_suffix": "",
                "color": "#34434E",
                "worklist_model": {
                  "options": {
                    "disable_recommendations": "1"
                  },
                  "columns": [
                    "t_last_wrote_address_id",
                    "t_updated_date",
                    "t_group_id",
                    "t_bucket_id",
                    "t_owner_id"
                  ],
                  "params": {
                    "*_status": {
                      "field": "*_status",
                      "operator": "in",
                      "value": [
                        "open",
                        "waiting"
                      ]
                    },
                    "*_groups_of_worker": {
                      "field": "*_groups_of_worker",
                      "operator": "=",
                      "value": 1
                    }
                  },
                  "limit": 10,
                  "sort_by": "t_updated_date",
                  "sort_asc": false,
                  "subtotals": null,
                  "context": "cerberusweb.contexts.ticket"
                }
              }
            },
            {
              "uid": "workspace_widget_64",
              "label": "Ratings Over Time (90 days)",
              "extension_id": "core.workspace.widget.chart",
              "zone": "content",
              "width_units": 4,
              "pos": 2,
              "params": {
                "chart_type": "bar",
                "chart_display": "",
                "series": [
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Agree",
                    "context": "cerberusweb.contexts.ticket",
                    "search_mode": "quick_search",
                    "quick_search": "customerEffort.rating:>4 customerEffort.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_80}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "t_num_messages",
                    "yaxis_format": "",
                    "line_color": "#57970A",
                    "worklist_model": {
                      "options": {
                        "disable_recommendations": "1"
                      },
                      "columns": [
                        "t_last_wrote_address_id",
                        "t_updated_date",
                        "t_group_id",
                        "t_bucket_id",
                        "t_owner_id"
                      ],
                      "params": {
                        "*_status": {
                          "field": "*_status",
                          "operator": "in",
                          "value": [
                            "open",
                            "waiting"
                          ]
                        },
                        "*_groups_of_worker": {
                          "field": "*_groups_of_worker",
                          "operator": "=",
                          "value": 1
                        }
                      },
                      "limit": 10,
                      "sort_by": "t_updated_date",
                      "sort_asc": false,
                      "subtotals": null,
                      "context": "cerberusweb.contexts.ticket"
                    },
                    "fill_color": "rgba(87,151,10,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Undecided",
                    "context": "cerberusweb.contexts.ticket",
                    "search_mode": "quick_search",
                    "quick_search": "customerEffort.rating:4 customerEffort.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_80}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "t_num_messages",
                    "yaxis_format": "",
                    "line_color": "#FEAF03",
                    "worklist_model": {
                      "options": {
                        "disable_recommendations": "1"
                      },
                      "columns": [
                        "t_last_wrote_address_id",
                        "t_updated_date",
                        "t_group_id",
                        "t_bucket_id",
                        "t_owner_id"
                      ],
                      "params": {
                        "*_status": {
                          "field": "*_status",
                          "operator": "in",
                          "value": [
                            "open",
                            "waiting"
                          ]
                        },
                        "*_groups_of_worker": {
                          "field": "*_groups_of_worker",
                          "operator": "=",
                          "value": 1
                        }
                      },
                      "limit": 10,
                      "sort_by": "t_updated_date",
                      "sort_asc": false,
                      "subtotals": null,
                      "context": "cerberusweb.contexts.ticket"
                    },
                    "fill_color": "rgba(254,175,3,0.15)"
                  },
                  {
                    "datasource": "core.workspace.widget.datasource.worklist.series",
                    "label": "Disagree",
                    "context": "cerberusweb.contexts.ticket",
                    "search_mode": "quick_search",
                    "quick_search": "customerEffort.rating:<4 customerEffort.date:\"-90 days\"",
                    "xaxis_field": "cf_{{{uid.field_80}}}",
                    "xaxis_tick": "month",
                    "xaxis_format": "",
                    "yaxis_func": "count",
                    "yaxis_field": "t_num_messages",
                    "yaxis_format": "",
                    "line_color": "#CF2C1D",
                    "worklist_model": {
                      "options": {
                        "disable_recommendations": "1"
                      },
                      "columns": [
                        "t_last_wrote_address_id",
                        "t_updated_date",
                        "t_group_id",
                        "t_bucket_id",
                        "t_owner_id"
                      ],
                      "params": {
                        "*_status": {
                          "field": "*_status",
                          "operator": "in",
                          "value": [
                            "open",
                            "waiting"
                          ]
                        },
                        "*_groups_of_worker": {
                          "field": "*_groups_of_worker",
                          "operator": "=",
                          "value": 1
                        }
                      },
                      "limit": 10,
                      "sort_by": "t_updated_date",
                      "sort_asc": false,
                      "subtotals": null,
                      "context": "cerberusweb.contexts.ticket"
                    },
                    "fill_color": "rgba(207,44,29,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  },
                  {
                    "datasource": "",
                    "label": "",
                    "line_color": "#058DC7",
                    "fill_color": "rgba(5,141,199,0.15)"
                  }
                ]
              }
            },
            {
              "uid": "workspace_widget_63",
              "label": "Recent Ratings",
              "extension_id": "core.workspace.widget.bot",
              "zone": "content",
              "width_units": 4,
              "pos": 1,
              "params": {
                "behavior_id": "{{{uid.behavior_320}}}"
              }
            }
          ]
        }
      ]
    }
  ],
  "records": [
    {
      "uid": "portal_surveys",
      "_context": "community_portal",
      "name": "Satisfaction Survey Bot",
      "extension_id": "cerb.bots.portal",
      "uri": "satisfaction",
      "params": {
        "bot_name": "Survey Bot",
        "cors_allow_origin": "{{{default.base_url}}}",
        "interaction_behavior_id": "{{{uid.behavior_309}}}",
        "page_title": "Survey Bot",
        "page_hide_icon": "1",
        "page_css": "#cerb-bot-chat-window {\n\twidth: 600px;\n\tleft: 50%;\n\tright: 50%;\n\tmargin: 0 0 0 -300px;\n}\n\n@media (max-width: 600px) {\n\t#cerb-bot-chat-window {\n\t\twidth: 96%;\n\t\tleft: 2%;\n\t\tright: 2%;\n\t\tmargin: 0;\n\t}\n}"
      }
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll be prompted to enter two pieces of information:

* **Product Name**: The name of your product, service, or organization.  This is used to personalize the surveys (e.g. _"How likely are you to recommend [product name] to your friends and colleagues?"_).

Click the **Import** button again.

The following records will be created:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/imported.png" class="screenshot">
</div>

# Installing the community portal

Navigate to **Search >> Community Portals**.

Click on **Satisfaction Survey Bot**.

Switch to the **Deploy** tab.

Follow the instructions.

At the URL, you should see something like:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/portal.png" class="screenshot">
</div>

The page should be blank unless someone is clicking through from a valid survey link.  You can go ahead and close that browser tab.

# Testing an NPS survey

Navigate to **Search >> Bots** and click on **Satisfaction Bot**.

Click the **Behaviors** button at the top of the profile.

Hover over the row for **NPS: Get survey link for contact** and click the peek icon:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/behavior-nps-link-peek.png" class="screenshot">
</div>

Click the **Simulator** button at the top of the popup.

In **Target: Contact**, click on the magnifying glass icon and target yourself.  If you don't have a contact record yet, create one by clicking the **(+)** in the gray bar above the worklist.

Click the **Simulate** button.

In the simulator output, copy the URL between the quotes and paste it into a new browser tab.

You should see a bot-powered survey, like:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/survey-nps.png" class="screenshot">
</div>

Select a rating and click the blue **Send rating** button.

When prompted, enter an optional comment or press `<ENTER>`.

You can close the browser tab.

# Using the satisfaction dashboard

You should now have your first NPS rating.  Let's add the Satisfaction dashboard to your workspaces.

Switch back to Cerb and click on the arrow in the pages menu at the top:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/menu-bar.png" class="screenshot">
</div>

Click the checkmark button to the left of the **Satisfaction** page.  This will add it to your menu.

Now click on **satisfaction** in the pages bar.

You should see your first NPS rating:

<div class="cerb-screenshot">
<img src="/assets/images/packages/satisfaction/dashboard.png" class="screenshot">
</div>

# Locking down the custom fields

When the new customer satisfaction custom fieldsets are created they are owned by Cerb, which makes them editable by workers. You can prevent this by changing their owner to the bot. The fields will be hidden from workers, but the results will still be shown on the dashboard.

Navigate to **Search >> Custom Fieldsets**.

Change the owner of the three fieldsets to **Bots >> Satisfaction Bot**:

* **Net Promoter**
* **Customer Effort**
* **Customer Satisfaction**
