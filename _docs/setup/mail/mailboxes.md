---
title: "Setup: Mailboxes"
permalink: /docs/setup/mail/mailboxes/
toc:
  expand: Setup
jumbotron:
  title: Mailboxes
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Mail &raquo;
    url: /docs/setup/#incoming-mail
---

This page configures the mailboxes that will be checked for new mail.

It is highly recommended that you configure a single mailbox as a "dropbox".  You can redirect mail to a single mailbox even if you have dozens of email addresses.

For example, you can redirect `sales@example.com` and `support@example.com` to `cerb@example.com`.

Your <a href="/docs/setup/mail/routing/">mail routing</a> and <a href="/docs/setup/mail/filtering/">filtering</a> rules will still be able to identify the original destination.  This is much more efficient than checking several mailboxes every few minutes.

<div class="cerb-box note">
	<p>If you're using <b>Cerb Cloud</b>, you can alternatively redirect your incoming mail to <code>support@&lt;you&gt;.cerb.email</code> for instant delivery. Replace <code>&lt;you&gt;</code> with the name of your instance. With this delivery method you won't need to set up a mailbox here.</p>
</div>

## Adding a mailbox

To add a new mailbox, click the **(+)** icon in the blue bar of the [worklist](/docs/worklists/).

A mailbox has the following fields:

- **Enabled**
	
	If this checkbox is enabled then new mail will be downloaded from this mailbox.  Otherwise, this mailbox will not be checked until it is re-enabled.
	
- **Nickname**
	
	A friendly name to use for this mailbox when it is displayed in the interface.
	
- **Protocol**
	
	The protocol to use when connecting to this mailbox.  Use **POP3-SSL**[^pop3] unless you have a good reason to do otherwise.
	
	<div class="cerb-box warning">
		<p>If you aren't using SSL then your password will be sent in cleartext.  This might be a security issue depending on the network between your web server and mail server.  Use SSL whenever possible.</p>
	</div>
	
- **Username**
	
	The username used to authenticate access to this mailbox.  Depending on your mail server, this may be a simple username (e.g. `support`) or an email address (e.g. `support@example.com`).  If you aren't sure, ask your system administrator.
	
- **Password**
	
	The password used to authenticate access to this mailbox.
	
- **Port**
	
	The network port[^port] to connect to on the mail server.  If this field is left blank then the standard ports will be used by default.  If your mail server uses a non-standard port then you will need to enter that number here.
	
- **Delete**
	
	If this checkbox is selected then the mailbox will be deleted when you save.  Deleting a mailbox will **not** affect any previously downloaded mail.

	<div class="cerb-box warning">
		<p>Cerb deletes messages from your mailbox after it downloads them (unless the mail server prevents this behavior, like Google Apps). If this is not desirable, you should send a copy of all incoming email to a separate mailbox and add that to Cerb.</p>
	</div>

## Testing a mailbox

You can verify your mailbox connection details by clicking the **Test Mailbox** button.


# References

[^pop3]: Wikipedia: Post Office Protocol (POP3) - <https://en.wikipedia.org/wiki/Post_Office_Protocol>
[^port]: Wikipedia: Port (computer networking) - <https://en.wikipedia.org/wiki/Port_(computer_networking)>