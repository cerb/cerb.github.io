---
title: "Audio - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/audio/
toc:
  title: Audio
  expand: Automations
jumbotron:
  title: Audio
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

(Added in [10.5](/releases/10.5/))

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, an **audio** element plays a sound file.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Audio Example
      elements:
        audio/prompt_audio:
          label: Play audio:
          autoplay@bool: yes
          controls@bool: yes
          source:
            blob: data:audio/mpeg;base64,...
            #uri: cerb:resource:...
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/audio.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### autoplay:

If `no`, the audio only starts when the play button is pressed. The default is `yes`.

### controls:

If `no`, the player controls are hidden. The default is `yes`.

### loop:

If `no` (default), the audio plays once and stops. If `yes` the audio repeats indefinitely.

### source:

Must be one of:

| Source  | Description                                                                                           |
|---------|-------------------------------------------------------------------------------------------------------|
| `blob:` | A data URI with base64-encoded MPEG data (`data:audio/mpeg;base64,...`)                               |
| `uri:`  | A `cerb:automation_resource:<token>` token. This can be created with `file.write:` or `http.request:` | 