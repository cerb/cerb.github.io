* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.datacenter.sensor&quot;>
			<id>cerberusweb.datacenter.sensor.external</id>
			<name>External</name>
			<class>
				<file>api/App.php</file>
				<name>WgmDatacenterSensorsSensorExternal</name>
			</class>
			<params>
			</params>
		</extension>
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

