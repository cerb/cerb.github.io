---
title: Release History
permalink: /docs/history/
redirect_from:
  - /versions/
  - /releases/
jumbotron:
  title: Release History
  tagline: Cerb has been constantly improved for the past 20 years
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