---
layout: post
title: "Tip: Remove assignments from deactivated workers"
excerpt: Clear assignments on records owned by worker accounts that are deactivated.
author: The Cerb Team
date: 2017-02-16 10:00:00 -0700
permalink: /tips/unassign-deactivated-workers/
tags: cerb tips mailbag
---

As an administrator, you can deactivate worker accounts by clicking on **Workers** in the [Search](/docs/navigation/#search-menu) menu.  A deactivated worker is no longer able to log in, and they aren't included in active worker lists when making assignments; but their entire history of email replies and comments is preserved.

A deactivated worker may still be assigned to historical records.  You can use the new [deep quick search](/docs/workspaces#deep-searching) feature in Cerb 7.3 to find records owned by worker accounts that are deactivated.

For instance, you can search a [ticket](/docs/tickets/) [worklist](/docs/workspaces/#worklists) with this query:

<pre>
<code class="language-text">
owner:(isDisabled:y)
</code>
</pre>

This will return all the tickets that are owned by a deactivated worker.  You can then [bulk update](/docs/workspaces/#bulk-update) those results to remove the owner.  The records will keep their existing status unless you explicitly change it.

If you want to handle open and closed tickets differently, you can also include a status filter in the query:

<pre>
<code class="language-text">
owner:(isDisabled:y) status:[open,waiting]
</code>
</pre>
