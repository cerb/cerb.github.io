---
layout: post
title: "Tip: Private shared workspaces with roles"
excerpt: Use roles to share private workspaces with specific workers from different groups.
author: The Cerb Team
date: 2017-02-27 16:00:00 -0700
permalink: /tips/private-shared-workspaces-with-roles/
tags: cerb tips mailbag
---

When you create a [workspace](/docs/workspaces/) in Cerb, the owner determines who is able to use or modify it.

* **App-owned** workspaces can be used by everyone, but can only be modified by admins.
* **Role-owned** workspaces can be used by anyone in that role, but can only be modified by admins.
* **Group-owned** workspaces can be used by [group](/docs/groups/) members, but can only be modified by group managers.
* **Worker-owned** workspaces can only be used or modified by that [worker](/docs/workers/).

Sometimes you need to share a workspace with a few workers from different groups, while hiding it from everyone else. You can handle this with role-owned workspaces.

You'll need to be an admin to create a new role.

From the global [Search menu](/docs/navigation/#search-menu), select **Roles**.

Click the **(+)** icon above the worklist to add a new role.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Give a **Name:** to the new role.

In **Apply to:**, you can assign individual workers or entire groups.

For **Privileges** just select **None**.

<div class="cerb-screenshot">
<img src="/assets/images/tips/private-shared-workspaces-with-roles/role-new.png" class="screenshot">
</div>

Then click the **Save Changes** button.

Now from the **Search >> Workspace Pages** menu, you can use the new role as the owner when creating a new workspace or reassigning an existing one.

<div class="cerb-screenshot">
<img src="/assets/images/tips/private-shared-workspaces-with-roles/page-new.png" class="screenshot">
</div>
