---
title: Privacy
layout: page
jumbotron:
  title: Privacy Policy
  tagline: Our commitment to protecting your privacy and data
---

**Webgroup Media, LLC (henceforth "WGM", "our", "us", and "we")** is a commercial open source company founded in April 2001. Our developers started the **Cerb** project in January 2002 and have improved and maintained the software ever since. In connection with our business, we operate the [cerb.ai](https://cerb.ai) project website, as well as **Cerb Cloud**, a subscription-based _"software as a service"_ offering, on the cerb.me, cerb.cloud, and cerb.email domains.

It is our policy to respect your privacy regarding any information we may collect while operating our websites and services. We do not sell any personally identifiable information or data stored in Cerb Cloud to third-parties. We do not directly share your information with third-parties without explicit permission except to comply with the law or to provide necessary infrastructure in connection with the services you request; however, there is some passive risk of exposure to third-party access inherent in web-based services that is outlined in detail below. We do our best to mitigate and minimize these risks on your behalf.

## Website Visitors

Like most website operators, we collect non-personally identifying information of the sort that web browsers and servers typically make available, such as the browser type, language preference, referring site, and the date and time of each visitor request. Our purpose in collecting non-personally identifying information is to better understand how visitors use our website. From time to time, we may release non-personally identifying information in the aggregate; e.g., by publishing a report on trends in the usage of its software or websites.

We also collect "potentially personally identifying" information like Internet Protocol (IP) addresses for website visitors and workers. We only disclose IP addresses under the same circumstances that we use and disclose personally identifying information as described below.

## Gathering of Personally Identifying Information

Certain visitors to our websites choose to interact in ways that require us to gather personally identifying information. The amount and type of information that we gather depends on the nature of the interaction. For example, we ask workers who sign up for Cerb Cloud to provide an email address. Those who choose to engage in financial transactions with us (e.g. by purchasing products and services) are asked to provide additional information, including as necessary the personal and financial information required to process those transactions. In each case, we collect such information only insofar as is necessary or appropriate to fulfill the purpose of the visitor's interaction. We do not disclose personally identifying information other than as described below. Visitors can always refuse to supply personally identifying information, with the caveat that it may prevent them from purchasing licenses or engaging in certain services.

## Aggregated Statistics

We may collect statistics about the behavior of visitors to our websites or users of our Cerb Cloud service. For instance, we may gather metrics about individual Cerb instances like the number of workers, addresses, conversations, messages, and attachments; the composition of file attachments, such as distributions of sizes or file types; or the amount of activity over a given time period. This information is used to improve the usability and performance of products and services provided by us, as well as to curtail abuse.

We may display this aggregate, anonymous information publicly or provide it to others. However, we do not disclose personally identifying information other than as described below.

## Protection of Certain Personally Identifying Information

We disclose personally identifying information only to those of our employees, contractors and affiliated organizations that (i) need to know that information in order to process it on our behalf or to provide products and services available through our websites, and (ii) that have agreed not to disclose it to others. Some of those employees, contractors, and affiliated organizations may be located outside of your home country; and by using our websites and services you consent to the transfer of such information to them.

We will not rent or sell personally identifying information to anyone. Other than to our employees, contractors and affiliated organizations, as described above, we disclose personally identifying information only in response to a subpoena, court order, or other governmental request, or when we believe in good faith that disclosure is reasonably necessary to protect our property or rights, or those of third parties, or of the public at large.

If you are a registered user of Cerb and have supplied your email address, we may occasionally send you an email to tell you about new features or to solicit your feedback. We primarily use our social network profiles to communicate this type of information, and we expect to keep email broadcasts to a minimum. If you send us a request (e.g. via a support email or one of our feedback mechanisms), we reserve the right to anonymously republish it in order to help us clarify or respond to your request, or to help us support other users. We take all measures reasonably necessary to protect against the unauthorized access, use, alteration, or destruction, of potentially personally identifying information.

## Security and Safeguards

We take reasonable precautions to protect your data and personally identifying information.

We do not have physical access to any of our servers or online storage mediums.  See the section about "Third-Party Data Centers" for the upstream security policies of Amazon Web Services and Linode.  These servers are protected within state-of-the-art data centers.

We perform 24/7/365 monitoring of our network and service infrastructure.  This includes server load, process information, account access, service utilization, network activity, and logs.

Web-based communication with our servers is protected through 256-bit encryption via Secure Socket Layer (SSL) technology when URLs are prefixed with "https://". This feature is required and automatically enforced for all Cerb Cloud subscriptions.  It is the responsibility of clients and their representatives to ensure the use of SSL elsewhere.

We do not store credit card information on our servers.  For one-time transactions we do not save credit card or bank account numbers anywhere, although we do store email-based receipts that include contact information, payment type, transaction IDs, and authorization codes.

For recurring transactions, payment information is stored with vendors who adhere to the Payment Card Industry Data Security Standards (PCI DSS).  We contract with [FreshBooks](http://www.freshbooks.com>) for sending invoices and collecting payments, and they protect and encrypt financial information in accordance with regulations.

We also process credit card transactions through our merchant account at Authorize.net.

Depending on a client's preferred payment method, these transactions may alternatively take place through other vendors like PayPal, or wire transfers to Wells Fargo Bank.  We do not have access to client credit card numbers or bank account information through any of these vendors.

Our technicians securely access our servers using Secure Shell (SSH) encryption.  Logins are authenticated with [RSA keys](http://en.wikipedia.org/wiki/RSA_(algorithm)) rather than simple passwords.  Two-factor authentication is used with vendors and services that support it.  We do not provide direct client access (e.g. SSH, Telnet, FTP) to machines housing Cerb Cloud data for multiple tenants.  Instances with a need for direct access are hosted on isolated private servers.

We have disabled non-secure features in our PHP environment (e.g. process control, shell command execution, remote file includes) to protect against arbitrary code execution.  To protect against cross-site scripting (XSS), we "[escape](http://en.wikipedia.org/wiki/HTML#Character_and_entity_references>)" all user-provided data that is displayed in a web browser. Cerb also contains security mechanisms to combat cross-site request forgery (CSRF), and other common attack vectors.

## Disclosure of Security Breaches

We will notify you as soon as possible if a security breach results in the potential disclosure of any personally identifiable information or data related to your account. At the conclusion of a security investigation, we will provide you with a report about the nature of any compromised data (e.g. email addresses, worker account passwords) and the actions taken to prevent future intrusions.

## Third-Party Data Centers, Cloud Computing, and Virtualization

We remotely provision, administer, and maintain servers in various data centers throughout the world and do not maintain a physical presence in any of them. Cerb Cloud, and other related services like our project website, are provided from virtual servers in cloud computing and storage environments at Amazon Web Services, Linode, and GitHub. In virtual environments, many users from various organizations share a pool of resources like computational power and storage capacity, although provisioned resources are isolated from one another to a similar degree as leased machines in a datacenter.

Due to the remote nature of cloud computing, authorized technicians from our vendors and service providers may have temporary access to our servers in order to perform physical maintenance and upgrades, or to provide hands-on assistance with troubleshooting issues like RAID degradation and hardware failures.

In such events we defer to upstream privacy policies:

-  <https://aws.amazon.com/privacy>
-  <https://www.linode.com/privacy>
-  <https://help.github.com/articles/github-privacy-policy/>

## Backups

Cerb has two main components for storing customer data: (i) the database, and (ii) the /storage/ filesystem (which contains immutable objects like email attachments). Data is distributed among many servers in our Cerb Cloud network within Amazon Web Services.

If you communicate with us, or use Cerb Cloud services provided by us, your information will be routinely copied for the express purpose of maintaining backups for continuity and disaster recovery.

## Disposal of Data and Backups

Upon cancellation, we remove all live client data from the Cerb Cloud network and send a final backup to Amazon S3.  We will attempt to make arrangements for this backup to be transferred to the client before permanently destroying our final copy.  Without an explicit request for their immediate removal, backups may be persisted for several years.

We will comply with any written, and duly authenticated, client requests for the immediate destruction of all account data and backups.

## Testimonials

We display a list of clients and testimonials on our websites. We do not disclose the names of licensed organizations, or their representatives, without explicit permission, except in the event that a client freely discloses their identity through postings on public forums or social media networks.

## Cookies

A cookie is a string of information that a website stores on a visitor's computer, and that the visitor's browser provides to the website each time the visitor returns. We use cookies to identify and track visitors, observe their usage of our website, and store their website access preferences. Visitors who do not wish to have cookies placed on their computers should set their browsers to refuse cookies before using our websites, with the drawback that certain features of our websites may not function properly without the aid of cookies. Web-based products like Cerb require cookies to be enabled, although their use is limited to maintaining a logged-in session within the software.

## Business Transfers

If WGM or substantially all of its assets were acquired, or in the event that we go out of business or enter bankruptcy, user information would be one of the assets that is transferred or acquired by a third party. You acknowledge that such transfers may occur, and that any acquirer of WGM may continue to use your personal information as set forth in this policy.

## Ads

We do not display third-party advertising on our websites or in our applications.

When ads appear on our social media profiles, they are delivered to users by advertisers who may set cookies. These cookies allow the ad server to recognize your computer each time they send you an online advertisement to compile information about you or others who use your computer. This information allows ad networks to, among other things, deliver targeted advertisements that they believe will be of most interest to you. This Privacy Policy covers the use of cookies by us and does not cover the use of cookies by any advertisers.

## Privacy Policy Changes

Although most changes are likely to be minor, we may modify this Privacy Policy from time to time at our sole discretion. You are encouraged to frequently check this page for any changes to the Privacy Policy. Your continued use of this site after any change in this Privacy Policy will constitute your acceptance of such change.

## License

This privacy policy is available under a [Creative Commons Sharealike](http://creativecommons.org/licenses/by-sa/2.5/) license derived from original groundwork by [Automattic](http://automattic.com/privacy/). WGM is not affiliated with Automattic.
