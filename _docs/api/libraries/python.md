---
title: Cerb Web-API Library for Python
permalink: /docs/api/libraries/python/
toc:
  expand: API
jumbotron:
  title: Cerb Web-API Library for Python
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Libraries &raquo;
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
