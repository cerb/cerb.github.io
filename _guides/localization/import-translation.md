---
title: "Import a translation language pack"
excerpt: The text within Cerb's interface can be translated into any language. This guide walks through the process of installing a new language pack.
layout: integration
topic: Localization
jumbotron:
  title: Import a translation language pack
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Localization &raquo;
    url: /resources/guides/#localization
---

* TOC
{:toc}

# Introduction

The text within Cerb's interface [can be translated](/guides/localization/create-translation/) into any language.

**Translations** are shared as `.xml` files in the TMX[^tmx] format.

Language packs use the following naming convention:

`cerb_lang_<language>_<country>.xml`

The `<language>` and `<country>` codes use ISO 639[^iso-639] and ISO 3166[^iso-3166] respectively.

For instance:

* **de_DE**: German (Germany)
* **en_US**: English (American)
* **en_GB**: English (British)
* **es_ES**: Spanish (Spain)
* **es_MX**: Spanish (Mexico)
* **it_IT**: Italian (Italy)

[Workers](/docs/workers/) and [contacts](/docs/contacts/) can each configure their own preferred language.

This guide walks through the process of installing a new language pack.

# Enable the Translation Editor plugin

First, make sure the Translation Editor plugin is enabled.

1. Navigate to **Setup >> Plugins >> Installed Plugins**.

2. Search for: `translation`

3. 
	***If the plugin is enabled:***

	You're all set!

	***If the plugin is disabled:***

	1. Click the **Configure** button.

	1. Set the **Status** to **Enabled**.

	1. Click the **Save Changes** button.

# Download a language pack

Cerb is distributed with the most popular language packs.

Right-click one of these translation links and select **Download**:

* [German (Germany)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_de_DE.xml)
* [English (British)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_en_GB.xml)
* [Spanish (Spain)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_es_ES.xml)
* [Italian (Italy)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_it_IT.xml)
* [Dutch (Netherlands)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_nl_NL.xml)
* [Portuguese (Portugal)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_pt_PT.xml)
* [Russian (Russia)](https://raw.githubusercontent.com/cerb/cerb-release/master/install/extras/translations/cerb_lang_ru_RU.xml)

<div class="cerb-box note">
<p><b>Can't find the language you're looking for?</b> We offer billing credits for <a href="/guides/localization/create-translation/">creating, maintaining, and sharing translations</a>.</p>
</div>

# Import a language pack

You can now import the language pack with the translations plugin.

1. Navigate to **Setup >> Configure >> Translation Editor**.

1. Click the **Import** button.

1. Select the XML file you downloaded above.

1. Click the **Save Changes** button.

You should see your new language added to the translation worklist.

# Configure the language

### Setting your own language preference

1. Click on your name in the top right.

1. Select **Settings** from the menu.

1. On the **Settings** tab, in the **Localization** section, select a **Language**.

### Modifying someone else's language preference

1. Select a worker or contact record from the **Search** menu.

1. Edit their record.

1. Select a **Language**.

# References

[^iso-3166]: Wikipedia: ISO 3166-1 alpha-2 - <https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2>
[^iso-639]: Wikipedia: ISO 639 - <https://en.wikipedia.org/wiki/ISO_639>
[^tmx]: Wikipedia: Translation Memory eXchange (TMX) - <https://en.wikipedia.org/wiki/Translation_Memory_eXchange>