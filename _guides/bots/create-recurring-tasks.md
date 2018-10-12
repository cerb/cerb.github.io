---
title: "Create recurring tasks with bots"
excerpt: Many teams need to create a set of tasks on a repeating schedule. In this guide, we'll import a bot to do this and examine how it works.
layout: integration
topic: Bots
subtopic: Workflow Automation
jumbotron:
  title: Create recurring tasks with bots
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

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/recurring-tasks.png" class="screenshot">
</div>

Many teams need a way to create the same set of tasks on a repeating schedule (e.g. every day, week, month).

This is very easy to do in Cerb with the introduction of [recurrent behaviors](/releases/8.1/#recurrent-behaviors) and the [records API](/releases/8.2/#create-any-record-from-any-bot-behavior).

In this guide, we'll import the **Recurring Task Bot** package and examine how it works.

# Import the Recurring Task Bot package

Navigate to **Setup >> Configure >> Import Package**.

Copy and paste the following package into the **JSON:** section:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
	"package": {
		"name": "Recurring Task Bot",
		"cerb_version": "8.2.5",
		"revision": 1,
		"requires": {
			"cerb_version": "8.2.5",
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
			"uid": "bot_4",
			"name": "Recurring Task Bot",
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
						"event.behavior.recurrent"
					]
				},
				"actions": {
					"mode": "allow",
					"items": [
						"core.bot.action.record.create",
						"core.bot.action.record.search"
					]
				}
			},
			"image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAA5FBMVEX///9SUlJaWlpWVlZeXl6RkZFiYmKTk5OJiYmGhoZra2uMjIxoaGhlZWWOjo6VlZWDg4NwcHB4eHiAgIBPT09tbW11dXV7e3tISEjMzMxMTExFRUVycnJ9fX36+vrR0dFBQUHl5eXd3d34+PjY2Ng0NDTW1tbT09PP0NA7OzsxMTHw8PDz8/Pf39/r6+vb29vi4uLa2to/Pz/19fXh4eHx8fE3Nzfp6ek5OTk9PT3Ozs78/Pzt7e3q6urn5+cvLy+ysrLAwMC5ubmoqKjFxcWYmJgsLCytrKycnJz/8fGio6Kenp4NxQMaAAAHe0lEQVRo3u3aaVeiUBzHcbZIEUxQwAW31Mg0a2wk1DJtmfX9v5/53YuOwYVBnDnzYM58adKR5dPfq8cexP3vf3+9nvtFrXpXT09Xh/V0NehIhdcZF+rr12RheZ6ffyLXH2QJ0tNAr/W49ED0hU9PuL7neb7vD4f4SokchDwP0lNn00o37hRCeDhxPg3qpDUNms+Hvgemep1mPPsgfAA4uZEtwlFncLb85Xrn8Lx6wzkBqtkj0HToD66UWbIxNp6uPB8EFeqZC5z50BsIk8Q5LDLGFAQBKtmjTgNPmjeQkmbJw5hTYifwh7dzKANFj1+X9RU1tgR/VAEDxR+cxRmz6VVgAPidKINZ/C5rLOUrb8gYxzFklqHHtxjEHQyGUxgMcdQwVHmNGi1h4O8M8Te3YJapX+lFkD5ZdGqIx8S315X9mVDosrgRpOhhkKON+prjLitiSMEo+bBxV6WDHGt8WbZay2vp/SxklMYshFx4Hh0E+4XMG5/rtdDy3uG3j0Cho7RDyNofkkFAZE90ZiCIMs5DoUHBKMPPISTnzxvVSoCIB33tDWG0BIANvfG7R3m8jOfhRVGw7EcOwj8uWzTCcOv3o0zVECIMOxjkKKNPL48tUC7F/SgdMYTw8y0iZdz4Z3px2pJ++yjtET6CNOrUyBj/jWtFezRwGaLUG2FEpEuS2RCLvRbZgoK7veUzj10UEaNIJUDkw75ogj3uMbVeO2ISgiURgByqyPRmFGO4XpUiAhYlgmDdySByhiQRBtNkOOUF7MQoCYicJfG8d3d316NbEO4sq35FkNGfQYQNrh1tKXgwtHhECF5csnZwwktrzNSzBnUYSKYrL7BIFkM67c1Y4+1TlRpUiUXIIOqByeXxjOluTQ2VREZJRrTttktjNvrgiDQbvW/8SgwVJSJk3cODaE1ZTUiYzEZMN4OGKO/PJisfQfDiIoMo++TiXVvCA2yqdD56YLpvdGAo28go6Yj8NpvMNnIcIm9GE9LDBO3ujPl5YCQjEkFCxndyodlaYw3tZTxhGslDXg6NqwGRIghPEXOb9m10//j4eD9+0cxI2tsMuxD5vrvzUPJgmPsowjMI1v3nUerLbHVPWs2+RxQlP8KuSA/fnyowQsdh5aMIXsEyBtFp2nrUXXW7qxW+j84U/V2m/ogHg7B7Rb9N1p8qkqK/D6PICYhOU58n3X2Pufena7cgIq02Xh1GuETE1B3H0ZXNY+gak5LpbNPViy6b26nCcELpZhwiSltEeV3dhluVd4qy6d4yfaw2BMVxWEQSw4hMXsH4aSzHrHU/7rrd3dq6RVJe7kM7aF2+A8OK5OhYeVGOR8za7TXbjUWuYr7ds7tuzSlrJCNYd/yw8sdztuu+ifNyq91/93u6OV9UYTBh5aOIViHr7gARpes4xVUsO2bH7RcPhsFmOWTltTDCB4ihSx3t/IbtvKb03z3+Ibi5fvF5GBkQPFvYqQhz5/wD2/mHG+axm82U1xzDjsnA8xWDaATBXkUY2tf9g7psVDSHBXaIlohQJX/ev8BF8G8f+/+balWGcTCi8pJmYvBmswlF9N8+XKR2IxKjGZ9tOKYmqSxiASFB8b71Ly7cC5K7veO6uN3euOiD05FgJCIWi+Btolt2s0wiiv/Sd39ZPzeVdLucVNO2dDUR2SnzzxduO7mLt7kA43gEGQrfWf8CcT93BBNGJkQRZcUxcFYpiCiNTXvbJfkXur/piDBKiZXLWHlFVmKQJk77qaiVafsyIbfDK9RIVpoxCN7wFjktv61UtgNlsbvw4uf9RbtaUW0cmxwU20pC3h9nqPVKbbFY1LCFupTrMPK/LB7RoghVpBrbpd3QDMaIQzQGMa1mOXKgoVWVRdRoFzoyjLTKTcuMICYQo1nK595HlIbTjszxvSNZODClfKlpmJqZiqA8FMMNIWti5FB2xIlHoMiNUmiWqeDAOBDRQ0iTIji7EI4ondPLvdEQ9RIOSiuXo4gdQk6lACkw5Q1p+uWnIvB6OdWgSqkM5DSErCU5HoFiSZ1vgbLQ6wqMQ6KTyOsQ4kp4M1KkGI0ojc8LGJflKjGK6VEEb8Z2CHmQJYLEXyFvCY1nGCcNtZkrHtQWeeBCFSTVsUt5ICfRAqVWe2lodg670yPjl2xHLXDhFrKmG2UgJ8WYk/KOWH+uykbuEAJXAFI2dK0WQcbq7vmKPa3kSOKBBto+W+qYi/SMUWw6Cuk0tJFZbMvO0z2p2wkdxNa1Zy5aTw9eXxQ5ZTop5Ap4OD06CR1E73FMbW23KvEXSyJYJVgR1eViOpMVx8aq0EnOIhvtLG2jBobGS0s55eJqlclnyk7BJTMGYmfgs6Tc4mJ7MLZKEcrZMcEoBoYx4RJaEQVvScpknSVYjmIOb0MYXS6xUVmFUsYwYOBk6QQE+WwowyiNuF/U+qIquoEPe0wDCJ0U06PHFCCQj3ZDV760uF93Y6mmY2CaEqAsBb9sGY5p3XCptV51BYxBfzEuHRr99ZcQzmvrwL/COFEUU3csI0uWo5vmicu8zZP/LmPc/lww9EwZhc/tGfe///2D/QCHuCTQGwEPBwAAAABJRU5ErkJggg==",
			"behaviors": [
				{
					"uid": "behavior_12",
					"title": "Create daily tasks",
					"is_disabled": false,
					"is_private": false,
					"priority": 50,
					"event": {
						"key": "event.behavior.recurrent",
						"label": "Recurrent behavior",
						"params": {
							"repeat_patterns": "# https://en.wikipedia.org/wiki/Cron#CRON_expression\r\n# [min] [hour] [dom] [month] [dow]\r\n# Once every weekday\r\n0 8 * * 1-5",
							"timezone": "America/Los_Angeles",
							"repeat_history": [

							],
							"repeat_run_at": 1513008000
						}
					},
					"nodes": [
						{
							"type": "action",
							"title": "New task: Get coffee @ 8am",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "core.bot.action.record.create",
										"context": "task",
										"changeset_json": "{% set json = {} %}\r\n{% set json = dict_set(json, 'title', 'Get coffee') %}\r\n{% set json = dict_set(json, 'due', 'today 08:30'|date('U')) %}\r\n{% set json = dict_set(json, 'importance', 90) %}\r\n{% set json = dict_set(json, 'owner_id', 0) %}\r\n{{json|json_encode|json_pretty}}",
										"run_in_simulator": "1",
										"object_placeholder": "_record"
									}
								]
							}
						},
						{
							"type": "action",
							"title": "New task: Reply to all unread email @ 4pm",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "core.bot.action.record.create",
										"context": "task",
										"changeset_json": "{% set json = {} %}\r\n{% set json = dict_set(json, 'title', 'Reply to all unread email') %}\r\n{% set json = dict_set(json, 'due', 'today 16:00'|date('U')) %}\r\n{% set json = dict_set(json, 'importance', 50) %}\r\n{% set json = dict_set(json, 'owner_id', 0) %}\r\n{{json|json_encode|json_pretty}}",
										"run_in_simulator": "1",
										"object_placeholder": "_record"
									}
								]
							}
						},
						{
							"type": "switch",
							"title": "Is it Monday?",
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
														"condition": "_day_of_week",
														"oper": "is",
														"day": [
															"1"
														]
													}
												]
											}
										]
									},
									"nodes": [
										{
											"type": "action",
											"title": "Find active workers",
											"status": "live",
											"params": {
												"actions": [
													{
														"action": "core.bot.action.record.search",
														"context": "workers",
														"query": "isDisabled:n",
														"expand": "",
														"object_placeholder": "_records_workers"
													}
												]
											}
										},
										{
											"type": "loop",
											"title": "Loop workers",
											"status": "live",
											"params": {
												"foreach_json": "{{_records_workers|json_encode|json_pretty}}",
												"as_placeholder": "worker"
											},
											"nodes": [
												{
													"type": "action",
													"title": "New task: Send weekly status report Monday @ 10am",
													"status": "live",
													"params": {
														"actions": [
															{
																"action": "core.bot.action.record.create",
																"context": "task",
																"changeset_json": "{% set json = {} %}\r\n{% set json = dict_set(json, 'title', 'Send weekly status report: ' ~ worker._label) %}\r\n{% set json = dict_set(json, 'due', 'today 10:00'|date('U')) %}\r\n{% set json = dict_set(json, 'importance', 100) %}\r\n{% set json = dict_set(json, 'owner_id', worker.id) %}\r\n{{json|json_encode|json_pretty}}",
																"run_in_simulator": "1",
																"object_placeholder": "_record"
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
	]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

The following records should be created:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/imported.png" class="screenshot">
</div>

# How it works

In the import results, click on **Recurring Task Bot** to open its card.

Click the **Edit** button at the top of the card:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/bot-card-edit.png" class="screenshot">
</div>

This bot can only create behaviors on the **Recurrent behavior** event, and it can only use the **Record create** and **Record search** actions.

Close the bot's editor and card.

## Scheduling a recurrent behavior

Now click on the **Create daily tasks** behavior in the import results.

This is a **Recurrent behavior**, so it automatically runs on a given schedule.

Let's look at how to define the schedule.

Click the **Edit** button at the top of the card.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/behavior-editor.png" class="screenshot">
</div>

The schedules are define as a concise cron expression[^cron-expression] with the format:

```
[minute] [hour] [day of month] [month of year] [day of week]
```

Our format is:

```
0 8 * * 1-5
```

The behavior will run on the 0th minute of the 8th hour (08:00), every day of the month, every month of the year, when the day of the week is Mon-Fri.

In other words, _"every weekday morning at 8am"_.

You can define multiple schedules, and the next occurrence will be automatically scheduled each time the behavior runs (or is edited).

For instance, you could also run this behavior at 10:45am and 10:45pm on Saturdays during January with:

```
45 10,22 * 1 6
```

Cron expressions are very flexible.

Close the behavior editor popup by clicking on the **(x)** in the top right.

## Creating task records

Let's now look at the behavior's card:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/behavior-card.png" class="screenshot">
</div>

When the behavior runs, it creates several tasks using the **Record create** action.

The first two tasks are created every day at 8am and 4pm.

Then the bot does something more complex.  If it's Monday, the bot loads a list of available workers and loops through it.  For each worker it creates a "status report" task due at 10am and assigns it to them.

Let's look at one of the **Record create** actions:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/create-recurring-tasks/action-create-record-task.png" class="screenshot">
</div>

This action internally uses the [Records API](/docs/api/endpoints/records/) to be able to create any type of record and set any number fields (including your own custom fields).

The field values are provided as a JSON[^json] object.

The behavior uses the `dict_set()` function to build the object. This automatically handles escaping, etc.

Close the behavior's editor and card.

# Next steps

* Modify the recurrent behavior's schedule to meet your needs.

* Change the created tasks.

# References

[^cron-expression]: Wikipedia: CRON expression - <https://en.wikipedia.org/wiki/Cron#CRON_expression>

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>