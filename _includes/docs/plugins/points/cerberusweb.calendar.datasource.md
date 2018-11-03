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

