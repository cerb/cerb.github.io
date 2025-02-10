* TOC
{:toc}

# Manifest

{% highlight xml %}
		&lt;extension point=&quot;cerberusweb.datacenter.sensor&quot;&gt;
			&lt;id&gt;cerberusweb.datacenter.sensor.external&lt;/id&gt;
			&lt;name&gt;External&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WgmDatacenterSensorsSensorExternal&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_Sensor {
	public function renderConfig($params) {
	}

	public function run($params, $fields) {
	}
}
{% endraw %}
{% endhighlight %}

