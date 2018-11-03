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

