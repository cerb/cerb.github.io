---
layout: post
title: "Tip: Use prompted placeholders in snippets"
excerpt: Use prompted placeholders to personalize a snippet based on worker input.
author: The Cerb Team
date: 2017-03-15 18:50:00 -0700
permalink: /tips/snippet-prompted-placeholders/
tags: cerb tips mailbag
---

[Snippets](/docs/tickets/#snippets) let you quickly insert predefined text into messages. You can think of snippets as copying and pasting from a giant shared clipboard.

You can also use placeholders in a snippet to automatically insert details you already know -- a worker's name, a ticket's subject, custom fields, etc.

However, sometimes you need to include last minute details in a snippet, or situationally choose which paragraphs to include.  We've seen snippets in various client environments with manual placeholders like `[[WRITE TEXT HERE]]`.

Cerb already handles that with _prompted placeholders_.

When creating a snippet, you can add prompted placeholders like:

<div class="cerb-screenshot">
<img src="/assets/images/tips/snippet-prompted-placeholders/prompted-placeholders.png" class="screenshot">
</div>

Then when a worker selects that snippet they'll be prompted to customize it before it inserts:

<div class="cerb-screenshot">
<img src="/assets/images/tips/snippet-prompted-placeholders/prompted-popup.png" class="screenshot">
</div>

The inserted text then incorporates the extra details:

<div class="cerb-screenshot">
<img src="/assets/images/tips/snippet-prompted-placeholders/email.png" class="screenshot">
</div>

