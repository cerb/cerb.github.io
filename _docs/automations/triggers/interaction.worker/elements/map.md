---
title: Map - Interaction Form Element
excerpt: This page provides detailed information on the "map" interaction form element
  in Cerb, which is used to display interactive maps within web forms.
summary: This page provides detailed information on the "map" interaction form element
  in Cerb, which is used to display interactive maps within web forms. It explains
  how the map element utilizes map KATA to return selected regions or points, such
  as displaying the geographical location of an IP address with a pin on a map. The
  page includes an example configuration for setting up a map with specific parameters
  like resource URI, projection type, scale, center coordinates, and point data. Additionally,
  it covers syntax details, including the optional requirement for user input on the
  map element.
permalink: /docs/automations/triggers/interaction.worker/elements/map/
toc:
  title: Map
  expand: Automations
jumbotron:
  title: Map
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **map** element displays an interactive [map](/docs/maps/) using map [KATA](/docs/kata/) and returns the selection region(s) or point(s).

For instance, an interaction that displays the geographical location of an IP address can drop a pin on a map prompt.

{% highlight cerb %}
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
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/map.png" class="screenshot">
</div>

# Syntax

The maps element supports all of the functionality from [maps KATA](/docs/maps/#maps-kata).

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.