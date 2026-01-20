---
title: Qdrant
excerpt: A step-by-step guide for integrating Cerb and Qdrant.
summary: This page provides a step-by-step guide for integrating Cerb and Qdrant, an open-source vector database for similarity search. To begin, create a Qdrant Cloud account and cluster, then copy your API key. Next, navigate to the Cerb Connected Services section, click the "+" icon, switch to the "Build" tab, and create a custom API Key service with your Qdrant base URL and api-key header. The guide provides examples of common operations including creating collections, upserting points, and performing similarity searches.
social_image_url: /assets/images/solutions/integrations/cerb-and-qdrant.png
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

In this guide we'll walk through the process of linking Cerb to [Qdrant](https://qdrant.tech/), an open-source vector database designed for similarity search. You'll be able to use Qdrant's full API in Cerb automations to store and search vector embeddings for semantic search, recommendations, and RAG (Retrieval-Augmented Generation) applications.

Qdrant can be used as a managed cloud service or self-hosted with Docker.

# Qdrant Cloud vs Self-Hosted

## Qdrant Cloud (Recommended)

[Qdrant Cloud](https://cloud.qdrant.io/) is a fully managed service that handles scaling, backups, and security for you. This is the recommended option for most production use cases.

1. Sign up for a free account at **Qdrant Cloud**.

2. Navigate to the **Clusters** section and click **Create First Cluster**.

3. When prompted, copy your **API key** and store it securely. This key will not be shown again.

4. Note your cluster URL, which will look like: `https://xyz-example.cloud.qdrant.io`

## Self-Hosted with Docker

You can run Qdrant locally with Docker for development and testing:

{% highlight bash %}
docker run -p 6333:6333 qdrant/qdrant
{% endhighlight %}

Your local instance will be available at `http://localhost:6333` or `http://host.docker.internal:6333`.

With self-hosting, you're responsible for scaling, backups, API security, and maintenance. This is generally only recommended during development.

# Create the Qdrant service in Cerb

<div class="cerb-box note">
  This is only required if you're using Qdrant Cloud.
</div>

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Switch to the **Build** tab to create a custom service.

4. Enter a name like `Qdrant`.

5. For **Type:** selected **API Key**.

6. In **Base URL**, enter your Qdrant cluster URL (e.g. `https://xyz-example.cloud.qdrant.io`).

7. In **API Key Name**, enter `api-key`.

8. For **API Key Location**, select **HTTP Header**.

9. Click the **Save Changes** button.

10. From **Search >> Connected Accounts >> (+)** create a connected account for this service and enter your Qdrant API key.

# Examples

## Create a collection

Create a new vector collection with a specified dimension size and distance metric.

<https://api.qdrant.tech/api-reference/collections/create-collection>

{% highlight cerb %}
{% raw %}
start:
  http.request/createCollection:
    output: http_response
    inputs:
      method: PUT
      url: https://xyz-example.cloud.qdrant.io/collections/cerb_docs
      authentication: cerb:connected_account:qdrant
      headers:
        Content-Type: application/json
      body:
        vectors:
          size@int: 1536
          distance: Cosine
    on_success:
      set:
        response@json: {{http_response.body}}
{% endraw %}
{% endhighlight %}

## List collections

Retrieve information about an existing collection.

<https://api.qdrant.tech/api-reference/collections/get-collection>

{% highlight cerb %}
{% raw %}
start:
  http.request/getCollection:
    output: http_response
    inputs:
      method: GET
      url: https://xyz-example.cloud.qdrant.io/collections/cerb_docs
      authentication: cerb:connected_account:qdrant
    on_success:
      set:
        response@json: {{http_response.body}}
{% endraw %}
{% endhighlight %}

## Upsert points

Add or update vectors (points) in a collection. Each point has an ID, vector, and optional payload.

<https://api.qdrant.tech/api-reference/points/upsert-points>

{% highlight cerb %}
{% raw %}
start:
  http.request/upsertPoints:
    output: http_response
    inputs:
      method: PUT
      url: https://xyz-example.cloud.qdrant.io/collections/cerb_docs/points
      authentication: cerb:connected_account:qdrant
      headers:
        Content-Type: application/json
      body:
        points:
          0:
            id@int: 1234
            vector@json: [0.2, 0.3, 0.4]
            payload:
              title: Getting Started with Cerb
              category: documentation
    on_success:
      set:
        response@json: {{http_response.body}}
{% endraw %}
{% endhighlight %}

## Search for similar vectors

Perform a similarity search to find the nearest vectors to a query vector.

<https://api.qdrant.tech/api-reference/points/search-points>

{% highlight cerb %}
{% raw %}
start:
  http.request/search:
    output: http_response
    inputs:
      method: POST
      url: https://xyz-example.cloud.qdrant.io/collections/cerb_docs/points/search
      authentication: cerb:connected_account:qdrant
      headers:
        Content-Type: application/json
      body:
        vector@json: [0.3, 0.5, 0.2, ...]
        limit@int: 10
        with_payload@bool: true
    on_success:
      set:
        response@json: {{http_response.body}}
{% endraw %}
{% endhighlight %}

## Delete a collection

Remove a collection and all its data.

<https://api.qdrant.tech/api-reference/collections/delete-collection>

{% highlight cerb %}
{% raw %}
start:
  http.request/deleteCollection:
    output: http_response
    inputs:
      method: DELETE
      url: https://xyz-example.cloud.qdrant.io/collections/cerb_docs
      authentication: cerb:connected_account:qdrant
    on_success:
      set:
        response@json: {{http_response.body}}
{% endraw %}
{% endhighlight %}
