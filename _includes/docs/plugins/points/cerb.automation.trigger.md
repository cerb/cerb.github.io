# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.automation.trigger&quot;&gt;
			&lt;id&gt;cerb.trigger.api.request&lt;/id&gt;
			&lt;name&gt;api.request&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/automations/triggers/api.request.php&lt;/file&gt;
				&lt;name&gt;AutomationTrigger_ApiRequest&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;description&quot; value=&quot;Invoke an automation from the REST API with OAuth tokens&quot;/&gt;
				&lt;param key=&quot;features&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;inputs&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
class ExampleExtension extends Extension_AutomationTrigger {
	protected function _getRecordTypeSuggestions()

	public function getAutocompleteSuggestions()

	public function getAutocompleteSuggestionsJson()

	public function getEditorToolbar()

	public function getEditorToolbarItems($toolbar)

	public function getEventPlaceholders()

	public function getEventToolbar()

	public function getEventToolbarItems($toolbar)

	public function getInputsMeta()

	public function getOutputsMeta()

	public function renderConfig($model)

	public function validateConfig($params, $error)

}
</code>
</pre>

