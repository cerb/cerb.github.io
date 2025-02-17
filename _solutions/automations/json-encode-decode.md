---
title: JSON encode and decode
excerpt: Use `json_decode()` function and `|json_encode` filter to convert between JSON and native data types.
summary: This page demonstrates how to use JSON encoding and decoding to convert between JSON 
  strings and native data types. It shows examples of encoding arrays and dictionaries to JSON 
  using the `|json_encode` filter, as well as decoding JSON strings back into usable data 
  structures using the `json_decode()` function.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/json-encode-decode.png
---

{% comment %}
* Converts between JSON and native types
* Uses `json_decode()` function for decoding
* Uses `|json_encode` filter for encoding
* Supports pretty printing
{% endcomment %}

## Converting to JSON

Here is an example of using the [\|json_encode](/docs/scripting/json/) filter to convert native data types to JSON strings.

{% tabs json-encode-decode %}

{% tab json-encode-decode automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    data:
      name: Joe Customer
      order_id@int: 54321
      status:
        text: shipped
        tracking_id: Z1F238
  return:
    encoded: {{data|json_encode}}
    pretty: {{data|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab json-encode-decode output %}
{% highlight yaml %}
{% raw %}
__return:
  encoded: '{"name":"Joe Customer","order_id":54321,"status":{"text":"shipped","tracking_id":"Z1F238"}}'
  pretty: |-
    {
        "name": "Joe Customer",
        "order_id": 54321,
        "status": {
            "text": "shipped",
            "tracking_id": "Z1F238"
        }
    }
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

## Converting from JSON

Here is an example of using the [json_decode()](/docs/scripting/json/) function to convert JSON strings back into native data types.

{% tabs json-encode-decode2 %}

{% tab json-encode-decode2 automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    json_string@text: "{\"name\":\"Joe Customer\",\"order_id\":12345}"
    decoded_data@json: {{json_decode(json_string)}}
  
  return:
    customer: {{decoded_data.name}}
    order_num@int: {{decoded_data.order_id}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab json-encode-decode2 output %}
{% highlight yaml %}
{% raw %}
__return:
  customer: Joe Customer
  order_num: 12345
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}