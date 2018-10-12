---
title: Worker Roles
excerpt: Permissions are granted to workers using roles.
permalink: /docs/roles/
toc:
  title: Roles
jumbotron:
  title: Roles
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Workers &raquo;
    url: /docs/workers/
---

[Workers](/docs/workers/) generally don't have equal authority in executing their duties. For instance, someone in an entry-level position shouldn't have access to destroy important business records without any oversight.

In Cerb, sets of **privileges** are granted to workers using **roles**.

Multiple roles can be applied to the same worker. Roles can also be automatically applied to workers based on their [group](/docs/groups/) memberships.

A particular privilege is granted to a worker if _any_ of their roles permit it.

Special workers called **administrators** have no restrictions on their privileges. It is their job to decide which privileges everyone else needs in order to accomplish their jobs.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/roles/roles.png" class="screenshot">
</div>
