---
title: "Extension Point: Bot Action"
permalink: /docs/plugins/extensions/points/devblocks.event.action/
toc:
  title: "Bot Action"
  expand: Plugins
jumbotron:
  title: "Bot Action"
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
| **Name:** | Bot Action
| **Identifier (ID):** | devblocks.event.action

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

# Extensions

| Classifier Prediction | `core.va.action.classifier_prediction`
| Create Asset | `va.action.create_asset`
| Create Attachment | `core.va.action.create_attachment`
| Create Domain | `va.action.create_domain`
| Create Opportunity | `va.action.create_opportunity`
| Create Reminder | `core.bot.action.create_reminder`
| Create Server | `va.action.create_server`
| Data Query | `core.bot.action.data_query`
| Email Parser | `core.bot.action.email_parser`
| Get Available Workers from ShiftPlanning Event Action | `wgmshiftplanning.event.action.get_available_workers`
| Get Pre-signed URL for AWS | `wgm.aws.bot.action.get_presigned_url`
| Get time elapsed using calendar availability | `core.bot.action.calculate_time_elapsed`
| HTTP Request | `core.va.action.http_request`
| JIRA API | `wgmjira.event.action.api_call`
| Log Call Global Event Action | `calls.event.action.post`
| Package Import | `core.bot.action.package.import`
| Post to Campfire | `wgmcampfire.event.action.post`
| Post to Facebook Page | `wgmfacebook.event.action.post`
| Post to HipChat | `wgmhipchat.event.action.post`
| Record Create | `core.bot.action.record.create`
| Record Delete | `core.bot.action.record.delete`
| Record Retrieve | `core.bot.action.record.retrieve`
| Record Search | `core.bot.action.record.search`
| Record Update | `core.bot.action.record.update`
| Record Upsert | `core.bot.action.record.upsert`
| Schedule Proactive Interaction | `core.bot.action.interaction_proactive.schedule`
| Send SMS Event Action | `wgmclickatell.event.action.send_sms`
| Send SMS Event Action | `wgmtwilio.event.action.send_sms`
| Update Twitter Status | `wgmtwitter.event.action.post`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>