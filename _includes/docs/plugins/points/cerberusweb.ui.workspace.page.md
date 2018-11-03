* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.page&quot;&gt;
			&lt;id&gt;core.workspace.page.workspace&lt;/id&gt;
			&lt;name&gt;Workspace&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/workspaces.php&lt;/file&gt;
				&lt;name&gt;WorkspacePage_Workspace&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;label&quot; value=&quot;common.workspace&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_WorkspacePage {
	public function renderPage(Model_WorkspacePage $page) {
	}
}
{% endraw %}
</code>
</pre>

