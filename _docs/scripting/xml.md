---
title: "Scripting Reference: XML"
excerpt: 
permalink: /docs/scripting/xml/
toc:
  title: XML
  expand: Developer Guide
jumbotron:
  title: XML
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
  -
    label: Scripting &raquo;
    url: /docs/scripting/
---

XML[^xml] is another popular format for serializing or exchanging structured data.

# XML Decoding

You can decode an XML string into an XML object with the [xml_decode()](/docs/scripting/functions/#xml_decode) function.

Use the [xml_xpath()](/docs/scripting/functions/#xml_xpath) function to extract values with XPath[^xpath] queries.

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set client_id = xml_xpath(xml, '//client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
</code>
</pre>

```
Client ID: 1
Invoice ID: 123
```

# XML Namespaces

You can define an XML namespace with the [xml_xpath_ns()](/docs/scripting/functions/#xml_xpath_ns) function:

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response xmlns=\"http://www.example.com/api/\"&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set xml = xml_xpath_ns(xml, 'ns', 'http://www.example.com/api/') %}
{% set client_id = xml_xpath(xml, '//ns:client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//ns:invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
</code>
</pre>

```
Client ID: 1
Invoice ID: 123
```

# XML Encoding

You can encode an object as XML with the [xml_encode()](/docs/scripting/functions/#xml_encode) function:

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response xmlns=\"http://www.example.com/api/\"&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{{xml_encode(xml.client_id)}}	
{% endraw %}
</code>
</pre>

```
<client_id>1</client_id>
```

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/json/" class="prev">&lt; JSON</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/commands/" class="prev">Commands &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>