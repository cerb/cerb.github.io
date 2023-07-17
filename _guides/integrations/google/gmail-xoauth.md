---
title: Authenticate a Gmail mailbox using IMAP and XOAUTH2 
excerpt: A step-by-step guide for using XOAUTH2 to authenticate against Gmail IMAP accounts
social_image_url: /assets/images/guides/google/cerb-and-google.png
layout: integration
topic: Integrations
subtopic: Google
jumbotron:
  title: Authenticate a Gmail mailbox using IMAP and XOAUTH2
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: Google &raquo;
    url: /resources/guides/#google
---

* TOC
{:toc}

# Introduction

Google has retired passwords when connecting to Gmail using POP3 and IMAP (but not SMTP).

To authenticate you need to use [OAuth2 access tokens](https://developers.google.com/gmail/imap/imap-smtp) instead.

Cerb supports XOAUTH2 authentication for IMAP mailboxes since version [9.6](/releases/9.6/).

This guide explains how to configure the new feature.

# Configure Google APIs

If you haven't already configured a Gmail connected account in Cerb, [follow these instructions](/guides/integrations/google/gmail/).

Once your connected account is created you can continue to configuring the mailbox.

# Configure your mailbox in Cerb

In Cerb, navigate to **Search >> Email Mailboxes**.

Create or edit a mailbox with the following details:

|-|-
| Name: | Gmail
| Protocol: | IMAP (TLS/SSL)
| Host: | imap.gmail.com
| User: | (your Gmail address)
| Password: | (blank)
| XOAuth2: | (your Gmail connected account from above)
| Port: | 993

Click the **Test** button at the bottom of the popup.

If connected successfully, click the **Save Changes** button.

### Test your mailbox

You can verify your mailbox is working properly by running the scheduler manually.

Navigate to **Setup >> Configure >> Scheduler**.

In the section for **Mailbox Checker and Email Downloader**, click the **run now** link.

This will show you a detailed log of your mailbox connection. You should see 'Connected to mailbox' and 'Closed mailbox' without any authentication errors.

If any new messages were downloaded, Cerb will automatically process them. You can manually process new messages by clicking the **run now** link in the **Inbound Email Message Processor** section.

You do not need to manually run the scheduler in the future.