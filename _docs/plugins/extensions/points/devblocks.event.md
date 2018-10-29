---
title: "Extension Point: Bot Event"
permalink: /docs/plugins/extensions/points/devblocks.event/
toc:
  title: "Bot Event"
  expand: Plugins
jumbotron:
  title: "Bot Event"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Bot Event
| **Identifier (ID):** | devblocks.event

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.event&quot;&gt;
			&lt;id&gt;example.bot.event&lt;/id&gt;
			&lt;name&gt;Example bot event&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/events/example.php&lt;/file&gt;
				&lt;name&gt;Event_Example&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;contexts&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cerberusweb.contexts.app&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.group&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.role&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.worker&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;visibility&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

### Params

* `contexts`: This event is available for bots owned by one of these contexts.

* These `options` configure the event:

	 * `visibility`: The event has public/private variants. This is uncommon.

# Code

<pre style="max-height:29.5em;">
<code class="language-php">
{% raw %}
class Event_Example extends Extension_DevblocksEvent {
	const ID = 'example.bot.event';

	/**
	 * 
	 * 
	 * @return Model_DevblocksEvent
	 */
	function generateSampleEventModel(Model_TriggerEvent $trigger) {
		$actions = [];
		
		return new Model_DevblocksEvent(
			static::ID,
			[
				'key' => 'value',
				'actions' => &$actions,
			]
		);
	}
	
	public function renderEventParams(Model_TriggerEvent $trigger=null) {
		
	}
	
	/**
	 * @param array $event_params
	 * @param string $error
	 * @return boolean
	 */
	public function prepareEventParams(Model_TriggerEvent $behavior=null, &$new_params, &$error) {
		$error = null;
		return true;
	}

	public function setEvent(Model_DevblocksEvent $event_model=null, Model_TriggerEvent $trigger=null) {
		$labels = [];
		$values = [];
		
		/**
		 * Behavior
		 */
		
		$merge_labels = [];
		$merge_values = [];
		CerberusContexts::getContext(CerberusContexts::CONTEXT_BEHAVIOR, $trigger, $merge_labels, $merge_values, null, true);

			// Merge
			CerberusContexts::merge(
				'behavior_',
				'',
				$merge_labels,
				$merge_values,
				$labels,
				$values
			);
		
		// [TODO] Register key/values from the event
		
		//@$value = $event_model->params['key'];
		//$labels['key'] = 'Key';
		//$values['key'] = $value;
		
		//$values['_actions'] =& $event_model->params['actions'];
		
		/**
		 * Return
		 */

		$this->setLabels($labels);
		$this->setValues($values);
	}
	
	public function renderSimulatorTarget($trigger, $event_model) {
		
	}
	
	function getValuesContexts($trigger) {
		$vals = array(
			'behavior_id' => [
				'label' => 'Behavior',
				'context' => CerberusContexts::CONTEXT_BEHAVIOR,
			],
			'behavior_bot_id' => [
				'label' => 'Bot',
				'context' => CerberusContexts::CONTEXT_BOT,
			],
		);
		
		$vars = parent::getValuesContexts($trigger);
		
		$vals_to_ctx = array_merge($vals, $vars);
		DevblocksPlatform::sortObjects($vals_to_ctx, '[label]');
		
		return $vals_to_ctx;
	}
	
	public function getConditionExtensions(Model_TriggerEvent $trigger) {
		$labels = $this->getLabels($trigger);
		$types = $this->getTypes();
		
		$labels['example_condition'] = 'Example Condition';
		$types['example_condition'] = null;
		
		$conditions = $this->_importLabelsTypesAsConditions($labels, $types);
		
		return $conditions;
	}
	
	public function renderConditionExtension($token, $as_token, $trigger, $params=[], $seq=null) {
		$tpl = DevblocksPlatform::services()->template();
		$tpl->assign('params', $params);

		if(!is_null($seq))
			$tpl->assign('namePrefix','condition'.$seq);
		
		switch($as_token) {
			case 'example_condition':
				// [TODO] Render condition configuration template
				break;
		}
	}
	
	public function runConditionExtension($token, $as_token, $trigger, $params, DevblocksDictionaryDelegate $dict) {
		$pass = true;
		
		switch($as_token) {
			case 'example_condition':
				// [TODO] Implement condition logic
				$pass = true;
				break;
				
			default:
				$pass = false;
				break;
		}
		
		return $pass;
	}
	
	public function getActionExtensions(Model_TriggerEvent $trigger) {
		$actions =
			[
				'example_action' => array('label' => 'Example Behavior Action'),
			]
		;
		
		return $actions;
	}

	public function renderActionExtension($token, $trigger, $params=[], $seq=null) {
		$tpl = DevblocksPlatform::services()->template();
		$tpl->assign('params', $params);

		if(!is_null($seq))
			$tpl->assign('namePrefix','action'.$seq);

		$labels = $this->getLabels($trigger);
		$tpl->assign('token_labels', $labels);
			
		switch($token) {
			case 'example_action':
				// [TODO] Render action configuration template
				//$tpl->display('devblocks:example.plugin::events/action_example.tpl');
				break;
		}
	}

	protected function simulateActionExtension($token, $trigger, $params, DevblocksDictionaryDelegate $dict) {
		$out = null;
		
		switch($token) {
			case 'example_action':
				// [TODO] Output something
				$out = sprintf(">>> Output\n");
				break;
		}
		
		return $out;
	}
	
	public function runActionExtension($token, $trigger, $params, DevblocksDictionaryDelegate $dict) {
		switch($token) {
			case 'example_action':
				// [TODO] Do something
				break;
		}
	}
};
{% endraw %}
</code>
</pre>

# Extensions

| After message sent from group member | `event.mail.after.sent.group`
| After message sent from worker | `event.mail.after.sent`
| After ticket profile viewed by a worker | `event.ticket.viewed.worker`
| Before message sent from group member | `event.mail.sent.group`
| Before message sent from worker | `event.mail.before.sent`
| Before new incoming message is accepted | `event.mail.received.app`
| Conversation assigned in group | `event.mail.assigned.group`
| Conversation closed in group | `event.mail.closed.group`
| Conversation get interactions for worker | `event.interactions.get.worker`
| Conversation handle interaction with portal visitor | `event.interaction.chat.portal`
| Conversation handle interaction with worker | `event.interaction.chat.worker`
| Conversation moved in group | `event.mail.moved.group`
| Conversation with portal visitor | `event.message.chat.portal`
| Conversation with worker | `event.message.chat.worker`
| Custom API request | `event.api.custom_request`
| Custom behavior on JIRA issue | `event.macro.jira_issue`
| Custom behavior on JIRA project | `event.macro.jira_project`
| Custom behavior on asset | `event.macro.asset`
| Custom behavior on bot | `event.macro.bot`
| Custom behavior on calendar event | `event.macro.calendar_event`
| Custom behavior on calendar | `event.macro.calendar`
| Custom behavior on call | `event.macro.call`
| Custom behavior on contact | `event.macro.contact`
| Custom behavior on domain | `event.macro.domain`
| Custom behavior on email address | `event.macro.address`
| Custom behavior on feed item | `event.macro.feeditem`
| Custom behavior on group | `event.macro.group`
| Custom behavior on knowledgebase article | `event.macro.kb_article`
| Custom behavior on message | `event.macro.message`
| Custom behavior on notification | `event.macro.notification`
| Custom behavior on opportunity | `event.macro.crm.opportunity`
| Custom behavior on organization | `event.macro.org`
| Custom behavior on reminder | `event.macro.reminder`
| Custom behavior on sensor | `event.macro.sensor`
| Custom behavior on server | `event.macro.server`
| Custom behavior on task | `event.macro.task`
| Custom behavior on ticket | `event.macro.ticket`
| Custom behavior on time tracking entry | `event.macro.timetracking`
| Custom behavior on worker | `event.macro.worker`
| Dashboard get metric for widget | `event.dashboard.widget.get_metric`
| Dashboard render widget | `event.dashboard.widget.render`
| Data Query Datasource | `event.data.query.datasource`
| New JIRA issue | `wgmjira.event.issue.created`
| New comment on JIRA issue | `wgmjira.event.issue.commented`
| New comment on conversation in group | `event.comment.ticket.group`
| New contact registered in Support Center | `event.contact.registered.sc`
| New message added to ticket in this group | `event.mail.received.group`
| New message added to ticket | `event.mail.received`
| New message on a watched ticket | `event.mail.received.watcher`
| New notification for me | `event.notification.received.worker`
| New status on JIRA issue | `wgmjira.event.issue.status.changed`
| New task created | `event.task.created.worker`
| Record changed | `event.record.changed`
| Record commented on | `event.comment.created.worker`
| Recurrent behavior | `event.behavior.recurrent`
| Webhook received | `event.webhook.received`
| [DEPRECATED] [UI] During a message reply | `event.mail.reply.during.ui.worker`
| [UI] Before composing a message reply | `event.mail.reply.pre.ui.worker`
| [UI] Before composing a new message | `event.mail.compose.pre.ui.worker`
| [UI] Render record worklist | `event.ui.worklist.render.worker`
| [UI] Respond to Ajax HTTP request | `event.ajax.request`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>