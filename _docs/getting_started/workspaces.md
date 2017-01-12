---
title: Workspaces
permalink: /docs/workspaces/
jumbotron:
  title: Workspaces
  tagline: Stay on the same page while collaborating from anywhere
---

A **workspace** is a page designed to optimize a particular workflow.  Workspaces can be shared by everyone, shared within a group or role, or private to a specific worker.  Since you can add any number of workspace pages to your [navigation bar](/docs/navigation), you can personalize Cerb into your own mission control.

Workspaces use **tabs** to organize their content into sections; much like dividers are used to partition pages in a large binder. There are many kinds of tabs, but the two most common are worklists and dashboards.

# Worklists

A **worklist** is a filterable, pageable, sortable, and customizable set of records displayed using rows and columns.  Each row of a worklist is a matching record and each column is a particular field from each record. The displayed columns can be customized on a worklist based on your particular need.

By saving a worklist in a workspace, you'll always have an up-to-date view of matching records without wasting any time searching.  For instance, a worklist can display new customer messages that need a response, client organizations in a specific industry, tasks that are overdue, etc.

### Filters

The most useful feature of worklists is their ability to pull out interesting sets of records from your data using **filters**.  A filter is simply some criterion that a record must satisfy in order to be included in the list.  Filters target a specific field, and often provide both an **operator** and **value**.  For text, common operators are "starts with" and "contains this phrase".  For numbers, you may want fields that are equal to a value, not equal, greater/less than, between, etc.

The owner of a workspace can also add special **required filters** to a worklist that cannot be changed by other users of the worklist.  For instance, if a worklist is meant to only show open conversations from clients with a service level agreement, then no additional filtering can change that constraint.  Every other filter will act only against those matching records.

### Deep searching

Cerb also allows for **deep searching**, which means that you can filter a worklist based on the fields of records related to those that you're currently looking, and then filter again based on fields related to those deeper records, and so on into the abyss.  So you can build a worklist of email messages sent by organizations in the health care industry who have an enterprise SLA and also have at least one female contact whose name starts with the letter 'M'.  This is one of Cerb's distinguishing features.

### Sorting

In conjunction with filtering, **sorting** highlights the records of most interest by ordering a worklist by a particular field.  For example, you may be interested in the oldest messages in a list, or the opportunities with the highest potential value.

### Peek

When records are displayed in a worklist, you can open any of their cards for a quick **peek** without leaving the list.  Cards also summarize helpful information about a record, allow you to make modifications, etc.  In Cerb, you can accomplish a lot without ever leaving a worklist.

### Pagination

When a worklist has many results, it's automatically divided into smaller chunks called **pages**. You can navigate through the pages using *next* and *previous* links.  You can also quickly jump to the first or last page.

### Subtotals

Another useful feature in Cerb is the ability to **subtotal** worklists by grouping records with similar values for a given field.  Perhaps you want to subtotal organizations by country, email conversations by group, tasks by owner, etc.  Once you've subtotaled a list, you can click on a particular category to automatically add a new filter to the worklist.

### Import/Export

Once you have a worklist filtered the way you want it, you can export data in CSV (comma-separated), JSON, or XML formats.  You also aren't limited to the fields displayed by the worklist; you can choose any fields, including those from related records.

Similarly, you can also import records on most worklists in CSV format.  You'll be given the opportunity to map columns in your import file to record fields.

### Bulk update

You can also perform actions on an entire worklist, on selected records, or on a random sample of matching records of any size.

For instance, when looking at a long list of indistinguishable leads that need a followup, you can bulk assign a random set of 25 records to yourself.  You can also use random samples to run A/B tests.

### Explore

When you need to view the profile page of each matching record in sequence, click the **explore** button below a worklist.  This will create a consistent snapshot of the worklist at the current point-in-time and allow you to navigate through it.  You can even send an explore set to another worker using its permalink.

You can use the <tt>[</tt> and <tt>]</tt> keyboard shortcuts to navigate backward and forward through the list, respectively.

# Dashboards

**Dashboards** provide insight from your data using highly customizable **widgets**.

### Calendars

Plot records on a calendar using date-based fields.

### Charts

Plot records on bar and line charts using quantitative fields.  Add multiple series to the same chart for comparisons between record sets or over historical time periods.

### Clocks

Display the current time in any timezone in either 12-hour or 24-hour format.

### Countdowns

Show the time remaining until a particular event with a countdown clock.

### Counters

Display an aggregated count, sum, average, min, or max using any quantitative field from a set of records. Display the result as a number, decimal, percentage, number of seconds, minutes, or bytes.

### Custom HTML

Display arbitrary HTML content and Javascript.  This is most often used to display widgets from other systems.

### Gauges

Gauges are similar to a counter, but they allow you to create multiple thresholds within a range.  For instance, the average response time of a group can be displayed as a gauge with thresholds for "excellent", "acceptable", and "unacceptable".

### Pie Charts

Segment arbitrary JSON data as a pie chart.

### Scatterplots

Cluster two-dimensional data using count, value, average, sum, min, or max using record fields from a worklist.

### Subtotals

Grab the subtotal counts against a field on any worklist and display them as a table or pie chart.

### Worklists

Display a compact version of any worklist.