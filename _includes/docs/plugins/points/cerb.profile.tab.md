* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.profile.tab&quot;&gt;
			&lt;id&gt;cerb.profile.tab.dashboard&lt;/id&gt;
			&lt;name&gt;Dashboard&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/profiles.php&lt;/file&gt;
				&lt;name&gt;ProfileTab_Dashboard&lt;/name&gt;
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
class ExampleExtension extends Extension_ProfileTab {
	public function renderConfig(Model_ProfileTab $model) {
	}

	public function saveConfig(Model_ProfileTab $model) {
	}

	public function showTab(Model_ProfileTab $model, $context, $context_id) {
	}

	public function invoke(string $action, Model_ProfileTab $model) {
	}
}
{% endraw %}
</code>
</pre>

