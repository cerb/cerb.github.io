---
title: "Translate Cerb to a new language"
excerpt: Cerb includes a plugin for translating the UI into new languages. We offer a billing credit for sharing translation work.
layout: integration
topic: Localization
jumbotron:
  title: Translate Cerb to a new language
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Localization &raquo;
    url: /resources/guides/#localization
---

* TOC
{:toc}

# Introduction

Cerb includes a plugin for translating the user interface into new languages.  These translations are shared as `.xml` files in the TMX[^tmx] format, which can be shared and [imported](/guides/localization/import-translation/) by other Cerb users.

The TMX format is pretty simple.  Each `<tu>` tag defines a new phrase with the ID given in the `tuid` attribute. Within each phrase is any number of `<tuv>` translations that specify a language in the `xml:lang` attribute.

For example:

<pre>
<code class="language-xml">
&lt;tmx&gt;
	&lt;header creationtool="Cerb" creationtoolversion="8.1.4" srclang="en_US" /&gt;
	&lt;body&gt;
	 	&lt;!-- ... --&gt;
		&lt;tu tuid="common.notspam"&gt;
			&lt;tuv xml:lang="en_US"&gt;
				&lt;seg&gt;not spam&lt;/seg&gt;
			&lt;/tuv&gt;
			&lt;tuv xml:lang="de_DE"&gt;
				&lt;seg&gt;Kein Spam&lt;/seg&gt;
			&lt;/tuv&gt;
		&lt;/tu&gt;
		&lt;!-- ... --&gt;
	&lt;/body&gt;
&lt;/tmx&gt;
</code>
</pre>

We store each translated language in its own TMX file, so there's only one `<tuv>` child within each `<tu>` phrase.

In Cerb, templates in plugins can use these phrases like:

<pre>
<code class="language-smarty">
{% raw %}
{'common.notspam'|devblocks_translate|capitalize}
{% endraw %}
</code>
</pre>

This way we display each phrase in the preferred language of each worker or contact.

In this guide, we'll cover the steps required to translate Cerb to a new language.

<div class="cerb-box note">
<p>We offer a billing credit of <b>$0.50 USD per phrase</b> for translation work.  At the time of writing, there are roughly <b>1,300 phrases</b> in Cerb.  This credit is also available for maintaining existing translations as new versions of Cerb are released.</p>
</div>

# Enable the Translation Editor plugin

First, make sure the Translation Editor plugin is enabled.

{% include plugins/install-instructions.md keyword="translation" library=false %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/localization/enable-plugin.png" class="screenshot">
</div>

# Create a new language

1. Navigate to: **Setup >> Configure >> Translation Editor**

1. Click on the **Languages** button in the top left.

1. In **Add New Translation**, select the language you want to provide a new translation for.

1. If your new language is closely related to an existing language (e.g. British English >> American English, Mexican Spanish >> Castilian Spanish) then you can **Copy New Text From** that language.  Otherwise, use the default of **leave blank**.

1. Click the **Save Changes** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/localization/add-language.png" class="screenshot">
	</div>

# Translate text

## Using the built-in translation editor

1. Navigate to: **Setup >> Configure >> Translation Editor**

1. Use quick search to filter the worklist to phrases in your new language without a translation.  For example:

	<pre>
	<code class="language-text">
	lang:fr_FR mine:""
	</code>
	</pre>

1. Cerb automatically provides the English version of each phrase. Translate that phrase into your language in the textbox below each entry.

1. After each page of translations is complete, click the **Save Changes** button.  This will refresh the worklist with the next page of entries needing translation.  You're done when there aren't any non-translated entries left.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/localization/editor.png" class="screenshot">
	</div>

# Sharing translations

To share your new translation:

1. Navigate to: **Setup >> Configure >> Translation Editor**

1. Use quick search to filter the worklist to phrases in your new language.  For example:

	<pre>
	<code class="language-text">
	lang:fr_FR
	</code>
	</pre>

1. Click the **Export** button below the worklist.

1. Your browser will download the translation as an `.xml` file TMX format.  You can share this file in email, include it in a pull request on GitHub, etc.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/localization/export.png" class="screenshot">
	</div>

# References

[^tmx]: Wikipedia: Translation Memory eXchange (TMX) - <https://en.wikipedia.org/wiki/Translation_Memory_eXchange>
