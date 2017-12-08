---
title: Packages
permalink: /docs/api/modules/packages/
jumbotron:
  title: Packages
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

<div class="cerb-box note">
<p>This API is available in <a href="/releases/8.2.4/"><b>Cerb 8.2.4</b></a> or later.</p>
</div>

# Import a package

**POST /packages/import.json**

Import a pre-built workflow package. You must have **administrator** privileges to make this request.

|---
| Field | Type | 
|-|-|-
| `package_json` | string | See: [Packages](/resources/packages/)
| `prompts[]` | array | (varies by package)

### Example
{: .no_toc}

<pre>
<code class="language-php">
{% raw %}
$json_string = <<< EOF
{
  "package": {
    "name": "Create a task",
    "revision": 1,
    "requires": {
      "cerb_version": "8.0.0",
      "plugins": [
        "cerb.bots.portal.widget"
      ]
    },
    "configure": {
      "prompts": [
        {
          "type": "text",
          "label": "Task name:",
          "key": "task_title",
          "params": {
          }
        },
        {
          "type": "chooser",
          "label": "Task owner:",
          "key": "worker_id",
          "params": {
            "context": "cerberusweb.contexts.worker",
            "query": "isDisabled:n",
            "single": true
          }
        }
      ]
    }
  },
  "records": [
    {
      "_context": "task",
      "uid": "new_task",
      "title": "{{{task_title}}}",
      "owner_id": "{{{worker_id}}}"
    }
  ]
}
{% endraw %}
EOF;

$postfields = [
    ['package_json', $json_string],
    ['prompts[task_title]', 'This is a new task']
    ['prompts[worker_id]', '1']
];
$out = $cerb->post($base_url . 'packages/import.json', $postfields);
</code>
</pre>

{% include api_toc.html %}