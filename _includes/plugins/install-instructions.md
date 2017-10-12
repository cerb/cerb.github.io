Navigate to: **Setup >> Plugins >> Installed Plugins**

Search for: `{{include.keyword}}`

***If the plugin is enabled:***

You're all set!

***If the plugin is disabled:***

1. Click the **Configure** button.

1. Set the **Status** to **Enabled**.

1. Click the **Save Changes** button.

{% if include.library %}
***If the plugin isn't installed:***

1. Switch to the **Plugin Library** tab.

1. Search for `{{include.keyword}}`.

1. Click the **Download and install** button.

1. Click the **Download and install** button on the popup.

1. Set the **Status** to **Enabled**.

1. Click the **Save Changes** button.
{% endif %}