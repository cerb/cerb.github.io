---
title: Queues
excerpt: Queues...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/queues/
toc:
title: Queues
jumbotron:
  title: Queues
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

**Queues** distribute units of asynchronous work.

Queues are identified with a unique name. 

Messages with arbitrary payloads can be pushed into a queue. 

Concurrent consumers can pop messages from the queue to process them. 

A message is always in one of four states: available, in flight, failed, or complete. 

For instance, every historical ticket can be reviewed by pushing sets of IDs into a queue as messages.

The number of queue consumers can be scaled up to the desired throughput.

* TOC
{:toc}

