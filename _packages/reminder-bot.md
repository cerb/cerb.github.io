---
title: Reminder Bot
excerpt: A bot with conversational interactions for setting reminders from any record's card or profile page.
layout: integration
topic: Packages
permalink: /packages/reminder-bot/
jumbotron:
  title: Reminder Bot
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/cerb-reminders.png" class="screenshot">
</div>

# Introduction

This package adds **Reminder Bot**, which provides conversational interactions for setting reminders from any record's card or profile page.

# Importing the package

As of [9.2.2](/releases/9.2.2/):

1. Navigate to **Search >> Bots**.

1. Click **(+)** above the worklist.

1. Select a target **Owner**.

1. On the **Library** tab, select **Reminder Bot**.

1. Click the **Create** button.

# Using the bot

### Open the interaction menu on a card or profile

Open up the card or profile page of any record.

Click on the Cerb icon in the toolbar to open the bot interaction menu.

Hover over **Reminder Bot** in the interaction menu to expand the submenu:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/interactions.png" class="screenshot">
</div>

Click on **Remind me about this by notification**.

### Have a quick chat with the bot

The bot asks when it should remind you:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-prompt-when.png" class="screenshot">
</div>

You can enter either an _absolute_ time (`Jan 9 2019 08:00`) or a _relative_ time (`5 minutes`, `5pm`, `tomorrow 8am`, `next Friday noon`).

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-prompt-when-relative.png" class="screenshot">
</div>

Either way, the bot will convert your input into a properly formatted date:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-prompt-when-converted.png" class="screenshot">
</div>

Click the blue **Send** button.

The bot then asks what it should tell you when the reminder is due:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-prompt-what.png" class="screenshot">
</div>

The bot confirms your reminder details:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-prompt-confirm.png" class="screenshot">
</div>

When you click **Yes** to confirm, the bot creates the reminder for you.

The confirmation includes a link the new reminder's card popup:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-reminder-card.png" class="screenshot">
</div>

### Verify the reminder on the record

The bot created a reminder record and linked it to the ticket we were looking it. It also configured the **Remind by notification** behavior to run on the reminder date.

On the ticket profile, we also see a link to the reminder:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/profile-reminder-links.png" class="screenshot">
</div>

### Receive the reminder

In our example, we would receive the following notification in 5 minutes:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-reminder-notification.png" class="screenshot">
</div>

Clicking on the notification displays the card for the completed reminder:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/bot-reminder-completed.png" class="screenshot">
</div>

### If necessary, reschedule the reminder

Occasionally you'll receive a reminder message that you can't act on yet. You can easily edit the reminder from its card to reschedule it to run again in the future.

# Listing reminders

You can list your future and past reminders from **Search >> Reminders**:

<div class="cerb-screenshot">
<img src="/assets/images/packages/reminder-bot/search-reminders.png" class="screenshot">
</div>

# Receiving other kinds of reminders

### Reminders by email

Reminder Bot can also remind you through email. It uses the personal email address configured for your account.

### Reminders by text message

If you enable the Twilio plugin, the bot can also remind you with text messages using the mobile number configured on your account.

### Reminders by webhook

Reminder Bot also includes a behavior for sending a reminder to an arbitrary webhook URL as a JSON payload.  You can use this when creating your own reminders, or when editing reminders the bot created for you.

### Reminders by almost anything

You can create a new **Custom behavior on reminder** behavior to do almost anything you can think of with a reminder.