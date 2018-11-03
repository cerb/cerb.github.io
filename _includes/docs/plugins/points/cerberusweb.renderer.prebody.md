* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.renderer.prebody&quot;&gt;
			&lt;id&gt;timetracking.renderer.prebody&lt;/id&gt;
			&lt;name&gt;Time Tracking Pre-body Renderer&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChTimeTrackingPreBodyRenderer&lt;/name&gt;
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
class ExampleExtension extends Extension_AppPreBodyRenderer {
	public function render() {
	}
}
{% endraw %}
</code>
</pre>

