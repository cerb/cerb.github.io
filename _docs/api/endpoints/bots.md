---
title: Bots
excerpt: This page provides information on how to execute a specific bot behavior
  in Cerb using a custom API request.
summary: This page provides information on how to execute a specific bot behavior
  in Cerb using a custom API request. It details the process of running a bot behavior
  by sending a POST request to a specified endpoint, which returns the values from
  the behavior's dictionary upon completion. The page outlines the parameters required,
  which are the public variables defined on the behavior, and provides an example
  of how to structure the request with various data types such as strings, numbers,
  dates, booleans, and JSON-encoded arrays. The example demonstrates how to use the
  API to interact with the bot behavior, including setting custom placeholders to
  send information back to the API caller.
permalink: /docs/api/endpoints/bots/
toc:
  expand: API
jumbotron:
  title: Bots
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Run Bot Behavior

**POST /rest/bots/behavior/`<id>`/run.json**

Execute the specified bot _Custom API Request_ behavior.  The response will provide the values from the behavior's dictionary at conclusion.  A common strategy is to use the _Set custom placeholder_ action in the bot behavior in order to send information back to the API caller.

The parameters are the public variables defined on the behavior (if any).

|---
| Field | Type
|-|-
| `var_*` | mixed

**Example:**

{% highlight php %}
$postfields = array(
  	array('var_name','Jeff@WGM'),
  	array('var_picklist','Red'),
  	array('var_number',1234),
  	array('var_date',"tomorrow 5pm"),
  	array('var_bool',1),
  	array('var_worker',1),
  	array('var_tickets',json_encode(array(1024,1025,1026))),
);
$out = $cerb->post($base_url . 'bots/behavior/123/run.json', $postfields);
{% endhighlight %}
