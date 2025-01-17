---
title: 'Review bot behaviors by event'
excerpt: Review bot behaviors for each event using subtotals on a worklist.
summary: This page provides guidance on how to review bot behaviors by event in Cerb,
  particularly highlighting improvements made in the 7.3 update. It explains how to
  navigate to the Behaviors section, use the subtotals feature to categorize behaviors
  by event, and apply filters to focus on specific events. The instructions aim to
  simplify the process of managing and analyzing bot behaviors in response to various
  events.
layout: integration
author: The Cerb Team
date: "2017-03-07 17:39:00 -0700"
permalink: /tips/review-bot-behaviors-by-event/
jumbotron:
  title: 'Review bot behaviors by event'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---

In [earlier versions](/docs/history/) of Cerb there wasn't a simple way to review all the bot behaviors that would respond to a specific event. This was made much simpler in the [7.3](/releases/7.3/) update.

Navigate to **Search** >> **Behaviors** to open a popup worklist of behaviors.

Click on the [subtotals](/docs/workspaces/#subtotals) icon in the toolbar at the top right of the worklist:

<div class="cerb-screenshot">
<img src="/assets/images/tips/review-bot-behaviors-by-event/subtotals-icon.png" class="screenshot">
</div>

In the subtotals sidebar on the left, click on the green text at the top and select **Event**:

<div class="cerb-screenshot">
<img src="/assets/images/tips/review-bot-behaviors-by-event/subtotals-picker.png" class="screenshot">
</div>

You'll now see a breakdown of your bot behaviors by event:

<div class="cerb-screenshot">
<img src="/assets/images/tips/review-bot-behaviors-by-event/subtotals.png" class="screenshot">
</div>

You can click on the name of an event in the subtotals to filter the worklist to only those behaviors.

If you want to limit the subtotals to only certain events, you can add a quick search filter to the worklist like:

<pre>
<code class="language-json">
+event:event.macro.* OR event:event.record.changed
</code>
</pre>
