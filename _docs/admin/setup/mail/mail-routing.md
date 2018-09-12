---
title: Mail Routing
permalink: /docs/setup/mail-routing/
toc:
  title: Routing
jumbotron:
  title: Mail Routing
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup >> Mail >> Incoming Mail >> Mail Routing**.

You can configure rules to automatically route new mail to groups based on message properties.

For example, you may want to route messages addressed to `support@*` to the **Support** group, `orders@*` to **Sales**, and `receipts@*` to **Billing**. Adding an `*` after the **@** symbol makes the rule a wildcard that link multiple domains to that mailbox. 

These messages will be delivered to the **Inbox** bucket in those groups, and group managers can configure additional sorting from there.

<h3>Sticky Rules vs Managed Rules</h3>
* **Sticky rules** are checked first and can be manually ordered for precedence. Stacking sticky rules allows multiple rules to match in a row. 
* **Managed rules** sort automatically on frequency. They stop on the first rule matched.

### Adding a new mail routing rule
1. Click the add button

1. Fill in a name for your new rule

1. Check the **Message** box under the criteria match section

1. In **To/Cc** enter `support@*`

1. In actions check **Move to group** and pick `Support` in the dropdown

1. Save changes

<div class="cerb-box note">
<p>For future rules, swap <code>support@*</code> with the desired email address and select the desired group in actions.</p>
</div>
{% include setup_toc.html %}