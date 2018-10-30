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

# Migrating legacy macros to bot interactions

We've created a migration script that automatically builds interactions for each bot that has macro behaviors. The script generates a package for each bot that you can import into Cerb 8.3.1 or later.

### Save the migration script

Copy the migration script below and save it to the web path on your web server.  You can use your Cerb path, but remember to remove the files when you're done so the files don't remain downloadable.

**cerb-migrate-bot-macros.php**:
<pre style="max-height:29.5em;">
<code class="language-php">
{% raw %}
<?php
if(false == (@$json = json_decode(file_get_contents('bots.json'), true)))
	die("Failed to open the bots.json file.");

if(!isset($json['bots']))
	die("No bots in the JSON file.");

$macros_to_contexts = [
	'event.macro.address' => 'cerberusweb.contexts.address',
	'event.macro.asset' => 'cerberusweb.contexts.asset',
	'event.macro.bot' => 'cerberusweb.contexts.bot',
	'event.macro.calendar' => 'cerberusweb.contexts.calendar',
	'event.macro.calendar_event' => 'cerberusweb.contexts.calendar_event',
	'event.macro.call' => 'cerberusweb.contexts.call',
	'event.macro.contact' => 'cerberusweb.contexts.contact',
	'event.macro.crm.opportunity' => 'cerberusweb.contexts.opportunity',
	'event.macro.domain' => 'cerberusweb.contexts.datacenter.domain',
	'event.macro.feeditem' => 'cerberusweb.contexts.feed.item',
	'event.macro.group' => 'cerberusweb.contexts.group',
	'event.macro.jira_issue' => 'cerberusweb.contexts.jira.issue',
	'event.macro.jira_project' => 'cerberusweb.contexts.jira.project',
	'event.macro.kb_article' => 'cerberusweb.contexts.kb_article',
	'event.macro.message' => 'cerberusweb.contexts.message',
	'event.macro.notification' => 'cerberusweb.contexts.notification',
	'event.macro.org' => 'cerberusweb.contexts.org',
	'event.macro.reminder' => 'cerberusweb.contexts.reminder',
	'event.macro.sensor' => 'cerberusweb.contexts.datacenter.sensor',
	'event.macro.server' => 'cerberusweb.contexts.datacenter.server',
	'event.macro.task' => 'cerberusweb.contexts.task',
	'event.macro.ticket' => 'cerberusweb.contexts.ticket',
	'event.macro.timetracking' => 'cerberusweb.contexts.timetracking',
	'event.macro.worker' => 'cerberusweb.contexts.worker',
];

foreach($json['bots'] as $bot_id => &$bot) {
	if(!isset($bot['behaviors']))
		continue;
	
	$macros = [];
	$listen_points = [];
	
	$package_data = [
		'package' => [
			'name' => sprintf('Convert %s macros to interactions', $bot['name']),
			'revision' => 1,
			'requires' => [
				'cerb_version' => '8.3.1',
				'plugins' => [],
			],
			'configure' => [
				'prompts' => [],
				'placeholders' => [],
			],
		],
		'behaviors' => [
		],
	];
	
	$get_interactions_data = [
		'uid' => 'behavior_get_interactions_' . $bot_id,
		'bot_id' => $bot_id,
		'title' => 'Get macro interactions for worker',
		'is_disabled' => false,
		'is_private' => false,
		'priority' => 50,
		'event' => [
			'key' => 'event.interactions.get.worker',
			'label' => 'Conversation get interactions for worker',
			'params' => [
				'listen_points' => '',
			],
		],
		'nodes' => [
			[
				'type' => 'switch',
				'title' => 'Interaction Point:',
				'status' => 'live',
				'nodes' => [],
			],
		],
	];
	
	$handle_interaction_data = [
		'uid' => 'behavior_handle_interaction_' . $bot_id,
		'bot_id' => $bot_id,
		'title' => 'Handle macro interaction with worker',
		'is_disabled' => false,
		'is_private' => false,
		'priority' => 50,
		'event' => [
			'key' => 'event.interaction.chat.worker',
			'label' => 'Conversation handle interaction with worker',
		],
		'nodes' => [
			[
				'type' => 'switch',
				'title' => 'Interaction:',
				'status' => 'live',
				'nodes' => [],
			],
		],
	];
	
	$convo_run_macro_data = [
		'uid' => 'behavior_convo_run_macro_' . $bot_id,
		'bot_id' => $bot_id,
		'title' => 'Convo: Run a macro behavior for worker',
		'is_disabled' => false,
		'is_private' => false,
		'priority' => 50,
		'event' => [
			'key' => 'event.message.chat.worker',
			'label' => 'Conversation with worker',
		],
		'variables' => [
			'var_context' => [
				'key' => 'var_context',
				'label' => 'Context',
				'type' => 'S',
				'is_private' => '0',
				'params' => [
					'widget' => 'single',
				]
			],
			'var_context_id' => [
				'key' => 'var_context_id',
				'label' => 'Context ID',
				'type' => 'N',
				'is_private' => '0',
				'params' => [],
			],
			'var_records' => [
				'key' => 'var_records',
				'label' => 'Records',
				'type' => 'contexts',
				'is_private' => 1,
				'params' => [],
			],
		],
		'nodes' => [
			[
				'type' => 'action',
				'title' => 'Load record',
				'status' => 'live',
				'params' => [
					'actions' => [
						[
							'action' => 'var_records',
							'context' => 'var_context',
							'search_mode' => 'quick_search',
							'quick_search' => 'id:{{var_context_id}}',
							'limit' => 'first',
							'limit_count' => '1',
							'mode' => 'replace',
						]
					],
				],
			],
			[
				'type' => 'switch',
				'title' => 'Empty?',
				'status' => 'live',
				'nodes' => [],
			],
			[
				'type' => 'switch',
				'title' => 'Interaction:',
				'status' => 'live',
				'nodes' => [],
			],
			[
				'type' => 'action',
				'title' => 'Thanks!',
				'status' => 'live',
				'params' => [
					'actions' => [
						[
							'action' => 'prompt_buttons',
							'options' => 'Thanks!',
							'color_from' => '#4795f7',
							'color_mid' => '#4795f7',
							'color_to' => '#4795f7',
							'style' => '',
						],
					],
				],
			],
			[
				'type' => 'action',
				'title' => 'Close chat window',
				'status' => 'live',
				'params' => [
					'actions' => [
						[
							'action' => 'send_message',
							'message' => 'Bye!',
							'format' => '',
							'delay_ms' => '1000',
						],
						[
							'action' => 'window_close',
						],
					],
				],
			],
		],
	];
	
	foreach($bot['behaviors'] as &$behavior) {
		// We only care about macros
		if('event.macro.' != substr($behavior['event']['key'], 0, 12))
			continue;
		
		// Skip macros on bots
		if('event.macro.bot' == $behavior['event']['key'])
			continue;
		
		// We only care about enabled public macros
		if($behavior['is_private'] || $behavior['is_disabled'])
			continue;
		
		// It must be a macro we have a context for
		if(false == (@$listen_point = $macros_to_contexts[$behavior['event']['key']]))
			continue;
		
		$behavior_id = explode('_', $behavior['uid'])[1];
		$macros[] = $behavior_id;
		
		// Add the listen point to the behaviors
		if(!isset($listen_points[$listen_point])) {
			$get_interactions_data['event']['params']['listen_points'] .= 'record:' . $listen_point . "\r\n";
			
			// Keep track of where we added the listen point in the switch
			$listen_points[$listen_point] = count($get_interactions_data['nodes'][0]['nodes']);
			
			$get_interactions_data['nodes'][0]['nodes'][] = [
				'type' => 'outcome',
				'title' => 'record:' . $listen_point,
				'status' => 'live',
				'params' => [
					'groups' => [
						[
							'any' => 0,
							'conditions' => [
								[
									'condition' => 'point',
									'oper' => 'is',
									'value' => 'record:' . $listen_point,
								],
							],
						],
					],
				],
				'nodes' => [
					[
						'type' => 'action',
						'title' => 'Return interactions',
						'status' => 'live',
						'params' => [
							'actions' => [],
						],
					],
				],
			];
		}
		
		$get_interactions_data['nodes'][0]['nodes'][$listen_points[$listen_point]]['nodes'][0]['params']['actions'][] = [
			'action' => 'return_interaction',
			'behavior_id' => '{{{uid.behavior_handle_interaction_' . $bot_id . '}}}',
			'name' => $behavior['title'],
			'interaction' => $behavior['uid'],
			"interaction_params_json" => "{% set json = {} %}\r\n{% set json = dict_set(json, 'context', point_params._context) %}\r\n{% set json = dict_set(json, 'context-id', point_params.id) %}\r\n{{json|json_encode|json_pretty}}",
		];
		
		$handle_interaction_data['nodes'][0]['nodes'][] = [
			'type' => 'outcome',
			'title' => $behavior['title'],
			'status' => 'live',
			'params' => [
				'groups' => [
					[
						'any' => 0,
						'conditions' => [
							[
								'condition' => 'interaction',
								'oper' => 'is',
								'value' => $behavior['uid'],
							],
						],
					],
				],
			],
			'nodes' => [
				[
					'type' => 'action',
					'title' => 'Start convo',
					'status' => 'live',
					'params' => [
						'actions' => [
							[
								'action' => 'switch_behavior',
								'return' => 0,
								'behavior_id' => '{{{uid.behavior_convo_run_macro_' . $bot_id . '}}}',
								'var_context' => "{{interaction_params['context']}}",
								'var_context_id' => "{{interaction_params['context-id']}}",
								'var' =>  '_behavior',
							]
						],
					],
				],
			],
		];
		
		$node_idx = count($convo_run_macro_data['nodes'][2]['nodes']);
		
		$convo_run_macro_data['nodes'][2]['nodes'][] = [
			'type' => 'outcome',
			'title' => $behavior['title'],
			'status' => 'live',
			'params' => [
				'groups' => [
					[
						'any' => 0,
						'conditions' => [
							[
								'condition' => 'interaction',
								'oper' => 'is',
								'value' => $behavior['uid'],
							],
						],
					],
				],
			],
			'nodes' => [
				[
					'type' => 'action',
					'title' => 'Run macro behavior',
					'status' => 'live',
					'params' => [
						'actions' => [
							[
								'action' => '_run_behavior',
								'on' => 'var_records',
								'behavior_id' => $behavior_id,
								'run_in_simulator' => '0',
								'var' =>  '_behavior',
							],
						],
					],
				],
				[
					'type' => 'action',
					'title' => 'Respond with summary',
					'status' => 'live',
					'params' => [
						'actions' => [
							[
								'action' => 'send_message',
								'message' => "{% set record = var_records|first %}\r\nI ran \r\n<div class=\"bubble\">\r\n\t<a href=\"javascript:;\" class=\"cerb-peek-trigger\" data-context=\"cerberusweb.contexts.behavior\" data-context-id=\"{{_behavior.behavior_id}}\">{{_behavior.behavior__label}}</a>\r\n</div>\r\n on \r\n<div class=\"bubble\">\r\n\t<a href=\"javascript:;\" class=\"cerb-peek-trigger\" data-context=\"{{record._context}}\" data-context-id=\"{{record.id}}\">{{record._label}}</a>\r\n</div>\r\n for you.",
								'format' => 'html',
								'delay_ms' =>  '1000',
							]
						],
					],
				],
			],
		];
		
		// See if we have variables in this behavior we need to prompt for
		if(isset($behavior['variables'])) {
			//var_dump($behavior['variables']);
			
			$action_vars =& $convo_run_macro_data['nodes'][2]['nodes'][$node_idx]['nodes'][0]['params']['actions'][0];
			$actions =& $convo_run_macro_data['nodes'][2]['nodes'][$node_idx]['nodes'];
			
			foreach($behavior['variables'] as $variable) {
				// Only public inputs
				if($variable['is_private'])
					continue;
				
				$key = $variable['key'];
				$type = $variable['type'];
				
				switch($type) {
					// Checkbox
					case 'C':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_buttons',
										'options' => "yes\r\nno",
										'color_from' => '#4795f7',
										'color_mid' => '#4795f7',
										'color_to' => '#4795f7',
										'style' => '',
										'var' => 'prompt_' . $key,
										'var_format' => "{{message == 'yes' ? 1 : 0}}",
										'var_validate' => '',
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
					
					// Picklist
					case 'D':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_buttons',
										'options' => @$variable['params']['options'],
										'color_from' => '#4795f7',
										'color_mid' => '#4795f7',
										'color_to' => '#4795f7',
										'style' => '',
										'var' => 'prompt_' . $key,
										'var_format' => "{{message}}",
										'var_validate' => '',
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
					
					// Date
					case 'E':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_date',
										'placeholder' => "e.g. \"tomorrow 5pm\"",
										'default' => '',
										'mode' => '',
										'var' => 'prompt_' . $key,
										'var_format' => "{{message|date('U')}}",
										'var_validate' => "{% if 0 == prompt_var_date %}\r\nPlease enter a valid date.\r\n{% endif %}",
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
					
					// Number
					case 'N':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_text',
										'placeholder' => 'Enter a number...',
										'default' => '',
										'mode' => '',
										'var' => 'prompt_' . $key,
										'var_format' => "{{message|replace({',':''})|number_format(0,'','')}}",
										'var_validate' => "{% if message is not numeric %}\r\nYou must enter a number.\r\n{% endif %}",
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
					
					// Text
					case 'S':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_text',
										'placeholder' => '',
										'default' => '',
										'mode' => '',
										'var' => 'prompt_' . $key,
										'var_format' => '',
										'var_validate' => '',
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
						
					// Worker
					case 'W':
						$prompt = [
							'type' => 'action',
							'title' => 'Prompt for ' . $variable['label'],
							'status' => 'live',
							'params' => [
								'actions' => [
									[
										'action' => 'send_message',
										'message' => $variable['label'] . '?',
										'format' => '',
										'delay_ms' => '1000',
									],
									[
										'action' => 'prompt_chooser',
										'context' => 'cerberusweb.contexts.worker',
										'query' => 'isDisabled:n',
										'selection' => 'single',
										'autocomplete' => '1',
										'var' => 'prompt_' . $key,
										'var_format' => '',
										'var_validate' => '',
									]
								],
							],
						];
						
						array_splice($actions, -2, 0, [$prompt]);
						$action_vars[$key] = '{{prompt_' . $key . '}}';
						break;
				}
			}
		}
		
		//var_dump($behavior);
	}
	
	if($macros) {
		echo "<h1>", $bot['name'], "</h1>";
		
		$package_data['behaviors'][] = $get_interactions_data;
		$package_data['behaviors'][] = $handle_interaction_data;
		$package_data['behaviors'][] = $convo_run_macro_data;
		
		echo "<textarea style='height:250px;width:95%;'>";
		echo json_encode($package_data, JSON_PRETTY_PRINT);
		echo "</textarea>";
	}
}
{% endraw %}
</code>
</pre>

### Export your existing bot macros

1. Navigate to the `/debug` page in your Cerb install.

1. Select the **Export Bots** option.

1. Download and save the file as `bots.json` in the same directory as the PHP script above.

### Run the migration script

Open the PHP script in your web browser from the URL on your web server.

You should see a textarea for each bot that contains a package file:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/script-export-package.png" class="screenshot">
</div>

### Import packages

Once you've upgraded to Cerb 8.3.1 or later, you can import the generated packages to wrap your legacy macro behaviors in bot interactions.

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste a package into the text box.

1. Click the **Import** button.

You should see that three new behaviors have been created on the target bot:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/imported.png" class="screenshot">
</div>

### Clean up

Remove the `bots.json` file and `cerb-migrate-bot-macros.php` script from your web server.

# Using the new bot interactions

1. Navigate to the profile page of a record where you had macros.

1. Click on the Cerb icon in the toolbar:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/menu.png" class="screenshot">
	</div>

1. You should see a bot interaction for each of your old macros.

1. Click on one of the interactions.

1. The bot will prompt you for any required input:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/convo-prompts.png" class="screenshot">
	</div>

1. The bot will then run the macro on your behalf:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/convo-finished.png" class="screenshot">
	</div>
	
1. Click on the blue **Thanks!** button to end the chat.

# Extending bot interactions

Now let's look at how your bots handle these interactions.

1. Navigate to **Search >> Bots**.

1. Open the card for one of the bots where you just imported interactions.

1. Click on the **Behaviors** button near the bottom of the card:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/bots/migrate-macros/card-macro-bot.png" class="screenshot">
	</div>
	
Let's examine these behaviors in more detail.

### Get macro interactions for worker

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-get-interactions.png" class="screenshot">
</div>

The **Get macro interactions for worker** behavior listens on various record-based interaction points. This is the Cerb button on profile pages and card popups.

Depending on how your macros are set up, you may see multiple interaction points.

The available interactions are returned for the point where the worker is -- a contact record, a ticket, etc.

When an interaction is triggered, we add parameters for the `context` and `context-id` of the current record and send everything to the **Handle macro interaction with worker** behavior below.

### Handle macro interaction with worker

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-handle-interaction.png" class="screenshot">
</div>

The **Handle macro interaction with worker** behavior runs when a worker triggers a specific interaction.

A decision determines which interaction was selected as an outcome. A **Use behavior** action then starts the **Convo: Run a macro behavior for worker** conversational behavior below.  It is given the `context` and `context-id` for the current record as inputs.  Its results will be returned as a `_behavior` placeholder.

### Convo: Run a macro behavior for worker

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros.png" class="screenshot">
</div>

At this point, a chat window opens in the browser and a conversation begins between the bot and worker.

The **Convo: Run a macro behavior for worker** conversational behavior starts.  The first thing it does is load the current record into a variable so its placeholders can be used later on. This also allows the record to be used as a target for actions. This is what enables all of your existing legacy macro behaviors to be used during the interaction.

Next, a decision determines which interaction should be used as the outcome.

The bot then collects the inputs needed to run the the macro (if any).

It saves the worker's response in a series of placeholders named `prompt_*` and runs the macro behavior on their behalf. The macro's response is saved in the `_behavior` placeholder.

After the macro runs, the bot provides a link to the record's card popup, and prompts with a 'Thanks!' button.  The conversation ends when the worker clicks the button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/migrate-macros/macro-bot-behavior-run-macros-output.png" class="screenshot">
</div>

You can modify this response for each interaction to make your bots more helpful.

The bot also doesn't have to provide output when there isn't an error.  You can use the **Close chat window** action to end the conversation immediately after running the macro.

Over time, you should migrate the functionality from your legacy macro behaviors into **Conversation with worker** behaviors that start directly from **Handle interaction**.  This allows the entire process to be interactive, rather than just the initial input and final output.