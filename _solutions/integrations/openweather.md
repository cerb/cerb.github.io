---
title: OpenWeather
excerpt: A step-by-step guide for integrating Cerb and OpenWeather.
summary: This page provides a step-by-step guide for integrating Cerb with OpenWeather, a weather data API service. To start, you need to obtain an OpenWeather API key by logging into your account and copying the default or creating a new one through the "My API Keys" section. Next, navigate to Cerb's Connected Services, select OpenWeather, paste the API key, and click Create to link the two systems. The guide also includes examples of how to use the integrated service, such as geocoding a location using the OpenWeather API or retrieving current weather data for a specific latitude and longitude.
layout: solution
jumbotron:
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Solutions Hub &raquo;
      url: /solutions/
    - label: Integrations &raquo;
      url: /solutions/#integrations
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to OpenWeather, a weather data API service. You'll be able to use OpenWeather's full API for any automations you wish to make.

# Get a OpenWeather API Key.

Log in to your [OpenWeather Account](https://home.openweathermap.org) or sign up if you don't already have one.

Click your username in the top right and click **My API Keys**.

Copy your default API key or create a new one with the **Create Key** section.

# Create the OpenWeather service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **OpenWeather**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Geocode a location

<https://openweathermap.org/current>

{% highlight cerb %}
{% raw %}
start:
  set:
    location: London
    limit: 2
  http.request/current:
    output: http_response
    inputs:
      method: GET
      url: http://api.openweathermap.org/geo/1.0/direct?q={{location}}&limit={{limit}}
      authentication: cerb:connected_account:openweather
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Current weather

<https://openweathermap.org/current#geocoding>

{% highlight cerb %}
{% raw %}
start:
  set:
    lat: 44.34
    long: 10.99
  http.request/geocoding:
    output: http_response
    inputs:
      method: GET
      url: https://api.openweathermap.org/data/2.5/weather?lat={{lat}}&lon={{long}}
      authentication: cerb:connected_account:openweather
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}