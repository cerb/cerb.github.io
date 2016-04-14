{% for recipe in include.recipes %}
{% assign recipe_url = "/integrations/" | append: include.app | append: "/" | append: recipe %}
{% assign p = site.pages | where:"url",recipe_url | first %}

{% if p %}
# [{{ p.title }}]({{ p.url }})

{{ p.excerpt }} ([read more]({{ p.url }}))
{% endif %}

{% endfor %}
