---
title: Break a while loop with a condition
excerpt: You can break an infinite while loop with conditional logic
summary: 
layout: integration
jumbotron:
  title: Breaking a while loop with a condition
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
[while:](https://cerb.ai/docs/automations/commands/while/) will continuously loop a command while certain criteria remains. This is an infinite loop that will break with 25% probability `(random(n)` is a random number from 0 to n inclusive). The while: loop repeats until `isLooping` is `false`.

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

Loops like this can be used around an `await:` to repeat an interaction until stopped.