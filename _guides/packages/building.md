---
title: Build a new package
excerpt: Packages are a blueprint for importing a related set of pre-configured records.
social_image_url: /assets/images/guides/packages/packages.png
layout: integration
topic: Packages
jumbotron:
  title: Building packages
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Packages &raquo;
    url: /resources/guides/#packages
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/packages.png" class="screenshot">
</div>

* TOC
{:toc}

{% comment %}
* Record graph relationships
* Translation of local IDs (issue with SQL dumps)
* prompts
* placeholders
* source of bot packages
{% endcomment %}

# What are packages?

Packages are a blueprint for importing a related set of pre-configured records into Cerb. A single package can contain workspaces, dashboards, bots, project boards, custom records, custom fieldsets, tasks, tickets, contacts, etc.

This allows you to quickly configure Cerb for your needs.

For instance, in our [Packages Library](/resources/packages/) you'll find the [Customer Satisfaction Surveys](/packages/customer-satisfaction/) package. This creates three new custom fieldsets for tracking satisfaction metrics. It creates a conversational bot that can converse with your clients to gauge their satisfaction. It adds a community portal for the bot to use. And it creates a workspace with three dashboards for reporting on your NPS, CSAT, and CES metrics.

It would probably take you several hours to follow detailed instructions for creating all of that in your own copy of Cerb. With a package, you can import the customer satisfaction workflow and start using it in seconds.

As well, rather than us locking you into a specific approach, you can now modify every aspect of the records created by the package to meet your exact needs. We can also offer alternative packages for different needs.

You can create your own packages and use them in [setup](/docs/setup/), [bots](/docs/bots/), or the [API](/docs/api/).

Perhaps you want to build **Onboarding Bot** to configure a default workspace for new workers and give them a project board checklist to get them up to speed.  You can create these records as a package, and use **prompts** to personalize them every time they are imported.

Packages also simplify the process of importing and synchronizing records from other apps and services.

# The structure of a package

Packages use the JSON[^json] file format. This is something you can easily create from any text editor, and read/write in nearly any programming language.

Here's the basic structure of a package:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Package Name",
    "revision": 1,
    "requires": {
      "cerb_version": "9.2.0",
      "plugins": []
    },
    "library": {},
    "configure": {
      "placeholders": [],
      "prompts": []
    }
  },
  "records": [],
  "bots": []
}
{% endraw %}
</code>
</pre>

First, let's look at the `package` section:

* **name** is the human-friendly name of the package.
* **revision** is incremented each time the package changes.
* **requires** specifies the requirements of the package (Cerb version, installed plugins).
* **library** is optional metadata for the package library. This is covered in more detail below.
* **configure** defines the `prompts` and `placeholders` used to configure this package. We'll cover those more in a minute.

We also see two other keys:

* **records** is an optional array of [record objects](/guides/packages/create-records/). A package can include any number of records.
* **bots** is an optional array of bot objects. While bots are also comprised of records, their potentially complex behaviors are easier to import as a single unit instead of individual records for each component.

# Scripting

A package itself must always be a valid JSON object, but any key or value string can use [Cerb's scripting syntax](/docs/bots/scripting/) for dynamic content.

Because packages can include bots that also use scripting, packages use a slightly modified syntax to avoid conflicting with them:

* [Commands](/docs/bots/scripting/commands/) use `{%raw%}{{% ... %}}{%endraw%}` rather than `{%raw%}{% ... %}{%endraw%}`
* Placeholders use `{%raw%}{{{...}}}{%endraw%}` rather than `{%raw%}{{...}}{%endraw%}`
* Comments use `{%raw%}{{#...#}}{%endraw%}` rather than `{%raw%}{#...#}{%endraw%}`

# Placeholders

Most importantly, scripting provides **placeholders** that are substituted with a new value when a package is imported.

There are several sources of placeholders:

* The **default** object provides access to global defaults:
  * `{% raw %}{{{default.base_url}}}{% endraw %}` is the base URL where Cerb is running. e.g. https://support.cerb.example/
  * `{% raw %}{{{default.group_id}}}{% endraw %}` is the ID of your default group. e.g. `123` for "Support"
  * `{% raw %}{{{default.bucket_id}}}{% endraw %}` is the ID of your default group's default bucket. e.g. `456` for "Inbox"
  * `{% raw %}{{{default.replyto_id}}}{% endraw %}` is the ID of your default sender address. e.g. `789` for support@cerb.example
  * `{% raw %}{{{default.replyto_email}}}{% endraw %}` is the default sender address. e.g. support@cerb.example
  
* **Built-in placeholders** provide common functionality like generating random numbers or passwords.
* **Prompts** ask for input to configure the package before it's imported. These can be different every time the package is used, and they're the key to designing reusable packages.
* **UIDs** are unique identifiers for referencing specific [records](/guides/packages/create-records/) included within the package. These are automatically replaced with record IDs once imported. e.g. `{% raw %}{{{uid.example_uid}}}{% endraw %}`

# Package Library

Pre-approved packages can be added to the package library as templates for use by workers when creating new records.

The **library** key uses the following structure:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "library": {
      "name": "Package Name",
      "uri": "a_unique_package_identifier",
      "description": "A description of your package",
      "instructions": "Instructions with **Markdown** formatting.",
      "point": "an_extension_point",
      "image": "data:image/png;base64,..."
    }
  }
}
{% endraw %}
</code>
</pre>

* **name** is the human-friendly name of the package shown in the library.
* **uri** is a globally unique identifier for the package (lowercase letters, numbers, and underscores).
* **description** is a brief summary of the package's contents.
* **instructions** includes any additional information a worker may need to know before using the package. This can include Markdown formatting. Multiple lines are delimited with `\r\n` characters.
* **point** is one of the library sections described below.
* **image** is a Base64-encoded PNG image (480 x 270) in data URI format. This key may be omitted or blank to use the default artwork for the given `point`.

### Library sections

* `behavior` 
* `behavior_action` 
* `behavior_action:`[&lt;event.point.id&gt;](/docs/plugins/extensions/points/devblocks.event/#extensions) 
* `behavior_loop` 
* `behavior_switch` 
* `calendar` 
* `connected_service` 
* `profile_tab` 
* `profile_tab:`[&lt;record_alias&gt;](/docs/records/types/)
* `profile_widget` 
* `profile_widget:`[&lt;record_alias&gt;](/docs/records/types/) 
* `project_board` 
* `task` 
* `workspace_page` 
* `workspace_tab` 
* `workspace_widget`

### Adding packages to the library

Once your package is complete, you can add it to the library from **Setup >> Packages >> Library**.

Click **(+)** in the top right of the packages worklist.

Paste your package into the **Package: (JSON)** section and click the **Save Changes** button.

# Making packages configurable

**Built-in placeholders** and **prompts** are used to customize packages every time they are imported.

## Built-in placeholders

### Random code generator

The random code generator is useful for generating passwords, confirmation codes, or secret keys.

For instance, the [Customer Satisfaction Surveys](/packages/customer-satisfaction/) package generates a different random 16-character secret key every time it's imported. This secret key is used by the bot to "sign" survey URLs and ensure they weren't tampered with. If the same default key was shared by everyone who installed the package, then everyone could forge new survey links for anyone else.  Instead, two people importing the same package get two different secret keys.

Here's an example package that uses the random code generating to generate random tasks:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package",
    "configure": {
      "placeholders": [
        {
          "type": "random",
          "key": "random_code",
          "params": {
            "length": "8"
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "task_001",
      "_context": "task",
      "title": "Random task #{{{random_code}}}"
    }
  ]
}
{% endraw %}
</code>
</pre>

Every time you import this package it will generate a new task record with a random 8-character code, like:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/placeholder-random-imported.png" class="screenshot">
</div>

### Data Query

Added in [9.6](/releases/9.6/).

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package",
    "configure": {
      "placeholders": [
        {
          "type": "data_query",
          "key": "ticket_profile_tab_id",
          "params": {
            "query": "type:worklist.records of:profile_tab query:(name:\"Overview\" record:\"cerberusweb.contexts.ticket\" format:dictionaries limit:1)",
            "selector": "{{results.data|first.id}}",
            "format": "json",
            "validate": "{% if results.data|first.id is empty %}Ticket profile tab record not found.{% endif %}"
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "widget_001",
      "_context": "profile_widget",
      "name": "Example Widget",
      "profile_tab_id": "{{{ticket_profile_tab_id}}}",
      "extension_id": "cerb.profile.tab.widget.sheet"
    }
  ]
}
{% endraw %}
</code>
</pre>

## Prompts

Prompted placeholders ask the importer for extra information which is then incorporated into the package.

### Text entry

The simplest prompted placeholder is a text box.

This package will prompt you for the name of a new task before creating it:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package",
    "configure": {
      "prompts": [
        {
          "type": "text",
          "label": "Task name",
          "key": "task_name",
          "params": {
            "default": "A very special task",
            "placeholder": "(enter a task name)"
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "task_001",
      "_context": "task",
      "title": "{{{task_name}}}"
    }
  ]
}
{% endraw %}
</code>
</pre>

When you import the package you'll see the following prompt:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-text-input.png" class="screenshot">
</div>

Whatever you type will be used as the new task name:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-text-imported.png" class="screenshot">
</div>

### Picklists

Your package can prompt with a picklist of pre-defined options.

This package will prompt you for the importance before creating a task:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package",
    "requires": {
      "cerb_version": "9.1.4",
      "plugins": []
    },
    "configure": {
      "prompts": [
        {
          "type": "picklist",
          "label": "Importance",
          "key": "prompt_importance",
          "params": {
            "options": {"Low":25,"Normal":50,"High":75,"Urgent":100},
            "default": 50
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "task_001",
      "_context": "task",
      "title": "New task",
      "importance": "{{{prompt_importance}}}"
    }
  ]
}
{% endraw %}
</code>
</pre>

When you import the package, you'll be prompted for the importance with a dropdown:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-picklist-input.png" class="screenshot">
</div>

After importing the package, the new task has the importance you assigned:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-picklist-imported.png" class="screenshot">
</div>

The options can be specified as a simple array:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
"options": ["Option 1", "Option 2", "Option 3"]
{% endraw %}
</code>
</pre>

Or as an object with label/value pairs:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
"options": {
  "First": "Value 1",
  "Second": "Value 2",
  "Third": "Value 3",
  "Fourth": "Value 4",
  "Fifth": "Value 5"
}
{% endraw %}
</code>
</pre>

### Choosers

Your package may also need to reference records that already exist in Cerb. For instance, your new **Onboarding Bot** may need to target a specific worker to set up their environment.

To accomplish this, you can include a **chooser prompt**.

This package prompts for a worker and assigns them a task:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package",
    "requires": {
      "cerb_version": "9.1.4",
      "plugins": []
    },
    "configure": {
      "prompts": [
        {
          "type": "chooser",
          "label": "Who should the new task be assigned to?",
          "key": "task_owner_id",
          "params": {
            "context": "cerberusweb.contexts.worker",
            "single": true,
            "query": "isDisabled:n"
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "task_001",
      "_context": "task",
      "title": "New task for {{{task_owner__label}}}",
      "owner_id": "{{{task_owner_id}}}"
    }
  ]
}
{% endraw %}
</code>
</pre>

When you import the package, you'll be prompted to pick a task assignee with a chooser:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-chooser-input.png" class="screenshot">
</div>

After importing the package, the new task is automatically assigned to the worker you selected:

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/building/prompts-chooser-imported.png" class="screenshot">
</div>

<div class="cerb-box note">
<p>
  {% raw %}
  If the <tt>key</tt> of your chooser prompt ends with <tt>_id</tt> then Cerb will automatically load in all of the 
  records placeholders. That's why we can use the <tt>{{{task_owner__label}}}</tt> placeholder in the example above,
  for our prompt named <tt>{{{task_owner_id}}}</tt>. This requires <b>Cerb 8.3.4</b> or later.
  {% endraw %}
</p>
</div>

# Next steps

Now that you understand how to create a basic package, learn more about [adding records to packages](/guides/packages/create-records/) and [importing packages](/guides/packages/importing/).

# References

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>