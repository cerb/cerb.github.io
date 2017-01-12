---
title: Mail
permalink: /docs/mail/
jumbotron:
  title: Mail
  #tagline: ...
---

(( groups, buckets ))

(( watchers ))

(( recommendations ))

# Signatures

Email signatures[^signatures] are an important part of branding in professional correspondence -- sometimes they are even mandatory to comply with local laws. They provide additional contact information (similar to a business card), as well as links to an organization's website, social media profiles, etc.

Many organizations mandate a consistent signature style, and Cerb automatically handles this requirement by default.

Signatures are automatically personalized for each worker using **placeholders** -- special words that are replaced with field values from a target record.  The most common placeholders for worker signatures are {% raw %}`{{first_name}}`, `{{last_name}}`, `{{full_name}}`, and `{{title}}`.{% endraw %}

Conventionally, signatures begin with two dashes, a space, and a new line; allowing them to be consistently detected by email software.

Your first signature template may look something like this:

{% highlight text %}
{% raw %}
-- 
{{full_name}}, {{title}}
Example, Inc. - http://example.com/
{% endraw %}
{% endhighlight %}

When workers are composing a message, their signature is represented by a `#signature` marker. This a special kind of placeholder that serves several purposes.  First, the signature marker declutters the outgoing message by not showing a worker their own signature in every message.  More importantly, it allows the signature to be moved or modified by plugins, HTML templates, and Virtual Attendants.

You may recall that sender addresses provide a default signature for outgoing messages.  That is called a _default_ signature because buckets and HTML templates can provide alternate signatures to be used instead.

Signatures are selected in this order:

1. The signature of the current HTML template (selected on a per-message basis).
1. The signature of the current bucket.
1. The signature of the current bucket's sender address.
1. The signature of the current group inbox.
1. The signature of the current group inbox's sender address.
1. The signature of the default sender address. 

We refer to this as _cascading signatures_.  You don't need to set a signature in all of those places.  If a given signature above is blank (e.g. an HTML template isn't being used, and the current bucket doesn't define a signature) then the next non-blank signature is used as a default.  This process repeats all the way until the signature of the default sender address is used.  If that is blank then no signature is added.

This may seem like a complicated process, but it happens automatically, uniformly, and saves workers from the hassle of having to pick the appropriate signature from a list for every outgoing message.  When conversations move between groups and buckets (e.g. changing brands), the signature automatically changes in response.  When an HTML template is used, the signature of the current message can be moved into the appropriate part of the layout, modified, or ignored entirely. Workers don't have to waste any time thinking about it.

The simplest way to set up a global signature is to add it to your default sender address, and then leave the signature option blank everywhere else.

To set up a different signature per brand, you can set the signature on each group's inbox, and that signature will be used for all the buckets within the group from a single place.

# References

[^signatures]: <https://en.wikipedia.org/wiki/Signature_block>
