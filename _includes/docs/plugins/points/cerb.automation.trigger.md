# Manifest

{% highlight xml %}
		<extension point="cerb.automation.trigger">
			<id>cerb.trigger.api.request</id>
			<name>api.request</name>
			<class>
				<file>api/automations/triggers/api.request.php</file>
				<name>AutomationTrigger_ApiRequest</name>
			</class>
			<params>
				<param key="description" value="Invoke an automation from the REST API with OAuth tokens"/>
				<param key="features">
					<value>
						<data key="inputs"/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
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
{% endhighlight %}

