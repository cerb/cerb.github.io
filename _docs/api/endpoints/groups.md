---
title: Groups
excerpt: This page provides instructions for modifying group rosters in Cerb using
  the REST API.
summary: This page provides instructions for modifying group rosters in Cerb using
  the REST API. It details the use of the PUT method at the endpoint `/rest/groups/members.json`
  to update group memberships. The page outlines the required parameters, specifically
  a JSON-formatted string that specifies changes to group memberships, such as assigning
  roles or removing members. An example is provided to demonstrate how to structure
  the JSON data and make the API call to update group information.
permalink: /docs/api/endpoints/groups/
toc:
  expand: API
jumbotron:
  title: Groups
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Members

**PUT /rest/groups/members.json**

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
