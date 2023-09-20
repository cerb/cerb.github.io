---
title: Integrate with ipstack
excerpt: A step-by-step guide for integrating Cerb and ipstack.
permalink: /guides/integrations/ipstack/
social_image_url: /assets/images/guides/integrations/ipstack/interaction-geolocate.png
layout: integration
topic: Integrations
subtopic: Ipstack
jumbotron:
  title: Cerb + ipstack
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: ipstack &raquo;
    url: /resources/guides/#ipstack
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to ipstack. You'll be able to use [ipstack's API](https://ipstack.com/documentation) from automations to perform geolocation.

Let's assume we have a list of client IP addresses and want to plot them on a map to visualize where activity is coming from.

First, it's important to acknowledge that locations derived from IP addresses are approximate. Clients may be using VPNs, proxies, third party services, etc. The location may be an ISP, or the contact information for the registered owner of a block of IP addresses.

<div class="cerb-screenshot">
<img src="/assets/images/guides/integrations/ipstack/interaction-geolocate.png" class="screenshot">
</div>

# Sign up at ipstack

Like [geocoding](https://github.com/cerb/cerb-release/discussions/9), IP-based geolocation uses a large dataset. It wouldn't make sense to ship this with Cerb, so we'll be using an API from [ipstack](https://ipstack.com/).

You can sign up for a [free API key](https://ipstack.com/product/) at ipstack and make 1,000 IP location requests per month at no cost.

Once you sign up, make a note of your API Access Key so you can use it within Cerb.

# Import the ipstack package in Cerb

Navigate to **Setup -> Packages -> Import** and paste the following package:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "ipstack",
    "requires": {
      "cerb_version": "10.0.0"
    },
    "configure": {
      "placeholders": [],
      "prompts": [
        {
          "type": "text",
          "label": "API Key",
          "key": "prompt_api_key",
          "params": {
            "default": "",
            "placeholder": "(paste your ipstack API Key)"
          }
        }
      ]
    }
  },
  "records": [
    {
      "uid": "service_ipstack",
      "_context": "connected_service",
      "name": "ipstack",
      "extension_id": "cerb.service.provider.api_key",
      "params": {
        "api_base_url": "https://api.ipstack.com/",
        "api_key_name": "access_key",
        "api_key_location": "url"
      }
    },
    {
      "uid": "account_ipstack",
      "_context": "connected_account",
      "name": "ipstack",
      "service_id": "{{{uid.service_ipstack}}}",
      "uri": "ipstack",
      "owner__context": "app",
      "owner_id": 0,
      "params": {
        "api_key": "{{{prompt_api_key}}}"
      }
    },
    {
      "uid": "automation_ipstack_lookup",
      "_context": "automation",
      "name": "wgm.services.ipstack.location",
      "extension_id": "cerb.trigger.automation.function",
      "description": "Return location data for a given IP address",
      "script": "inputs:\n  text/ip:\n    type: ip\n    required@bool: yes\n\nstart:\n  storage.get:\n    inputs:\n      key: wgm.services.ipstack.location::ip:{{inputs.ip}}\n    output: ip_data\n    on_error:\n      http.request@ref: httpRequest\n  return:\n    data@key: ip_data\n\n&httpRequest:\n  output: http_response\n  inputs:\n    url: http://api.ipstack.com/{{inputs.ip|url_encode}}\n    authentication: cerb:connected_account:ipstack\n  on_success:\n    set:\n      response_json@json: {{http_response.body}}\n    decision:\n      outcome/error:\n        if@bool: {{not response_json.ip ? 'yes'}}\n        then:\n          error: Failed to retrieve the IP.\n      \n      outcome/success:\n        then:\n          set:\n            ip_data@key: response_json\n          storage.set:\n            inputs:\n              key: wgm.services.ipstack.location::ip:{{inputs.ip}}\n              value@key: ip_data\n              expires: 3 days\n  on_error:\n    error:\n      message@key: http_response:error\n",
      "policy_kata": "commands:\n  storage.get:\n    deny/key@bool: {{inputs.key is not prefixed ('wgm.services.ipstack.location::')}}\n    allow@bool: yes\n  storage.set:\n    deny/key@bool: {{inputs.key is not prefixed ('wgm.services.ipstack.location::')}}\n    allow@bool: yes\n  http.request:\n    deny/url@bool: {{inputs.url is not prefixed ('http://api.ipstack.com/')}}\n    deny/account@bool: {{inputs.authentication not in ['cerb:connected_account:ipstack']}}\n    allow@bool: yes"
    },
    {
      "uid": "automation_ipstack_interaction",
      "_context": "automation",
      "name": "wgm.interaction.ipstack.location",
      "extension_id": "cerb.trigger.interaction.worker",
      "description": "Interaction to convert an IP address to geo coordinates",
      "script": "script": "inputs:\r\n  text/ip:\r\n    type: ip\r\n\r\nstart:\r\n  decision/hasInput:\r\n    outcome/input:\r\n      if@bool: {{inputs.ip is empty}}\r\n      then:\r\n        await:\r\n          form:\r\n            title: IP Lookup\r\n            elements:\r\n              text/prompt_ip:\r\n                label: What IP would you like to locate?\r\n                required@bool: yes\r\n                type: ip\r\n                placeholder: (e.g. 1.2.3.4)\r\n    outcome:\r\n      then:\r\n        set:\r\n          prompt_ip@key: inputs:ip\r\n\r\n  function/lookup:\r\n    uri: cerb:automation:wgm.services.ipstack.location\r\n    output: results\r\n    inputs:\r\n      ip@key: prompt_ip\r\n    on_success:\r\n      set:\r\n        ip_data@key: results:data\r\n  \r\n  await/results:\r\n    form:\r\n      title: Coordinates\r\n      elements:\r\n        say:\r\n          content@text:\r\n            #### Location of {{ip_data.ip}}\r\n        sheet/ip_data:\r\n          data@json: [{{ip_data|json_encode}}]\r\n          schema:\r\n            layout:\r\n              style: fieldsets\r\n              paging@bool: no\r\n            columns:\r\n              text/city:\r\n                label: City\r\n              text/region_name:\r\n                label: State/Region\r\n              text/country_name:\r\n                label: Country\r\n              text/coordinates:\r\n                label: Coordinates\r\n                params:\r\n                  value_template@raw:\r\n                    {{latitude}}, {{longitude}}\r\n        map:\r\n          resource:\r\n            uri: cerb:resource:map.world.countries\r\n          projection:\r\n            type: mercator\r\n            scale: 90\r\n            center:\r\n              latitude: {{ip_data.latitude}}\r\n              longitude: {{ip_data.longitude}}\r\n            zoom:\r\n              latitude: {{ip_data.latitude}}\r\n              longitude: {{ip_data.longitude}}\r\n              scale: 3.5\r\n          points:\r\n            data:\r\n              point:\r\n                latitude: {{ip_data.latitude}}\r\n                longitude: {{ip_data.longitude}}\r\n                properties@key: feature\r\n            size:\r\n              default: 5\r\n            fill:\r\n              default: #FF0000\r\n  \r\n  return:\r\n    coordinates:\r\n      label: {{ip_data.ip}}\r\n      lat: {{ip_data.latitude}}\r\n      lon: {{ip_data.longitude}}\r\n",
      "policy_kata": "commands:\n  function:\n    deny/name@bool: {{uri != 'cerb:automation:wgm.services.ipstack.location'}}\n    allow@bool: yes"
    }
  ],
  "toolbars": [
    {
      "toolbar": "global.menu",
      "kata": "interaction/ipLocation:\n  label: Location by IP\n  uri: cerb:automation:wgm.interaction.ipstack.location\n  icon: global"
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

Enter your ipstack API Access key.

Click the **Import** button again.

<div class="cerb-screenshot">
<img src="/assets/images/guides/integrations/ipstack/package-imported.png" class="screenshot">
</div>

# Test the automation

Navigate to **Search -> Automations** and filter with `ipstack`.

Open the card for **wgm.services.ipstack.location** and click the **Edit** button.

This is a reusable function that returns location data for an IP address.

In the **Run** tab at the bottom, type the following into **Input:**

<pre style="max-height:29.5em;">
<code class="language-yaml">
{% raw %}
inputs:
  ip: 1.2.3.4
{% endraw %}
</code>
</pre>

And click the run icon.

<div class="cerb-screenshot">
<img src="/assets/images/guides/integrations/ipstack/automation-run.png" class="screenshot">
</div>

In the **Output:** section you should see something like:

<pre>
<code class="language-yaml">
{% raw %}
__exit: return
__return:
  data:
    ip: 1.2.3.4
    type: ipv4
    continent_code: OC
    continent_name: Oceania
    country_code: AU
    country_name: Australia
    region_code: QLD
    region_name: Queensland
    city: Brisbane
    zip: "4000"
    latitude: -27.467581
    longitude: 153.027893
{% endraw %}
</code>
</pre>

This demonstrates that our function is using the ipstack API to return location data for any IP address we give it.

# Using the interaction

Reload the page by clicking on the logo in the top left.

Click on the floating Cerb icon in the lower right and select **Location by IP** from the menu.

<div class="cerb-screenshot">
<img src="/assets/images/guides/integrations/ipstack/global-menu.png" class="screenshot">
</div>

Enter an IP address:

<div class="cerb-screenshot">
<video autoplay="autoplay" loop="loop">
  <source src="/assets/images/guides/integrations/ipstack/cerb-interaction-ipstack.mp4" type="video/mp4">
</video>
</div>

You can click the reset icon to repeat the interaction multiple times before closing the popup.

# How it works

## Connected Service and Connected Account

The package imports a [connected service](/docs/connected-services/) for ipstack. This is an **API Key** service that securely appends an `access_key` parameter any URL starting with `https://api.ipstack.com/`. You can find this at **Search -> Connected Services**.

The package also imports a [connected account](/docs/connected-accounts/) using the above service. This has the API key you configured. You can find it at **Search -> Connected Accounts**.

## Automations

The package imports two [automations](/docs/automations/). You can find them at **Search -> Automations**.

### wgm.services.ipstack.location

The **wgm.services.ipstack.location** automation function is a reusable wrapper around the ipstack lookup API. This function can be called by any automation to fetch location data for an IP address.

The function takes an `ip` key as input and returns a `data` key with location info.

Because location data for an IP changes very infrequently, and ipstack charges per lookup, the function caches the results of an IP lookup for 3 days.

The [storage.get:](/docs/automations/commands/storage.get) command is used to check the cache for a given IP. If the cache misses, the `on_error:` event connects the ipstack API. If the cache hits, that data is returned and the automation ends.

The [http.request:](/docs/automations/commands/http.request) command connects to the ipstack API. You'll see from `http.request@ref: httpRequest` that the command is defined as a [reference](/docs/kata/#references). This makes the logic simpler to follow.

The `&httpRequest` uses the `authentication:` option to securely add the ipstack API key to the URL at runtime. The `url:` appends the `ip` input and uses the [\|url_encode](/docs/bots/scripting/filters/#url_encode) filter to encode it.

If the HTTP request is successly, `on_success:` decodes the JSON body and saves it as a `response_json` placeholder.

A `decision:` then determines if the API returned successfully (the HTTP request can succeed and the API can still return an error code). If there's an error, the automation returns in the `error:` state. Otherwise, the IP data is set in the `ip_data` placeholder. That result is then cached with the [storage.set:](/docs/automations/commands/storage.set) command.

Because `http.request@ref: httpRequest` is a reference, execution continues after that line. The interaction exits in the `return:` state with a `data` key containing the IP details. This is how results are returned to the caller.

<pre style="max-height:29.5em;">
<code class="language-cerb">
{% raw %}
inputs:
  text/ip:
    type: ip
    required@bool: yes

start:
  storage.get:
    inputs:
      key: wgm.services.ipstack.location::ip:{{inputs.ip}}
    output: ip_data
    on_error:
      http.request@ref: httpRequest
  return:
    data@key: ip_data

&httpRequest:
  output: http_response
  inputs:
    url: http://api.ipstack.com/{{inputs.ip|url_encode}}
    authentication: cerb:connected_account:ipstack
  on_success:
    set:
      response_json@json: {{http_response.body}}
    decision:
      outcome/error:
        if@bool: {{not response_json.ip ? 'yes'}}
        then:
          error: Failed to retrieve the IP.
      
      outcome/success:
        then:
          set:
            ip_data@key: response_json
          storage.set:
            inputs:
              key: wgm.services.ipstack.location::ip:{{inputs.ip}}
              value@key: ip_data
              expires: 3 days
  on_error:
    error:
      message@key: http_response:error
{% endraw %}
</code>
</pre>

The automation policy allows the `storage.get:` and `storage.set:` commands with the key prefix `wgm.services.ipstack.location::`. This ensures only keys in this namespace are permitted.

The policy also allows the `http.request:` command for URLs prefixed with `http://api.ipstack.com/` and only allows `authentication:` with the `cerb:connected_account:ipstack` record.

<pre style="max-height:29.5em;">
<code class="language-cerb">
{% raw %}
commands:
  storage.get:
    deny/key@bool: {{inputs.key is not prefixed ('wgm.services.ipstack.location::')}}
    allow@bool: yes
  storage.set:
    deny/key@bool: {{inputs.key is not prefixed ('wgm.services.ipstack.location::')}}
    allow@bool: yes
  http.request:
    deny/url@bool: {{inputs.url is not prefixed ('http://api.ipstack.com/')}}
    deny/account@bool: {{inputs.authentication != 'cerb:connected_account:ipstack'}}
    allow@bool: yes
{% endraw %}
</code>
</pre>

### wgm.interaction.ipstack.location

The **wgm.interaction.ipstack.location** [interaction](/docs/interactions/) automation prompts a worker for an IP address, runs the `wgm.services.ipstack.location` function above, and displays the resulting location as a sheet and a map.

<pre style="max-height:29.5em;">
<code class="language-cerb">
{% raw %}
start:
  await/ip:
    form:
      title: IP Lookup
      elements:
        text/prompt_ip:
          label: IP:
          type: ip
          required@bool: yes
          placeholder: (e.g. 1.2.3.4)
  
  function/lookup:
    uri: cerb:automation:wgm.services.ipstack.location
    output: results
    inputs:
      ip@key: prompt_ip
    on_success:
      set:
        ip_data@key: results:data
  
  await/results:
    form:
      title: Coordinates
      elements:
        say:
          content@text:
            #### Location of {{ip_data.ip}}
        sheet/ip_data:
          data@json: [{{ip_data|json_encode}}]
          schema:
            layout:
              style: fieldsets
              paging@bool: no
            columns:
              text/city:
                label: City
              text/region_name:
                label: State/Region
              text/country_name:
                label: Country
              text/coordinates:
                label: Coordinates
                params:
                  value_template@raw:
                    {{latitude}}, {{longitude}}
        map:
          resource:
            uri: cerb:resource:map.world.countries
          projection:
            type: mercator
            scale: 90
            center:
              latitude: {{ip_data.latitude}}
              longitude: {{ip_data.longitude}}
            zoom:
              latitude: {{ip_data.latitude}}
              longitude: {{ip_data.longitude}}
              scale: 3.5
          points:
            data:
              point:
                latitude: {{ip_data.latitude}}
                longitude: {{ip_data.longitude}}
                properties@key: feature
            size:
              default: 5
            fill:
              default: #FF0000
  
  return:
    coordinates:
      label: {{ip_data.ip}}
      lat: {{ip_data.latitude}}
      lon: {{ip_data.longitude}}
{% endraw %}
</code>
</pre>

The automation policy allows the [function:](/docs/automations/commands/function) command only for the `wgm.services.ipstack.location` function.

<pre style="max-height:29.5em;">
<code class="language-cerb">
{% raw %}
commands:
  function:
    deny/name@bool: {{uri != 'cerb:automation:wgm.services.ipstack.location'}}
    allow@bool: yes
{% endraw %}
</code>
</pre>

## Toolbar

The package registers the interaction on the **global.menu** [toolbar](/docs/toolbars/). You'll find this in **Search -> Toolbars**.

<pre style="max-height:29.5em;">
<code class="language-cerb">
{% raw %}
interaction/ipLocation:
  label: Location by IP
  uri: cerb:automation:wgm.interaction.ipstack.location
  icon: global
{% endraw %}
</code>
</pre>
