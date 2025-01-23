---
title: Sheet with paging in an interaction
excerpt: Make a sheet of records with paging in a worker interaction.
summary: "This page provides a step-by-step guide to creating a sheet with paging in a worker interaction using the `cerb.data.records` automation data source. It includes a code snippet demonstrating how to use the `form` automation trigger to create a paged sheet of records, including setting pagination limits and displaying specific fields such as status, group, and owner."
layout: integration
jumbotron:
  title: Sheet with paging in an interaction
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

By using the `cerb.data.records` automation data source in a sheet, you can make a paged sheet of records in a [worker interaction](/docs/automations/triggers/interaction.worker/)

Using:

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Sheet with paging
      elements:
        sheet/prompt_results:
          label: Results:
          data:
            automation:
              uri: cerb:automation:cerb.data.records
              inputs:
                record_type: ticket
                query_required: status:o
          limit: 10
          schema:
            layout:
              title_column:  _label
              headings@bool: yes
              paging@bool: yes
            columns:
              text/_label:
                params:
                  bold@bool: yes
              text/status:
              card/group_id:
                label: Group
              card/owner_id:
                label: Owner
              date/updated:
{% endraw %}
</code>
</pre>

Gives you:

<div class="cerb-screenshot">
<img src="/assets/images/cookbook/sheet-paging-interaction/sheet.png" class="screenshot">
</div>
