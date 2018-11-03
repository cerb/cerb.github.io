* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.page.menu.item&quot;&gt;
			&lt;id&gt;wgmclickatell.setup.menu.plugins.clickatell&lt;/id&gt;
			&lt;name&gt;Clickatell&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WgmClickatell_SetupPluginsMenuItem&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;page_id&quot; value=&quot;core.page.configuration&quot;/&gt;
				&lt;param key=&quot;menu_id&quot; value=&quot;core.setup.menu.services&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_ContextProfileScript {
	public function renderScript($context, $context_id) {
	}
}
{% endraw %}
</code>
</pre>

