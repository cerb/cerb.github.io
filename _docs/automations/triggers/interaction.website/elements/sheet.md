---
title: Sheet - Interaction Form Element
excerpt: This page provides detailed information on the "sheet" element used in website
  interaction forms within Cerb.
summary: This page provides detailed information on the "sheet" element used in website
  interaction forms within Cerb. It explains how a sheet element can display a schema
  using either static or dynamic data, with options for single or multiple selections.
  The page outlines the syntax for various attributes such as labels, required fields,
  data sources, limits, pagination, filtering, default selections, and schema definitions.
  It also covers the use of synthesized data and custom validation scripts to ensure
  data integrity. The document includes examples of how to configure these elements,
  emphasizing the flexibility and customization available for creating interactive
  forms.
permalink: /docs/automations/triggers/interaction.website/elements/sheet/
toc:
  title: Sheet
  expand: Automations
jumbotron:
  title: Sheet
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **sheet** element displays a [sheet](/docs/sheets/) schema using static or dynamic data.

Selection prompt can be set to 'single' or 'multiple'.

{% highlight cerb %}
{% raw %}
start:
  await:
    form:
      elements:
        title: Menu
        sheet/prompt_choice:
          label: Make a selection:
          required@bool: yes
          data:
            0:
              key: option1
              name: Option 1
              description: This is a description of option one.
            1:
              key: option2
              name: Option 2
              description: This is a description of option two.
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
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/sheet.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{expression}}
{% endraw %}
{% endhighlight %}

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### data:

A sheet element can display an array of dictionaries as a dataset.

Alternatively, a [ui.sheet.data](/docs/automations/triggers/ui.sheet.data/) automation can fetch a dynamic dataset.

{% highlight cerb %}
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
{% endhighlight %}

#### Synthesized data

You can also specify a list of keys in `data:` without properties. These will be available as the `key` property.

{% highlight cerb %}
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
{% endhighlight %}

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

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

{% highlight cerb %}
{% raw %}
text/prompt_name:
  label: Name:
  required@bool: yes
  type: freeform
  validation@raw:
    {% if prompt_name is empty %}
    A name is required.
    {% elseif prompt_name|length < 8 %}
    A name must be 8 or more characters. 
    {% elseif prompt_name|length > 32 %}
    A name must be less than 32 characters. 
    {% endif %}
{% endraw %}
{% endhighlight %}