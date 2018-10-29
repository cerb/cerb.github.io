---
title: "Extension Point: Record Type"
permalink: /docs/plugins/extensions/points/devblocks.context/
toc:
  title: "Record Type"
  expand: Plugins
jumbotron:
  title: "Record Type"
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
| **Name:** | Record Type
| **Identifier (ID):** | devblocks.context

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.context&quot;&gt;
			&lt;id&gt;cerberusweb.contexts.asset&lt;/id&gt;
			&lt;name&gt;Asset&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/dao/asset.php&lt;/file&gt;
				&lt;name&gt;Context_Asset&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;names&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;asset&quot; value=&quot;singular&quot;/&gt;
						&lt;data key=&quot;assets&quot; value=&quot;plural&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
				&lt;param key=&quot;alias&quot; value=&quot;asset&quot;/&gt;
				&lt;param key=&quot;dao_class&quot; value=&quot;DAO_Asset&quot;/&gt;
				&lt;param key=&quot;view_class&quot; value=&quot;View_Asset&quot;/&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cards&quot;/&gt;
						&lt;data key=&quot;custom_fields&quot;/&gt;
						&lt;data key=&quot;links&quot;/&gt;
						&lt;data key=&quot;records&quot;/&gt;
						&lt;data key=&quot;search&quot;/&gt;
						&lt;data key=&quot;snippets&quot;/&gt;
						&lt;data key=&quot;va_variable&quot;/&gt;
						&lt;data key=&quot;watchers&quot;/&gt;
						&lt;data key=&quot;workspace&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
				&lt;param key=&quot;acl&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;comment&quot;/&gt;
						&lt;data key=&quot;create&quot;/&gt;
						&lt;data key=&quot;delete&quot;/&gt;
						&lt;data key=&quot;export&quot;/&gt;
						&lt;data key=&quot;import&quot;/&gt;
						&lt;data key=&quot;merge&quot;/&gt;
						&lt;data key=&quot;update&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_DevblocksContext {
	/**
	 * 
	 * @param string $view_id
	 * @return C4_AbstractView
	 */
	public function getChooserView($view_id) {
	}

	public function getContext($object, $token_labels, $token_values, $prefix) {
	}

	public function getDaoClass() {
	}
	
	public function getDaoFieldsFromKeyAndValue($key, $value, $out_fields, $error) {
	}

	public function getDaoFieldsFromKeysAndValues($data, $out_fields, $out_custom_fields, $error) {
	}

	public function getDefaultProperties() {
	}

	public function getKeyMeta() {
	}

	public function getKeyToDaoFieldMap() {
	}

	public function getMeta($context_id) {
	}

	public function getRandom() {
	}

	public function getSearchClass() {
	}

	public function getView($context, $context_id, $options, $view_id) {
	}

	public function getViewClass() {
	}

	public function lazyLoadContextValues($token, $dictionary) {
	}

	public function lazyLoadGetKeys() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Activity Log | `cerberusweb.contexts.activity_log`
| Application | `cerberusweb.contexts.app`
| Asset | `cerberusweb.contexts.asset`
| Attachment | `cerberusweb.contexts.attachment`
| Behavior Scheduled | `cerberusweb.contexts.behavior.scheduled`
| Behavior | `cerberusweb.contexts.behavior`
| Bot | `cerberusweb.contexts.bot`
| Bucket | `cerberusweb.contexts.bucket`
| Calendar Event | `cerberusweb.contexts.calendar_event`
| Calendar Recurring Event | `cerberusweb.contexts.calendar_event.recurring`
| Calendar | `cerberusweb.contexts.calendar`
| Call | `cerberusweb.contexts.call`
| Classifier Classification | `cerberusweb.contexts.classifier.class`
| Classifier Entity | `cerberusweb.contexts.classifier.entity`
| Classifier Example | `cerberusweb.contexts.classifier.example`
| Classifier | `cerberusweb.contexts.classifier`
| Comment | `cerberusweb.contexts.comment`
| Community Portal | `cerberusweb.contexts.portal`
| Connected Account | `cerberusweb.contexts.connected_account`
| Contact | `cerberusweb.contexts.contact`
| Currency | `cerberusweb.contexts.currency`
| Custom Field | `cerberusweb.contexts.custom_field`
| Custom Fieldset | `cerberusweb.contexts.custom_fieldset`
| Custom Record | `cerberusweb.contexts.custom_record`
| Domain | `cerberusweb.contexts.datacenter.domain`
| Draft | `cerberusweb.contexts.mail.draft`
| Email Address | `cerberusweb.contexts.address`
| Email Signature | `cerberusweb.contexts.email.signature`
| Email Template | `cerberusweb.contexts.mail.html_template`
| Email Transport | `cerberusweb.contexts.mail.transport`
| Feed Item | `cerberusweb.contexts.feed.item`
| Feed | `cerberusweb.contexts.feed`
| Feedback | `cerberusweb.contexts.feedback`
| File Bundle | `cerberusweb.contexts.file_bundle`
| Freshbooks Client | `wgm.freshbooks.contexts.client`
| Freshbooks Invoice | `wgm.freshbooks.contexts.invoice`
| Group | `cerberusweb.contexts.group`
| Jira Issue | `cerberusweb.contexts.jira.issue`
| Jira Project | `cerberusweb.contexts.jira.project`
| Knowledgebase Article | `cerberusweb.contexts.kb_article`
| Knowledgebase Category | `cerberusweb.contexts.kb_category`
| Mailbox Account | `cerberusweb.contexts.mailbox`
| Message | `cerberusweb.contexts.message`
| Notification | `cerberusweb.contexts.notification`
| Opportunity | `cerberusweb.contexts.opportunity`
| Organization | `cerberusweb.contexts.org`
| Profile Tab | `cerberusweb.contexts.profile.tab`
| Profile Widget | `cerberusweb.contexts.profile.widget`
| Project Board Column | `cerberusweb.contexts.project.board.column`
| Project Board | `cerberusweb.contexts.project.board`
| Public Key | `cerberusweb.contexts.gpg_public_key`
| Reminder | `cerberusweb.contexts.reminder`
| Role | `cerberusweb.contexts.role`
| Saved Search | `cerberusweb.contexts.context.saved.search`
| Sensor | `cerberusweb.contexts.datacenter.sensor`
| Server | `cerberusweb.contexts.datacenter.server`
| Skill | `cerberusweb.contexts.skill`
| Skillset | `cerberusweb.contexts.skillset`
| Snippet | `cerberusweb.contexts.snippet`
| Task | `cerberusweb.contexts.task`
| Ticket | `cerberusweb.contexts.ticket`
| Time Tracking Activity | `cerberusweb.contexts.timetracking.activity`
| Time Tracking | `cerberusweb.contexts.timetracking`
| Twitter Message | `cerberusweb.contexts.twitter.message`
| Web Api Credentials | `cerberusweb.contexts.webapi.credential`
| Webhook Listener | `cerberusweb.contexts.webhook_listener`
| Worker | `cerberusweb.contexts.worker`
| Workspace Page | `cerberusweb.contexts.workspace.page`
| Workspace Tab | `cerberusweb.contexts.workspace.tab`
| Workspace Widget | `cerberusweb.contexts.workspace.widget`
| Workspace Worklist | `cerberusweb.contexts.workspace.list`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>