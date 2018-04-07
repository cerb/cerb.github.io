---
title: Cerb Web-API Library for Python
permalink: /docs/api/libraries/python/
jumbotron:
  title: Cerb Web-API Library for Python
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
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

{% include api_toc.html %}