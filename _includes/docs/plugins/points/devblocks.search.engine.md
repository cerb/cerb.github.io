* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.search.engine&quot;>
			<id>devblocks.search.engine.elasticsearch</id>
			<name>Elasticsearch</name>
			<class>
				<file>api/services/search.php</file>
				<name>DevblocksSearchEngineElasticSearch</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksSearchEngine {
}
{% endraw %}
{% endhighlight %}

