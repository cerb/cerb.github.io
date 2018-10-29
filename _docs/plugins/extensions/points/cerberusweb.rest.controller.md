---
title: "Extension Point: Rest API Controller"
permalink: /docs/plugins/extensions/points/cerberusweb.rest.controller/
toc:
  title: "Rest API Controller"
  expand: Plugins
jumbotron:
  title: "Rest API Controller"
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
| **Name:** | Rest API Controller
| **Identifier (ID):** | cerberusweb.rest.controller

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.rest.controller&quot;&gt;
			&lt;id&gt;cerberusweb.datacenter.domains.rest&lt;/id&gt;
			&lt;name&gt;Domains&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/rest/domains.php&lt;/file&gt;
				&lt;name&gt;ChRest_Domains&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;domains&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_RestController {
	public function deleteAction($stack) {
	}

	public function getAction($stack) {
	}

	public function patchAction($stack) {
	}

	public function postAction($stack) {
	}

	public function putAction($stack) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Activity Log | `cerberusweb.rest.controller.activity_log`
| Addresses | `cerberusweb.rest.controller.addresses`
| Attachments | `cerberusweb.rest.controller.attachments`
| Bots | `cerberusweb.rest.controller.bots`
| Calendars | `cerberusweb.rest.controller.calendars`
| Comments | `cerberusweb.rest.controller.comments`
| Contacts | `cerberusweb.rest.controller.contacts`
| Contexts | `cerberusweb.rest.controller.context`
| Custom Fields | `cerberusweb.rest.controller.custom_fields`
| Data | `cerberusweb.rest.controller.data`
| Domains | `cerberusweb.datacenter.domains.rest`
| Feedback | `feedback.rest.controller.feedback`
| Groups | `cerberusweb.rest.controller.groups`
| KB Articles | `cerberusweb.rest.controller.kbarticles`
| KB Categories | `cerberusweb.rest.controller.kbcategories`
| Mail HTML Templates | `cerberusweb.rest.controller.mail_html_templates`
| Messages | `cerberusweb.rest.controller.messages`
| Notifications | `cerberusweb.rest.controller.notifications`
| Opportunities | `crm.rest.controller.opps`
| Orgs | `cerberusweb.rest.controller.orgs`
| Packages | `cerberusweb.rest.controller.packages`
| Parser | `cerberusweb.rest.controller.parser`
| Records | `cerberusweb.rest.controller.records`
| Saved Searches | `cerberusweb.rest.controller.saved_searches`
| Sensors | `cerberusweb.datacenter.sensors.rest`
| Servers | `cerberusweb.datacenter.servers.rest`
| Snippets | `cerberusweb.rest.controller.snippets`
| Tasks | `cerberusweb.rest.controller.tasks`
| Tickets | `cerberusweb.rest.controller.tickets`
| Time Tracking | `cerberusweb.rest.controller.timetracking`
| Workers | `cerberusweb.rest.controller.workers`
| Workspaces | `cerberusweb.rest.controller.workspaces`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>