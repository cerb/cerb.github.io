---
title: Credits
excerpt: This page provides credits for the development and contributions to Cerb,
  highlighting key individuals such as Jeff Standen and Dan Hildebrandt, who have
  played significant roles in its development.
summary: This page provides credits for the development and contributions to Cerb,
  highlighting key individuals such as Jeff Standen and Dan Hildebrandt, who have
  played significant roles in its development. It outlines the platform and infrastructure
  used, including Devblocks, HTML5, PHP, MySQL, Amazon Web Services, Docker, and GitHub.
  The page also lists various libraries and tools integrated into Cerb, such as
  jQuery and the plugins bundled with it, PHPUnit, Symfony Mailer, and Twig, among others, which support functionalities
  like templating, unit testing, and secure communications. It credits Lucide, the ISC-licensed icon library the
  guided installer's icons come from and that Cerb's AI icon assistants independently echo.
  Additionally, it mentions the licenses and references related to the project.
permalink: /docs/credits/
layout: docs
jumbotron:
  title: Credits
  tagline: Cerb wouldn't exist without these building blocks and contributions
---

# Developers

- [Jeff Standen](http://www.linkedin.com/in/jeffstanden) has over 30 years of software development experience, and is the founding partner at Webgroup Media LLC. He has been Cerb's software architect and lead programmer from the first line of code in January 2002.

- [Dan Hildebrandt](http://www.linkedin.com/in/danielhildebrandt) is a partner at Webgroup Media LLC and an active Cerb developer since 2005.

# Contributors

- [Ben Halsted](http://www.linkedin.com/in/bhalsted)
- [Brenan Cavish](http://www.linkedin.com/pub/brenan-cavish/21/a89/57b)
- [Corey Cohen](https://www.linkedin.com/in/corey-cohen-33727a17/)
- [Darren Sugita](http://www.linkedin.com/pub/darren-sugita/24/234/978)
- [Jacob Cavish](https://www.linkedin.com/in/jacob-cavish-coding/)
- [Jeremy Johnstone](http://www.linkedin.com/in/jsjohnst)
- [Jerry Kanoholani](http://www.linkedin.com/pub/jerry-kanoholani/19/74/977)
- Joe Geck
- [Josh Clemens](http://www.linkedin.com/in/joshuaclemens)
- [Mike Fogg](http://www.linkedin.com/in/mikefogg)
- [Niek Beernink](http://nl.linkedin.com/in/nbeernink)
- [Robert Middleswarth](http://www.linkedin.com/in/robertmiddleswarth)
- [Ryan Bantz](https://www.linkedin.com/in/ryanbantz)
- [Scott Luther](http://www.linkedin.com/pub/scott-luther/7/3b3/98)
- [Trent Ramseyer](http://www.linkedin.com/in/trentramseyer)

# Platform

- **Devblocks** is a software development framework created by Webgroup Media that has evolved in parallel with Cerb. It provides the application framework, development platform, plugin architecture, and software development philosophy for all Cerb functionality and third-party plugins.

- [HTML5](https://en.wikipedia.org/wiki/HTML5) is a markup language used for structuring and presenting content on the World Wide Web. It is the fifth and current version of the HTML standard.

- [PHP](http://www.php.net/) is a popular programming language for web development.

- [MySQL](http://www.mysql.com/) is the world's most popular open source database.

# Infrastructure

- [Amazon Web Services](https://aws.amazon.com/)

- [Docker](https://www.docker.com)

- [GitHub](https://github.com/)

# Libraries

- [Composer](https://getcomposer.org/) is a package manager for PHP.

- [CssToInlineStyles](https://github.com/tijsverkoyen/CssToInlineStyles) is a PHP library that folds a stylesheet into inline `style` attributes, which is how HTML email survives mail clients that discard stylesheets.

- [dragonmantank/cron-expression](https://github.com/dragonmantank/cron-expression) is a PHP library for parsing Unix crontab syntax and calculating run times. It's the maintained fork of the original `mtdowling` package.

- [Guzzle](https://github.com/guzzle/guzzle/) is an extension PHP HTTP client library.

- [Horde IMAP Client](https://github.com/bytestream/horde-imap-client) is a PHP library implementing the IMAP and POP3 protocols. It's the client behind mailbox checking.

- [HTML Purifier](http://htmlpurifier.org/) is a PHP library for sanitizing untrusted HTML, including inbound mail bodies and rich text.

- [jQuery](http://jquery.com/) is a fast and concise JavaScript library that simplifies HTML document traversal, event handling, animation, and asynchronous interactions (Ajax). Cerb bundles it with these plugins:

  - [jQuery throttle / debounce](http://benalman.com/projects/jquery-throttle-debounce-plugin/) v1.1, by "Cowboy" Ben Alman, dual licensed under MIT and GPL.

  - [jQuery Hotkeys](https://github.com/tzuryby/jquery.hotkeys), copyright John Resig, dual licensed under MIT and GPL v2. Based on the plugin by Tzury Bar Yochay, from an original idea by [Binny V A](http://www.openjs.com/scripts/events/keyboard_shortcuts/).

  - [hoverIntent](http://briancherne.github.io/jquery-hoverIntent/) v1.10.2, by Brian Cherne, MIT licensed.

  - [jQuery MD5](https://github.com/blueimp/jQuery-MD5) v1.2.1, by Sebastian Tschan, MIT licensed. It builds on the JavaScript MD5 implementation by Paul Johnston, with contributions from Greg Holt, Andrew Kepert, Ydnar, and Lostinet, distributed under the BSD license.

  - [jquery-visible](https://github.com/customd/jquery-visible), which declares no author or license in its source.

- [lcobucci/clock](https://github.com/lcobucci/clock) is a PHP clock abstraction, used to validate token timestamps against a controllable source of time.

- [lcobucci/jwt](https://github.com/lcobucci/jwt) is a PHP library for issuing and verifying JSON Web Tokens, used on the OAuth2 and OpenID Connect paths.

- [League\CommonMark](https://commonmark.thephpleague.com) is a PHP library for converting lightweight Markdown[^markdown] text into HTML.

- [OpenPGP-PHP](https://github.com/singpolyma/openpgp-php) is a PHP library for PGP encryption and signature verification.

- [php-encryption](https://github.com/defuse/php-encryption) is a secure library for encrypting data in PHP.

- [php-saml](https://github.com/onelogin/php-saml) is a PHP library for single-sign on (SSO) authentication using SAML.

- [phpseclib](https://github.com/phpseclib/phpseclib) is a PHP library for secure communications.

- [PHPUnit](https://phpunit.de/) is a programmer-oriented unit testing framework for PHP.

- [PhpUserAgent](https://packagist.org/packages/donatj/phpuseragentparser) is a PHP library for parsing user-agent strings.

- [ramsey/uuid](https://github.com/ramsey/uuid) is a PHP library for generating UUIDs, used for record and agent session identifiers.

- [Rangy](https://github.com/timdown/rangy) v1.3.1-dev is a cross-browser JavaScript library for working with text ranges and selections, copyright Tim Down and MIT licensed. The [classifier](/docs/records/types/classifier/) editor uses it to highlight spans of example text.

- [sebastian/diff](https://github.com/sebastianbergmann/diff) is a PHP diffing library, behind the differences shown in record change history and the editors.

- [Smarty](http://www.smarty.net/) is a template engine for PHP. It facilitates the separation of presentation (HTML/CSS) from application logic.

- [svg-sanitize](https://packagist.org/packages/enshrined/svg-sanitize) is a PHP library for sanitizing uploaded SVG, including custom icons.

- [Symfony Mailer](https://symfony.com/doc/current/mailer.html) is a component-based library for sending email from PHP applications.

- [thephpleague/oauth2-client](https://github.com/thephpleague/oauth2-client/) is a PHP library for simplified integration with OAuth 2.0 service providers.

- [thephpleague/oauth2-server](https://oauth2.thephpleague.com/) is a PHP library for implementing standards compliant OAuth 2.0 servers.

- [Twig](http://www.twig-project.org/) is an open source template engine for the PHP programming language by Fabien Potencier. It focuses on being fast, secure, and flexible.

# Icons

- [Lucide](https://lucide.dev/) is an open source icon library, used under the ISC license. Cerb's guided installer draws its interface icons from Lucide's own geometry.

  Separately, the AI assistants that help design icons in the [Icon Builder](/docs/setup/developers/icon-builder/) tend to produce Lucide-like shapes. Nothing in Cerb tells them to -- their instructions describe the format and point at Cerb's own icons for its conventions -- so that resemblance comes from what the models learned long before they saw Cerb.

# References

[^markdown]: <http://daringfireball.net/projects/markdown/>