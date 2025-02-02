---
title: Documentation
excerpt: This webpage serves as a comprehensive documentation hub for Cerb, covering
  various guides and references essential for different user roles.
summary: This webpage serves as a comprehensive documentation hub for Cerb, covering
  various guides and references essential for different user roles. It includes an
  introduction and getting started section, an admin guide with topics like installation,
  security, and backups, and a worker guide focusing on the user interface. The developer
  guide provides insights into dictionaries, scripting, and plugins. The reference section
  is extensive, detailing features such as activity logs, automations, calendars, dashboards,
  notifications, and workflows, among others. Additionally, the API section offers information
  on authentication, requests, responses, and endpoints. The meta section provides release history,
  philosophy, and credits, making this a complete resource for understanding and utilizing Cerb
  effectively.
layout: page
permalink: /docs/home/
redirect_from:
  - /docs/
toc:
  title: Introduction
jumbotron:
  title: Documentation
  tagline: Let's get you up to speed
---

<ul>
    {% for section in site.data.docs %}
    <li><a href="#{{ section.title | slugify }}">{{ section.title }}</a></li>
    {% endfor %}
</ul>

{% for section in site.data.docs %}
<div class="docs-index">
<h1 id="{{ section.title | slugify }}">{{ section.title }}</h1>

<div style="column-count:2;column-width:400px;margin-bottom:20px;">
    {% for item in section.docs %}
      {% assign item_id = item | prepend:"/docs/" %}
      {% assign solution = site.docs | where:"id",item_id | first %}
    
      <div class="docs-page" style="break-inside:avoid;page-break-inside: avoid;-webkit-column-break-inside:avoid;">
          <a href="{{ solution.url }}" style="font-size:110%;font-weight:600;color:rgb(60,60,60);">{% if solution.toc.title %}{{ solution.toc.title }}{% else %}{{ solution.title }}{% endif %}</a>
          <div style="font-size:90%;font-weight:200;">{{solution.excerpt}}</div>
      </div>
    {% endfor %}
</div>
{% endfor %}