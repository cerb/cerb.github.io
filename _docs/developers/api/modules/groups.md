---
title: Groups
permalink: /docs/api/modules/groups/
jumbotron:
  title: Groups
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/modules/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# Members

**PUT /groups/members.json**

Modify group rosters.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `json` | changes string in JSON format

### Example
{: .no_toc}

<pre>
<code class="language-php">
$changes = [
  "groups" => [
    "1" => [
      "workers" => [
        "1" => "manager",
        "2" => "remove",
        "3" => "member",
      ],
    ],
    "2" => [
      "workers" => [
        "2" => "remove",
      ],
    ],
  ],
];

$postfields = array(
    array('json', json_encode($changes)),
);
$out = $cerb->put($base_url . 'groups/123.json', $postfields);
</code>
</pre>

{% include api_toc.html %}