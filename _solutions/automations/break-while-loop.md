---
title: Break a while loop with a condition
excerpt: Abort an infinite while loop with conditional logic.
summary: This page explains how to break a while loop in Cerb with conditional logic,
  using the `while` command with a probability-based condition that breaks the loop
  25% of the time. It also shows an example of how to use this to implement an infinite
  loop that can be stopped at any time.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/break-while-loop.png
redirect_from:
- /automation/cookbook/break-while-loop/
---

## Break an infinite loop

The [while:](https://cerb.ai/docs/automations/commands/while/) command continuously repeats its child commands while its criteria remains `true`.

This example is an infinite loop that will break with 25% probability (`random(n)` is a random number from `0` to `n` inclusive). The loop repeats until `isLooping` is `false`.

At the end, the `counter` value shows how many times it looped, which will be different each time it runs.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    isLooping@bool: yes
    counter@int: 0
  
  while/exampleLoop:
    if@bool: {{isLooping}}
    do:
      set:
        counter@int: {{counter + 1}}
        isLooping@bool: {{3 != random(3)}}
{% endraw %}
</code>
</pre>

Loops like this can be used around an `await:` block to repeat an interaction until aborted by the user.