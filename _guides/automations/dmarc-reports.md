---
title: Parse and visualize DMARC report email attachments
excerpt: In this guide we’ll demonstrate how to read a DMARC report file attachment and display its contents. As a bonus, we’ll use the ipstack API to geolocate the IPs found in the report and display them on a world map.
social_image_url: /assets/images/guides/automations/worker-interactions/dmarc-reports/ip-lookup.png
layout: integration
topic: Automations
subtopic: Worker Interactions
jumbotron:
  title: Parse and visualize DMARC report email attachments
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Automations &raquo;
    url: /resources/guides/#automations
---

* TOC
{:toc}

# Introduction

A DMARC[^dmarc] (Domain-based Message Authentication, Reporting, and Conformance) report is a feedback mechanism used in email authentication to provide organizations with information about the successful and blocked deliveries of their emails using their own domain name (hostname) from various sender IP addresses. These reports help organizations monitor and enhance their email security and authentication practices.

DMARC reports include details about email authentication results, such as whether an email passed or failed SPF (Sender Policy Framework) and DKIM (DomainKeys Identified Mail) checks. They also provide insights into the source IP addresses of email senders and whether their emails were accepted, rejected, or marked as suspicious. This information is valuable for organizations to identify and address potential email spoofing, phishing, or unauthorized use of their domain names.

DMARC reports are delivered as an email attachment containing a compressed XML file (zip or gzip are most common). You can use [automations](/docs/automations/) in Cerb to automatically parse and visualize DMARC report attachments.

In this guide we'll demonstrate how to read a DMARC report file attachment and display its contents. As a bonus, we'll use the ipstack API to geolocate the IPs found in the report and display them on a world map.

# Import automations

In Cerb, navigate to **Setup >> Packages >> Import** and paste the following package:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "requires": {
      "cerb_version": "10.3"
    },
    "configure": {
      "placeholders": [],
      "prompts": []
    }
  },
  "records": [
    {
      "uid": "automation_dmarc_parse",
      "_context": "automation",
      "name": "example.function.dmarcReportParse",
      "extension_id": "cerb.trigger.automation.function",
      "description": "Parse DMARC report attachments",
      "script": "inputs:\r\n  record/file:\r\n    record_type: attachment\r\n    required@bool: yes\r\n\r\nstart:\r\n  decision/format:\r\n    # .xml.gz\r\n    outcome/gzipXml:\r\n      if@bool: {{inputs.file.name ends with '.xml.gz'}}\r\n      then:\r\n        file.read:\r\n          inputs:\r\n            uri: cerb:attachment:{{inputs.file.id}}\r\n            filters:\r\n              gzip.decompress:\r\n          output: file_contents\r\n    \r\n    # .zip\r\n    outcome/zip:\r\n      then:\r\n        # Look inside the ZIP for the first XML file\r\n        data.query/zip:\r\n          inputs:\r\n            query@text:\r\n              type:attachment.manifest\r\n              id:{{inputs.file.id}}\r\n              filter:*.xml\r\n              limit:1\r\n              format:dictionaries\r\n          output: results\r\n          on_success:\r\n            outcome/notFound:\r\n              if@bool: {{1 != results.data.cursor.num_files}}\r\n              then:\r\n                return:\r\n  \r\n        # Extract the XML file from the ZIP\r\n        file.read:\r\n          inputs:\r\n            uri: cerb:attachment:{{inputs.file.id}}\r\n            extract: {{results.data.files[0].name}}\r\n          output: file_contents\r\n          on_success:\r\n            outcome/notXml:\r\n              # Must be XML\r\n              if@bool:\r\n                {{\r\n                  not file_contents.bytes \r\n                  or 'text/xml' != file_contents.mime_type\r\n                }}\r\n              then:\r\n                return:\r\n  \r\n  set/json:\r\n    file_contents@json: {{xml_decode(file_contents.bytes)|json_encode}}\r\n  \r\n  outcome/notJson:\r\n    # Must be JSON\r\n    if@bool: {{not file_contents}}\r\n    then:\r\n      return:\r\n  \r\n  # If there's only one row, make a list for consistency\r\n  outcome/oneRow:\r\n    if@bool: {{file_contents.record.row is not empty}}\r\n    then:\r\n      var.set:\r\n        inputs:\r\n          key: file_contents:record\r\n          value:\r\n            0@key: file_contents:record\r\n  \r\n  return:\r\n    report@key: file_contents\r\n  ",
      "policy_kata": "commands:\r\n  data.query:\r\n    deny/type@bool: {{query.type != 'attachment.manifest'}}\r\n    allow@bool: yes\r\n  file.read:\r\n    deny/uri@bool: {{inputs.uri is not prefixed ('cerb:attachment:')}}\r\n    allow@bool: yes",
      "created_at": 1695171444,
      "updated_at": 1695171444
    },
    {
      "uid": "automation_dmarc_interaction",
      "_context": "automation",
      "name": "example.interaction.dmarcReport",
      "extension_id": "cerb.trigger.interaction.worker",
      "description": "Interaction for quick review of DMARC reports",
      "script": "inputs:\r\n  record/file:\r\n    required@bool: yes\r\n    record_type: attachment\r\n\r\nstart:\r\n  function/dmarc:\r\n    uri: cerb:automation:example.function.dmarcReportParse\r\n    output: results\r\n    inputs:\r\n      file: {{inputs.file.id}}\r\n    on_success:\r\n      await:\r\n        form:\r\n          title: DMARC results\r\n          elements:\r\n            sheet/prompt_sheet:\r\n              data@key: results:report:record\r\n              schema:\r\n                layout:\r\n                columns:\r\n                  interaction/ip:\r\n                    params:\r\n                      #uri: cerb:automation:wgm.interaction.ipstack.location\r\n                      text_template@raw: {{row.source_ip}}\r\n                      inputs:\r\n                        ip@raw: {{row.source_ip}}\r\n                  text/domain:\r\n                    params:\r\n                      value_template@raw: {{identifiers.header_from}}\r\n                  text/count:\r\n                    params:\r\n                      value_template@raw: {{row.count}}\r\n                  icon/spf:\r\n                    params:\r\n                      image_template@raw: {{'pass' == row.policy_evaluated.spf ? 'circle-ok' : 'remove-2'}}\r\n                  icon/dkim:\r\n                    params:\r\n                      image_template@raw: {{'pass' == row.policy_evaluated.dkim ? 'circle-ok' : 'remove-2'}}\r\n                  text/disposition:\r\n                    params:\r\n                      value_template@raw: {{row.policy_evaluated.disposition}}",
      "policy_kata": "commands:\r\n  function:\r\n    deny/uri@bool: {{uri != 'cerb:automation:example.function.dmarcReportParse'}}\r\n    allow@bool: yes",
      "created_at": 1695171511,
      "updated_at": 1695171511
    },
    {
      "uid": "card_widget_dmarc",
      "_context": "card_widget",
      "name": "Actions",
      "record_type": "attachment",
      "pos": 100,
      "width_units": 4,
      "extension_id": "cerb.card.widget.form_interaction",
      "extension_params": {
        "interactions_kata": "interaction/zx78jf:\n  label: DMARC Report\n  uri: cerb:automation:example.interaction.dmarcReport\n  icon: briefcase\n  hidden@bool:\n    {{\n      not (\n        record_mime_type in ['application/zip','application/gzip','application/octet-stream'] \n        and record_name is pattern ('*!*!*.zip','*!*!*.xml.gz')\n      )\n    }}\n  inputs:\n    file: {{record_id}}",
        "is_popup": 0
      }
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

# Import a sample DMARC report

From **Setup >> Packages >> Import** paste the following package to create a sample ticket with a sample DMARC report attachment:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "requires": {
      "cerb_version": "10.3"
    },
    "configure": {
      "placeholders": [],
      "prompts": [],
      "options": {
          "disable_events": true
      }
    }
  },
  "records": [
    {
      "uid": "ticket_dmarc",
      "_context": "ticket",
      "group_id": "{{{default.group_id}}}",
      "subject": "Report Domain: cerb.example Submitter: customer.example Report-ID: <a1b2c3d4e5f6@customer.example>"
    },
    {
      "uid": "message_dmarc",
      "_context": "message",
      "ticket_id": "{{{uid.ticket_dmarc}}}",
      "sender": "dmarc-report@customer.example",
      "headers": "To: support@cerb.example\r\nFrom: dmarc-reports@customer.example",
      "content": "Find attached the DMARC Aggregate Report."
    },
    {
      "uid": "attachment_dmarc",
      "_context": "attachment",
      "name": "customer.example!cerb.example!1695078003!1695164407.xml.gz",
      "mime_type": "application/gzip",
      "attach": [
        "message:{{{uid.message_dmarc}}}"
      ],
      "content": "data:application/zip;base64,H4sICOxJCmUAA2N1c3RvbWVyLmV4YW1wbGUhY2VyYi5leGFtcGxlITE2OTUwNzgwMDMhMTY5NTE2NDQwNy54bWwA7VbbjtsgFHzfr4jyXl9yr8SyfeoXtM8WgeOErg0IcJr+fcGA7U3SbbRVpapa5SFmzsCcM0ysoKdz28xOoA2X4nFeZsV8BoJKxsXhcf71y+cPu/nsCT+gGoDtCX3GD7MZinzs6ChPC1/QoKS2VQuWMGKJxxwq9aESpAVMO2NlCzqDM2lVAygfSoEJLeENZi3R9NM1OVQj82w1qagUllBbcVHLX2+7poYzYrecYVLuF3TJVrCuNzdOGIlho5sNKk3EIfbtoD0cuDNk83FdbHdFsUR5QFIdBOur5Wa1KrauKZEOy1+eNqhNTURKNpz+qFS3b7g5wtCIdJYITEHvx24jGBiEPfMWG5SHhwgaVfeY/w6Qwhq+AbUoVxExI2QSpqjFZeEu3T/0zd5qzBlLpU49avl9cMHITlOouMKrbJktstKdPUCJRGUnvAzKw1PCoxScSNM5y1gqeB+4UdJw63MopPAmTJAJz3ugiHGzj3bEaetYGDyZjHeh6e4oDYU4A2F5zd2vYNh2BMJAV7WW7cXdTCtjNE7QSAW3+C9rUfxKEpHOHisNpmvs2MXFhL/NSvABGnflUvc8Z0ZajowgE82Ki8GvqSaaOHm/PnXT4taP69T7xZ3SY5bzSzs8OSXynnCus/7zSjj/VjZr94Z7z+afZjO4+H9ms9zusnK9ysrF7tXX5xsTml75b8loKLxn9F/P6G3puzKK8uGP4E8SDFfPOwoAAA=="
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

# Testing the interaction

Open the profile page for the sample ticket with the subject **Report Domain: cerb.example Submitter: customer.example Report-ID: &lt;a1b2c3d4e5f6@customer.example&gt;**.

You can find it in the package import results, or from **Search >> Tickets**.

Click on the attachment:

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/worker-interactions/dmarc-reports/message-attachment.png" class="screenshot">
</div>

Click the new **DMARC Report** button. This will only show up for attachments matching the filename pattern.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/worker-interactions/dmarc-reports/attachment-card-toolbar.png" class="screenshot">
</div>

You'll see a visual summary of the DMARC report:

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/worker-interactions/dmarc-reports/dmarc-interaction.png" class="screenshot">
</div>

# Enable IP geolocation maps

Right now our report just shows IP addresses. It would be useful to be able to see the hostname and general location of each IP. 

Follow the [Cerb + ipstack](/guides/integrations/ipstack/) guide if you haven't already. This will create a connected account to use the free ipstack geolocation IP, as well as sample automations.

Then navigate to **Search >> Automations** and edit the **example.interaction.dmarcReport** automation.

Around line `24`, change:

```cerb
#uri: cerb:automation:wgm.interaction.ipstack.location
```

To: (remove the `#` prefix)

```cerb
uri: cerb:automation:wgm.interaction.ipstack.location
```

Click the **Save Changes** button at the bottom of the automation editor.

Now when you view a DMARC report, you can click on an IP to see its location. The hostname will also be displayed if a DNS `PTR` record exists.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/worker-interactions/dmarc-reports/ip-lookup.png" class="screenshot">
</div>

# References

[^dmarc]: Wikipedia - DMARC <https://en.wikipedia.org/wiki/DMARC>