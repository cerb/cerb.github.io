---
title: GitHub Bot
excerpt: A bot demonstrating integration between Cerb and GitHub.
layout: integration
topic: Packages
permalink: /packages/github-bot/
jumbotron:
  title: GitHub Bot
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

This package creates **GitHub Bot** for demonstrating integration between Cerb and [GitHub's API](https://developer.github.com/v3/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/github/plugin/cerb-and-github.png" class="screenshot">
</div>

# Configure the GitHub service

If you haven't already, follow [these instructions](/guides/integrations/github/) to configure the GitHub service and add your first connected account.

# Import the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "GitHub",
    "cerb_version": "9.1.0",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.0"
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "GitHub Account:",
          "key": "github_account_id",
          "params": {
            "context": "cerberusweb.contexts.connected_account",
            "single": true,
            "query": "name:github"
          }
        }
      ]
    },
    "placeholders": []
  },
  "bots": [
    {
      "uid": "bot_1",
      "name": "GitHub",
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
          "title": "API: GET /user/repos",
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
                    "http_url": "https://api.github.com/user/repos",
                    "http_headers": "User-Agent: Cerb",
                    "http_body": "",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{github_account_id}}}",
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
          "uid": "behavior_10",
          "title": "API: POST /repos/:owner/:repo/issues",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.macro.bot",
            "label": "Custom behavior on bot"
          },
          "variables": {
            "var_repository": {
              "key": "var_repository",
              "label": "repository",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_title": {
              "key": "var_title",
              "label": "title",
              "type": "S",
              "is_private": "0",
              "params": {
                "widget": "single"
              }
            },
            "var_body": {
              "key": "var_body",
              "label": "body",
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
              "title": "Call API to create issue",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "core.va.action.http_request",
                    "http_verb": "post",
                    "http_url": "https://api.github.com/repos/{{var_repository}}/issues",
                    "http_headers": "User-Agent: Cerb\r\nContent-Type: application/json",
                    "http_body": "{% set request = {} %}\r\n{% set request = dict_set(request, \"title\", var_title) %}\r\n{% set request = dict_set(request, \"body\", var_body) %}\r\n{{request|json_encode|json_pretty}}\r\n",
                    "auth": "connected_account",
                    "auth_connected_account_id": "{{{github_account_id}}}",
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
          "uid": "behavior_8",
          "title": "Create GitHub Issue",
          "is_disabled": false,
          "is_private": true,
          "priority": 50,
          "event": {
            "key": "event.message.chat.worker",
            "label": "Conversation with worker"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Prompt which repo?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "_trigger_va_id",
                    "behavior_id": "{{{uid.behavior_5}}}",
                    "run_in_simulator": "1",
                    "var": "_behavior"
                  },
                  {
                    "action": "send_message",
                    "message": "Which GitHub repo do you want to create the issue on?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "{{_behavior.repos_with_issues|join('\\n')}}",
                    "color_from": "#4795f7",
                    "color_mid": "#4795f7",
                    "color_to": "#4795f7",
                    "style": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save repo and confirm",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "prompt_repository"
                  },
                  {
                    "action": "send_message",
                    "message": "Ok, I will use the repo '{{prompt_repository}}'",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for issue title?",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Summarize the issue:",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(e.g. PC Load Letter!? What the frak does that mean?)"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "prompt_title"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Save title and confirm",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{message}}",
                    "format": "",
                    "is_simulator_only": "0",
                    "var": "prompt_title"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Create the new issue",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "_trigger_va_id",
                    "behavior_id": "{{{uid.behavior_10}}}",
                    "var_repository": "{{prompt_repository}}",
                    "var_title": "{{prompt_title}}",
                    "var_body": "Created via Cerb bot",
                    "run_in_simulator": "0",
                    "var": "_behavior"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_behavior.response_json|json_encode|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "response_json"
                  },
                  {
                    "action": "send_message",
                    "message": "I created issue #{{response_json.number}} for you: {{response_json.html_url}}",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_2",
          "title": "Get Interactions for worker",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interactions.get.worker",
            "label": "Conversation get interactions for worker",
            "params": {
              "listen_points": "global"
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Point:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "global",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "point",
                            "oper": "is",
                            "value": "global"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Return interactions",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "return_interaction",
                            "behavior_id": "3",
                            "name": "Create issue in GitHub",
                            "interaction": "github.issue.create",
                            "interaction_params_json": "{}"
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
          "uid": "behavior_3",
          "title": "Handle Interaction with worker",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interaction.chat.worker",
            "label": "Conversation handle interaction with worker"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "github.issue.create",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "github.issue.create"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "call create github issue behavior",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "return": "0",
                            "behavior_id": "{{{uid.behavior_8}}}",
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
        },
        {
          "uid": "behavior_5",
          "title": "PARSE: Get repos with issues enabled",
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
              "title": "Get Repos from API",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_run_behavior",
                    "on": "_trigger_va_id",
                    "behavior_id": "{{{uid.behavior_4}}}",
                    "run_in_simulator": "1",
                    "var": "_behavior"
                  },
                  {
                    "action": "_set_custom_var",
                    "value": "{{_behavior.response_json|json_encode|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "github_repos"
                  }
                ]
              }
            },
            {
              "type": "loop",
              "title": "Loop over repos",
              "status": "live",
              "params": {
                "foreach_json": "{{github_repos|json_encode}}",
                "as_placeholder": "github_repo"
              },
              "nodes": [
                {
                  "type": "switch",
                  "title": "Repo has issues?",
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
                                "tpl": "{% if github_repo.has_issues %}true{% endif %}",
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
                          "title": "Save repo",
                          "status": "live",
                          "params": {
                            "actions": [
                              {
                                "action": "_set_custom_var",
                                "value": "{{github_repo.full_name|json_encode}}",
                                "format": "json",
                                "is_simulator_only": "0",
                                "var": "full_name"
                              },
                              {
                                "action": "_set_custom_var",
                                "value": "{% if repos is not iterable %}{% set repos = [] %}{% endif %}\r\n{{repos|merge([full_name])|json_encode|json_pretty}}",
                                "format": "json",
                                "is_simulator_only": "0",
                                "var": "repos"
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
              "type": "action",
              "title": "Save list to \"repos_with_issues\"",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "_set_custom_var",
                    "value": "{{repos|json_encode|json_pretty}}",
                    "format": "json",
                    "is_simulator_only": "0",
                    "var": "repos_with_issues"
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

You'll be prompted to link the GitHub connected account you created earlier.

Click the **Import** button again.

You should see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/github-bot/imported.png" class="screenshot">
</div>

# Test the integration behaviors

Click on **GitHub Bot** and then click **Behaviors** on its card.

<div class="cerb-screenshot">
<img src="/assets/images/packages/github-bot/bot.png" class="screenshot">
</div>

Open the card for the **API: GET /user/repos** behavior.

<div class="cerb-screenshot">
<img src="/assets/images/packages/github-bot/behaviors.png" class="screenshot">
</div>

Click on the **Simulator** button at the top of the card.

Click the **Simulate** button.

You should see a JSON response with fields from your linked GitHub account.

<div class="cerb-screenshot">
<img src="/assets/images/packages/github-bot/simulator.png" class="screenshot">
</div>

You can use the simulator on the other behaviors to test them as well.

# Next steps

At this point you can modify the behaviors to meet your needs.  You can use the responses from [GitHub's API](https://developer.github.com/v3/) in your behaviors.
