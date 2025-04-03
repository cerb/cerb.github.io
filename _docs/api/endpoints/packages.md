---
title: Packages
excerpt: This page provides instructions for importing a pre-built workflow package
  in Cerb using a POST request to the `/rest/packages/import.json` endpoint.
summary: This page provides instructions for importing a pre-built workflow package
  in Cerb using a POST request to the `/rest/packages/import.json` endpoint. It specifies
  that administrator privileges are required to perform this action. The page details
  the necessary fields for the request, including `package_json` and `prompts[]`,
  which vary by package. An example is provided, illustrating how to structure the
  JSON string for a package named "Create a task," which includes configuration prompts
  for task name and task owner. The example also demonstrates how to use PHP to send
  the request with the appropriate postfields.
permalink: /docs/api/endpoints/packages/
toc:
  expand: API
jumbotron:
  title: Packages
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Import a package

**POST /rest/packages/import.json**

Import a pre-built workflow package. You must have **administrator** privileges to make this request.

|---
| Field | Type | 
|-|-|-
| `package_json` | string | See: [Packages](/guides/packages/building/)
| `prompts[]` | array | (varies by package)

### Example
{: .no_toc}

{% highlight http %}
{% raw %}
POST /rest/packages/import.json
Host: cerb.example
Authorization: Bearer <token>

package_json={
  "package": {
    "name": "Create a task",
    "revision": 1,
    "requires": {
      "cerb_version": "9.1.4",
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
&prompts[task_title]=This is a new task
&prompts[worker_id]=1
{% endraw %}
{% endhighlight %}
