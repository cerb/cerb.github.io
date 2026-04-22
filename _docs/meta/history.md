---
title: Release History
excerpt: Cerb has 24 years worth of incremental improvements from community feedback.
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
- /releases/
jumbotron:
  title: Release History
  tagline: Production-tested with millions of conversations for over 24 years of active development.
---

{% assign last_section = '' %}
{% assign releases = site.releases | sort: 'date' | reverse %}
{% for post in releases %}
{% assign section = post.date | date: "%B %Y" %}

{% if section != last_section %}
{% if last_section != '' %}
</div>
{% endif %}

<h2 class="release-month">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
	{{ section }}
</h2>

<div class="release-grid">
{% endif %}

{% assign is_major = false %}
{% if post.release.type contains 'platform' or post.release.type contains 'feature' %}
{% assign is_major = true %}
{% endif %}

<a href="{{ post.url }}" class="release-card{% if is_major %} release-major{% endif %}">
	<div class="release-card-icon">
		{% if is_major %}
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
		{% else %}
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
		{% endif %}
	</div>
	<div class="release-card-content">
		<h3>{{ post.title }}</h3>
		{% if post.release.type %}
		<span class="release-type">{{ post.release.type }}</span>
		{% endif %}
		{% if post.release.count %}
		<span class="release-count">{{ post.release.count }} improvements</span>
		{% endif %}
	</div>
</a>

{% if forloop.last %}
</div>
{% endif %}

{% assign last_section = section %}
{% endfor %}