---
title: 'Automation Inputs: Array'
excerpt: This page provides information on configuring automation inputs for an array
  in Cerb.
summary: 'This page provides information on configuring automation inputs for an array
  in Cerb. It specifies that the ''array/colors'' input is required, as indicated
  by the ''required@bool: yes'' setting. Additionally, there is a commented-out section
  for a default list of colors, including Red, Green, and Blue, which suggests that
  users can define default values for the array if needed. The page appears to be
  part of a larger documentation or guide on setting up automation inputs in Cerb.'
permalink: /docs/automations/inputs/array/
toc:
  title: Array
  expand: Automations
jumbotron:
  title: Array
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Inputs &raquo;
    url: /docs/automations/#inputs
---

{% highlight cerb %}
inputs:
  array/colors:
    required@bool: yes
    #default@list:
    #  Red
    #  Green
    #  Blue
{% endhighlight %}

### required:

### default: