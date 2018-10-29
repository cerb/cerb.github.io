---
title: Plugin Translations
permalink: /docs/plugins/translations/
toc:
  title: Translations
jumbotron:
  title: Translations
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Most of the text you see in Cerb is provided by the **translation** system using _American English_ defaults. All of this text is able to be translated into any other language using our built-in [Translation Editor](/docs/plugins/cerberusweb.translators/) plugin.

Plugins can add new text to the translation system with a `strings.xml` file in TMX format, which can then be translated into any language by anyone, as well as shared in our official translation packs.

<pre>
<code class="language-xml">
{% raw %}
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE tmx PUBLIC "-//LISA OSCAR:1998//DTD for Translation Memory eXchange//EN" "tmx14.dtd"&gt;
&lt;tmx version="1.4"&gt;
	&lt;header creationtool="Cerb" creationtoolversion="9.0.7" srclang="en_US" adminlang="en" datatype="unknown" o-tmf="unknown" segtype="sentence" creationid="" creationdate=""/&gt;
	&lt;body&gt;

		&lt;tu tuid='example.plugin.string_name'&gt;
			&lt;tuv xml:lang="en_US"&gt;&lt;seg&gt;Replace this with your own text.&lt;/seg&gt;&lt;/tuv&gt;
		&lt;/tu&gt;
		
	&lt;/body&gt;
&lt;/tmx&gt;
{% endraw %}
</code>
</pre>