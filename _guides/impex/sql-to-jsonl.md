---
title: Export from SQL to JSONL
excerpt: Export data to JSONL directly from the database using PHP and SQL.
summary: This page provides instructions on how to export data from Cerb's SQL database directly to JSONL format using PHP and SQL, a more efficient method than exporting through the API due to rate limits and paging. By accessing a local copy of their database, users can export millions of records in a few minutes. The provided example script exports metadata for all ticket records and demonstrates how to add custom field values by modifying the SQL query.
layout: integration
topic: Import/Export
permalink: /guides/impex/sql-to-jsonl/
jumbotron:
  title: Export from SQL to JSONL
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Import/Export &raquo;
    url: /resources/guides/#impex
---

# Introduction

JSONL (JSON Lines) is a popular file format for ingesting large amounts of data into analytics or machine learning models.

If you have millions of records in Cerb, it can be inefficient to export them through the [API](/docs/api/) due to rate limits and paging.

With access to a local copy of your database (which we can provide from Cerb Cloud), you can export millions of records in a few minutes using SQL and your preferred programming language.

# Code (PHP)

This example exports metadata for all ticket records. It uses PHP, but the logic will be similar in any language.

**`cerb-export-jsonl.php`**
{% highlight php linenos %}
<?php
const DB_HOST = 'localhost';
const DB_USER = 'cerb_user';
const DB_PASS = 'cerb_password';
const DB_NAME = 'cerb';

const OUTPUT_FILE = 'records.jsonl';

$sql = "SELECT closed_at as closed, created_date as created, elapsed_response_first, 
elapsed_status_open, id, mask, num_messages, num_messages_out, num_messages_in, org_id, 
reopen_at as reopen_date, updated_date as updated, group_id, bucket_id, 
CASE WHEN status_id=0 THEN 'open' WHEN status_id=1 THEN 'waiting' ELSE 'closed' END as status,
FROM ticket 
WHERE status_id < 3
";

$fp = fopen(OUTPUT_FILE,'w');
$count = 0;

$db = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$rs = mysqli_query($db, $sql, MYSQLI_USE_RESULT);

while($row = $rs->fetch_object()) {
	fwrite($fp, json_encode($row) . PHP_EOL);
	if(0 == ++$count % 10_000) echo $count . PHP_EOL;
}

fclose($fp);
{% endhighlight %}

* **Line 1:** Set `DB_HOST` to your database server hostname.
* **Line 2:** Set `DB_USER` to your database user.
* **Line 3:** Set `DB_PASS` to your database password.
* **Line 4:** Set `DB_NAME` to your database name.

Once you've configured the script, you can run it with the command:

{% highlight bash %}
php cerb-export-jsonl.php
{% endhighlight %}

The script will output a count every 10,000 records.

You can export custom field values by adding additional `SELECT` clauses above **Line 13**:

{% highlight sql %}
(select cf_123.field_value from custom_field_numbervalue cf_123 
  where cf_123.field_id = 123 and cf_123.context_id = ticket.id LIMIT 1
) as custom_123
{% endhighlight %}

Change `custom_123` to the ID of your custom field. You'll find this in the `custom_field` table.

If you add this clause multiple times, separate them with a comma (`,`).

Custom field values are partitioned into four tables depending on their type:

* `custom_field_clobvalue` (multi-line text)
* `custom_field_geovalue` (geolocations)
* `custom_field_numbervalue` (checkbox, number, record ID)
* `custom_field_stringvalue` (text, picklist, list)