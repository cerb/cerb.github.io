---
title: "Extension Point: Sensor Type"
permalink: /docs/plugins/extensions/points/cerberusweb.datacenter.sensor/
toc:
  title: "Sensor Type"
  expand: Plugins
jumbotron:
  title: "Sensor Type"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Sensor Type
| **Identifier (ID):** | cerberusweb.datacenter.sensor

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

# Extensions

| External | `cerberusweb.datacenter.sensor.external`
| HTTP | `cerberusweb.datacenter.sensor.http`
| Port | `cerberusweb.datacenter.sensor.port`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>