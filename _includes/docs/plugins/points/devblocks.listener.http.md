* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.listener.http&quot;&gt;
			&lt;id&gt;core.listeners.tour&lt;/id&gt;
			&lt;name&gt;Core Helpdesk Tour&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/listeners.classes.php&lt;/file&gt;
				&lt;name&gt;ChCoreTour&lt;/name&gt;
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
class ExampleExtension extends DevblocksHttpResponseListenerExtension {
	public function run(DevblocksHttpResponse $request, Smarty $tpl) {
	}
}
{% endraw %}
</code>
</pre>

