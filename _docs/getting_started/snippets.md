---
title: Snippets
permalink: /docs/snippets/
jumbotron:
  title: Snippets
  tagline: Quickly reply with predefined responses
---

* TOC
{:toc}

[Workers](/docs/workers/) and [bots](/docs/bots) can use **snippets** to quickly insert predefined text into messages. You can think of snippets as _copying and pasting_ from a giant shared clipboard.

However, unlike the traditional _paste_ action, snippets also support [sophisticated scripting functionality](/docs/building-bots/scripting/) with **placeholders** and **conditional logic**.  This means that the content of a snippet can change based on when and where you use it.

In a common use case, an auto-responder message will use placeholders in a snippet like:

{% raw %}
<pre>
<code class="language-twig">Hi <b>{{first_name}}</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>{{mask}}</b>
Subject: <b>{{subject}}</b>

We'll be in contact shortly.</code>
</pre>
{% endraw %}

The above snippet results in the following text when used by a [bot](/docs/bots/) on a new ticket:

<pre>
<code class="language-text">Hi <b>Charlotte</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>CRB-01092-002</b>
Subject: <b>Do you accept purchase orders?</b>

We'll be in contact shortly.</code>
</pre>