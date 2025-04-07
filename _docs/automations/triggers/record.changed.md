---
title: record.changed
excerpt: This page provides information on the "record.changed" automations in Cerb,
  which are triggered when one or more fields of a record are modified.
summary: This page provides information on the "record.changed" automations in Cerb,
  which are triggered when one or more fields of a record are modified. It explains
  that this trigger utilizes event handler KATA, executing the first enabled automation.
  The page details the inputs available in the automation dictionary, including keys
  like `actor_*`, `change_type`, `inputs`, `record_*`, and `was_record_*`, each with
  specific roles and types. There are no outputs specified for this automation.
permalink: /docs/automations/triggers/record.changed/
toc:
  title: record.changed
  expand: Automations
jumbotron:
  title: record.changed
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**record.changed** [automations](/docs/automations/) are triggered when one or more record fields change.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key            | Type       | Notes                                                                         |
|----------------|------------|-------------------------------------------------------------------------------|
| `actor_*`      | record     | The current actor dictionary. Supports key expansion.                         |
| `change_type`  | string     | `created`, `updated`, or `deleted`                                            |
| `inputs`       | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.             |
| `record_*`     | record     | The new [record](/docs/records/types/) dictionary. Supports key expansion.    |
| `was_record_*` | record     | The former [record](/docs/records/types/) dictionary. Supports key expansion. |

# Outputs

(none)

# Examples

Set the proper MIME type if a file with a `.png` extension comes in as an `application/octet-stream`:

{% tabs png %}

{% tab png automation %}
{% highlight cerb %}
{% raw %}
start:
  outcome/png:
    if@bool: {{record_name is suffixed ('.png')}}
    then:
      record.update/fix:
        output: updated_attachment
        inputs:
          record_type: attachment
          record_id: {{record_id}}
          fields:
            mime_type: image/png
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab png policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.update:
    deny/type@bool: {{inputs.record_type is not record type ('attachment')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab png event %}
{% highlight cerb %}
{% raw %}
automation/png:
  uri: cerb:automation:cerb.example.automation
  disabled@bool: 
      {{
        change_type not in ['created']
        or record__context is not record type ('attachment')
        or record_mime_type not in ['application/octet-stream']
      }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

Create a notification when someone adds an event to your calendar:

{% tabs reminder %}

{% tab reminder automation %}
{% highlight cerb %}
{% raw %}
start:
  record.create/notification:
    output: new_notification
    inputs:
      record_type: notification
      fields:
        activity_point: record.created
        params:
          message: a new event has been placed on your calendar {{record_record_url}}
        worker_id@int: {{record_calendar_owner_id}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab reminder policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('notification')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab reminder event %}
{% highlight cerb %}
{% raw %}
automation/reminder:
  uri: cerb:automation:cerb.example.automation
  disabled@bool: 
    {{
      change_type not in ['created']
      or record__context is not record type ('calendar_event')
    }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

Add a watcher (eg. a manager) if a ticket thread reaches a certain number of messages:

{% tabs manager %}

{% tab manager automation %}
{% highlight cerb %}
{% raw %}
start:
 decision/number:
   outcome/15:
     if@bool: {{record_num_messages == 15}}
      record.update/addManager:
        output: updated_ticket
        inputs:
          record_type: ticket
          record_id: {{record_id}}
          fields:
            links@list:
              worker:1
   outcome/30:
    if@bool: {{record_num_messages == 30}}
         then:
          record.update/addSeniorManager:
            output: updated_ticket
            inputs:
              record_type: ticket
              record_id: {{record_id}}
              fields:
                links@list:
                  worker:2
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab manager policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.update:
    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab manager event %}
{% highlight cerb %}
{% raw %}
automation/manager:
  uri: cerb:automation:cerb.example.automation
  disabled@bool: 
    {{
      change_type not in ['updated']
      or record__context is not record type ('ticket')
      or record_num_messages == was_record_num_messages
      or record_num_messages not in [15,30]
    }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}