---
title: Migrate legacy macro behaviors to bot interactions
excerpt: This guide is simplifies the process of migrating from legacy macros in earlier versions to bot interactions in Cerb 8.0+.
layout: integration
topic: Bots
subtopic: Conversational Bots
jumbotron:
  title: Migrate legacy macro behaviors to bot interactions
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
  -
    label: Conversational Bots &raquo;
    url: /resources/guides/#bots-conversational-bots
---

* TOC
{:toc}

# Introduction

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/cerb-bots-banner.png" class="screenshot">
</div>
{% endcomment %}

Prior to Cerb [8.0](/releases/8.0/), workers could run "custom behaviors" (_macros_) to automate actions against a specific record from its profile.

This was simple to use, but the implementation had several significant shortcomings:

* Macros were limited to basic inputs: text, numbers, dates, and picklists.

* Macros couldn't ask different questions based on earlier answers (i.e. multi-step inputs).

* Macros lacked a uniform way to return output or errors. Behaviors failed silently. As a hack, the bot could leave comments on the target record.

* Macros lacked fine-grained control over which workers could run which behaviors on which records. This led to a lot of clutter in the macro menu.

* Macros lacked a consistent placeholder for the worker who ran the behavior. This is because macros could also be scheduled to run in the future, started by bots, triggered from other events, etc.

* A long-running macro could time out without any indication it didn't finish. There was no way to avoid the maximum execution time of a request.

* Macros could only automate worker actions in Cerb -- they couldn't interact with customers, etc.

To address these issues, the 8.0 update introduced [bot interactions](/releases/8.0/#conversational-bots) to replace macros:

* Interactions use a conversational interface. They can prompt for input in multiple formats and steps, and adapt based on previous answers. They can easily respond with output in a variety of formats as often as needed.

* Interactions support multiple channels. They can help workers in Cerb or serve visitors directly on any website. We're also building channels for other platforms like Facebook Messenger, Slack, and Twilio.

* Interactions can be personalized. The available interactions may change depending on any combination of fields on the current worker or the target record. For instance, a particular interaction may only be available on closed tickets, or on tickets in a specific group, or on tickets with a specific subject line.  This contextuality greatly reduces clutter.

* Interactions always have a human actor on the other side of the conversation.

* Interactions can break long running actions into multiple steps and provide output between the steps.

* Interactions are virtual. Several interactions can reuse the same behavior as shortcuts and provide different inputs.  For instance, "Remind me by email", "Remind me by notification", and "Remind me by text message" could use the same underlying behavior, without having to prompt "How would you like to be reminded?" as the first question each interaction.

* While workers can't directly run custom behaviors, bots still can.  Therefore, interactions can "wrap" any existing custom behaviors without modification.

Despite these improvements, in environments that heavily relied on macro behaviors, the upgrade from 7.x to 8.x can be daunting.

This guide is intended to simplify the process of migrating from legacy macro behaviors to bot interactions.

# A primer on bot interactions

First, let's review how bot interactions work.

Interactions are available from several **interaction points**.  For instance, record-based interactions can begin from a record's profile or card popup.  On a website, an interaction may start when the visitor clicks on a "Sign up" button.  For workers, there's a "global" interaction point available in the lower right of every page.

Interaction points can provide parameters, such as a record's type and ID. This initially informs the conversational bot about what is being discussed.

There are three events involved with the lifecycle of an interaction:

* **Get interactions:** When a user is near an interaction point, this event is called to fetch a list of possible interactions. Each interaction is returned from a bot behavior using an action, so the possible interactions can be filtered based on any condition (aspects of the worker, the target record, etc). These are generally displayed in an interactions menu.

* **Handle interaction:** When a specific interaction from the above list is selected, Cerb runs its associated handler. A single handler behavior can be shared by multiple interactions.  The common convention is to have one "Get interactions" and one "Handle interaction" behavior per bot.  The handler takes parameters from the interaction and passes them to a conversational behavior. If an interaction is being started from a link in email, a signature may be verified to detect tampering, etc.  With customer-facing bots on websites, the _get interactions_ step is skipped and the _handler_ is called directly when a link or button is clicked.

* **Conversation:** The conversational behavior then starts, with its initial state provided by the interaction.  It prompts the user for input, does something useful, and provides output.  This process may repeat as many times as needed to achieve the desired outcome. For instance, imagine a troubleshooter that has a user try multiple solutions to uncover a root cause.  In some situations it may find a common issue right away, and in others it may need to ask many follow-up questions to identify an uncommon issue.

Macro behaviors were always of a specific record type -- ticket macros, task macros, etc.

Conversational behaviors aren't inherently associated with a specific record type.  That means you can reuse the same conversational behavior for multiple interactions and adapt it to different record types.

Consider a "Remind me" interaction.  Previously, you would have needed a new macro for every record type (ticket, task, organization, opportunity, and so on).  This is cumbersome.  With interactions, you can register a single "Remind me about this" interaction on every record at the same time (with interaction point `record:*`), which uses the same handler, and the same conversational behavior.

The ability to use wildcards like this is another reason why the _handler_ step exists, rather than directly linking interactions to conversational behaviors.

Ideally, all existing macros would be converted into conversational behaviors to take full advantage of the new functionality. However, this can take a while in environments with hundreds of macros.  During the transition, the existing macro behaviors can be "wrapped" by interactions.  That is, an interaction can run the macro on behalf of the worker; gathering the required input and providing output.

The most frequently used macros can then be converted into conversational behaviors first, with the "long tail" of less frequently used macros being converted over time.

# Import the Macro Bot package

We've created a **Macro Bot** package to demonstrate how to run existing macros from interactions.

Navigate to **Setup >> Configure >> Import Package**.

Copy and paste the following JSON:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
	"package": {
		"name": "Macro Bot",
		"revision": 1,
		"requires": {
			"cerb_version": "8.2.9",
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
	"records": [

	],
	"bots": [
		{
			"uid": "bot_macro",
			"name": "Macro Bot",
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
			"image": null,
			"behaviors": [
				{
					"uid": "behavior_9",
					"title": "Comment on task",
					"is_disabled": false,
					"is_private": false,
					"priority": 50,
					"event": {
						"key": "event.macro.task",
						"label": "Custom behavior on task"
					},
					"variables": {
						"var_comment_text": {
							"key": "var_comment_text",
							"label": "Comment Text",
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
							"title": "Comment",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "create_comment",
										"on": "task_id",
										"content": "{{var_comment_text}}"
									}
								]
							}
						}
					]
				},
				{
					"uid": "behavior_6",
					"title": "Get interactions for worker",
					"is_disabled": false,
					"is_private": false,
					"priority": 50,
					"event": {
						"key": "event.interactions.get.worker",
						"label": "Conversation get interactions for worker",
						"params": {
							"listen_points": "record:cerberusweb.contexts.task\r\n\r\n"
						}
					},
					"nodes": [
						{
							"type": "switch",
							"title": "Interaction Point:",
							"status": "live",
							"nodes": [
								{
									"type": "outcome",
									"title": "record:cerberusweb.contexts.task",
									"status": "live",
									"params": {
										"groups": [
											{
												"any": 0,
												"conditions": [
													{
														"condition": "point",
														"oper": "is",
														"value": "record:cerberusweb.contexts.task"
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
														"behavior_id": "{{{uid.behavior_7}}}",
														"name": "Comment on task",
														"interaction": "task.comment",
														"interaction_params_json": "{\r\n\t\"id\": \"{{point_params.id}}\"\r\n}"
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
					"uid": "behavior_7",
					"title": "Handle interaction with worker",
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
									"title": "task.comment",
									"status": "live",
									"params": {
										"groups": [
											{
												"any": 0,
												"conditions": [
													{
														"condition": "interaction",
														"oper": "is",
														"value": "task.comment"
													}
												]
											}
										]
									},
									"nodes": [
										{
											"type": "action",
											"title": "Run behavior",
											"status": "live",
											"params": {
												"actions": [
													{
														"action": "switch_behavior",
														"return": "0",
														"behavior_id": "{{{uid.behavior_8}}}",
														"var_interaction": "{{interaction}}",
														"var_task_id": "{{interaction_params.id}}",
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
					"uid": "behavior_8",
					"title": "Run legacy task macros",
					"is_disabled": false,
					"is_private": false,
					"priority": 50,
					"event": {
						"key": "event.message.chat.worker",
						"label": "Conversation with worker"
					},
					"variables": {
						"var_interaction": {
							"key": "var_interaction",
							"label": "Interaction",
							"type": "S",
							"is_private": "0",
							"params": {
								"widget": "single"
							}
						},
						"var_task_id": {
							"key": "var_task_id",
							"label": "Task ID",
							"type": "N",
							"is_private": "0",
							"params": [

							]
						},
						"var_task": {
							"key": "var_task",
							"label": "Task",
							"type": "ctx_cerberusweb.contexts.task",
							"is_private": "1",
							"params": [

							]
						}
					},
					"nodes": [
						{
							"type": "action",
							"title": "Load task record",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "var_task",
										"search_mode": "quick_search",
										"quick_search": "id:{{var_task_id}}",
										"limit": "first",
										"limit_count": "10",
										"mode": "replace",
										"worklist_model": null
									}
								]
							}
						},
						{
							"type": "switch",
							"title": "Interaction:",
							"status": "live",
							"nodes": [
								{
									"type": "outcome",
									"title": "task.comment",
									"status": "live",
									"params": {
										"groups": [
											{
												"any": 0,
												"conditions": [
													{
														"condition": "var_interaction",
														"oper": "is",
														"value": "task.comment"
													}
												]
											}
										]
									},
									"nodes": [
										{
											"type": "action",
											"title": "What should I comment?",
											"status": "live",
											"params": {
												"actions": [
													{
														"action": "send_message",
														"message": "What should I say in the comment?",
														"format": "",
														"delay_ms": "1000"
													},
													{
														"action": "prompt_text",
														"placeholder": "",
														"default": "This is a new comment on the task.",
														"mode": "multiple"
													}
												]
											}
										},
										{
											"type": "action",
											"title": "Save prompt response",
											"status": "live",
											"params": {
												"actions": [
													{
														"action": "_set_custom_var",
														"value": "{{message}}",
														"format": "",
														"is_simulator_only": "0",
														"var": "prompt_text"
													}
												]
											}
										},
										{
											"type": "action",
											"title": "Run behavior",
											"status": "live",
											"params": {
												"actions": [
													{
														"action": "_run_behavior",
														"on": "var_task",
														"behavior_id": "{{{uid.behavior_9}}}",
														"var_comment_text": "{{prompt_text}}",
														"run_in_simulator": "0",
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
							"type": "action",
							"title": "Respond",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "send_message",
										"message": "Done!",
										"format": "",
										"delay_ms": "1000"
									},
									{
										"action": "send_message",
										"message": "{% set task = var_task|first %}\r\n&lt;ul class=\"bubbles\" style=\"padding:0;\"&gt;\r\n\t&lt;li&gt;\r\n\t\t&lt;a href=\"javascript:;\" class=\"cerb-peek-trigger\" data-context=\"{{task._context}}\" data-context-id=\"{{task.id}}\"&gt;{{task._label}}&lt;/a&gt;\r\n\t&lt;/li&gt;\r\n&lt;/ul&gt;",
										"format": "html",
										"delay_ms": "1000"
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
										"action": "prompt_buttons",
										"options": "Thanks!",
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
							"title": "Close chat window",
							"status": "live",
							"params": {
								"actions": [
									{
										"action": "window_close"
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

You should see a summary like the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/imported.png" class="screenshot">
</div>

# Using Macro Bot

The example in Macro Bot is implemented for task records.

1. Navigate to **Search >> Tasks**.

1. Select (or create) a task.

1. Open its profile page.

1. Click on the Cerb icon in the toolbar, and select **Macro Bot >> Comment on task**:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/menu.png" class="screenshot">
	</div>
	
1. The bot will begin a conversation and ask you for the text of the comment to be created.  You can type something, or keep the default of _"This is a new comment on the task"_.  Press `<ENTER>` when done.
	
	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/convo-comment.png" class="screenshot">
	</div>
	
1. The bot will use a task macro behavior to add a comment to the task.  You'll be given a link to the card of the task once it's done.  Click the link to open the card:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/convo-task-card.png" class="screenshot">
	</div>

1. You should see the comment on the task, created by the legacy macro behavior:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/convo-task-card-comment.png" class="screenshot">
	</div>
	
1. Click on the blue **Thanks!** button to end the chat.

# Examining Macro Bot

Now let's look at how Macro Bot handles these interactions.

1. Navigate to **Search >> Bots**.

1. Open the card for **Macro Bot**.

1. Click on the **Behaviors** button near the bottom of the card:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/card-macro-bot.png" class="screenshot">
	</div>

1. A search popup will open with the bot's four behaviors in a worklist:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behaviors.png" class="screenshot">
	</div>
	
Let's examine these behaviors in more detail.

### Get interactions for worker

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-get-interactions.png" class="screenshot">
</div>

The **Get interactions for worker** behavior listens on the `record:cerberusweb.contexts.task` interaction point. This is the Cerb button on task profile pages and card popups.

The behavior returns one interaction named **task.comment** with the label **Comment on task** (it could have returned more). The interaction starts with the parameter `id`, which is set to the ID of the current task.  The task's full dictionary of placeholders is available from `point_params`.

When the interaction starts, it runs the **Handle interaction with worker** behavior below.

### Handle interaction with worker

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-handle-interaction.png" class="screenshot">
</div>

The **Handle interaction with worker** behavior runs when a worker starts a specific interaction. In the example above, this would be when the worker selects a macro (_Comment on task_) from a task profile page or card popup.

A decision determines which interaction was selected as an outcome. In our example above, the outcome would be **task.comment**. A **Use behavior** action then starts the **Run legacy task macros** conversational behavior below.  It is given the interaction and task ID as inputs.  Its results are returned as a `_behavior` placeholder.

### Comment on task

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-comment.png" class="screenshot">
</div>

The **Comment on task** behavior is a simple example of a legacy macro behavior.

It accepts **Comment Text** as an input variable of type _multiple line text_.

It then uses the **Create comment** action to post a comment on the target task record.

In practice, legacy macros are generally much more involved.

Once you understand how interactions work, you can delete this sample behavior and use your own.

### Run legacy task macros

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros-load.png" class="screenshot">
</div>

At this point, a chat window opens in the browser and a conversation begins between the worker and Macro Bot.

The **Run legacy task macros** conversational behavior starts.  The first thing it does is load the current task record into a variable so its placeholders can be used later on. This also allows the task record to be used as a target for actions. This is what enables all of your existing legacy macro behaviors to be used during the interaction.

Next, a decision determines which interaction should be used as the outcome.  In this case it would be **task.comment**.

The bot then collects the inputs needed to run the **Comment on task** macro behavior.

It asks the worker for the comment text:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros-prompt.png" class="screenshot">
</div>

It saves the worker's response in a placeholder named `prompt_text` and runs the macro behavior on their behalf. The macro's response is saved in the `_behavior` placeholder:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros-run-behavior.png" class="screenshot">
</div>

After any macro runs in the previous step, the bot provides a link to the task's card popup, and prompts with a 'Thanks!' button.  The conversation ends when the worker clicks the button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros-output.png" class="screenshot">
</div>

This simple demonstration is a bit contrived because a worker could just comment on the record themselves. Generally, macros automate a sequence of actions that would be tedious and time-consuming for a worker to manually repeat.

# Extending Macro Bot

You can reuse the same **Get interactions** and **Handle interaction** behaviors on Macro Bot for all of your existing macros.

You can reuse the same **Run legacy task macros** conversational behavior for all of your existing task macros.  You can copy it for other record types (e.g. tickets).

In the outcome for each interaction, the bot would prompt the worker for information depending on the inputs of each macro.  Macro Bot can run macro behaviors on any other bot as long as they are marked public. Private behaviors can only be used by behaviors on the same bot.

The bot also doesn't have to provide output when there isn't an error.  You can use the **Close chat window** action to end the conversation immediately after running the macro.

Over time, you should migrate the functionality from your legacy macro behaviors into **Conversation with worker** behaviors that start directly from **Handle interaction**.  This allows the entire process to be interactive, rather than just the initial input and final output.