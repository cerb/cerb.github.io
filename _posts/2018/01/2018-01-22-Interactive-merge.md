---
layout: post
title: "Preview: Interactive record merging in Cerb 8.3"
excerpt: A new interactive merge tool in Cerb 8.3 gives you more control over how duplicate records are merged into a single record.
author: The Cerb Team
date: 2018-01-22 00:00:00 -0700
tags: cerb sneak-peek
---

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/22/interactive-merge.png" class="screenshot">
</div>

With Cerb, you can [create records to keep track of anything](/guides/records/custom-records/). We make it easy to bring data from anywhere -- manual input, email, webhooks, bots, APIs, etc.

A consequence of importing data from multiple sources is that you'll occasionally discover duplicate records.

This is common with organization records, where workers may unintentionally create extra records for existing companies due to inconsistencies in naming. There may be a record for _IBM_ and another for _International Business Machines Corp_, when these refer to the same organization.

Or perhaps two different contacts from the same organization opened the same support issue within a few minutes of each other.

Another common scenario is when an email address is included in a conversation with a typo. Someone meant to include `kina.halpue@company` and typed `kena.halpue@copany` into the `Cc:` field instead. Or a company rebrands and changes their email addresses, and the old mailboxes (with their years of history) start bouncing.

All of these situations can be resolved by _merging_ duplicates into a single record. This combines all of their content, comments, attachments, links, etc.

As of Cerb 8.2, it was only possible to merge tickets or organizations. We performed merges algorithmically with very little user input. For instance, tickets always merged into the oldest record, and we only kept the custom field values on that record. When merging organizations, a new record was always created and we moved everything into it.

We've implemented a new interactive record merge tool in Cerb 8.3 with the following improvements:

* The interactive merge feature is _abstract_, which means it's easy for us to add it to new record types (including custom records). You can now merge tickets, organizations, email addresses, contacts, tasks, calls, assets, custom records, and more.
* You can select which record will be kept at the end of a merge. It doesn't always have to be the oldest record.
* You can select which field value should be kept when the merged records have conflicting values. This includes all custom fields.
* When a field allows multiple values, you can select the desired combination of values to keep.
* By merging email address records, it's finally possible to delete defunct email addresses without losing their history.

Let's look at a quick example.

We've discovered two organization records for the same company:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/22/records-orgs-dupe.png" class="screenshot">
</div>

We can select these organizations in a worklist and click the **merge** button at the bottom:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/22/worklist-orgs-merge.png" class="screenshot">
</div>

This brings up the interactive merge popup:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/22/popup-merge-orgs.png" class="screenshot">
</div>

At the top, we select which record we want to keep.

If there are conflicting field values, we can resolve them by selecting the one we want to keep.

If the field values are the same, or are blank in every record except one, we're shown what the resulting value will be without having to do anything.

When a multiple value custom field exists (e.g. files, list, multiple checkboxes) we'll see the combined values from all merged records, and we can make changes as we see fit.

After clicking the **Continue** button we now have a single record for this organization without losing any useful information. The comments, activity logs, links, and other content from both records are moved into the one record we kept.

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/22/record-org-merged.png" class="screenshot">
</div>
