---
title: record.profile.image.editor
excerpt: "The profile image editor toolbar is displayed when editing a record's profile image, and allows automations to generate profile images."
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/record.profile.image.editor/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: record.profile.image.editor
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Toolbars &raquo;
    url: /docs/toolbars/
---

**Available since:** [10.4.2](/releases/10.4.2/)

The profile image editor [toolbar](/docs/toolbars/) is displayed when editing a record's profile image, and allows [interaction.worker](/docs/interactions/) automations to generate profile images.

For instance, creating images from text/emoji, file uploads, or APIs like Stable Diffusion.

Interactions must return an `image:url:` or `image:text:` key.

Built-in interactions are provided for text-based images, file uploads, and fetching images from an external URL.

This improves on the previous built-in functionality by allowing admins to add custom logic to profile image creation – for instance, profanity and adult content filters.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/record-profile-image-editor.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `record.profile.image.editor`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/stability:
  label: Stable Diffusion
  icon: picture
  uri: cerb:automation:example.interaction.recordProfileImage.stabilityai
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `image_height` | The height of the image to be generated.
| `image_width` | The width of the image to be generated.
| `record_*` | The [record](/docs/records/types/) profile being viewed. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion). The `record__type` placeholder is the type (e.g. `ticket`).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.record.profile`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| `image_height` | The height of the image to be generated.
| `image_width` | The width of the image to be generated.
| **`record_`** | record | The [record](/docs/records/types/) dictionary

### Output

An interaction should return one of:

| Key | Type |
|-|-|-
| `image:text:` | Text or emoji to convert into an image.
| `image:url:` | An image URL to load. This can be `/ui/image/<token>` in the case of [automation resources](/docs/records/types/automation_resource/).

### after:

| Key | Type |
|-|-|-
| **`refresh_toolbar@bool:`** | boolean | Refresh the current [toolbar](/docs/toolbars/).
