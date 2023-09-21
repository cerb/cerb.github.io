---
title: "Create recurring tasks with automations"
excerpt: Many teams need to create a set of tasks on a repeating schedule.
social_image_url: /assets/images/guides/automations/automation.timer/create-recurring-tasks/recurring-tasks.png
layout: integration
topic: Automations
subtopic: automation.timer
redirect_from:
  - /guides/bots/create-recurring-tasks/
jumbotron:
  title: Create recurring tasks with automations
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Automations &raquo;
    url: /resources/guides/#automations
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/automation.timer/create-recurring-tasks/recurring-tasks.png" class="screenshot">
</div>

Many teams need a way to create the same set of tasks on a repeating schedule (e.g. every day, week, month).

This is very easy to do in Cerb with the introduction of [automation timers](/docs/automations/#timers) and the [records API](/docs/records/types/task/).

In this guide, we'll import a sample automation timer and examine how it works.

# Import the example package

Navigate to **Setup >> Packages >> Import**.

Copy and paste the following package into the **JSON:** section:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "requires": {
      "cerb_version": "10.3"
    }
  },
  "records": [
    {
      "uid": "automation_createTasks",
      "_context": "automation",
      "name": "example.automationTimer.createDailyTasks",
      "extension_id": "cerb.trigger.automation.timer",
      "description": "An example of creating daily tasks from an automation timer",
      "script": "start:\r\n  record.create/coffee:\r\n    output: new_task\r\n    inputs:\r\n      record_type: task\r\n      fields:\r\n        title: Get coffee\r\n        due@date: today 8:30am\r\n        importance: 90\r\n        owner_id@int: 0\r\n  record.create/replyToAll:\r\n    output: new_task\r\n    inputs:\r\n      record_type: task\r\n      fields:\r\n        title: Reply to all unread email\r\n        due@date: today 4pm\r\n        importance: 50\r\n        owner_id@int: 0\r\n  decision/dayOfWeek:\r\n    outcome/mon:\r\n      if@bool: {{'Mon' == 'now'|date('D')}}\r\n      then:\r\n        record.create/status:\r\n          output: new_task\r\n          inputs:\r\n            record_type: task\r\n            fields:\r\n              title: Send weekly status report\r\n              due@date: today 10am\r\n              importance: 100\r\n              owner_id@int: 0",
      "policy_kata": "commands:\r\n  record.create:\r\n    deny/type@bool: {{inputs.record_type is not record type ('task')}}\r\n    allow@bool: yes"
    },
    {
      "uid": "automation_timer",
      "_context": "automation_timer",
      "name": "Create daily tasks",
      "is_recurring": 1,
      "recurring_patterns": "# https://en.wikipedia.org/wiki/Cron#CRON_expression\n# [min] [hour] [dom] [month] [dow]\n0 8 * * 1-5",
      "recurring_timezone": "America/Los_Angeles",
      "automations_kata": "automation/dailyTasks:\n  uri: cerb:automation:example.automationTimer.createDailyTasks\n  disabled@bool: no"
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

The following records should be created:

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/automation.timer/create-recurring-tasks/imported.png" class="screenshot">
</div>

# How it works

## Scheduling an automation

In the import results, click on **Create daily tasks** in the **Automation Timers** section to open its card. You can also find it from **Search >> Automation Timers**.

This is an [automation timer](/docs/automations/#timers), so it automatically runs on a given schedule.

Let's look at how to define the schedule.

Click the **Edit** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/automation.timer/create-recurring-tasks/timer-card-edit.png" class="screenshot">
</div>

The **Repeat:** schedules are define as a concise cron expression[^cron-expression] with the format:

```
[minute] [hour] [day of month] [month of year] [day of week]
```

Our format is:

```
0 8 * * 1-5
```

The automation will run on the 0th minute of the 8th hour (08:00), every day of the month, every month of the year, when the day of the week is Mon-Fri.

In other words, _"every weekday morning at 8am"_.

You can define multiple schedules, and the next occurrence will be automatically scheduled each time the automation runs (or is edited).

For instance, you could also run this automation at 10:45am and 10:45pm on Saturdays during January with:

```
45 10,22 * 1 6
```

Cron expressions are very flexible.

Close the automation timer popup by clicking on the **(x)** in the top right.

## Creating task records

Now click on the **example.automationTimer.createDailyTasks** automation in the import results and click the **Edit** button at the top.

The automation uses the [record.create](/docs/automations/commands/record.create/) command to create tasks records.

```cerb
start:
  record.create/coffee:
    output: new_task
    inputs:
      record_type: task
      fields:
        title: Get coffee
        due@date: today 8:30am
        importance: 90
        owner_id@int: 0
```

The first two tasks are created every day at 8:30am and 4pm.

There's also an example for creating tasks only a specific day of the week (in this case Monday).

You can test the automation by clicking the **Run** icon from the **Input:** section in the lower left: 

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/automation.timer/create-recurring-tasks/automation-run-tasks.png" class="screenshot">
</div>

You'll see the results in the **Output:** section.

The new tasks can be found from **Search >> Tasks**.

Close the automation editor popups.

# Next steps

* Modify the automation timer's schedule to meet your needs.

* Change the created tasks.

# References

[^cron-expression]: Wikipedia: CRON expression - <https://en.wikipedia.org/wiki/Cron#CRON_expression>

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>