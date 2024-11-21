---
title: 'Setup: Incoming Mail Settings'
excerpt: This page provides detailed information on configuring incoming mail settings
  in Cerb.
summary: This page provides detailed information on configuring incoming mail settings
  in Cerb. Key topics include the "Reply to All" feature, which allows all email addresses
  in the 'To:' and 'Cc:' headers to be added as participants on new tickets, and the
  option to exclude certain email addresses from being participants to prevent auto-responder
  loops. It also covers settings for handling email attachments, including enabling/disabling
  them and setting a maximum file size. Additionally, the page discusses displaying
  HTML messages using the Tidy PHP extension to correct syntax errors and clean up
  extraneous markup. Lastly, it explains the default ticket mask format used for generating
  reference masks for new tickets, emphasizing the importance of a format that allows
  for efficient lookups and meets a minimum cardinality requirement.
permalink: /docs/setup/mail/incoming/
toc:
  title: Incoming Mail
  expand: Admin Guide
jumbotron:
  title: Incoming Mail
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Mail &raquo;
    url: /docs/setup/#incoming-mail
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/mail-settings.png" class="screenshot">
</div>

## Settings

### Reply to All

When this setting is enabled, every email address in the `To:` and `Cc:` headers will also be added as a participant on new [tickets](/docs/tickets/)

By default, only the email address in the `From:` header is automatically added as a participant.  The other addresses are suggested to a worker as potential participants when replying.

### Always exclude these addresses as participants

Any email address matching one of these patterns will not be permitted as a participant on tickets.

By default, this list includes any email address beginning with `postmaster@` or `mailer-daemon@` to prevent auto-responder loops.

### Attachments

Email attachments are enabled by default.  If this option is disabled, email attachments will be ignored on incoming mail.

When attachments are enabled, a maximum file size can be configured.  This defaults to 10MB.

<div class="cerb-box note">
	<p>
		It's a good idea to send large files as links rather than attachments.
	</p>
</div>

## Displaying HTML Messages

When displaying email messages in HTML format, Cerb will use the Tidy[^php-tidy] PHP extension when available to correct common syntax errors.

As part of this process, extraneous markup is cleaned up from mail sent by Microsoft Office applications.  In rare situations this can cause issues, and you can disable the functionality here.

## Default Ticket Mask Format

Cerb will use this pattern when generating _reference masks_ for new [tickets](/docs/tickets/).

By default, the format is `LLL-NNNNN-NNN`, which provides a mask with three leading letters for quick and efficient lookups. This minimizes the amount of information required from a customer over the phone, etc.  Contrast this with masks that begin with the current year, which can have millions of matches with the same first digits.

You can define a different mask pattern here, with the caveat that it must meet a minimum cardinality of 10,000,000 possible combinations.  The default mask format has 672,605,015,625 combinations.

<div class="cerb-box geek-out">
	<p>
		The default mask format has <tt>25^3 * 9^8</tt> combinations because the letter <tt>O</tt> and the number <tt>0</tt> are excluded for their ambiguity.
	</p>
</div>


# References

[^php-tidy]: Tidy PHP Extension - <http://php.net/tidy>