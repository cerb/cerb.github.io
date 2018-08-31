---
title: Roles
excerpt: Permissions are granted to workers using roles.
permalink: /docs/roles/
jumbotron:
  title: Roles
  tagline: What each worker is allowed to do
---

[Workers](/docs/workers/) generally don't have equal authority in executing their duties.

For instance, the latest new-hire in an entry-level position probably shouldn't have access to destroy important business records without any oversight.

Within Cerb, collections of related **privileges** are granted to workers using **roles**.

A single worker can have multiple roles applied to them. A particular privilege is granted to a worker if _any_ of their roles permit it.

Special workers called **administrators** have no restrictions on their privileges. It is up to them to decide what privileges everyone else needs in order to accomplish their jobs.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/roles/roles.png" class="screenshot">
</div>
