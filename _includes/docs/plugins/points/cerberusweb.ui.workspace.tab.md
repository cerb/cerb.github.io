* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.tab&quot;&gt;
			&lt;id&gt;core.workspace.tab.dashboard&lt;/id&gt;
			&lt;name&gt;Dashboard&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/dashboards.php&lt;/file&gt;
				&lt;name&gt;WorkspaceTab_Dashboards&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;label&quot; value=&quot;dashboard&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_WorkspaceTab {
	public function exportTabConfigJson(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function importTabConfigJson($import_json, Model_WorkspaceTab $tab) {
	}

	public function renderTab(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function renderTabConfig(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function saveTabConfig(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}
}
{% endraw %}
</code>
</pre>

