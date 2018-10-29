---
title: "Extension Point: Profile Widget Type"
permalink: /docs/plugins/extensions/points/cerb.profile.tab.widget/
toc:
  title: "Profile Widget Type"
  expand: Plugins
jumbotron:
  title: "Profile Widget Type"
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
| **Name:** | Profile Widget Type
| **Identifier (ID):** | cerb.profile.tab.widget

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.profile.tab.widget&quot;&gt;
			&lt;id&gt;cerb.profile.tab.widget.behavior.tree&lt;/id&gt;
			&lt;name&gt;Behavior Tree&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/profiles.php&lt;/file&gt;
				&lt;name&gt;ProfileWidget_BehaviorTree&lt;/name&gt;
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
class ExampleExtension extends Extension_ProfileWidget {
	public function render(Model_ProfileWidget $model, $context, $context_id, $refresh_options) {
	}

	public function renderConfig(Model_ProfileWidget $model) {
	}

	public function saveConfig(array $fields, $id, $error) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Behavior Tree**](/docs/plugins/extensions/cerb.profile.tab.widget.behavior.tree/) | `cerb.profile.tab.widget.behavior.tree`
| [**Calendar Availability**](/docs/plugins/extensions/cerb.profile.tab.widget.calendar.availability/) | `cerb.profile.tab.widget.calendar.availability`
| [**Calendar**](/docs/plugins/extensions/cerb.profile.tab.widget.calendar/) | `cerb.profile.tab.widget.calendar`
| [**Chart: Categories**](/docs/plugins/extensions/cerb.profile.tab.widget.chart.categories/) | `cerb.profile.tab.widget.chart.categories`
| [**Chart: Pie**](/docs/plugins/extensions/cerb.profile.tab.widget.chart.pie/) | `cerb.profile.tab.widget.chart.pie`
| [**Chart: Scatterplot**](/docs/plugins/extensions/cerb.profile.tab.widget.chart.scatterplot/) | `cerb.profile.tab.widget.chart.scatterplot`
| [**Chart: Table**](/docs/plugins/extensions/cerb.profile.tab.widget.chart.table/) | `cerb.profile.tab.widget.chart.table`
| [**Chart: Time Series**](/docs/plugins/extensions/cerb.profile.tab.widget.chart.time_series/) | `cerb.profile.tab.widget.chart.time_series`
| [**Comments**](/docs/plugins/extensions/cerb.profile.tab.widget.comments/) | `cerb.profile.tab.widget.comments`
| [**Custom**](/docs/plugins/extensions/cerb.profile.tab.widget.bot/) | `cerb.profile.tab.widget.bot`
| [**Data Query Visualization**](/docs/plugins/extensions/cerb.profile.tab.widget.visualization/) | `cerb.profile.tab.widget.visualization`
| [**HTML/Javascript**](/docs/plugins/extensions/cerb.profile.tab.widget.html/) | `cerb.profile.tab.widget.html`
| [**Knowledgebase Article**](/docs/plugins/extensions/cerb.profile.tab.widget.kb_article/) | `cerb.profile.tab.widget.kb_article`
| [**Project Board**](/docs/plugins/extensions/cerb.profile.tab.widget.project_board/) | `cerb.profile.tab.widget.project_board`
| [**Record Fields**](/docs/plugins/extensions/cerb.profile.tab.widget.fields/) | `cerb.profile.tab.widget.fields`
| [**Responsibilities**](/docs/plugins/extensions/cerb.profile.tab.widget.responsibilities/) | `cerb.profile.tab.widget.responsibilities`
| [**Ticket Conversation**](/docs/plugins/extensions/cerb.profile.tab.widget.ticket.convo/) | `cerb.profile.tab.widget.ticket.convo`
| [**Ticket Spam Analysis**](/docs/plugins/extensions/cerb.profile.tab.widget.ticket.spam_analysis/) | `cerb.profile.tab.widget.ticket.spam_analysis`
| [**Worklist**](/docs/plugins/extensions/cerb.profile.tab.widget.worklist/) | `cerb.profile.tab.widget.worklist`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>