---
title: "Data Queries: Classifier Prediction"
excerpt: 
permalink: /docs/data-queries/classifier/prediction/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Classifier Prediction
jumbotron:
  title: Classifier Prediction
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# classifier.prediction
{: .no_toc}

`classifier.prediction` queries return a predicted [classification](/docs/records/types/classifier_class/) for the given text using the given [classifier](/docs/records/types/classifier/).

For instance, a "Yes/No" classifier would predict `answer.maybe` for the input _"I'm not sure"_.

* TOC
{:toc}

# Inputs

* `classifier:` (a [search query](/docs/search/) of [classifier](/docs/records/types/classifier/#search-query-fields) records to include)
* `text:` (the text to classify)

# Response Formats

The results can be returned in these formats:

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

# Examples

<pre>
<code class="language-cerb">
type:classifier.prediction
classifier:(name:Yes/No)
text:"I am not sure"
format:dictionaries
</code>
</pre>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-response_times.png" class="screenshot">
</div>
{% endcomment %}
