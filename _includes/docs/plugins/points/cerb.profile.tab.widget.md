* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.profile.tab.widget&quot;&gt;
			&lt;id&gt;cerb.profile.tab.widget.behavior.tree&lt;/id&gt;
			&lt;name&gt;Behavior Tree&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/profiles.php&lt;/file&gt;
				&lt;name&gt;ProfileWidget_BehaviorTree&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_ProfileWidget {
	public function render(Model_ProfileWidget $model, $context, $context_id, $refresh_options) {
	}

	public function renderConfig(Model_ProfileWidget $model) {
	}

	public function saveConfig(array $fields, $id, $error) {
	}
}
{% endraw %}
</code>
</pre>

