---
title: Groups
permalink: /docs/api/endpoints/groups/
jumbotron:
  title: Groups
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

# Members

**PUT /groups/members.json**

Modify group rosters.

### Parameters

|---
| Field | Type | 
|-|-|-
| `json` | changes string in JSON format

### Example

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
