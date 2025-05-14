* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.calendar.datasource">
			<id>calendar.datasource.calendar</id>
			<name>Calendar</name>
			<class>
				<file>api/uri/internal/calendars/calendar_datasources.php</file>
				<name>CalendarDatasource_Calendar</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_CalendarDatasource {
	public function getData(Model_Calendar $calendar, array $params, $params_prefix, $date_range_from, $date_range_to) {
	}

	public function renderConfig(Model_Calendar $calendar, $params, $series_prefix) {
	}
}
{% endraw %}
{% endhighlight %}

