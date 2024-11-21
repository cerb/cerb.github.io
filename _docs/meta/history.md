---
title: Release History
excerpt: Cerb has 22 years worth of incremental improvements from community feedback.
summary: This page provides a comprehensive release history for Cerb, detailing updates
  and improvements from December 2012 to November 2024. It includes both feature upgrades
  and maintenance updates, highlighting the number of improvements in each release.
  The document tracks the evolution of Cerb through various versions, showcasing significant
  platform upgrades and regular maintenance updates aimed at enhancing functionality
  and performance. Notable releases include major platform upgrades such as version
  10.0 in April 2021 with 216 improvements and version 9.0 in August 2018 with 175
  improvements, reflecting Cerb's ongoing commitment to development and user experience
  enhancement.
permalink: /docs/history/
redirect_from:
- /versions/
- /releases/
jumbotron:
  title: Release History
  tagline: Cerb has 22 years worth of incremental improvements from community feedback
---

{% assign last_section = '' %}
{% for post in site.posts %}
{% assign section = post.date | date: "%B %Y" %}

{% if post.tags contains 'releases' %}
{% if section != last_section %}
{% if last_section != '' %}
</ul>
{% endif %}

<h2>{{ section }}</h2>

<ul class="blog-post-group">
{% endif %}

<li {% if post.release.type contains 'maintenance' %}{% else %}style="font-size:120%;font-weight:bold;"{% endif %}>
    <a href="{{ post.url }}" style="font-weight:inherit;">{{ post.title }}</a>{% if post.release.type %} - {{ post.release.type }} {% if post.release.count %} with {{ post.release.count }} improvements{% endif %}{% endif %}
</li>

{% if forloop.last %}
</ul>
{% endif %}

{% assign last_section = section %}
  {% endif %}
{% endfor %}