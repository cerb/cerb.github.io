* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
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
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_Sensor {
	public function renderConfig($params) {
	}

	public function run($params, $fields) {
	}
}
{% endraw %}
</code>
</pre>

