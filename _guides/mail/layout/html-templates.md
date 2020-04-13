---
title: "Send email on company letterhead"
excerpt: In this example we'll create a letterhead mail template and demonstrate how to use it when sending mail from the browser or using bots.
permalink: /guides/mail/html-templates/
layout: integration
topic: Mail
subtopic: Layout
jumbotron:
  title: Send email on company letterhead
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Mail &raquo;
    url: /resources/guides/#mail
  -
    label: Layout &raquo;
    url: /resources/guides/#mail-layout
---

* TOC
{:toc}

# Introduction

You can use mail templates in Cerb to send messages with images and fancy layouts. This is typically used for corporate branding.

In this example we'll create a letterhead mail template and demonstrate how to use it when sending mail from the browser or using bots.

# Creating the layout

You'll need to be an admin to create a new email template.

Click **Setup** >> **Mail** >> **HTML Templates**.

Click the **(+)** icon above the worklist to add a new HTML template.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

In the **Name:** field, add some descriptive text like _"Company Letterhead"_.

In the next large text box, paste the following template:

<pre style="max-height:29.5em;">
<code class="language-html">
{% raw %}
&lt;div id="body"&gt;
  &lt;img id="logo" src="https://cerb.ai/assets/cerb_logo.png"&gt;
  &lt;div id="content"&gt;
    {{message_body}}
  &lt;/div&gt;
  &lt;div id="footer"&gt;
    Sent from &lt;a href="https://cerb.ai/"&gt;Cerb&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;style type="text/css"&gt;
body {
  margin: 0;
  padding: 0;
}

#body {
  margin: 0px;
  font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', sans-serif;
  font-size: 10pt;
  background-color: #dddddd;
}

#content {
  margin: 0px 20px 20px 20px;
  padding: 20px;
  background-color: white;
  border-radius: 10px;
}

#logo {
  margin: 10px 0px 10px 20px;
}

#footer {
  color: rgb(150,150,150);
  font-weight: normal;
  text-align: center;
  padding-bottom: 20px;
}

#footer a {
  font-weight: bold;
  color: rgb(150,150,150);
}

a { 
  color: black;
}

blockquote {
  color: rgb(0, 128, 255);
  font-style: italic;
  margin-left: 0px;
  border-left: 1px solid rgb(0, 128, 255);
  padding-left: 5px;
}

blockquote a {
  color: rgb(0, 128, 255);
}
&lt;/style&gt;
{% endraw %}
</code>
</pre>

In the **Signature** section, you can add HTML formatting to signatures. For example:

<pre>
<code class="language-twig">
{% raw %}
-- 
{% if first_name %}{{first_name}}{% else %}the **support** team{% endif %} @ [cerb.ai](https://cerb.ai/)
{% endraw %}
</code>
</pre>

You can preview the HTML template by clicking on the last icon in the editor toolbar.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/html-templates/editor-preview.png" class="screenshot">
</div>

This example uses Cerb's branding, but you can easily modify the template to use your own logo, footer, and style preferences.

You'll notice that styles are defined in this template using a CSS[^css] stylesheet in the `<style>` element. This is a convenience for you when editing the template. When mail is sent using the template, Cerb converts the stylesheet into inline `style="..."` attributes for the widest compatibility with email readers.

Click the **Save Changes** button.

# Using the mail template

When composing or replying to a message, you can toggle between plaintext and HTML with the first icon in the editor toolbar.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/html-templates/mail-html-mode-toggle.png" class="screenshot">
</div>

In HTML mode, you'll see some new formatting options.  On the far right of the toolbar is a list of your mail templates.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/html-templates/mail-html-mode.png" class="screenshot">
</div>

Your client will see:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/html-templates/html-message.png" class="screenshot">
</div>

# Using the mail template from bots

When using the [Send email action on a bot behavior](/guides/bots/send-automatic-replies/), you can enable HTML mode from the first icon on the editor toolbar.  In this mode, you'll see a new **HTML Template:** option for selecting the template. You can then preview the message with the last icon.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/html-templates/bot-action-html-message.png" class="screenshot">
</div>

# References

[^css]: Wikipedia: Cascading Style Sheets - <https://en.wikipedia.org/wiki/Cascading_Style_Sheets>
