---
title: Create a comment
excerpt: Use record.create to make a comment
summary: 
layout: integration
jumbotron:
  title: Create a comment
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
You can use ```record.create``` to create a comment on any record.
<pre>
<code class="language-cerb">
{% raw %}
start:
  record.create/comment:
    output: new_comment
    inputs:
      record_type: comment
      fields:
        author__context: app
        author_id@int: 0
        target__context: ticket
        target_id@int: 123
        is_markdown@int: 1
        comment@text:
          This is a **comment** from an automation.
{% endraw %}
</code>
</pre>

```author__context:``` can be one of: app, role, group, worker
```target_context``` is the target [record type](/docs/records/types) for the comment (ticket, message, task etc.)

Use this policy:
<pre>
<code class="language-cerb">
{% raw %}
commands:
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('comment')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
