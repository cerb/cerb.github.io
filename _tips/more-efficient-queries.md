---
title: 'More efficient OR queries'
excerpt: Ways to make search queries more efficient when using OR．
layout: integration
author: The Cerb Team
permalink: /tips/more-efficient-queries/
jumbotron:
  title: 'Ｍore efficient OR queries'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---

When making search queries with the OR operator, where and how you use it can make your query more efficient.

For example: 

```
status:o (someFilter:1 OR otherFilter:2)
```

is more efficient as:

```
(status:o someFilter:1) OR (status:o otherFilter:2)
```

That's because the common `status:o` filter being redundantly included in both operands of the OR reduces the scope. With the first query, those filters could match 1M tickets but only 100 of them are also open.