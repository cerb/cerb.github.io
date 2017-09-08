---
layout: post
title: "8.2 preview: Create records for anything without using plugins"
excerpt: Starting in Cerb 8.2, you can create new record types from your web browser without using plugins. Here's an explanation and some use cases.
author: The Cerb Team
date: 2017-09-08 11:00:00 -0700
tags: cerb sneak-peek
---

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records.png" class="screenshot">
</div>

### The boring foundation of everything: Record keeping

As Cerb has incorporated modern innovations over the past 15 years -- like interactive bots and encryption -- it's easy to forget that the fundamental idea of _record keeping_ has been around for more than 5,000 years[^record-keeping]. There's no excuse to not get that part right.

A [**record**](/docs/records/) is simply a distinctly identifiable entity that you can refer back to. When records refer to the same kind of entity, we say that they are of the same **record type**.

In Cerb, we include a set of built-in record types to help you get started.  When you add a new customer they become a **contact** record. Their company becomes an **organization** record.  You write to them using an **email address** record.  A specific conversation with them is stored as a **ticket** record, which is a collection of **message** and **comment** records. Your team can also keep track of what needs to be done using **task** records.

While the built-in record types cover things that every team has in common, individual teams also need to keep track of data that's specific to them or their industry. For instance, if you're a transportation company, your tickets may refer to physical trucks, planes, and ships in the real world.

New record types can be added using Cerb's [plugin](/docs/plugins/) system. There are already plugins for logging details about phone **calls**, tracking sales **opportunities**, saving **tweets** where your brand is mentioned, building Kanban-style **project boards**, and much more.

However, as of the current version today ([8.1.1](/releases/8.1.1/)), if you find yourself needing a completely new record type, you have to find a software developer and have them build a plugin for it.

That's about to become much easier.

### Plugins are great, but...

Plugins are nearly unlimited in their ability to add new functionality to Cerb; but they also have several big limitations:

* Plugin development requires an experienced PHP developer. This is time-consuming and it costs money.
* Plugins must be continuously maintained to ensure compatibility with each new version of Cerb. When record-based functionality changes, every plugin has to be updated and redistributed. This is a hassle during upgrades, and the maintenance is an added ongoing cost.
* Third-party plugins without general appeal aren't added to the Plugin Library, and they therefore lack the accessibility and security assurances afforded to official plugins. This means there's a good chance that you're redundantly building the same plugin as someone else without knowing about it.
* On [Cerb Cloud](/cloud/), most subscribers (other than enterprise) are limited to the official plugins. If your custom plugin isn't accepted into the Plugin Library, you either have to give up the convenience of the cloud service to run Cerb on your own servers, or you have to upgrade to an enterprise subscription that you may not otherwise need.

Plugins will remain the way that new building blocks are created by developers; but plugins shouldn't be the only way to track new kinds of data.  It's such a common requirement to be so needlessly complicated.

### Embracing the web browser

Ever since the introduction of bots in version 5.4 (May 2011), we've been moving customization (like business rules) out of code-based plugins and into the web-based interface. This allows everyone -- not just developers -- to build new functionality and automate their workflow within Cerb with just a web browser.

Starting with the upcoming [8.2](/releases/8.2/) release, you'll be able to create new record types directly from your web browser without the need for plugins.

### Creating a custom record type the old way

For comparison, let's take a final look at the old way of creating new record types:

1. You find an experienced PHP developer.

1. You convince them to build a new plugin for you.

1. The developer starts by creating a bunch of files with arcane names and syntaxes: `plugin.xml`, `api/App.php`, and `templates/view.tpl`.

1. They then have to finish implementing functionality for the new record type: database access, cards, permissions, bot behaviors, worklists, profiles, filters, subtotals, quick search, custom fields, watchers, and whatever else you need. We provide some code and tools to make this easier, but it's still a decent amount of work.

1. A while later, you get back a plugin that adds your new record type.

1. You realize that you need to add another field to your custom record.

1. You contact the developer and wait for them to make the changes.

1. Your team decides that it would be great to have several other new record types for projects that they're working on.

1. This process repeats every time you need a new record type or field, or want to upgrade to a new major version of Cerb.

### Creating a custom record type the new way

The old approach was incredibly flexible for very specific needs, but it was also potentially complex, slow, and expensive.

Frankly, we're also a bit tired of building and maintaining new record plugins that are 99% identical.  Most use cases just need a simple way to create a new kind of record with the same functionality as the other records in Cerb.  With modern versions of Cerb, specialization can happen with bot behaviors rather than plugin code.

And it finally started to dawn on us that perhaps a process that's been around for thousands of years should actually be simpler with a computer.

So here's the new way:

1. Navigate to **Search >> Custom Records**.

1. Click **(+)** above the worklist.

1. Enter the name of your new custom record type.

1. Click the **Save Changes** button.

Your new custom records show up in the search menu:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records-search.png" class="screenshot">
</div>

They provide searchable, filterable, pagable worklists and choosers:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records-worklists.png" class="screenshot">
</div>

They provide cards and editors, making it easy to link the new records to any other records in Cerb:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records-cards.png" class="screenshot">
</div>

You can add custom fields and fieldsets to your new records to keep track of anything:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records-custom-fields.png" class="screenshot">
</div>

You can set itemized permissions in roles for them:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2017/09/08/custom-records-privs.png" class="screenshot">
</div>

And by the time we finish 8.2, you'll be able to use them in bot behaviors, the [API](/docs/api/), and everywhere else.

### Use cases

What will you use custom records for?  Here are some ideas:

* **Project management**: Create records to sync basic issue details from GitHub, GitLab, or JIRA. Link them to tickets, contacts, or organizations to keep track of client wish lists. Automatically notify clients when their issues are resolved.

* **Product management**: Create records for product and service offerings. Link them to contacts and organizations to segment clients, and make bots smarter and more personalized when offering help.

* **Order history**: Create records for past orders, invoices, estimates, and coupons. Link them together and associate them with contacts and organizations.

* **Asset tracking:** Instead of creating fieldsets on asset records, create new records for different types of assets (e.g. laptop, computer, automobile).

* **Academia:** Create records for students, courses, professors, and rooms.  Link them all together to make bots smarter.

* **Software as a service (SaaS):** For instance, with Cerb Cloud we need to keep track of things like community portals and DKIM key pairs for each client. Bringing these relationships into Cerb as custom records would make it much easier to automate with bots.

### References

[^record-keeping]: Wikipedia: Recorded history - <https://en.wikipedia.org/wiki/Recorded_history>