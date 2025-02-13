---
title: 'Setup: Mail Routing'
excerpt: This page provides guidance on setting up mail routing in Cerb, introduced
  in version 11.0.
summary: This page provides guidance on setting up mail routing in Cerb, introduced
  in version 11.0. It explains how to configure rules to automatically direct incoming
  emails to specific groups based on message properties such as recipient addresses.
  Examples include routing emails sent to `support@*` to the Support group, `orders@*`
  to Sales, and `receipts@*` to Billing. The page also introduces the concept of Routing
  KATA, which allows for complex workflows through automations, though they are not
  mandatory. It details the use of conditions and actions within routing rules, such
  as checking recipients, subject lines, and other message attributes to determine
  the appropriate group for each email. The page includes sample rules for various
  departments like Development, Sales, Billing, Corporate, and Support, demonstrating
  how to set up these automated routing processes.
permalink: /docs/setup/mail/routing/
toc:
  title: Routing
  expand: Admin Guide
jumbotron:
  title: Routing
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Mail &raquo;
    url: /docs/setup/#incoming-mail
---

(Added in [11.0](/releases/11.0/))

You can configure rules to automatically route new mail to groups based on message properties.

For example, you may want to route messages addressed to `support@*` to the **Support** group, `orders@*` to **Sales**, and `receipts@*` to **Billing**.

These messages will be delivered to the **Inbox** bucket in those groups, and group managers can configure additional sorting from there.

* TOC
{:toc}

# Routing KATA

Automations are available for complex workflows but are no longer required.

Conditions include: `script`, `recipients`, `sender_email`, `spam_score`, `subject`, `body`, and `header`.

Actions include: `bucket`, `comment`, `group`, `importance`, `owner`, and `watchers`.


## Conditions:

Multiple conditions in a single `if:` node are "all of these", and multiple `if:` nodes are "any of these".

{% highlight yaml %}
rule/dev:
  if/to:
    recipients: dev@, development@, bugs@
  if/subj:
    subject: [Bugs] *
    body: * bug report *
  then:
    group: Development
{% endhighlight %}

In this scenario, tickets would be routed to the Development group if they were either sent to `dev@`. `development@` or `bugs@`, or they had both a subject line containing `[Bugs]` and body containing `bug report`

### script

With the ```script``` condition, you can route based on any custom scripting you would like, such as boolean logic or negation.

{% highlight yaml %}
{% raw %}
rule/dev:
  if:
    recipient: dev@
    script: {{subject != 'dev conference invite'}}
  then:
    group: Development
rule/trouble:
  if/name:
    script@text: 
      {{
        sender_full_name == "Trouble Customer"
        or sender_num_spam >= 10
      }}
  then:
    group: Special Handling
    owner: KinaHalpue
{% endraw %}
{% endhighlight %}

### recipients

```recipients``` routes based on the address(es) the mail is sent to. You can use full addresses. prefixes or domains. You can include multiple addresses in a comma-separated list or in a line-separated list with the ```@list``` annotation.

{% highlight yaml %}
  rule/billing:
    if:
      recipients: billing@, receipts@
    then:
      group: Billing
  rule/brand2:
    if:
      recipients@list: 
        help@brand2.example
        sales@brand2.example
    then:
      group: Brand 2
{% endhighlight %}

### sender_email
```sender_email``` routes based on the address(es) of the sender.  You can use full addresses. prefixes or domains. You can include multiple addresses in a comma-separated list or in a line-separated list with the ```@list``` annotation.

{% highlight yaml %}
  rule/vip:
    if:
      sender_email: *@vipcustomer.example
    then:
      group: VIP
      importance: 90
  {% endhighlight %}

### spam_score
```spam_score``` routes based on the assigned spam score of an email. You can use ```<```,```>``` and ```=``` operators to specify a "greater than" or "less than" value.

{% highlight yaml %}
  rule/spam:
    if:
      spam_score: >=80%
    then:
      group: Spam
{% endhighlight %}

### subject
```subject``` routes based on the text of the email subject line.

{% highlight yaml %}
rule/bugs:
  if:
    subject: this is a bug
  then:
    group: Development
{% endhighlight %}

### body
```body``` routes based on content of the email message body.

{% highlight yaml %}
rule/campaign:
  if:
    body: *I'm responding to your marketing campaign*
  then:
    group: Marketing
{% endhighlight %}

### header
```header``` routes based on content from the message header

{% highlight yaml %}
rule/autoreplies:
  if:
    header: 
      Auto-Submitted:"autoreplied"
  then:
    group: Spam
    bucket: Autoreplies
{% endhighlight %}

## Actions

Actions are what you want to occur if the conditions are met. You can have multiple actions for each routing rule.

### bucket
```bucket``` sets a bucket to route the ticket.

{% highlight yaml %}
rule/bugs:
  if/email:
    recipients: bugs@
  if/subj:
    subject: bug report
  then:
    group: Development
    bucket: Bugs 
{% endhighlight %}

### commnent
  ```comment``` adds a comment with the given text to the resulting ticket.

{% highlight yaml %}
rule/vip:
  if:
    sender_email: *@vipcustomer.example
  then:
    group: VIP
    importance: 90
    comment: This is a high value customer. Please respond rapidly.
{% endhighlight %}

### group
```group``` defines the group a ticket will be moved to. If you do not also use ```bucket`` the ticket will be placed in the group's Inbox.`

{% highlight yaml %}
rule/billing:
  if:
    recipients: billing@, receipts@
  then:
    group: Billing
{% endhighlight %}

### importance
```importance``` sets the "importance" field on the ticket. It can be a value between 0 and 100. 

{% highlight yaml %}
rule/vip:
  if:
    sender_email: *@vipcustomer.example
  then:
    group: VIP
    importance: 90
rule/spam:
  if:
    spam_score: >=80%
  then:
    group: Spam
    importance: 0
{% endhighlight %}

### owner
```owner``` assigns an owner to the ticket. This is done with the @mention name of the relevant worker.

{% highlight yaml %}
rule/billing:
  if:
    recipients: billing@, receipts@
  then:
    group: Billing
    owner: karlkwota
{% endhighlight %}

### watchers
```watchers``` assigns watchers to a ticket with a comma-separated list of their @mention names. This cam be useful, for example, for assigning developers as watchers on tickets about bug reports or certain workers for tickets from a VIP customer.

{% highlight yaml %}
rule/bugs:
  if/email:
    recipients: bugs@
  if/subj:
    subject: bug report
  then:
    group: Development
    bucket: Bugs
    watchers@csv: marakusako, milodade
{% endhighlight %}

