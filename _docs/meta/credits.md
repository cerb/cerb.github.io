---
title: Credits
permalink: /docs/credits/
layout: docs
jumbotron:
  title: Credits
  tagline: Cerb wouldn't exist without these building blocks and contributions.
---

# Platform

- **Devblocks** is a software development framework created by Webgroup Media that has evolved in parallel with Cerb. It provides the application framework, development platform, plugin architecture, and software development philosophy for all Cerb functionality and third-party plugins.

- [HTML5](https://en.wikipedia.org/wiki/HTML5) is a markup language used for structuring and presenting content on the World Wide Web. It is the fifth and current version of the HTML standard.
	- Cerb's interface is rendered via HTML5 markup.

- [PHP](http://www.php.net/) is a widely-used programming language for web development.
	- We use PHP for the majority of the application logic in Cerb and Devblocks.

- [MySQL](http://www.mysql.com/) is the world's most popular open source database.
	- We use MySQL to store and query all relational data.

# Infrastructure

- Amazon Web Services
- GitHub

# Libraries

- [jQuery](http://jquery.com/) is a fast and concise JavaScript library that simplifies HTML document traversal, event handling, animation, and asynchronous interactions (Ajax).
	- We use jQuery for all of the client-side functionality in Cerb.

- [jQuery UI](http://jqueryui.com/) is a curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library.
	- We use jQuery UI for the majority of the interface components: tabs, dialogs, autocomplete, drag and drop sorting, effects, etc.

- [Smarty](http://www.smarty.net/) is a template engine for PHP, facilitating the separation of presentation (HTML/CSS) from application logic.
	- We use Smarty to render the majority of the interface HTML and Javascript.

- [Swift Mailer](http://swiftmailer.org/) is a component-based library for sending email from PHP applications.
	- We use Swift Mailer to compose MIME messages and send all outgoing mail.

- [Twig](http://www.twig-project.org/) is an open source template engine for the PHP programming language by Fabien Potencier. It focuses on being fast, secure, and flexible.
	- We use Twig for placeholder and scripting functionality in snippets and Virtual Attendant behaviors.

- [Parsedown](http://michelf.com/projects/php-markdown/) is a PHP library for converting lightweight Markdown[^markdown] text into HTML.
	-  We use Markdown for formatting in HTML messages and knowledgebase articles.

- [Amazon S3 PHP Class](http://undesigned.org.za/2007/10/22/amazon-s3-php-class) is a PHP library by Donovan Schönknecht for working with Amazon's S3[^s3] web service.
	- We use the Amazon S3 PHP Class to provide the option to use Amazon's S3 service as long-term storage for infrequently accessed but heavy content (e.g. message content and attachments).

- [jqPlot](http://www.jqplot.com/) is a plotting and charting plugin for the jQuery Javascript framework. jqPlot produces beautiful line, bar and pie charts with many features.
	- We use jqPlot to draw charts in the legacy reporting plugin.

- [qTip](http://craigsworks.com/projects/qtip/) is a tooltip plugin for the jQuery framework.
	- We use qTip to show tooltips on several legacy reports.

- [php-encryption](https://github.com/defuse/php-encryption) is a secure library for encrypting data in PHP.
	- We use php-encryption to secure connected account credentials, settings, etc.
	
- PHPUnit
- Selenium

# Licenses

- [GLYPHICONS](http://glyphicons.com) is a library of precisely prepared monochromatic icons and symbols, created with an emphasis to simplicity and easy orientation.
	-  We licensed most of the interface icons from GLYPHICONS.

# Developers

- [Jeff Standen](http://www.linkedin.com/in/jeffstanden) is the founding partner at Webgroup Media LLC. He has been Cerb's software architect and lead programmer from the first line of code in January 2002[^bdfl]. He brings more than 23 years of software development experience to the project.

- [Dan Hildebrandt](http://www.linkedin.com/in/danielhildebrandt) is a partner at Webgroup Media LLC and an active Cerb developer since 2005.

# Contributors

- [Ben Halsted](http://www.linkedin.com/in/bhalsted)
- [Brenan Cavish](http://www.linkedin.com/pub/brenan-cavish/21/a89/57b)
- [Darren Sugita](http://www.linkedin.com/pub/darren-sugita/24/234/978)
- [Jeremy Johnstone](http://www.linkedin.com/in/jsjohnst)
- [Jerry Kanoholani](http://www.linkedin.com/pub/jerry-kanoholani/19/74/977)
- Joe Geck
- [Mike Fogg](http://www.linkedin.com/in/mikefogg)
- [Niek Beernink](http://nl.linkedin.com/in/nbeernink) provided the Dutch translation and continues to provide an immeasurable amount of constructive feedback.
- [Robert Middleswarth](http://www.linkedin.com/in/robertmiddleswarth) has provided an incredible amount of support to the Cerb community for more than a decade.
- [Scott Luther](http://www.linkedin.com/pub/scott-luther/7/3b3/98)
- [Trent Ramseyer](http://www.linkedin.com/in/trentramseyer)

# References

[^bdfl]: <https://en.wikipedia.org/wiki/Benevolent_dictator_for_life>
[^s3]: <http://aws.amazon.com/s3/>
[^markdown]: <http://daringfireball.net/projects/markdown/>