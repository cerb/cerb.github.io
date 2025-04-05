---
title: mail.moved
excerpt: This page provides information about the "mail.moved" automation events in
  Cerb, which are triggered when a ticket is moved to a new group or bucket.
summary: This page provides information about the "mail.moved" automation events in
  Cerb, which are triggered when a ticket is moved to a new group or bucket. It details
  the placeholders available in the automation event dictionary, including keys for
  the current actor, the previous group and bucket, and the new state of the moved
  ticket. The page specifies that there are no outputs for this event.
permalink: /docs/automations/events/mail.moved/
toc:
  title: mail.moved
  expand: Automations
jumbotron:
  title: mail.moved
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

**mail.moved** [automation](/docs/automations/) [events](/docs/automations/#events) trigger after a ticket is moved to a new group or bucket.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key            | Type   | Notes                                                                                                                                          |
|----------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------|
| `actor_*`      | record | The current [actor](/docs/records/types/) record. Supports key expansion. `actor__type` is the record type alias (e.g. `automation`, `worker`) |
| `was_group_*`  | record | The [group](/docs/records/types/group/) record before the ticket was moved. Supports key expansion.                                            |
| `was_bucket_*` | record | The [bucket](/docs/records/types/bucket/) record before the ticket was moved. Supports key expansion.                                          |
| `ticket_*`     | record | The new state of the moved [ticket](/docs/records/types/ticket/). Supports key expansion.                                                      |

# Outputs

(none)

# Examples
Set a watcher if a ticket is moved to a particular group:
{% tabs event-mail-moved %}

{% tab event-mail-moved automation %}
{% highlight cerb %}
{% raw %}
start:
  decision/group:
    outcome/group1:
      if@bool: {{ticket_group_name == "Support"}}
      then:
        record.update/watcher:
          output: updated_ticket
          inputs:
            record_type: ticket
            record_id: {{ticket_id}}
            fields:
              links@list:
                worker:1
    outcome/group2:
      if@bool: {{ticket_group_name == "Sales"}}
      then:
        record.update/watcher:
          output: updated_ticket
          inputs:
            record_type: ticket
            record_id: {{ticket_id}}
            fields:
              links@list:
                worker:2
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-moved policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.update:
    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-moved event %}
{% highlight cerb %}
{% raw %}
automation/group:
  uri: cerb:automation:example.ticketMove.watcher
  disabled@bool: {{ticket_group_id == was_group_id}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-moved inputs %}
{% highlight cerb %}
{% raw %}
ticket_id: 1
ticket_group_name: Sales
was_ticket_group_name: Support
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}