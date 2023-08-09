---
title: Connected Accounts
permalink: /docs/connected-accounts/
jumbotron:
  title: Connected Accounts
  tagline: Securely integrate and automate third-party apps and services
---

[Automations](/docs/automations/) can use **connected accounts** to cryptographically sign (or otherwise authenticate) arbitrary HTTP requests for a specific [service provider](/docs/connected-services/).

This opens up entire third-party APIs to bots, rather than only offering a few hand-picked actions.

The _owner_ of a connected account determines how it's shared. For instance, a corporate Twitter account could be shared by an entire team, while a worker's private Salesforce account could be accessed by only them and their bots.

We have [integration examples](/resources/guides/#integrations) for many popular services:

- [Amazon Web Services](/guides/integrations/aws/)
- [Dropbox](/guides/integrations/dropbox/)
- [Facebook](/guides/integrations/facebook/)
- [GitHub](/guides/integrations/github/)
- [LinkedIn](/guides/integrations/linkedin/)
- [Salesforce](/guides/integrations/salesforce/)
- [Slack](/guides/integrations/slack/)
- [Stripe](/guides/integrations/stripe/)
- [Twilio](/guides/integrations/twilio/)
- [Twitter](/guides/integrations/twitter/)

We recommend creating an automation function for each service (e.g. _Facebook Bot_) to act as a delegate. That way the credentials and API interaction for a particular service are handled in a single place, and any number of other automations can use [automation.function:](/docs/automations/commands/automation.function/) to interface with those services in a secure and reusable way.
