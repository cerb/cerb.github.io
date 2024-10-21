---
title: Test Custom Fieldset
excerpt: A custom fieldset for that includes an example of every custom field type. This is useful for evaluation, development, and testing.
layout: integration
topic: Workflows
permalink: /workflows/wgm.example.custom_fieldsets/
redirect_from:
  - /packages/test-custom-fieldset/
jumbotron:
  title: Test Custom Fieldset
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow create a custom fieldset that includes an example of every custom field type. This is particularly useful for evaluation, development, and testing.

# Installation

Navigate to **Search >> Workflows >> (+) >> Empty**.

Paste the following KATA into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: wgm.example.custom_fieldsets
  version: 2024-10-10T00:00:00Z
  description: A custom fieldset for that includes an example of every custom field type
  website: https://cerb.ai/workflows/wgm.example.custom_fieldsets/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core

records:
  custom_fieldset/test_fieldset:
    fields:
      name: Test Fieldset
      context: ticket
      owner__context: app
      owner_id: 0
  custom_field/field_checkbox:
    fields:
      name: Checkbox
      context: ticket
      uri: testFieldset_checkbox
      type: C
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_currency:
    fields:
      name: Currency
      context: ticket
      uri: testFieldset_currency
      type: Y
      custom_fieldset_id: {{records.test_fieldset.id}}
      params:
        currency_id: 1
  custom_field/field_date:
    fields:
      name: Date
      context: ticket
      uri: testFieldset_date
      type: E
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_decimal:
    fields:
      name: Decimal
      context: ticket
      uri: testFieldset_decimal
      type: O
      custom_fieldset_id: {{records.test_fieldset.id}}
      params:
        decimal_at: 2
  custom_field/field_file:
    fields:
      name: File
      context: ticket
      uri: testFieldset_file
      type: F
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_files:
    fields:
      name: Files
      context: ticket
      uri: testFieldset_files
      type: I
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_list:
    fields:
      name: List
      context: ticket
      uri: testFieldset_list
      type: M
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_checkboxes:
    fields:
      name: Multiple Checkboxes
      context: ticket
      uri: testFieldset_multipleCheckboxes
      type: X
      custom_fieldset_id: {{records.test_fieldset.id}}
      params:
        options@list:
          Option 1
          Option 2
          Option 3
          Option 4
          Option 5
  custom_field/field_number:
    fields:
      name: Number
      context: ticket
      uri: testFieldset_number
      type: N
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_picklist:
    fields:
      name: Picklist
      context: ticket
      uri: testFieldset_picklist
      type: D
      custom_fieldset_id: {{records.test_fieldset.id}}
      params:
        options@list:
          Option 1
          Option 2
          Option 3
          Option 4
          Option 5
  custom_field/field_link:
    fields:
      name: Record Link
      context: ticket
      uri: testFieldset_recordLink
      type: L
      custom_fieldset_id: {{records.test_fieldset.id}}
      params:
        context: worker
  custom_field/field_text:
    fields:
      name: Text
      context: ticket
      uri: testFieldset_text
      type: S
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_multi_text:
    fields:
      name: Text: Multiple Lines
      context: ticket
      uri: testFieldset_textMulti
      type: T
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_url:
    fields:
      name: URL
      context: ticket
      uri: testFieldset_url
      type: U
      custom_fieldset_id: {{records.test_fieldset.id}}
  custom_field/field_worker:
    fields:
      name: Worker
      context: ticket
      uri: testFieldset_worker
      type: W
      custom_fieldset_id: {{records.test_fieldset.id}}
{% endraw %}
</code>
</pre>

Click the **Continue** button.

You should see output like the following:

<div class="cerb-screenshot">
<img src="/assets/images/workflows/test-custom-fieldset/imported.png" class="screenshot">
</div>

# Usage

### Using the custom fieldset

You can add the custom fieldset to any ticket record.

Navigate to **Search >> Tickets** and open a record's card popup.

Click the **Edit** button and select **Test Fieldset** in the **Add Fieldset** menu.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/test-custom-fieldset/fieldset-add.png" class="screenshot">
</div>

You can then try out every custom field type:

<div class="cerb-screenshot">
<img src="/assets/images/workflows/test-custom-fieldset/fieldset-edit.png" class="screenshot">
</div>