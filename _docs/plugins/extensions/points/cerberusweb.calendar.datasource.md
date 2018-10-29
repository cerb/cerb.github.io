---
title: "Extension Point: Calendar Datasource"
permalink: /docs/plugins/extensions/points/cerberusweb.calendar.datasource/
toc:
  title: "Calendar Datasource"
  expand: Plugins
jumbotron:
  title: "Calendar Datasource"
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
| **Name:** | Calendar Datasource
| **Identifier (ID):** | cerberusweb.calendar.datasource

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.calendar.datasource&quot;&gt;
			&lt;id&gt;calendar.datasource.calendar&lt;/id&gt;
			&lt;name&gt;Calendar&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/calendars/calendar_datasources.php&lt;/file&gt;
				&lt;name&gt;CalendarDatasource_Calendar&lt;/name&gt;
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
class ExampleExtension extends Extension_CalendarDatasource {
	public function getData(Model_Calendar $calendar, array $params, $params_prefix, $date_range_from, $date_range_to) {
	}

	public function renderConfig(Model_Calendar $calendar, $params, $series_prefix) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Calendar | `calendar.datasource.calendar`
| Worklist | `calendar.datasource.worklist`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>