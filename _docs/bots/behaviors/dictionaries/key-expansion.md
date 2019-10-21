---
title: Key Expansion
permalink: /docs/bots/behaviors/dictionaries/key-expansion/
toc:
  title: Key Expansion
jumbotron:
  title: Key Expansion
  #tagline: ...
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Behaviors &raquo;
    url: /docs/bots/behaviors/
  -
    label: Dictionaries &raquo;
    url: /docs/bots/behaviors/dictionaries/
---

* TOC
{:toc}

Now that we've demonstrated how record [dictionaries](/docs/bots/behaviors/dictionaries/) reduce complexity, let's look at how they improve performance.

The previous example was simplified to demonstrate the basic concept of dictionaries.  In practice, there are many more records and keys involved, and it would be inefficient to always load that data if most of the time it doesn't end up being used.

In other words, if you just need the mask and subject from a ticket record, Cerb shouldn't waste time loading data for the associated group, bucket, latest message, sender, organization, owner, custom fields, and so on.

In a real-world dictionary, you will see many keys like:

<pre>
<code class="language-yaml">
bucket__context: "cerberusweb.contexts.bucket"
bucket_id: 6

group__context: "cerberusweb.contexts.group"
group_id: 6

initial_message__context: "cerberusweb.contexts.message"
initial_message_id: 1195

initial_message_sender__context: "cerberusweb.contexts.address"

initial_message_sender_org__context: "cerberusweb.contexts.org"

latest_message__context: "cerberusweb.contexts.message"
latest_message_id: 1195

latest_message_sender__context: "cerberusweb.contexts.address"

latest_message_sender_org__context: "cerberusweb.contexts.org"

org__context: "cerberusweb.contexts.org"
org_id: 51

owner__context: "cerberusweb.contexts.worker"
owner_id: 0

owner_address__context: "cerberusweb.contexts.address"
</code>
</pre>

These keys are placeholders for linked records that are not loaded by default.

When you request a key that needs data from other records, Cerb will automatically _lazy load_[^lazy-loading] it. We call this process **key expansion**.

For instance, let's assume you wanted the name of the group that the ticket is assigned to.  Here's the placeholder for that record:

<pre>
<code class="language-yaml">
group__context: "cerberusweb.contexts.group"
group_id: 6
</code>
</pre>

When you request a key that doesn't exist in the dictionary, like `group_name`, Cerb builds a list of all the `*__context` keys it does know about.  It then attempts to match those patterns against the requested key, using the longest patterns first.

In this case, the following key pattern would match:

<pre>
<code class="language-yaml">
group__context: "cerberusweb.contexts.group"
</code>
</pre>

Once a context is found for a key, Cerb looks for an associated `*_id` in the dictionary with the same prefix.  In this example, it looks for `group_id`, which does exist in the dictionary with a value of `6`.  Cerb would then *expand* (load) the keys and values from group #6:

<pre>
<code class="language-yaml">
group_name: "Billing"
</code>
</pre>

You may notice that some deeply nested contexts don't have corresponding IDs in the dictionary.  For instance:

<pre>
<code class="language-yaml">
latest_message_sender_org__context: "cerberusweb.contexts.org"
</code>
</pre>

To find a key like `latest_message_sender_org_name`, Cerb would build the following list of contexts using the dictionary:

* `latest_message_sender_org__context`
* `latest_message_sender__context`
* `latest_message__context`
* `__context`

There aren't keys for `latest_message_sender_org_id` or `latest_message_sender_id` in the dictionary because their records haven't been expanded yet.  However, the following key does exist:

<pre>
<code class="language-yaml">
latest_message_id: 1195
</code>
</pre>

Cerb will:

* Expand the message record for `latest_message_id`, which includes the `latest_message_sender_id` key for locating the message sender's record.
* Expand the message sender record for `latest_message_sender_id`, which includes the `latest_message_sender_org_id` for locating the message sender's organization record.
* Expand the sender organization record for `latest_message_sender_org_id`.
* Return the `latest_message_sender_org_name` key from the organization record.

Once a record has been expanded, its keys are included in the dictionary and subsequent lookups are very fast.

When working with multiple dictionaries, it's also possible to expand the same keys on all of them as a single operation. For instance, when expanding the `group_` keys on a set of ticket dictionaries, many of them may refer to the same group, and its record is only loaded once.

# References
{:.no_toc}

[^lazy-loading]: <http://en.wikipedia.org/wiki/Lazy_loading>