---
title: 'Setup: Mailboxes'
excerpt: This page provides instructions for configuring mailboxes in Cerb, emphasizing
  the efficiency of using a single "dropbox" mailbox to consolidate emails from multiple
  addresses.
summary: This page provides instructions for configuring mailboxes in Cerb, emphasizing
  the efficiency of using a single "dropbox" mailbox to consolidate emails from multiple
  addresses. It explains how to redirect emails from various addresses to a central
  mailbox, allowing for streamlined mail routing and filtering. For Cerb Cloud users,
  it suggests redirecting incoming mail to a specific Cerb email address for instant
  delivery, eliminating the need for additional mailbox setup. The page also details
  the process of adding a new mailbox, including fields like host, protocol, and
  credentials, and offers guidance on testing mailbox connections.  It covers authenticating
  with OAuth2 instead of a password -- required by Google for Gmail and by Microsoft for
  Microsoft 365 -- as a connected service, a connected account, and the mailbox's XOAuth2
  field, with the Microsoft Entra ID library package added in 12.0.
permalink: /docs/setup/mail/mailboxes/
toc:
  expand: Admin Guide
jumbotron:
  title: Mailboxes
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Mail &raquo;
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

The editor has ten fields, in this order:

- **Enabled**
	
	If this toggle is on then new mail will be downloaded from this mailbox.  Otherwise, this mailbox will not be checked until it is re-enabled.
	
- **Name**
	
	A friendly name to use for this mailbox when it is displayed in the interface.
	
- **Protocol**
	
	The protocol to use when connecting to this mailbox.  Choose **POP3**[^pop3] or **IMAP**, each offered as **STARTTLS**, **TLS/SSL**, or **Unencrypted** -- the option labels carry the encryption state, so the selected value reads like `IMAP (Unencrypted)`.  Use an encrypted option unless you have a good reason to do otherwise.
	
	<div class="cerb-box warning">
		<p>If you aren't using an encrypted protocol then your password will be sent in cleartext.  This might be a security issue depending on the network between your web server and mail server.  Encrypt whenever possible.</p>
	</div>
	
- **Port**
	
	The network port[^port] to connect to on the mail server.  If this field is left blank then the standard ports will be used by default.  If your mail server uses a non-standard port then you will need to enter that number here.
	
- **Host**
	
	The mail server to connect to, e.g. `imap.gmail.com` or `outlook.office365.com`.
	
- **User**
	
	The username used to authenticate access to this mailbox.  Depending on your mail server, this may be a simple username (e.g. `support`) or an email address (e.g. `support@example.com`).  If you aren't sure, ask your system administrator.
	
- **Password**
	
	The password used to authenticate access to this mailbox.  Leave it blank when authenticating with **XOAuth2**.
	
- **XOAuth2** *(optional)*
	
	A chooser for the [connected account](/docs/records/types/connected_account/) to authenticate with, instead of a password -- you pick an existing account rather than pasting a token.  Leave it empty for password authentication.  See [below](#authenticating-with-oauth2).
	
- **Timeout**
	
	The socket timeout, in seconds, when downloading mail.
	
- **Max Message Size**
	
	The largest message to download, in kilobytes.  `0` disables the limit.

Below the fields are three buttons -- **Save Changes**, **Test**, and **Delete**.  Deleting a mailbox will **not** affect any previously downloaded mail.

<div class="cerb-box warning">
	<p>Messages in a mailbox are deleted once downloaded (unless the mail server prevents it, as Google Workspace does). If that isn't desirable, create a disposable mailbox to use instead and have copies of your incoming mail sent to it.</p>
</div>

## Authenticating with OAuth2

Major providers have retired passwords for mail access.  Google no longer accepts one for Gmail over POP3 or IMAP, and Microsoft has been retiring them for Microsoft 365.  Both use **XOAUTH2** instead, which authenticates with a rotating, time-limited access token rather than a stored password.

Cerb has supported XOAUTH2 for IMAP mailboxes since [9.6](/releases/9.6/) and for POP3 mailboxes since [11.1.1](/releases/11.1.1/).

Setting one up is three records, in this order:

1. A [connected service](/docs/records/types/connected_service/) holding the provider's OAuth2 endpoints and your application's credentials.
2. A [connected account](/docs/records/types/connected_account/) that authenticates against that service.  This is the record that holds the tokens, and it is shared -- one account can serve a mailbox, an automation, and a [transport](/docs/setup/mail/transports/).
3. The mailbox itself, with that connected account chosen in its **XOAuth2** field and its **Password** left blank.

Then use **Test** to confirm the token works before saving.

<div class="cerb-box note">
	<p>
		Add the connected service from the <b>library</b> rather than building it by hand.  A library
		package fills in the authorize and token URLs and prefills the scopes, including the
		<code>offline_access</code> scope that lets Cerb refresh an expiring token on its own.  Cerb
		12.0 added a <b>Microsoft Entra ID</b> package covering SMTP, POP3, and IMAP for Microsoft
		365; you supply the client ID, client secret, and directory ID from your app registration.
	</p>
</div>

For worked examples end to end, see [Authenticate a Gmail mailbox using IMAP or POP3 with XOAUTH2](/guides/integrations/google/gmail-xoauth/) and [Authenticate an Office365 mailbox using XOAUTH2](/guides/integrations/azure/o365-xoauth/).  For Gmail, [Gmail](/solutions/integrations/gmail/) covers creating the connected account those steps start from.

<div class="cerb-box warning">
	<p>
		<b>The library's Google service ships without a mail scope.</b>  It's scoped for calendar and
		profile access, which is what it was built for.  Gmail over IMAP with XOAUTH2 also needs
		<code>https://mail.google.com/</code>, so add it to the service's scopes yourself -- nothing
		will prompt you, and the connected account will authorize successfully and then fail to read
		mail.  The <b>Microsoft Entra ID</b> package doesn't have this problem; its scopes are
		prefilled for mail.
	</p>
</div>

Microsoft 365 uses `outlook.office365.com` on port `993` for IMAP, and `smtp.office365.com` on port `587` with TLS for the matching [transport](/docs/setup/mail/transports/).  Both leave their passwords blank and select the same connected account.

## Testing a mailbox

You can verify your mailbox connection details by clicking the **Test** button.


# References

[^pop3]: Wikipedia: Post Office Protocol (POP3) - <https://en.wikipedia.org/wiki/Post_Office_Protocol>
[^port]: Wikipedia: Port (computer networking) - <https://en.wikipedia.org/wiki/Port_(computer_networking)>