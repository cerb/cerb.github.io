---
title: Resources
excerpt: Resources are shared assets used by automations and widgets.
#social_image_url: /assets/images/search/kata.png
permalink: /docs/resources/
toc:
  title: Resources
jumbotron:
  title: Resources
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**Resources** are shared assets used by automations and widgets. Resources can be file-based, with an uploaded file that infrequently changes, or [automation](/docs/automations/)-based, with a dynamically generated resource. For instance, an automation-based resource can fetch live data from any HTTP endpoint, transform it, and output the expected JSON format.

For instance, [map widgets](/docs/maps/) require resources that can be several megabytes large. This would be cumbersome and redundant to include within an automation. Instead, a map widget refers to a resource by name, like `map.world.countries` or `mapPoints.worldCapitalCities`, which is then loaded directly by a client's browser and cached.

Similarly, resources can provide logo images and stylesheets for [portals](/docs/portals/), and datasets for charts and [sheets](/docs/sheets/) on [dashboards](/docs/dashboards/).

{% comment %}
* TOC
{:toc}
{% endcomment %}

## Resource Types

Resources have a **type** that determines where they are available.

### Maps

| Type | Description
|-|-
| **Map** | Features that describe regions in GeoJSON (e.g. countries, states, counties). These are base maps that other features are drawn on top of.
| **Map Points** | Points of interest to display on a base map (e.g. cities, business locations).
| **Map Properties** | Additional datasets that can be merged into a base map (e.g. election results by state/county, COVID-19 cases per country).
