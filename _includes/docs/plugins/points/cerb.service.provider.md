* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.service.provider&quot;&gt;
			&lt;id&gt;wgm.aws.service.provider&lt;/id&gt;
			&lt;name&gt;Amazon Web Services&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ServiceProvider_Aws&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;contexts&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cerberusweb.contexts.app&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.group&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.role&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.worker&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_ServiceProvider {
	public function renderConfigForm(Model_ConnectedAccount $account) {
	}

	public function saveConfigForm(Model_ConnectedAccount $account, array $params) {
	}
}
{% endraw %}
</code>
</pre>

