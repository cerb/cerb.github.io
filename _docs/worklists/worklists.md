---
title: Worklists
permalink: /docs/worklists/
jumbotron:
  title: Worklists
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Workspaces &raquo;
    url: /docs/workspaces/
---

A **worklist** is a [searchable](#search), [pageable](#pagination), [sortable](#sorting), and customizable set of [records](/docs/records/) displayed using rows and columns.

Each row of a worklist is a matching record, and each column is a particular [field](/docs/records/fields/) from that record. The displayed columns can be customized for each worklist based on your needs.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/worklist.png" class="screenshot">
</div>

By saving a worklist, you'll always have an up-to-date view of matching records without wasting any time searching.

For instance, a worklist can display new customer messages that need a response, client organizations in a specific industry, tasks that are overdue, etc.

* TOC
{:toc}

# Search

The most useful feature of worklists is their ability to pull out interesting sets of records from your data using [search queries](/docs/search/).

For instance, you can build a worklist of email messages sent by organizations in the health care industry who have an enterprise SLA and also have at least one female contact whose name starts with the letter 'M'.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/deep_search.png" class="screenshot">
</div>

# Sorting

In conjunction with filtering, **sorting** highlights the records of most interest by ordering a worklist by a particular field.

For example, you may be interested in the oldest messages in a list, or the opportunities with the highest potential value.

You can click on the column label to toggle sorting between ascending and descending order.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/sorting.png" class="screenshot">
</div>

# Peek

When records are displayed in a worklist, you can hover over any row and click the **peek** icon to open its [card](/docs/cards/) without leaving the list.

<div class="cerb-screenshot">
<img src="/assets/images/docs/worklists/peek-icon.png" class="screenshot">
</div>

# Pagination

When a worklist has many results, it's automatically divided into smaller chunks called **pages**.

You can navigate through the pages using **Next** and **Prev** links, or quickly jump to the first or last page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/paging.png" class="screenshot">
</div>

# Subtotals

Another useful feature in Cerb is the ability to **subtotal** worklists by grouping records with similar values for a given field.

Perhaps you want to subtotal organizations by country, email conversations by group, tasks by owner, etc.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/subtotals.png" class="screenshot">
</div>

Once you've subtotaled a list, you can click on a particular category to automatically add a new filter to the worklist.

# Bulk Update

You can perform actions on an entire worklist, on selected records, or on a random sample of matching records of any size.

For instance, when looking at a long list of indistinguishable leads that need a followup, you can bulk assign a random set of 25 records to yourself.

You can also use random samples to run A/B tests.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/bulk.png" class="screenshot">
</div>

# Import/Export

Once you have a worklist filtered the way you want it, you can **export** data in CSV (comma-separated), JSON, or XML formats.  You also aren't limited to the fields displayed by the worklist; you can choose any fields, including those from related records.

Similarly, you can also **import** records on most worklists in CSV format.  You'll be given the opportunity to map columns in your import file to record fields.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/export.png" class="screenshot">
</div>

# Explore Mode

When you need to view the [profile](/docs/profiles/) page of each matching [record](/docs/records/) in sequence, click the **explore** button below a worklist.  This will create a consistent snapshot of the worklist at the current point-in-time and allow you to navigate through it.  You can even send an explore set to another worker using its permalink.

You can use the `[` and `]` keyboard shortcuts to navigate backward and forward through the list, respectively.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/workspaces/explore.png" class="screenshot">
</div>
