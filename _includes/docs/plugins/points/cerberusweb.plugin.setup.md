* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.plugin.setup&quot;&gt;
			&lt;id&gt;wgmcampfire.setup&lt;/id&gt;
			&lt;name&gt;Setup&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WgmCampfire_Setup&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;tab_label&quot; value=&quot;Campfire Credentials&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_PluginSetup {
	public static function getByPlugin($plugin_id, $as_instances) {
	}

	public function render() {
	}

	public function save($errors) {
	}
}
{% endraw %}
</code>
</pre>

