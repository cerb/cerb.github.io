---
title: URL Record Fields
excerpt: This page provides information on how to format and use URL fields within
  Cerb, detailing the structure of a URL and how it should be represented in JSON
  packages and API requests.
summary: This page provides information on how to format and use URL fields within
  Cerb, detailing the structure of a URL and how it should be represented in JSON
  packages and API requests. It includes examples of encoding URLs for PUT or POST
  requests in the Records API, ensuring proper handling of hyperlinks in the system.
permalink: /docs/records/fields/types/url/
toc:
  title: URL
  expand: Records
jumbotron:
  title: URL
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

A **URL** field contains a hyperlink to a web page in the format:

{% highlight text %}
{% raw %}
&lt;protocol&gt;://&lt;host:port&gt;/&lt;path-to-resource&gt;
{% endraw %}
{% endhighlight %}	

### Packages

As JSON from [packages](/docs/packages/):

{% highlight json %}
{% raw %}
{
	"website": "https://cerb.ai/docs/"
}
{% endraw %}
{% endhighlight %}

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/), the URL should be encoded:

{% highlight text %}
{% raw %}
&amp;fields[website]=https%3A%2F%2Fcerb.ai%2Fdocs%2F
{% endraw %}
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/timestamp/" class="prev">&lt; Timestamp</a>
	</div>
</div>
<div class="clear"></div>