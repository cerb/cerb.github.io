---
title: "Automations: decrypt.pgp"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/decrypt.pgp/
toc:
  title: decrypt.pgp
  expand: Automations
jumbotron:
  title: decrypt.pgp
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **decrypt.pgp:** command decrypts a PGP-encrypted text block.

<pre>
<code class="language-cerb">
{% raw %}
start:
  decrypt.pgp:
    output: decrypted_message
    inputs:
      message@text:
        -----BEGIN PGP MESSAGE-----
        
        wf8AAAIMA9OZ2lumKgRyARAAhtCjoVos8hiC0RejOfMnQX34Cm83dapwGoynTrc2yaCdyUwpI5M4
        AnLI3IVxYmdxatH31dj7W5/J7k/2gmr6JMEUy5jCIycD1b+FqPxD8dVJqCpyKPlN4/ot5Ke7k6pe
        48KptLECdh18w4N/IA+NZML+a5b1VXqg3KngI/Vbp8rIZycW2Vp571iKS+3RM2gp10l61yrKPPNJ
        QFohE0XKVLs7NxGPjFL7eSOORbDX73SfIsgR4UTnv/DMrZ4OuuS63qPB/epngMEdV+lJELdyHgzb
        3m4bNyJuy1zkTvAyMBME5O89FduvIXn7BcxthayxpTnH4uc4yU9E7cye8vk4XjZRdEkf1U8nlV6a
        tCrIgE5pj6lBhfXI66DPTo9SchvXG4vm7ZxEWfaggI0Pwf4bemS09x9RD/BruI9FcIImMXjuv+r4
        cxLQAAXe1GYSnuyh4wR6UhAiEfkX1tTOQaa0bIgE+R94d2vNjNjPtrcqt6b+ZxT8IC0p+WBOLN9M
        ng+A6l71TM9LYCY3R/H2jrd0jQrajTe8AXpnUdm4TQTh6sRuPUuj7FZoNW3eUdb9WyD/AXla9QXT
        49nAkiACXOZa1gt6nnM1CYWN9Z5uxBeD9h4xvSUbIiF1pEnyBMjjS0tt1iRxgrMa8lp8xv7yohHR
        CGVkG7EicuiSMcUdIUKsvO/S/wAAAFsBJKmA9SdyrNBKMI1VAi45jOdejbPjdz0+oglDWRZNVIlv
        58kfJ6jGONz0P3bomG8KI1rm7lRmKS7c+B8BJDVlbtHDW3ejBifla4rypgj7mPkQJaoFwzImusu4
        =6tzL
        -----END PGP MESSAGE-----      
    on_success:
      return:
        decrypted_message@key: decrypted_message
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `message@text:` | A PGP-encrypted message as a text block. This will attempt to match any private key records.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of decrypting the message.

If omitted, the PGP message is decrypted during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is set to the decrypted message.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
