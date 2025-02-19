---
title: 'Scripting Reference: Commands'
excerpt: A reference of the template commands in bot scripting.
summary: This page serves as a scripting reference for Cerb, detailing various commands
  available for use in bot scripts and snippets. It covers the functionality and usage
  of commands such as "do," "filter," "for," "if," "set," "spaceless," "verbatim,"
  and "with." Each command is explained with examples, demonstrating how to evaluate
  expressions, apply filters, iterate over arrays, implement conditional logic, define
  variables, manage whitespace, avoid parsing template syntax, and create separate
  variable scopes. The page provides practical insights into effectively utilizing
  these commands within Cerb's scripting environment.
permalink: /docs/scripting/commands/
toc:
  title: Commands
  expand: Developer Guide
jumbotron:
  title: 'Reference: Commands'
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

These commands are available in bot scripts and snippets:

* TOC
{:toc}

## apply

Apply the given filters to the enclosed block of text:

{% highlight twig %}
{% raw %}
{% apply upper %}
All of this text will be uppercase.
{% endapply %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
ALL OF THIS TEXT WILL BE UPPERCASE.
{% endhighlight %}

## do

Evaluate a variable or expression without outputting anything:

{% highlight twig %}
{% raw %}
{% do "This won't print" %}
{% endraw %}
{% endhighlight %}

This is primarily useful for expanding placeholders in dictionaries before serializing the object to [JSON](/docs/scripting/#json) or [XML](/docs/scripting/#xml):

{% highlight twig %}
{% raw %}
{% do ticket_custom_ %}
{% endraw %}
{% endhighlight %}

## for

Arrays can be iterated with **for** loops:

{% highlight twig %}
{% raw %}
{% set list_of_names = ["Jeff", "Dan", "Darren"] %}
{% for name in list_of_names %}
* {{name}}
{% endfor %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
* Jeff
* Dan
* Darren
{% endhighlight %}

## if

Conditional logic can display different content based on the result of any number of **expressions**:

{% highlight twig %}
{% raw %}
{% set sla_expiration = '+2 weeks'|date('U') %}
{% if sla_expiration >= 'now'|date('U') %}
Your SLA coverage is active.
{% else %}
Your SLA coverage has expired.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Your SLA coverage is active.
{% endhighlight %}

## set

You can make your own variables in a template using the **set** command:

{% highlight twig %}
{% raw %}
{% set name = "Kina" %}
{% set quantity = 5 %}
{{name}} has {{quantity}} gold stars.
{% endraw %}
{% endhighlight %}

{% highlight text %}
Kina has 5 gold stars.
{% endhighlight %}

Variables are temporary. When you define a new variable in one action, it can't be referenced from other actions.  In programmer parlance, the **scope** of a variable is limited to the same template.


## spaceless

Remove whitespace between HTML tags in the enclosed block of text with **spaceless**:

{% highlight twig %}
{% raw %}
{% spaceless %}
&lt;div&gt;
  &lt;span&gt;This will all be on a single line.&lt;/span&gt;
&lt;/div&gt;
{% endspaceless %}
{% endraw %}
{% endhighlight %}

{% highlight html %}
<div><span>This will all be on a single line.</span></div>
{% endhighlight %}

<div class="cerb-box note">
<p>This is also useful when you're using a lot of template commands (if, for) to mark up text. You won't have to add <tt>-</tt> to every tag.</p>
</div>

## verbatim

You can avoid parsing template syntax by enclosing the code in **verbatim** tags:

{% highlight twig %}
{% raw %}
{% verbatim %}
You can print a variable by typing {{variable_name}}
{% endverbatim %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
You can print a variable by typing {%raw %}{{variable_name}}{% endraw %}
{% endhighlight %}

## with

Create a separate variable scope using the **with** command:

{% highlight twig %}
{% raw %}
{% with %}
{% set name = 'Kina' -%}
Hi, {{name}}!
{% endwith %}
{% if name is empty %}
Where did you go?
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Hi, Kina!
Where did you go?
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/xml/" class="prev">&lt; XML</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/functions/" class="prev">Functions &gt;</a>
	</div>
</div>
<div class="clear"></div>
