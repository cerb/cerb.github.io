---
title: Cerb Web-API Library for Python
excerpt: This page provides information about the Cerb Web-API Library for Python,
  contributed by CyberTechCafe-LLC.
summary: This page provides information about the Cerb Web-API Library for Python,
  contributed by CyberTechCafe-LLC. It includes links to the library's PyPI and GitHub
  pages, instructions for installing the library using pip, and examples of how to
  use the library to interact with the Cerb API. The usage examples demonstrate how
  to initialize the Cerb API client, retrieve a specific record, list available contexts,
  and perform a search query on records.
permalink: /docs/api/libraries/python/
toc:
  expand: API
jumbotron:
  title: Cerb Web-API Library for Python
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Libraries &raquo;
    url: /docs/api/libraries/
---

The Python library for the Cerb API was contributed by [CyberTechCafe-LLC](https://github.com/CyberTechCafe-LLC):

* <https://pypi.python.org/pypi/cerbapi>
* <https://github.com/CyberTechCafe-LLC/cerbapi>

# Installation

Install the module from `pip`:

<pre>
<code class="language-bash">
pip install cerbapi
</code>
</pre>

# Usage

<pre>
<code class="language-python">
from cerbapi import Cerb

cerb = Cerb(
        access_key='myaccesskey',
        secret='IdeallyDontStoreThisInYourCodeLikeThis',
        base='https://cerb.example/rest/'
        )

print(cerb.get_record('ticket', 1))
print(cerb.get_contexts())
print(cerb.search_records('comment', query='author.worker:Rob'))
</code>
</pre>
