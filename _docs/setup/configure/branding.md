---
title: Branding
permalink: /docs/setup/configure/branding/
excerpt: Personalize Cerb with your organization's name and logo.
toc:
  expand: Admin Guide
jumbotron:
  title: Branding
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Configure &raquo;
    url: /docs/setup/#configure
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/branding.png" class="screenshot">
</div>

# Logo

You can personalize your Cerb instance by uploading your organization's logo.

In the **Logo** section, click the edit button below the current logo and select an image file from your machine.

To reset back to the default logo, click the remove button below the current logo image.

# Settings

The **Browser Title** is the label you see on browser tabs and saved bookmarks by default.

You can configure your **Favicon URL** from your organization's website. This is the icon that people see when they add links to their bookmarks. 

For example: `http://example.com/favicon.ico`

# Custom Stylesheet

You can provide your own stylesheet to modify the overall _"look and feel"_ of Cerb's interface.

Using the `#cerb-logo` selector you can target the logo. This is useful if you want to add responsiveness or interactivity -- like using a smaller logo image on narrow screens and a higher resolution image on retina displays.

To reference a logo you previously uploaded, use:

<pre>
<code class="language-css">
#cerb-logo {
  background-image:url(logo?v=1);
}
</code>
</pre>

<div class="cerb-box note">
<p>If you refer to <tt>url(logo)</tt> manually then you should increment a version counter to prevent browsers from serving a stale cached image. If you let Cerb manage the logo it will do this for you automatically.</p>
</div>

You can also use an external logo URL like:

<pre>
<code class="language-css">
#cerb-logo {
  background-image:url(https://example.com/logo.png);
}
</code>
</pre>
