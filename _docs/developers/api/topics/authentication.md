---
title: Authentication
permalink: /docs/api/topics/authentication/
jumbotron:
  title: Authentication
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

API requests are authenticated using credentials comprised of an access key and a secret key.

You can think of the access key as a username.  A single worker may have multiple access keys with varying permissions for each application or service that uses the API, and each of them would have their own secret key.

Similarly, the secret key is like a password.  However, unlike a traditional password, the secret key isn't directly transmitted back to the server for verification.  Instead, the secret key is combined with public details about the HTTP request (verb, path, date, query string, payload) to cryptographically _sign_ it.  Since the server also knows the secret key for each access key, it can create its own signature using the same combination of secret key and HTTP request details.  If the signatures match then the request is authenticated.

# Authenticating with the provided libraries

The process of signing a request is automatically handled by the official libraries for PHP, Perl, Python, and Node.js.

# Authenticating from custom scripts

To sign an API request manually, create an MD5[^md5] signature of the following string:

<pre>
<code class="language-text">
verb\n
http_date\n
url_path\n
url_query_string\n
payload\n
secret\n
</code>
</pre>

* **verb**

	The verb of the HTTP request: `GET`, `PUT`, `POST`, or `DELETE`.  This prevents the signature of a previous request from being reused with a different verb.

* **http_date**

	The RFC-2822 formatted `Date:` header being sent with the request.  The current date should be used, but the server will tolerate a difference of no more than 10 minutes.  This prevents the signature of a previous request from being reused at a later date (a "replay attack"[^replay-attack]).

* **url_path**

	The relative path of the request, without the scheme, host, or query string.  For example, in the URL `https://cerb.example.com/rest/tickets/123.json?expand=latest_message_content`, the path is `/rest/tickets/123.json`
    
* **url_query_string**

	The query string parameters sorted in alphabetical order.  For example, the parameters `name=Cerb`, `age=15`, and `status=active` would be sorted as `?age=15&name=Cerb&status=active`
    
* **payload**
	
	The body of a `PUT` or `POST` request, or blank otherwise.

* **secret**

	The secret key as a lowercase MD5 hash.
    
The generated signature should be sent with the request as a header in the following format:

<pre>
<code class="language-text">
Cerb-Auth: &lt;access_key&gt;:&lt;signature&gt;
</code>
</pre>

<div class="cerb-box note"><p>
	If you're having trouble authenticating and you're sure that the signature is correct, verify that the current time is accurate on both the client and server.
</p></div>

<div class="cerb-box warning"><p>
	All of these security considerations are moot if your secret key isn't stored securely.  Make sure that custom scripts aren't world-readable on the server.  You should always give API credentials the least amount of privileges required to perform the desired actions.
</p></div>

## Example

Let's look at an example signature for testing your own authentication implementation.

For this request:

<pre>
<code class="language-http">
POST /rest/tickets/search.json?show_meta=0 HTTP/1.1
Date: Wed, 08 Feb 2017 19:53:35 GMT
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Host: cerb.example
Connection: close
Content-Length: 27

expand=custom_&q=status%3Ao
</code>
</pre>

Using these credentials:

* Access key: `pjlfmn339fgh`
* Secret key: `fw4y9fjjd5tqjlsk3u9zkjjr154xbftc`

The authentication header is comprised of `<access-key>:<signature>`:

<pre>
<code class="language-http">
Cerb-Auth: pjlfmn339fgh:0cfe2f3b06552c060c8e77f7a0c875ee
</code>
</pre>

In PHP, the signature is generated as follows:

<pre>
<code class="language-php">
$secret_hash = md5('fw4y9fjjd5tqjlsk3u9zkjjr154xbftc');

$string_to_sign = <<< EOF
POST
Wed, 08 Feb 2017 19:53:35 GMT
/rest/tickets/search.json
show_meta=0
expand=custom_&q=status%3Ao
$secret_hash

EOF;

echo md5($string_to_sign);
</code>
</pre>

This outputs:

<pre>
<code class="language-text">
0cfe2f3b06552c060c8e77f7a0c875ee
</code>
</pre>


# References

[^md5]: Wikipedia: MD5 - <http://en.wikipedia.org/wiki/MD5>

[^replay-attack]: Wikipedia: Replay Attack - <http://en.wikipedia.org/wiki/Replay_attack>

{% include api_toc.html %}