---
title: Deep search in queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/deep-search/
toc:
  title: Deep Search
jumbotron:
  title: Deep Search
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
---

Some [filters](/docs/search/filters/) represent [links](/docs/records/links/) between related [records](/docs/records/).

The expression for these filters is another [search query](/docs/search/) based on the linked record type.

We refer to this as **deep searching** because you can chain these searches to any depth.

For instance, you can build a worklist of email messages sent by organizations in the health care industry, in Europe, and who also have at least one female contact with a name that starts with the letter 'M'.

This is one of the most powerful features in Cerb.

### Deep search

When performing a deep search, your expression is another search query:

<pre>
<code class="language-cerb">
{% raw %}
status:open group:(name:S*)
{% endraw %}
</code>
</pre>

The above example returns records that are open and in a group that begin with the letter _'S'_.

### Multiple deep searches

You can perform multiple deep searches at once:

<pre>
<code class="language-cerb">
{% raw %}
owner:(gender:f) 
group:(name:[support,sales]) 
org:(sla.plan:!null)
{% endraw %}
</code>
</pre>

The above example returns records owned by a female worker, in the _Support_ or _Sales_ group, from an organization with any service level agreement (a [custom fieldset](/docs/custom-fieldsets/) picklist).

### Deeper search

You can perform a deep search, within a deep search, within a deep search (ad nauseam):

<pre>
<code class="language-cerb">
{% raw %}
messages.first:(
  sender:(
    org:(
      company.industries:"Health Care" 
      region:Europe 
      sla.plan:Priority
    )
  )
)
{% endraw %}
</code>
</pre>

The above example returns records where the sender of the first message is a member of an organization in the health care industry in Europe with a "Priority" service level agreement.

### Negation

You can also negate a deep search by prefixing an exclamation mark (`!`). This returns all records that **don't match**:

<pre>
<code class="language-cerb">
{% raw %}
group:!(name:S*)
{% endraw %}
</code>
</pre>

The above example returns records that are in a group whose name **doesn't** start with the letter _'S'_.