---
title: Respond to messages from an external email client
excerpt: This page provides detailed information on how Cerb's email relay feature
  allows workers to respond to messages using external email clients like Gmail, Outlook,
  or mobile phones, while maintaining the benefits of Cerb's platform such as shared
  history and privacy protection.
summary: 'This page provides detailed information on how Cerb''s email relay feature
  allows workers to respond to messages using external email clients like Gmail, Outlook,
  or mobile phones, while maintaining the benefits of Cerb''s platform such as shared
  history and privacy protection. It explains how administrators can enable the mail
  relay, and how messages can be relayed to external accounts either through bots
  or directly from the Cerb user interface. The page also outlines the use of specific
  #commands in email replies, which allow users to perform actions like adding comments,
  cutting content, changing conversation status, and managing conversation watch status,
  all while ensuring that personal email addresses remain private.'
permalink: /guides/mail/relaying/
layout: integration
topic: Mail
keywords: relay
jumbotron:
  title: Respond to messages from an external email client
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Mail &raquo;
    url: /resources/guides/#mail
---

# Introduction

The email relay allows workers to respond to messages from external mail applications (e.g. Gmail, mobile phones, Outlook, etc) instead of requiring them to always use Cerb in the web browser.

Relayed responses are received from a worker's personal email address and rewritten so they appear to be from Cerb before being sent to a conversation's recipients. This process protects the privacy of personal worker email addresses, while still providing the benefits of Cerb (e.g. shared history, assignments, etc).

* TOC
{:toc}

# Enabling the mail relay

Administrators can enable mail relay functionality from [Setup >> Mail >> Incoming >> External Relay](/docs/setup/mail/relay/).

# Relaying messages to external email accounts

## From bots

In bots, on message-based events, you can use the **Send >> Email >> Relay To Workers** action to automatically relay specific messages to a list of workers:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/relaying/bot-relay.png" class="screenshot">
</div>

## From the UI

From Cerb, you can also do a one-time relay for any message from the **Reply** menu on a ticket timeline:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/relaying/reply-relay.png" class="screenshot">
</div>

# Using #commands in replies

You can use the following **#commands** when replying to email through the relay.

Each command must appear on its own line.

## #comment

Add a private comment to the conversation timeline. By default, a comment is **in addition** to your reply.

{% highlight text %}
You're all set!

#cut
#status closed
#comment I called the client a couple minutes ago and we resolved this.
{% endhighlight %}

## #cut

Ignore all content below this line when sending a reply.

This is useful in mobile email clients where deleting quoted text is tedious.  It's also useful to make sure other #commands aren't accidentally sent to the recipients.

{% highlight text %}
This is my quick reply to the customer.

#sig
#cut
#status waiting
#reopen +2 days

On Friday, customer@example.com wrote:
> This is the original quoted message, and it will not be displayed as 
> part of your reply because of the nifty #cut tag above.  You don't 
> have to waste your time deleting this message in your mobile 
> email client.
{% endhighlight %}

## #noreply

Only apply tags to the conversation and do not send anything to requesters.

{% highlight text %}
#comment I'll take care of this on Monday.
#noreply
{% endhighlight %}

## #reopen

If waiting or closed, reopen the conversation on at the given time (`+2 days`, `next Tuesday`).

{% highlight text %}
#reopen +2 days
{% endhighlight %}

## #sig

Insert your full signature on the current line (based on the conversation's group and bucket).

{% highlight text %}
This is my reply to the recipients.

#sig
{% endhighlight %}

## #status

Change conversation status (`open`, `waiting`, or `closed`]).

{% highlight text %}
You're all set!

#sig
#status closed
{% endhighlight %}

## #start comment

Add a private multi-line comment to the conversation timeline, and terminate with **#end**.

{% highlight text %}
#start comment
This is the first line of the comment.
This is the second line of the comment.
#end
{% endhighlight %}

## #unwatch

Stop watching this conversation.

{% highlight text %}
#noreply
#unwatch
{% endhighlight %}

## #watch

Start watching this conversation.

{% highlight text %}
I'll research this and get right back to you.

#sig
#watch
{% endhighlight %}
