* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.page&quot;&gt;
			&lt;id&gt;core.page.welcome&lt;/id&gt;
			&lt;name&gt;Welcome Page&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/welcome.php&lt;/file&gt;
				&lt;name&gt;ChWelcomePage&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;welcome&quot;/&gt;
				&lt;param key=&quot;menutitle&quot; value=&quot;&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends CerberusPageExtension {
	public function isVisible() {
	}

	public function render() {
	}
}
{% endraw %}
</code>
</pre>

