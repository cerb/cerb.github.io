* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.rest.controller&quot;&gt;
			&lt;id&gt;cerberusweb.datacenter.domains.rest&lt;/id&gt;
			&lt;name&gt;Domains&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/rest/domains.php&lt;/file&gt;
				&lt;name&gt;ChRest_Domains&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;domains&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_RestController {
	public function deleteAction($stack) {
	}

	public function getAction($stack) {
	}

	public function patchAction($stack) {
	}

	public function postAction($stack) {
	}

	public function putAction($stack) {
	}
}
{% endraw %}
</code>
</pre>

