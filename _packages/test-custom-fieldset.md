---
title: Test Custom Fieldset
excerpt: A custom fieldset for that includes an example of every custom field type. This is useful for evaluation, development, and testing.
layout: integration
topic: Packages
permalink: /packages/test-custom-fieldset/
jumbotron:
  title: Test Custom Fieldset
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

# Introduction

This package imports a custom fieldset that includes an example of every custom field type. This is particularly useful for evaluation, development, and testing.

# Importing the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Test Custom Fieldset",
    "cerb_version": "8.3.0",
    "revision": 1,
    "requires": {
      "cerb_version": "8.3.0",
      "plugins": [

      ]
    },
    "configure": {
      "prompts": [
        {
          "type": "text",
          "key": "record_type",
          "label": "On record type:",
          "params": {
            "default": "tasks"
          }
        }
      ],
      "placeholders": [

      ]
    }
  },
  "records": [
    {
      "uid": "fieldset_test",
      "_context": "custom_fieldset",
      "name": "Test Fieldset",
      "context": "{{{record_type}}}",
      "owner__context": "app",
      "owner_id": 0
    },
    {
      "uid": "field_checkbox",
      "_context": "custom_field",
      "name": "Checkbox",
      "type": "C",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_currency",
      "_context": "custom_field",
      "name": "Currency",
      "type": "Y",
      "context": "{{{record_type}}}",
      "params": {
        "currency_id": "1"
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_date",
      "_context": "custom_field",
      "name": "Date",
      "type": "E",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_decimal",
      "_context": "custom_field",
      "name": "Decimal",
      "type": "O",
      "context": "{{{record_type}}}",
      "params": {
        "decimal_at": "2"
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_file",
      "_context": "custom_field",
      "name": "File",
      "type": "F",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_files",
      "_context": "custom_field",
      "name": "Files",
      "type": "I",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_list",
      "_context": "custom_field",
      "name": "List",
      "type": "M",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_multi_checkboxes",
      "_context": "custom_field",
      "name": "Multiple Checkboxes",
      "type": "X",
      "context": "{{{record_type}}}",
      "params": {
        "options": [
          "Option 1",
          "Option 2",
          "Option 3",
          "Option 4",
          "Option 5"
        ]
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_number",
      "_context": "custom_field",
      "name": "Number",
      "type": "N",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_picklist",
      "_context": "custom_field",
      "name": "Picklist",
      "type": "D",
      "context": "{{{record_type}}}",
      "params": {
        "options": [
          "Option 1",
          "Option 2",
          "Option 3",
          "Option 4",
          "Option 5"
        ]
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_link",
      "_context": "custom_field",
      "name": "Record Link",
      "type": "L",
      "context": "{{{record_type}}}",
      "params": {
        "context": "cerberusweb.contexts.worker"
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_text_multi",
      "_context": "custom_field",
      "name": "Text: Multiple Lines",
      "type": "T",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_text",
      "_context": "custom_field",
      "name": "Text",
      "type": "S",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_url",
      "_context": "custom_field",
      "name": "URL",
      "type": "U",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    },
    {
      "uid": "field_worker",
      "_context": "custom_field",
      "name": "Worker",
      "type": "W",
      "context": "{{{record_type}}}",
      "params": {
      },
      "custom_fieldset_id": "{{{uid.fieldset_test}}}"
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll be prompted for **On record type** to determine which record type the custom fieldset can be added to.

You can enter any record type, like:

* `calls`
* `orgs`
* `tasks`
* `tickets`
* `workers`

Click the **Import** again.

You should see the following output:

<div class="cerb-screenshot">
<img src="/assets/images/packages/test-custom-fieldset/imported.png" class="screenshot">
</div>

# Using the custom fieldset

You can add the custom fieldset to any record of the type you selected.

For instance, if you kept the default of **tasks**, you can navigate to **Search >> Tasks** and open the card for a task record. Click the **Edit** button and select **Test Fieldset** in the **Add Fieldset** menu.

<div class="cerb-screenshot">
<img src="/assets/images/packages/test-custom-fieldset/fieldset-add.png" class="screenshot">
</div>

You can then try out every custom field type:

<div class="cerb-screenshot">
<img src="/assets/images/packages/test-custom-fieldset/fieldset-edit.png" class="screenshot">
</div>