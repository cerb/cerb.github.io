---
title: Change the bot icon on your website
excerpt: You can change the bot icon on your website by adding a new rule to your stylesheet.
layout: integration
topic: Bots
subtopic: Conversational Bots
jumbotron:
  title: Change the bot icon on your website
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Bots &raquo;
    url: /resources/guides/#bots
---

* TOC
{:toc}

# The default bot icon

In the [Add a conversational bot to any website](/guides/bots/deploy-bot-on-website/) guide you learned how to deploy a bot to interact with your website visitors.

By default, an icon like this is added to the lower right of your website:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/change-bot-icon/bot-icon-default.png" class="screenshot">
</div>

You can change the icon by adding a new rule for `#cerb-bot-interaction-button .cerb-bot-interaction-button-icon` to your website's stylesheet.

The new `background-image` can be a URL or a `data:` URI with a base64-encoded image.

For best results, use an image with square dimensions.

# Examples

## Question mark

<pre>
<code class="language-css">
#cerb-bot-interaction-button .cerb-bot-interaction-button-icon {
	background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAA7VBMVEUsf6v///9AgqItf6pRjq7u//8wfqby///u8/Yuga4rfqowgKn7///p///l///3//////f///Kt3e///+6esq05gaY2gKVFhaCq0+ue0+v//+n//+Pk6NZ1stTI09Nsr9LY3cVWncRRmsSuwcPM08BEkrw8h7BVkq9FiK1Oi6w1gqyouatznao4gqqDoqM4gaLg//////vu8/rm8/ri8/rR8/q46PSy0+fK3eaOyubh6OWkyt3k6NHY3c+Wuc2Hsstfn8XM08TAyr9rn72Hq7pkmrpZlbiywbdKi66Qq6tChqpqlaI8gaFQiJ9djp1esXAcAAABjklEQVRo3u3X507jQBQF4HM8ib2OE0II2WXpvffee2/v/zj8AOEZZDCK5wJC9/traY6ux2fkgVJKKaV+NJMsTJdKpZnbVmggYvJojZbd85bvoNk9Zhj7C38qW3zHYAhPRviBeXjRww8dGBRXY45miKI6mKuZoJgufsI+ChnlpyyiiCpdgzOJgUku1+kqUpj/b8oXpu0s0zaMtsW0dQawDdB2jza56zRCuIZomfNTkQBvbTDV5+VtzeU8X0J7JphqmJyiBh4Oxu7sphYP2XTWEJokub443H6uY6/Jq1GAIoxZmD6bR5bICZEx6h4sMupMNQ0kVCJauiEiottFAXGVtnEImKRjJYR/x3Q9wr8epqR2vYOU3pBKRNeJQEadrlMA0nNcwb9lum7g3xBdd/AvpusfBHTR1htCQKVKSz9ETNDSZyBih6nOEDJqTD1ASGT/xkspZ117BCcJICSWq2EqFv+23JCGgZTanxer/VA/w1Tp1ZSBkPpXFKWccenREA3RkG8Iib56khaUUkqpX+gJvakW0xoJUfYAAAAASUVORK5CYII=);
}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/change-bot-icon/bot-icon-question.png" class="screenshot">
</div>
