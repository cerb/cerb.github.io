---
title: Parser
permalink: /docs/api/endpoints/parser/
jumbotron:
  title: Parser
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Parse a new message

**POST /parser/parse.json**

Import a raw message source.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$mime = <<< EOF
From: jeff@localhost
To: support@localhost
Subject: This is a test through the Web-API.
Message-Id: <abc2@local1234>
X-Mailer: cURL+PHP5

This is some message content.
EOF;

$postfields = array(
    array('message', $mime),
);
$out = $cerb->post($base_url . 'parser/parse.json', $postfields);
</code>
</pre>

# Parse a reply

**POST /parser/parse.json**

Parsing a reply to an existing message is fairly simple. You should use the quoted `Message-Id:` header as an `In-Reply-To:` when possible, but you can also use a ticket mask in the subject as a fallback option.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$mime = <<< EOF
From: ben@localhost
To: support@localhost
Subject: [parser #TKD-88128-525] This is a test through the Web-API.
Message-Id: <abc1@local1234>
X-Mailer: cURL+PHP5

This is another reply using the subject masks.
EOF;

$postfields = array(
    array('message', $mime),
);
$out = $cerb->post($base_url . 'parser/parse.json', $postfields);
</code>
</pre>
