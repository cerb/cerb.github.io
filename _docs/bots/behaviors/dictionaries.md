---
title: Bot Dictionaries
permalink: /docs/bots/behaviors/dictionaries/
toc:
  title: Dictionaries
jumbotron:
  title: Dictionaries
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
---

Every [event](/docs/bots/behaviors/events/) and [record](/docs/records/) in Cerb can be represented as a **dictionary**.

Dictionaries are used to power many features, including [bots](/docs/bots/), [data queries](/docs/data-queries/), [sheets](/docs/sheets/), [snippets](/docs/snippets/), [dashboards](/docs/dashboards/), [worklists](/docs/worklists/), and the [API](/docs/api/).

A dictionary is a flat list of **keys** and their associated **values**.

Let's consider a real-world example to demonstrate the benefits of this approach.

A simplified ticket record has a hierarchal relationship with several other records:

* Ticket
	* Group
	* Latest Message
	* Owner
        
Some of these _child_ records also have their own children:

* Ticket
	* Group
		* Bucket
	* Latest Message
		* Sender
			* Organization
	* Owner
		* Email Address

Normally, parent/child relationships are modeled using tree-based data structures.

The above example as a tree-based object would be:

<pre>
<code class="language-json">
{
    ticket: {
        id: 123,
        subject: "Do you offer volume discounts?",
        group: {
            id: 2,
            name: "Support",
            bucket: {
                id: 0,
                name: "Inbox"
            }
        },
        latest_message: {
            id: 2,
            content: "...",
            sender: {
                id: 5
                name: "William Portcullis",
                email: "customer@example.com",
                organization: {
                    id: 6,
                    name: "Macrotough"
                }
            },
        },
        owner: {
            id: 3,
            name: "Steven Métier",
            email: "worker@example.com"
        }
    }
}</code>
</pre>

These relationship trees can become quite complex. You can imagine how tedious it would be to use a model like this in bots:

* To iterate through all the key/value pairs, you would need to use recursion[^recursion].

* You have to first check that each parent node exists to access a deeply nested key.

* Keys are not globally unique within the model (e.g. `id`, `name`).

* The syntax for accessing a child can change depending on its type (e.g. array elements vs. object properties).

The above complexity can be reduced considerably by modeling the hierarchal relationships in a single-level dictionary:

<pre>
<code class="language-yaml">
ticket_id: 123
ticket_subject: "Do you offer volume discounts?"
ticket_group_id: 2
ticket_group_name: "Support"
ticket_bucket_id: 0
ticket_bucket_name: "Inbox"
ticket_latest_message_id: 2
ticket_latest_message_content: "..."
ticket_latest_message_sender_id: 5
ticket_latest_message_sender_name: "William Portcullis"
ticket_latest_message_sender_email: "customer@example.com"
ticket_latest_message_sender_org_id: 6
ticket_latest_message_sender_org_name: "Macrotough"
ticket_owner_id: 3
ticket_owner_name: "Steven Métier"
ticket_owner_email: "worker@example.com"
</code>
</pre>

* We still have the ability to model hierarchal relationships at any depth.

* All of the keys and values can now be iterated with a simple loop.

* Keys have globally unique names using namespace prefixes.

* Any key can be retrieved directly in a consistent way without recursion.

* Metadata can be attached to keys by including keys with the same base name and different suffixes.

# Key expansion

Now that we've demonstrated how dictionaries reduce complexity, let's look at how they improve performance.

The example above was simplified to demonstrate the basic concept of dictionaries.  In practice, there are many more records and keys involved, and it would be inefficient to always load that data if most of the time it doesn't end up being used.

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

[^lazy-loading]: <http://en.wikipedia.org/wiki/Lazy_loading>
[^recursion]: <http://en.wikipedia.org/wiki/Recursion_(computer_science)>