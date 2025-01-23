---
title: Test mail deliverability
excerpt: Send a test mail to check for proper deliverability.
permalink: /guides/mail/test-deliverability/
layout: integration
topic: Mail
keywords: relay
jumbotron:
  title: Test mail deliverability
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Mail &raquo;
    url: /resources/guides/#mail
---

We're going to send a test message from Cerb to the **mail-tester.com** service. Not only will this verify that your message was delivered properly, but it will also generate a deliverability score by testing your mail server configuration: SPF, DKIM, DMARC, reverse DNS (PTR), etc.

1. First, open a web browser to <http://mail-tester.com>.

   <div class="cerb-screenshot">
   <img src="/assets/images/guides/mail/test-deliverability/tester.png" class="screenshot">
   </div>

1. Copy the destination email address that shows up on that page.

1. Open Cerb in another browser window or tab.

1. Navigate to **Search** >> **Tickets**.

1. Click the **(+)** icon in the gray bar above the worklist.

1. Select a group and bucket to send **From:**.

1. Paste the destination email address from **@mail-tester.com** in the **To:** field.

1. In **Subject:**, type: `This is a test of outgoing mail from Cerb`

1. On the first line of the message, type: `This is an outgoing message.`

1. In **Properties**, below the message text, select **Open** for the status of the conversation.

1. Scroll down to the bottom of the popup window and click the **Send Message** button.

   <div class="cerb-screenshot">
   <img src="/assets/images/guides/mail/test-deliverability/send-mail.png" class="screenshot">
   </div>

1. Switch back to the browser at **mail-tester.com** and click the blue **Then Check Your Score** button.

1. If everything goes well, you should see something like this:

   <div class="cerb-screenshot">
   <img src="/assets/images/guides/mail/test-deliverability/result.png" class="screenshot">
   </div>

If you received a less than perfect score, scroll down to see the details.  You can make corrections, send another test message to the same email address, and then reload the results page.
