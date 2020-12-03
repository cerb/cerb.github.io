---
title: "Map - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/elements/map/
toc:
  title: Map
  expand: Automations
jumbotron:
  title: Map
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: ui.interaction &raquo;
    url: /docs/automations/triggers/ui.interaction/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/ui.interaction/#elements
---

{% include docs/note_preview.html %}

In [interaction](/docs/automations/triggers/ui.interaction/) web forms, a **map** element displays an interactive [map](/docs/maps/) using map [KATA](/docs/kata/) and returns the selection region(s) or point(s).

For instance, an interaction that displays the geographical location of an IP address can drop a pin on a map prompt.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        map/respond_map:
          resource:
            uri: cerb:resource:map.world.countries
          projection:
            type: mercator
            scale: 350
            center:
              latitude: 47.0416
              longitude: 19.6887
          points:
            size:
              default: 5
            data:
              point/berlin:
                latitude: 52.5246
                longitude: 13.4033
                properties:
                  name: Berlin{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/elements/map.png" class="screenshot">
</div>

# Syntax

The maps element supports all of the functionality from [maps KATA](/docs/maps/#maps-kata).

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.