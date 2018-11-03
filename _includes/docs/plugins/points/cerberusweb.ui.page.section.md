* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.page.section&quot;&gt;
			&lt;id&gt;assets.page.profiles.asset&lt;/id&gt;
			&lt;name&gt;Asset Section&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/profiles/asset.php&lt;/file&gt;
				&lt;name&gt;PageSection_ProfilesAsset&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;page_id&quot; value=&quot;core.page.profiles&quot;/&gt;
				&lt;param key=&quot;uri&quot; value=&quot;asset&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_PageSection {
	public function render() {
	}
}
{% endraw %}
</code>
</pre>

