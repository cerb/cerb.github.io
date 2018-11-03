* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.event.action&quot;&gt;
			&lt;id&gt;example.bot.action&lt;/id&gt;
			&lt;name&gt;Example Bot Action&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;BotAction_Example&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;label&quot; value=&quot;Example Bot Action&quot;/&gt;
				&lt;param key=&quot;events&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;*&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

### Params

* `label`: The human-friendly name for this action shown in the actions menu when building bots.

* `events`: The [bot events](/docs/plugins/extensions/points/devblocks.event/) where this action is available. One entry per data key. Wildcards can be used with an asterisk (`*`), and a single asterisk key adds the action to all events.

# Code

<pre>
<code class="language-php">
{% raw %}
class BotAction_Example extends Extension_DevblocksEventAction {
	const ID = 'example.bot.action';

	/**
	 * Render the behavior action's configuration template.
	 */
	public function render(Extension_DevblocksEvent $event, Model_TriggerEvent $trigger, $params=[], $seq=NULL) {
		$tpl = DevblocksPlatform::services()->template();
		$tpl->assign('params', $params);
		
		if(!is_null($seq))
			$tpl->assign('namePrefix', 'action'.$seq);
		
		$tpl->display('devblocks:example.plugin::bot_actions/action_example.tpl');
	}

	/**
	 * Simulate the behavior action.
	 */
	public function simulate($token, Model_TriggerEvent $trigger, $params, DevblocksDictionaryDelegate $dict) {
		@$object_placeholder = $params['object_placeholder'] ?: '_placeholder';
		
		// Run the action in the simulator
		$this->run($token, $trigger, $params, $dict);
		
		// Return some simulator output
		$out = sprintf(">>> {{%s}}:\n%s\n",
			$object_placeholder,
			$dict->get($object_placeholder)
		);
		
		return $out;
	}

	/**
	 * Run the behavior action.
	 */
	public function run($token, Model_TriggerEvent $trigger, $params, DevblocksDictionaryDelegate $dict) {
		@$object_placeholder = $params['object_placeholder'] ?: '_placeholder';
		@$content = $params['content'];
		
		$tpl_builder = DevblocksPlatform::services()->templateBuilder();
		
		$output = $tpl_builder->build($content, $dict);
		
		$dict->set($object_placeholder, $output);
	}
};
{% endraw %}
</code>
</pre>

