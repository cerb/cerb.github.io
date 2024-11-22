---
title: 'Reflow quotes in a reply'
excerpt: Design research shows that the ideal line length for human readers is around
  50-60 characters. This keyboard shortcut reflows quoted text for you.
summary: This page provides guidance on how Cerb reflows quoted text in email replies
  to enhance readability, adhering to a longstanding internet convention of limiting
  line length to 76 characters. It explains the historical context of this practice,
  rooted in the limitations of older terminal displays, and highlights modern design
  research that supports shorter line lengths for optimal readability. The page also
  offers practical instructions on using Cerb's features, such as starting a paragraph
  with a `>` character and employing a keyboard shortcut (`<CTRL>` + `<SHIFT>` + `Q`)
  to automatically reflow quotes, making it easier for users to format text efficiently.
layout: integration
author: The Cerb Team
date: "2017-02-27 15:25:00 -0700"
permalink: /tips/reflow-reply-quotes/
jumbotron:
  title: 'Reflow quotes in a reply'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Packages &raquo;
      url: /resources/packages/
---

When you reply to a message, Cerb "reflows" the quoted text so that each line is no longer than 76 characters. This comes from a decades old Internet convention[^rfc2045] intended to improve readability.

At the time, most terminals displayed around 80 characters per line and 25 lines per screen.  It was important to not send lines longer than the recipient could read, because the quotes became very difficult to read.  The length of each line could vary wildly.

Even though computer monitors today can display hundreds of characters per line, design research shows that the ideal line length for human readers is still around 50-60 characters[^typographie].

When you need to paste some text into an email message and treat it as a quote, you don't need to do all this work yourself.

You can simply start a paragraph with a `>` character and then use the `<CTRL>` + `<SHIFT>` + `Q` to reflow the quotes.

For instance, this long line of text:

<pre>
<code class="language-text">
&gt; This is a sentence with details that are pertinent to the discussion. The second sentence here is a side-hand comment that doesn't contribute to the discussion. There is one other interesting detail at the end of the third sentence.
</code>
</pre>

Is reflowed with the keyboard shortcut to:

<pre>
<code class="language-text">
&gt; This is a sentence with details that are pertinent to the discussion. The
&gt; second sentence here is a side-hand comment that doesn't contribute to the
&gt; discussion. There is one other interesting detail at the end of the third
&gt; sentence.
</code>
</pre>

If you delete that second sentence from the quote, you're left with:

<pre>
<code class="language-text">
&gt; This is a sentence with details that are pertinent to the discussion. [...] interesting detail at the end of the third
&gt; sentence.
</code>
</pre>

You can then use the keyboard shortcut again for a nice short quoted block:

<pre>
<code class="language-text">
&gt; This is a sentence with details that are pertinent to the discussion.
&gt; [...] interesting detail at the end of the third sentence.
</code>
</pre>

It takes a little bit of work on your part, but it makes things much easier for the reader.

## References

[^rfc2045]: IETF: RFC-2045 Multipurpose Internet Mail Extensions - <https://www.ietf.org/rfc/rfc2045.txt>

[^typographie]: Amazon Typographie: A Manual of Design. Emil Ruder. - <https://www.amazon.com/Typographie-Manual-Design-Emil-Ruder/dp/3721200438>