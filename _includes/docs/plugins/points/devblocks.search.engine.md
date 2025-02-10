* TOC
{:toc}

# Manifest

{% highlight xml %}
		&lt;extension point=&quot;devblocks.search.engine&quot;&gt;
			&lt;id&gt;devblocks.search.engine.elasticsearch&lt;/id&gt;
			&lt;name&gt;Elasticsearch&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/search.php&lt;/file&gt;
				&lt;name&gt;DevblocksSearchEngineElasticSearch&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksSearchEngine {
}
{% endraw %}
{% endhighlight %}

