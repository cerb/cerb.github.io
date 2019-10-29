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

Every [event](/docs/bots/events/) and [record](/docs/records/) in Cerb can be represented as a **dictionary**.

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

# References

[^recursion]: <http://en.wikipedia.org/wiki/Recursion_(computer_science)>