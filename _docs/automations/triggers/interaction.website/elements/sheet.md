---
title: "Sheet - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/elements/sheet/
toc:
  title: Sheet
  expand: Automations
jumbotron:
  title: Sheet
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **sheet** element displays a [sheet](/docs/sheets/) schema using static or dynamic data.

Selection prompt can be set to 'single' or 'multiple'.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        title: Menu
        sheet/prompt_choice:
          label: Make a selection:
          required@bool: yes
          data@json:
            [
              {
                "key": "option1",
                "name": "Option 1",
                "description": "This is a description of option one."
              },
              {
                "key": "option2",
                "name": "Option 2",
                "description": "This is a description of option two."
              }
            ]
          limit: 5
          default: option1
          schema:
            layout:
              headings@bool: no
              paging@bool: no
              #filtering@bool: yes
              #title_column: key
            columns:
              selection/key:
                params:
                  mode: single
              text/name:
                params:
                  bold@bool: yes
              text/description:
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/sheet.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### data:

A sheet element can display an array of dictionaries as a dataset.

Alternatively, a [ui.sheet.data](/docs/automations/triggers/ui.sheet.data/) automation can fetch a dynamic dataset.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        sheet/prompt_workers:
          label: Workers:
          required@bool: yes
          data:
            automation:
              uri: cerb:automation:cerb.data.records
              inputs:
                record_type: worker
                query_required@text:
                  isDisabled:n
          limit: 5
          schema:
            layout:
              headings@bool: no
              paging@bool: no
              filtering@bool: yes
            columns:
              selection/id:
                params:
                  mode: multiple
              card/_label:
                params:
                  bold@bool: yes
                  image@bool: yes
{% endraw %}
</code>
</pre>

#### Synthesized data

You can also specify a list of keys in `data:` without properties. These will be available as the `key` property.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        sheet/prompt_rating:
          label: Rating:
          required@bool: yes
          data:
            1:
            2:
            3:
            4:
            5:
          schema:
            layout:
              headings@bool: no
              paging@bool: no
            columns:
              text/key:
{% endraw %}
</code>
</pre>

### limit:

The number of dataset items to display per page. Default: `10`

### page:

The page of dataset items to display. Default: `0`

### filter:

The default filtering text, if `schema:layout:filtering:` is enabled.

### default:

The optional selected dataset item(s) by default.

### schema:

A [sheet](/docs/sheets/) schema defining the column types to display for each dataset item.

Selection is managed by a `selection:` column in the sheet.

The selected values are set on the element placeholder.

The `selection:params:mode:` may be `single` or `multiple`.