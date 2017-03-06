---
title: Notifications
excerpt: Notifications keep the right people informed about recent activity on any record.
permalink: /docs/notifications/
jumbotron:
  title: Notifications
  tagline: Keep the right people informed about recent activity
---

**Notifications** keep [workers](/docs/workers/) informed about recent activity when they're watching a [record](/docs/records/) or someone directs a [comment](/docs/records/#comments) at them.

* TOC
{:toc}

## Unread notifications

When a worker has unread notifications, a red badge is displayed in the top right of every page:

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/notifications/notifications-badge.png" class="screenshot">
</div>

Clicking on the notification badge opens a notifications [worklist](/docs/workspaces/#worklists) in a popup:

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/notifications/notifications-popup.png" class="screenshot">
</div>

The links in the worklist open up [cards](/docs/records/#cards) for those relevant records. In many cases, a worker doesn't even need to leave the popup to act on their latest notifications.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/notifications/notifications-card.png" class="screenshot">
</div>

The summary on a card displays all the unread notifications on that record at the same time.  The notifications are automatically marked as read and the underlying worklist is refreshed.

## Watchers

A worker can receive notifications about all new activity on a record by becoming a [watcher](/docs/records/#watchers). Most [worklists](/docs/workspaces/#worklists) provide watcher shortcuts in the first column.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/watchers.png" class="screenshot">
</div>

<div class="cerb-box note"><p>You can hold <tt>&lt;SHIFT&gt;</tt> while clicking on a watcher button to quickly add or remove yourself as a watcher.</p></div>

A worker who is assigned as a record's **owner** is automatically treated as a watcher.

## Mentions

When adding a [comment](/docs/records/#comments) on a record, you can `@mention` other workers to send them a notification.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/notifications/notifications-atmention.png" class="screenshot">
</div>
