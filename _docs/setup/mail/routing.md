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


# Routing KATA

Automations are available for complex workflows but are no longer required. 

Multiple conditions in a single `if:` node are "all of these", and multiple `if:` nodes are "any of these". 

Conditions include: `script`, `recipients`, `sender_email`, `spam_score`, `subject`, `body`, and `header`.

Actions include: `bucket`, `comment`, `group`, `importance`, `owner`, and `watchers`.

  ```yaml
  rule/dev:
    if/to:
      recipients: dev@, development@, bugs@
    if/subj:
      subject: [Bugs] *
    then:
      group: Development
  
  rule/sales:
    if:
      recipients: sales@
    then:
      group: Sales
  
  rule/billing:
    if:
      recipients: billing@, receipts@
    then:
      group: Billing
  
  rule/corp:
    if:
      recipients: corporate@, jobs@cerb.example, partners@cerb.example, corp@
    then:
      group: Corporate
  
  rule/support:
    if:
      recipients: support@, team@, help@
    then:
      group: Support
  ```
