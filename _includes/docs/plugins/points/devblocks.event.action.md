* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.event.action">
			<id>example.bot.action</id>
			<name>Example Bot Action</name>
			<class>
				<file>api/App.php</file>
				<name>BotAction_Example</name>
			</class>
			<params>
				<param key="label" value="Example Bot Action"/>
				<param key="events">
					<value>
						<data key="*"/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

### Params

* `label`: The human-friendly name for this action shown in the actions menu when building bots.

* `events`: The [bot events](/docs/plugins/extensions/points/devblocks.event/) where this action is available. One entry per data key. Wildcards can be used with an asterisk (`*`), and a single asterisk key adds the action to all events.

# Code

{% highlight php %}
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
{% endhighlight %}

