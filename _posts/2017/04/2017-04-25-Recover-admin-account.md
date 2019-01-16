---
layout: post
title: "Tip: Recover your administrator account"
excerpt: You can recover your administrator account by switching back to password authentication directly from the database.
author: The Cerb Team
date: 2017-04-25 13:05:00 -0700
permalink: /tips/recover-admin-account/
tags: cerb tips mailbag
---

In rare situations, it's possible to become locked out of your administrator account in Cerb. For example, if you authenticate against an LDAP server that becomes unavailable then you won't be able to log in.

In this situation, you can recover your administrator account by switching back to password authentication directly from the database.

Connect to your database from the console or a tool like phpMyAdmin.

Find your administrator's worker ID:

<pre>
<code class="language-sql">
{% raw %}
SELECT id, CONCAT_WS(' ',first_name,last_name) AS name FROM worker;
{% endraw %}
</code>
</pre>

Let's assume your ID is `123`.

Change back to password authentication for your account:

<pre>
<code class="language-sql">
{% raw %}
UPDATE worker SET is_password_disabled = 0 WHERE id = 123;
{% endraw %}
</code>
</pre>

You can also reset your password if needed (replace `s3cr3t` below with your new password):

<pre>
<code class="language-sql">
{% raw %}
UPDATE worker_auth_hash SET pass_hash = SHA1(CONCAT(pass_salt,MD5('s3cr3t'))) WHERE worker_id = 123;
{% endraw %}
</code>
</pre>

You then need to [clear the server-side cache](/tips/clear-server-cache/).

<div class="cerb-box note"><p>
	If you use Cerb Cloud, <a href="/contact/">contact us</a> to resolve this issue for you.
</p></div>