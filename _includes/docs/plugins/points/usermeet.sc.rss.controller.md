* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;usermeet.sc.rss.controller&quot;&gt;
			&lt;id&gt;cerberusweb.kb.sc.rss.controller&lt;/id&gt;
			&lt;name&gt;Knowledgebase RSS&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/sc/rss/kb.php&lt;/file&gt;
				&lt;name&gt;UmScKbRssController&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;kb&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_UmScRssController {
	public function handleRequest(DevblocksHttpRequest $request) {
	}
}
{% endraw %}
</code>
</pre>

