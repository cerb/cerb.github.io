---
title: 'Scripting Reference: Commands'
excerpt: A reference of the template commands in automation scripting.
summary: This page serves as a scripting reference for Cerb, detailing various commands
  available for use in automation scripting and snippets. It covers the functionality and usage
  of commands such as "apply," "do," "for," "if," "set," "verbatim," and "with," along
  with the "spaceless" filter. Each command is explained with examples, demonstrating
  how to evaluate expressions, apply filters, iterate over arrays, implement conditional
  logic, define variables, manage whitespace, avoid parsing template syntax, and create
  separate variable scopes. The page provides practical insights into effectively utilizing
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

These commands are available in automation scripting and snippets:

* TOC
{:toc}

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/JwC7rQAwv1s" title="Cerb scripting: Every command" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

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

This is primarily useful for expanding placeholders in dictionaries before serializing the object to [JSON](/docs/scripting/json/) or [XML](/docs/scripting/xml/):

{% highlight twig %}
{% raw %}
{% do ticket_customfields %}
{% endraw %}
{% endhighlight %}

Custom fields expand with `customfields` and no trailing underscore. The trailing underscore belongs to linked record prefixes like `owner_` and `group_`, which is a different kind of placeholder. A placeholder that matches neither expands nothing and reports no error.

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

## sandbox

Twig's **sandbox** command sandboxes an included template on demand. It's accepted, but in Cerb it does nothing: every template Cerb renders is already sandboxed, so this can only re-assert what's always true.

<div class="cerb-box note">
<p>Cerb enables Twig's sandbox <b>globally</b> rather than per-template. The commands, <a href="/docs/scripting/filters/">filters</a>, and <a href="/docs/scripting/functions/">functions</a> documented here <em>are</em> the sandbox policy -- there's no unsandboxed mode to opt into, and no way to widen the policy from inside a template.</p>
</div>

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

Remove the whitespace between HTML tags in a block of text by applying the **spaceless** filter with [apply](#apply):

{% highlight twig %}
{% raw %}
{% apply spaceless %}
<div>
  <span>This will all be on a single line.</span>
</div>
{% endapply %}
{% endraw %}
{% endhighlight %}

{% highlight html %}
<div><span>This will all be on a single line.</span></div>
{% endhighlight %}

`spaceless` only removes whitespace that falls _between_ a `>` and a `<`, and trims the start and end of the block. It does not change the whitespace within a run of text.

<div class="cerb-box note">
<p>This is also useful when you're using a lot of template commands (if, for) to mark up text. You won't have to add <tt>-</tt> to every tag.</p>
</div>

<div class="cerb-box warning">
<p>There is no longer a <tt>{% raw %}{% spaceless %}{% endraw %}</tt> command. It was removed in Twig 3.0 and replaced by the <b>spaceless</b> filter, which is applied with <tt>{% raw %}{% apply %}{% endraw %}</tt> as shown above.</p>
<p>That filter is itself deprecated as of Twig 3.12 and is scheduled for removal in Twig 4.0, which would take the <tt>{% raw %}{% apply spaceless %}{% endraw %}</tt> form with it since that compiles to the same filter. Both still work today. Where the extra whitespace comes from template tags rather than from the markup itself, <a href="/docs/scripting/strings/#whitespace">whitespace control</a> with <tt>-</tt> does the same job and isn't deprecated.</p>
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
