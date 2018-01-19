---
title: Connected Accounts
permalink: /docs/connected-accounts/
jumbotron:
  title: Connected Accounts
  tagline: Securely integrate and automate third-party apps and services
---

**Connected accounts** provide authentication, secure storage, and reuse of user credentials at third-party **service providers**.  Various forms of authentication are supported: OAuth, API keys, tokens, HTTP Basic, user/password, etc.

The _owner_ of a connected account determines how it's shared.  For instance, a corporate Twitter account could be shared by an entire team, while a worker's private Salesforce account could be accessed by only them and their bots.

Plugins can implement new service providers. Cerb currently has plugins for:

- [Amazon Web Services](/guides/integrations/aws/lambda/)
- Api.ai
- Cerb
- Clickatell
- [Facebook](/guides/integrations/facebook/configure-plugin/)
- Freshbooks
- [GitHub](/guides/integrations/github/configure-plugin/)
- GitLab
- Google
- HipChat
- JIRA
- [LDAP](/guides/integrations/ldap/configure-plugin/)
- [LinkedIn](/guides/integrations/linkedin/configure-plugin/)
- Nest
- [Salesforce](/guides/integrations/salesforce/configure-plugin/)
- [Slack](/guides/integrations/slack/configure-plugin/)
- Spotify
- [Stripe](/guides/integrations/stripe/configure-plugin/)
- [Twilio](/guides/integrations/twilio/configure-plugin/)
- [Twitter](/guides/integrations/twitter/configure-plugin/)

[Bots](/docs/bots) can use connected accounts to cryptographically sign (or otherwise authenticate) arbitrary HTTP requests.  This opens up entire service provider APIs[^api] to bots, rather than only offering a few hand-picked actions.

We recommend creating a bot for each service (e.g. _Facebook Bot_) to act as a [delegate](/docs/bots/#delegation). That way the credentials and API interaction for a particular service are handled in a single place, and any number of other bots can use _'Run behavior'_ or _'Schedule behavior'_ [actions](/docs/bots/#actions) against the bot delegate to interface with those services in a secure and reusable way.

# References

[^api]: API: <https://en.wikipedia.org/wiki/Application_programming_interface>