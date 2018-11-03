* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.widget&quot;&gt;
			&lt;id&gt;core.workspace.widget.bot&lt;/id&gt;
			&lt;name&gt;Bot Custom Widget&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/dashboards.php&lt;/file&gt;
				&lt;name&gt;WorkspaceWidget_BotBehavior&lt;/name&gt;
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
class ExampleExtension extends Extension_WorkspaceWidget {
	public function render(Model_WorkspaceWidget $widget, $refresh_options) {
	}

	public function renderConfig(Model_WorkspaceWidget $widget) {
	}

	public function saveConfig(Model_WorkspaceWidget $widget) {
	}
}
{% endraw %}
</code>
</pre>

