---
title: "Dispatch assignments to available workers using bots"
excerpt: In this guide we'll build a dispatcher bot that assigns new tickets to available group members using a round-robin rotation.
layout: integration
topic: Bots
subtopic: Workflow Automation
jumbotron:
  title: Dispatch assignments to available workers using bots
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Bots &raquo;
    url: /resources/guides/#bots
---

* TOC
{:toc}

# Introduction

One popular way to distribute assignments in Cerb is for [workers](/docs/workers/) to take turns playing the role of **dispatcher**.  The dispatcher quickly reviews new tickets in a [group's](/docs/groups/) inbox and assigns the most appropriate group member as the **owner**. This works best when the dispatcher is aware of each member's skills, current workload, and availability.

The dispatcher role can also be handled by a [bot](/docs/bots/).

In this guide we'll build a simple dispatcher bot that assigns new tickets to available group members using a round-robin rotation.  Availability is determined by worker calendars.  You can use this as the starting point for your own automated dispatcher.

<div class="cerb-box note"><p>This guide covers the <b>push</b> method of assigning work.  In another guide we'll cover the alternative <b>pull</b> model of assignment, where workers request new work when they're ready for it.</p></div>

# Importing the behavior

First, let's import the pre-built behavior.  We're going to use a group-owned bot for this, since assignment decisions should be made at the group level.  Each group may choose to handle their assignments differently.

Navigate to **Search >> Bots**.

Select an existing group-owned bot or create a new one.  The bot should be able to create behaviors on the **Conversation moved in group** event.

Open the bot's [card](/docs/records/#cards) from the [worklist](/docs/workspaces/#worklists).

Click **Behaviors** on the bot's card:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/bot.png" class="screenshot">
</div>

Click on the **(+)** icon above the behaviors worklist to add a new behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Switch to **Import** mode and paste the following behavior:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "behavior": {
    "title": "Auto-assign new inbox messages",
    "is_disabled": false,
    "is_private": false,
    "priority": 1,
    "event": {
      "key": "event.mail.moved.group",
      "label": "Conversation moved in group"
    },
    "variables": {
      "var_group_members": {
        "key": "var_group_members",
        "label": "Group members",
        "type": "ctx_cerberusweb.contexts.worker",
        "is_private": "1",
        "params": []
      },
      "var_assignee": {
        "key": "var_assignee",
        "label": "Assignee",
        "type": "W",
        "is_private": "1",
        "params": []
      }
    },
    "nodes": [
      {
        "type": "switch",
        "title": "Did it land in the inbox with no owner?",
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
                      "condition": "ticket_bucket_name",
                      "oper": "is",
                      "value": "Inbox"
                    },
                    {
                      "condition": "ticket_has_owner",
                      "bool": "0"
                    }
                  ]
                }
              ]
            },
            "nodes": [
              {
                "type": "action",
                "title": "Find available members in this group",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "var_group_members",
                      "search_mode": "quick_search",
                      "quick_search": "group:(id:{{group_id}}) isDisabled:n isAvailable:\"now to +15 mins\"",
                      "limit": "",
                      "limit_count": "10",
                      "mode": "add",
                      "worklist_model": {
                        "options": [],
                        "columns": [
                          "w_title",
                          "a_address_email",
                          "w_is_superuser",
                          "w_at_mention_name",
                          "w_language",
                          "w_timezone"
                        ],
                        "params": {
                          "58bf4124c1b27": {
                            "field": "*_group_search",
                            "operator": "custom",
                            "value": "(id:2)"
                          },
                          "58bf4124c1b33": {
                            "field": "w_is_disabled",
                            "operator": "equals or null",
                            "value": false
                          },
                          "58bf4124c1b3d": {
                            "field": "*_calendar_availability",
                            "operator": "between",
                            "value": [
                              "now",
                              "+15 mins",
                              "1"
                            ]
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
              },
              {
                "type": "action",
                "title": "Pick the next worker worker",
                "status": "live",
                "params": {
                  "actions": [
                    {
                      "action": "var_assignee",
                      "vars": [
                        "var_group_members"
                      ],
                      "opt_is_available": "1",
                      "mode": "seq"
                    }
                  ]
                }
              },
              {
                "type": "switch",
                "title": "Do we have an available assignee?",
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
                              "tpl": "{{var_assignee}}",
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
                        "title": "Assign the ticket to the new owner",
                        "status": "live",
                        "params": {
                          "actions": [
                            {
                              "action": "set_owner",
                              "worker_id": "var_assignee"
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
}
{% endraw %}
</code>
</pre>

Click the **Save Changes** button.

# Understanding how the behavior works

Click on the behavior name in the yellow notification above the [worklist](/docs/workspaces/#worklists).  You should see:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior.png" class="screenshot">
</div>

The behavior runs every time a [ticket](/docs/tickets/) (conversation) is moved to or within the [group](/docs/groups/).  It defines two behavior variables:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-edit.png" class="screenshot">
</div>

* **Group members** is a list of available group members to choose an assignee from.
* **Assignee** is the worker we select from the available group members to be the new ticket owner.

A moved ticket is first checked with the **Did it land in the inbox with no owner?** decision.

The behavior only continues on a **Yes** outcome:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-outcome-yes.png" class="screenshot">
</div>

The **Find available members in this group** action builds a list of possible assignees in a private [behavior variable](/docs/bots/#variables) using a worklist quick search.  This finds all the workers in the current group who have active accounts and will be available for the next 15 minutes:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-action-find-workers.png" class="screenshot">
</div>

Availability is determined per-worker based on their individual calendar.  A worker can exclude themselves from assignments by adding a **busy** event to their calendar to cover the period of their unavailability (e.g. vacation, dentist, meeting, etc):

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/calendar.png" class="screenshot">
</div>

Next, the **Pick the next available worker** action selects one member of the available group members list and sets the **Assignee** variable. The selection is made using a round-robin[^round-robin] rotation:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-action-pick-assignee.png" class="screenshot">
</div>

The **Do we have an available assignee?** decision then checks if an assignee was found. The `var_assignee` variable will hold the ID of a worker, or `0` for no worker:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-decision-found-owner.png" class="screenshot">
</div>

If the **Yes** outcome matches, the selected assignee is made the new ticket owner by using the variable:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-action-set-owner.png" class="screenshot">
</div>

# Testing the behavior

At the top of the decision tree on the behavior's card, click on the **Simulator** button.

If needed, you can choose a specific ticket to test with using **Target:** at the top.

Click the **Simulate** button at the bottom of the popup.

You should see output like:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-simulator.png" class="screenshot">
</div>

In the above image, the behavior found two workers in the Support group who are available for the next 15 minutes: Janey Youve and Kina Halpue.  They are added to the `var_group_members` variable.

Kina Halpue is then selected as the assignee in the `var_assignee` variable.

The `var_assignee` variable is then used to set the new ticket owner to Kina.

If we clicked **Simulate** again on the same ticket, Janey would be assigned next:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/dispatch-assignments/behavior-simulator-rerun.png" class="screenshot">
</div>

# Next steps

* If a single worker is available, the current dispatcher will assign everything to them. You could require a quorum[^quorum] in the assignee pool before making automated assignments.

* You could expand auto-assignment beyond the Inbox bucket.  Workers could be added to the assignee pool per bucket based on necessary skill sets.

* Workers are currently notified about their new assignment within Cerb. You could also send them an email, SMS, Slack message, etc.  This is particularly useful for workers who only login when they have an assignment.

# References

[^quorum]: Wikipedia: Quorum - <https://en.wikipedia.org/wiki/Quorum>

[^round-robin]: Wikipedia: Round-robin Scheduling - <https://en.wikipedia.org/wiki/Round-robin_scheduling>