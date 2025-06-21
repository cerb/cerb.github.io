---
title: 'Scripting Reference: Functions'
excerpt: This webpage serves as a comprehensive scripting reference for functions
  available in Cerb's bot scripts and snippets.
summary: This webpage serves as a comprehensive scripting reference for functions
  available in Cerb's bot scripts and snippets. It details a wide array of functions,
  including those for manipulating arrays (e.g., array_column, array_diff, array_sort_keys),
  handling JSON and XML data (e.g., json_decode, xml_decode, xml_xpath), and performing
  various utility operations (e.g., random_string, validate_email, clamp_int). Additionally,
  it covers Cerb-specific functions for automation, calendar management, and permissions
  (e.g., cerb_automation, cerb_calendar_get_relative_date, cerb_has_priv). Each function
  is explained with examples, showcasing its syntax and potential use cases, making
  this page a valuable resource for developers working with Cerb's scripting capabilities.
permalink: /docs/scripting/functions/
toc:
  title: Functions
  expand: Developer Guide
jumbotron:
  title: 'Reference: Functions'
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
search_index:
  sections:
    - heading: "array_column"
      title: "array_column function"
      summary: "Extract a column from the elements of an array"
    - heading: "array_combine"
      title: "array_combine function"
      summary: "Create a new array with the given keys and values"
    - heading: "array_count_values"
      title: "array_count_values function"
      summary: "Count occurrences of values in an array"
    - heading: "array_diff"
      title: "array_diff function"
      summary: "Return items in the second array that are not present in the first array"
    - heading: "array_extract_keys"
      title: "array_extract_keys function"
      summary: "Return given keys from all elements of a list"
    - heading: "array_fill_keys"
      title: "array_fill_keys function"
      summary: "Create an array with given keys, each set to a default value"
    - heading: "array_intersect"
      title: "array_intersect function"
      summary: "Return elements that are present in both arrays"
    - heading: "array_matches"
      title: "array_matches function"
      summary: "Compare an array of values to an array of patterns"
    - heading: "array_sort_keys"
      title: "array_sort_keys function"
      summary: "Sort an associative array by its keys rather than values"
    - heading: "array_unique"
      title: "array_unique function"
      summary: "Return a new array with only distinct values"
    - heading: "array_values"
      title: "array_values function"
      summary: "Return values from an associative array as a new indexed array"
    - heading: "attribute"
      title: "attribute function"
      summary: "Access object values with a variable key"
    - heading: "cerb_automation"
      title: "cerb_automation function"
      summary: "Invoke a scripting.function automation from any scripting feature"
    - heading: "cerb_avatar_image"
      title: "cerb_avatar_image function"
      summary: "Retrieve the avatar image HTML for a given record type and ID"
    - heading: "cerb_avatar_url"
      title: "cerb_avatar_url function"
      summary: "Retrieve the avatar image URL for a given record type and ID"
    - heading: "cerb_calendar_get_relative_date"
      title: "cerb_calendar_get_relative_date function"
      summary: "Calculate a future timestamp using calendar availability"
    - heading: "cerb_calendar_time_elapsed"
      title: "cerb_calendar_time_elapsed function"
      summary: "Calculate time elapsed between two dates using calendar availability"
    - heading: "cerb_current_worker"
      title: "cerb_current_worker function"
      summary: "Return a dictionary for the currently logged in worker"
    - heading: "cerb_extract_uris"
      title: "cerb_extract_uris function"
      summary: "Return an array of URLs found in HTML content with metadata"
    - heading: "cerb_file_url"
      title: "cerb_file_url function"
      summary: "Retrieve the download link for a given attachment ID"
    - heading: "cerb_has_priv"
      title: "cerb_has_priv function"
      summary: "Check if an actor has a given privilege among their roles"
    - heading: "cerb_placeholders_list"
      title: "cerb_placeholders_list function"
      summary: "Return an object with every placeholder in the current behavior"
    - heading: "cerb_plugin_enabled"
      title: "cerb_plugin_enabled function"
      summary: "Test if a Cerb plugin is installed and enabled"
    - heading: "cerb_record_readable"
      title: "cerb_record_readable function"
      summary: "Check if an actor has read access to a given record"
    - heading: "cerb_record_writeable"
      title: "cerb_record_writeable function"
      summary: "Check if an actor has write access to a given record"
    - heading: "cerb_url"
      title: "cerb_url function"
      summary: "Retrieve a full URL to a page or resource in Cerb"
    - heading: "cerb_workflow_config"
      title: "cerb_workflow_config function"
      summary: "Perform runtime configuration lookups from workflow"
    - heading: "cerb_workflow_resources"
      title: "cerb_workflow_resources function"
      summary: "Perform runtime resource lookups and return workflow resource map"
    - heading: "clamp_float"
      title: "clamp_float function"
      summary: "Set range boundaries for a decimal value"
    - heading: "clamp_int"
      title: "clamp_int function"
      summary: "Set range boundaries for an integer value"
    - heading: "cycle"
      title: "cycle function"
      summary: "Round-robin through a sequence"
    - heading: "date"
      title: "date function"
      summary: "Create a date object for use with date manipulation filters"
    - heading: "date_lerp"
      title: "date_lerp function"
      summary: "Interpolate timestamps between two dates with given unit and step"
    - heading: "dict_set"
      title: "dict_set function"
      summary: "Add, modify, or append items in an array or object using dot notation"
    - heading: "dict_unset"
      title: "dict_unset function"
      summary: "Remove items by key from an array or object using dot notation"
    - heading: "dns_get_record"
      title: "dns_get_record function"
      summary: "Resolve DNS records by hostname and type"
    - heading: "dns_host_by_ip"
      title: "dns_host_by_ip function"
      summary: "Resolve a hostname from an IP address"
    - heading: "json_decode"
      title: "json_decode function"
      summary: "Decode a JSON-encoded string into an object"
    - heading: "jsonpath_set"
      title: "jsonpath_set function"
      summary: "Set values in JSON objects using path notation"
    - heading: "kata_parse"
      title: "kata_parse function"
      summary: "Parse a KATA text block into an object"
    - heading: "max"
      title: "max function"
      summary: "Return the largest value in an array or object"
    - heading: "min"
      title: "min function"
      summary: "Return the smallest value in an array or object"
    - heading: "random"
      title: "random function"
      summary: "Return a random item from string/array or random number"
    - heading: "random_string"
      title: "random_string function"
      summary: "Generate a random string of given length"
    - heading: "range"
      title: "range function"
      summary: "Return an array with values between from and to with optional step"
    - heading: "regexp_match_all"
      title: "regexp_match_all function"
      summary: "Find all matches of a regular expression pattern in a string"
    - heading: "shuffle"
      title: "shuffle function"
      summary: "Randomize the order of elements in an array"
    - heading: "validate_email"
      title: "validate_email function"
      summary: "Validate an email address format"
    - heading: "validate_number"
      title: "validate_number function"
      summary: "Validate if a value is a valid number"
    - heading: "vobject_parse"
      title: "vobject_parse function"
      summary: "Parse text in VObject format like vCard or iCal"
    - heading: "xml_attr"
      title: "xml_attr function"
      summary: "Return a single attribute from an XML node"
    - heading: "xml_attrs"
      title: "xml_attrs function"
      summary: "Return all attributes from an XML node"
    - heading: "xml_decode"
      title: "xml_decode function"
      summary: "Decode an XML string into an XML object"
    - heading: "xml_encode"
      title: "xml_encode function"
      summary: "Encode an object as XML"
    - heading: "xml_xpath"
      title: "xml_xpath function"
      summary: "Extract values from XML using XPath queries"
    - heading: "xml_xpath_ns"
      title: "xml_xpath_ns function"
      summary: "Define an XML namespace for XPath queries"
    - heading: "xml_xpath_remove"
      title: "xml_xpath_remove function"
      summary: "Remove elements from XML document with XPath query"
---

These functions are available in bot scripts and snippets:

* TOC
{:toc}

## array_column

(Added in [9.2.1](/releases/9.2.1/))

The **array_column** function extracts a column from the elements of an array:

{% highlight twig %}
{% raw %}
{% set people = [
	{"id": 1, "name": "Kina Halpue", "email": "kina@cerb.example"},
	{"id": 2, "name": "Milo Dade", "email": "milo@cerb.example"},
	{"id": 3, "name": "Janey Youve", "email": "janey@cerb.example"},
] %}
The email addresses are: {{array_column(people,'email')|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
The email addresses are: kina@cerb.example, milo@cerb.example, janey@cerb.example
{% endhighlight %}

## array_combine

(Added in [9.0](/releases/9.0/))

The **array_combine** function creates a new array with the given `keys` and `values`:

{% highlight twig %}
{% raw %}
{% set keys = ['name', 'age', 'email'] %}
{% set values = ['Janey Youve', '30-ish', 'janey@cerb.example'] %}
{% set person = array_combine(keys, values) %}
{{person.name}} can be reached at {{person.email}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Janey Youve can be reached at janey@cerb.example
{% endhighlight %}

## array_count_values

(Added in [10.0.4](/releases/10.0.4/))

The **array_count_values** function takes an array of values as input, and returns an array with distinct values as keys and their count of occurrences. This function only works on arrays of strings or numbers.

{% highlight twig %}
{% raw %}
{% set values = [1,2,3,1,3,2,3,1,2,1,3,1,3] %}
{{array_count_values(values)|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "1": 5,
    "2": 3,
    "3": 5
}
{% endhighlight %}

## array_diff

The **array_diff** function returns the items in the second array that are not present in the first array:

{% highlight twig %}
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set diff = array_diff(arr2, arr1) %}
These are new: {{diff|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
These are new: Cerb
{% endhighlight %}

## array_extract_keys

(Added in [9.6.4](/releases/9.6.4/))

Returns the given keys from all elements of a list.

{% highlight twig %}
{% raw %}
{% set records = [
	{
		id: 1,
		subject: "Help with the API",
		status: "open",
		sender: "customer@cerb.example",
	},
	{
		id: 2,
		subject: "Automating email replies",
		status: "open",
		sender: "customer@cerb.example",
	}
] %}
Sender,Subject,Status
{{array_extract_keys(records, ['sender','subject','status'])|csv}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Sender,Subject,Status
customer@cerb.example,"Help with the API",open
customer@cerb.example,"Automating email replies",open
{% endhighlight %}

## array_fill_keys

(Added in [10.0](/releases/10.0/))

Create an array with the given keys, each set to the default value.

`array_fill_keys(keys,value)`

{% highlight twig %}
{% raw %}
{{array_fill_keys(range(1,10),true)|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true}
{% endhighlight %}

## array_intersect

(Added in [9.0](/releases/9.0/))

Returns a new array for all the elements in array1 that are also present in array2. This is the opposite of [array_diff](#array_diff).

{% highlight twig %}
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set intersect = array_intersect(arr2, arr1) %}
These are in both: {{intersect|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
These are in both: Apple, Microsoft
{% endhighlight %}

## array_matches

(Added in [9.6.4](/releases/9.6.4/))

Compares an array of values to an array of patterns.

{% highlight twig %}
{% raw %}
{% set recipients = ['support@cerb.example','sales@cerb.example'] %}
{% set patterns = ['sales@*'] %}
{% set results = array_matches(recipients, patterns) %}
Matches: {{results|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Matches: sales@cerb.example
{% endhighlight %}

## array_sort_keys

(Added in [9.0](/releases/9.0/))

Sort an associative array by its keys rather than its values.

{% highlight twig %}
{% raw %}
{% set arr = {"z":"A", "a":"B", "m":"C"} %}
{% set arr = array_sort_keys(arr) %}
{{arr|keys|join(',')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
a,m,z
{% endhighlight %}

## array_unique

(Added in [9.0](/releases/9.0/))

Return a new array with only the distinct values from the `array` argument.

{% highlight twig %}
{% raw %}
{% set arr = [1,1,2,2,3,3,4,4,5,5,6] %}
Unique values {{array_unique(arr)|join(',')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Unique values 1,2,3,4,5,6
{% endhighlight %}

## array_values

(Added in [9.0](/releases/9.0/))

Return the values from an associative array as a new indexed array. For instance, this can affect the output in JSON encoding by using `[]` rather than `{key:value}`.

{% highlight twig %}
{% raw %}
{% set arr = {"z":"A", "a":"B", "m":"C"} %}
{{array_values(arr)|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["A","B","C"]
{% endhighlight %}

## attribute

Access the values of an object with a variable key:

{% highlight twig %}
{% raw %}
{% set person = {"first_name": "Kina", "last_name": "Halpue", "title": "Customer Support Supervisor"} %}
{% set key = 'title' %}
{{attribute(person, key)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Customer Support Supervisor
{% endhighlight %}

## cerb_automation

Invoke a [scripting.function](/docs/automations/triggers/scripting.function/) automation from any feature that supports [scripting](/docs/scripting/).

The function returns keys for `exit_state:` (`exit`, `return`, `error`) and `return:` (an arbitrary dictionary).

This brings the full functionality of automations to email signatures, snippets, legacy bot behaviors, automation event bindings, toolbars bindings, etc.

For instance, a snippet could use an automation to dynamically generate content based on the target record or current worker. This solves many feature requests.

`cerb_automation(uri, inputs)`

|-|-|-
| **uri** | The URI of an [automation](/docs/automations/) record to invoke. It must be of type `scripting.function`.
| **inputs** | A key/value dictionary of inputs. The possible keys depend on the function being invoked.

{% highlight twig %}
{% raw %}
{% set ip_data = cerb_automation('wgm.scripting.getLocationByIP', { ip:"1.2.3.4" } ) %}
{% if ip_data.return.data %}
I see you are contacting us from {{ip_data.return.data.country_name}}.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
I see you are contacting us from Australia.
{% endhighlight %}

## cerb_avatar_image

Retrieve the avatar image for a given record type and ID.

`cerb_avatar_image(record_type, id, updated)`

{% highlight twig %}
{% raw %}
{{cerb_avatar_image('worker','1','now'|date('U'))}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
<img src="https:/cerb.example/avatars/worker/1?v=1513212603" style="height:16px;width:16px;border-radius:16px;vertical-align:middle;">
{% endhighlight %}

## cerb_avatar_url

Retrieve the avatar image URL for a given record type and ID.

`cerb_avatar_url(record_type, id, updated)`

{% highlight twig %}
{% raw %}
{{cerb_avatar_url('worker','1','now'|date('U'))}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
https://cerb.example/avatars/worker/1?v=1513212702
{% endhighlight %}

## cerb_calendar_get_relative_date

(Added in [11.0](/releases/11.0/))

Calculate a future timestamp using calendar availability. For instance, this can be used for SLAs to generate a due date like "+4 business hours".

`cerb_calendar_get_relative_date(calendar,rel_date,now)`

|-|-|-
| **calendar** | The ID of the [calendar](/docs/records/types/calendar/) to use for determining availability.
| **date_rel** | The time increment (e.g. "+2 hours").
| **now** | An optional starting date/time.

{% highlight twig %}
{% raw %}
Now: {{"now"|date('r')}}
Due: {{cerb_calendar_get_relative_date(123,'+2 hours')|date('r')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Now: Fri, 18 Oct 2024 20:02:18 -0700
Due: Mon, 21 Oct 2024 09:00:00 -0700
{% endhighlight %}

## cerb_calendar_time_elapsed

(Added in [10.1.1](/releases/10.1.1/))

Calculate the time elapsed (in seconds) between two dates using calendar availability.

`cerb_calendar_time_elapsed(calendar,date_from,date_to)`

|-|-|-
| **calendar** | The ID of the [calendar](/docs/records/types/calendar/) to use for determining availability.
| **date_from** | The starting date/time.
| **date_to** | The ending date/time.

{% highlight twig %}
{% raw %}
{{cerb_calendar_time_elapsed(123,'last Friday 5pm','now')|secs_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
18 hours, 13 mins
{% endhighlight %}

## cerb_current_worker

(Added in [10.4.14](/releases/10.4.14/))

Return a dictionary for the currently logged in worker. This returns an empty dictionary when used outside a browser session.

`cerb_current_worker(expand)`

|-|-|-
| **expand** | An optional comma-delimited string or array of dictionary keys to expand.

{% highlight twig %}
{% raw %}
Hello {{cerb_current_worker().first_name}}!
{% endraw %}
{% endhighlight %}

{% highlight text %}
Hello Kina!
{% endhighlight %}

## cerb_extract_uris

(Added in [9.5.3](/releases/9.5.3/))

Return an array of URLs found in HTML content, along with metadata (e.g. tag, attributes, URI parts).

In the response, URLs are replaced with `tokens` in the `template` which can be modified with the [\|replace](/docs/scripting/filters/#replace) filter.

For instance, this function can be used to rewrite all links in an email template for click tracking.

`cerb_extract_uris(html)`

|-|-|-
| **html** | The HTML content to extract links from.

{% highlight twig %}
{% raw %}
{% set html %}
This is some <b>HTML</b> with <a href="https://cerb.ai/">links</a>.
{% endset %}
{% set results = cerb_extract_uris(html) %}
{{results|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "tokens": {
        "#uri-61411f091662a": "https://cerb.ai/"
    },
    "context": {
        "#uri-61411f091662a": {
            "is_tag": true,
            "name": "a",
            "attr": "href",
            "attrs": {
                "href": "https://cerb.ai/"
            },
            "uri_parts": {
                "scheme": "https",
                "userinfo": null,
                "host": "cerb.ai",
                "port": null,
                "path": "/",
                "query": null,
                "fragment": null
            }
        }
    },
    "template": "This is some <b>HTML</b> with <a href=\"#uri-61411f091662a\">links</a>.\n"
}
{% endhighlight %}

To rewrite links:

{% highlight twig %}
{% raw %}
{% set html %}
This is some <b>HTML</b> with <a href="https://cerb.ai/">links</a>.
{% endset %}
{% set results = cerb_extract_uris(html) %}
{% set new_urls = results.tokens|map(
  (url,token) => "https://proxy.example/click?url=" ~ url|url_encode
)%}
{{results.template|replace(new_urls)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This is some <b>HTML</b> with <a href="https://proxy.example/click?url=https%3A%2F%2Fcerb.ai%2F">links</a>.
{% endhighlight %}

## cerb_file_url

Retrieve the download link for a given attachment ID.

This automatically adapts to use within Cerb and community portals (e.g. SSL, proxies).

`cerb_file_url(id)`

{% highlight twig %}
{% raw %}
{{cerb_file_url('1')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
https://cerb.example/files/1/original_message.html
{% endhighlight %}

## cerb_has_priv

(Added in [9.0](/releases/9.0/))

Returns a boolean depending on whether the given actor has the given privilege among their roles. If no actor is given, the current worker is assumed. This allows bot functionality, snippets, and widgets, to adapt based on worker permissions. This is particularly useful in HTML-based profile widgets.

{% highlight twig %}
{% raw %}
{% if cerb_has_priv('contexts.cerberusweb.context.ticket.create', 'worker', 1) %}
Worker #1 has permission to create tickets.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Worker #1 has permission to create tickets.
{% endhighlight %}

## cerb_placeholders_list

Return an [object](/docs/scripting/arrays-objects/) with every placeholder in the current behavior.

`cerb_placeholders_list(extract, prefix)`

|-|-|-
| **extract** | The key prefix to extract (e.g. `ticket_group_`)
| **prefix** | The optional new prefix to add (e.g. `group_`)

{% highlight twig %}
{% raw %}
{{cerb_placeholders_list()|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
  "worker__context": "cerberusweb.contexts.worker",
  "worker__loaded": true,
  "worker__label": "Kina Halpue",
  "worker__image_url": "https://cerb.example/avatars/worker/1?v=1512582324",
  "worker_at_mention_name": "Kina",
  "worker_calendar_id": 7,
  "worker_dob": null,
  "worker_id": 1,
  "worker_first_name": "Kina",
  "worker_full_name": "Kina Halpue",
  "worker_gender": "F",
  "worker_is_disabled": 0,
  "worker_is_superuser": 1,
  "worker_language": "en_US",
  "worker_last_name": "Halpue",
  "worker_location": "",
  "worker_mobile": "15555555555",
  "worker_phone": "",
  "worker_time_format": "D, d M Y h:i a",
  "worker_timezone": "America/Los_Angeles",
  "worker_title": "Customer Support",
  "worker_updated": 1512582324,
  "worker_record_url": "https://cerb.example/profiles/worker/1-Kina-Halpue",
  ...
}
{% endhighlight %}

## cerb_plugin_enabled

(Added in [11.0](/releases/11.0/))

Test if a Cerb plugin is installed and enabled.

For instance, this can be used to make dashboard tabs or widgets conditional on a particular plugin being enabled (e.g. project boards).

`cerb_plugin_enabled(plugin_id)`

|-|-|-
| **plugin_id** | The name or ID of the [workflow](/docs/workflows/).

{% highlight twig %}
{% raw %}
{{cerb_plugin_enabled('cerb.classifiers')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## cerb_record_readable

(Added in [9.0](/releases/9.0/))

Returns a boolean if the given actor has read access to the given record. If no actor is provided then the current worker is assumed. This allows bots and widgets to adapt based on record permissions. For instance, an HTML widget on a profile dashboard could only show a button to workers who can modify the record.

{% highlight twig %}
{% raw %}
{% if cerb_record_readable('ticket', 123, 'worker', 1) %}
Worker #1 can read ticket #123.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Worker #1 can read ticket #123.
{% endhighlight %}

## cerb_record_writeable

(Added in [9.0](/releases/9.0/))

Returns a boolean if the given actor has write access to the given record. If no actor is provided then the current worker is assumed. This allows bots and widgets to adapt based on record permissions. For instance, an HTML widget on a profile dashboard could only show a button to workers who can modify the record.

{% highlight twig %}
{% raw %}
{% if cerb_record_writeable('ticket', 123, 'worker', 1) %}
Worker #1 can modify ticket #123.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Worker #1 can modify ticket #123.
{% endhighlight %}

## cerb_url

Retrieve a full URL to a page or resource in Cerb.

This automatically adapts to use within Cerb and community portals (e.g. SSL, proxies).

{% highlight twig %}
{% raw %}
{{cerb_url("c=profiles&type=ticket&id=5")}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
https://cerb.example/profiles/ticket/5
{% endhighlight %}

## cerb_workflow_config

(Added in [11.0](/releases/11.0/))

Perform runtime configuration lookups from any feature that supports automation scripting (e.g. automations, workflows, snippets). For instance, you can create a workflow just for sharing values (e.g. API keys) between multiple workflows.

`cerb_workflow_config(name_or_id,key,default)`

|-|-|-
| **name_or_id** | The name or ID of the [workflow](/docs/workflows/).
| **key** | The optional config key to return. If omitted, all keys/values are returned as a map.
| **default** | The optional default value if the key doesn't exist.

{% highlight twig %}
{% raw %}
{{cerb_workflow_config('example.workflow','secretCode',null)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
sup3rs3cr3t
{% endhighlight %}

## cerb_workflow_resources

(Added in [11.0](/releases/11.0/))

Perform runtime resource lookups and return a map of workflow resources and their local record IDs. This is useful from automations, event listeners, and toolbars.

`cerb_workflow_resources(name_or_id)`

|-|-|-
| **name_or_id** | The name or ID of the [workflow](/docs/workflows/).

{% highlight twig %}
{% raw %}
{{cerb_workflow_resources('example.workflow'|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{"records":{"automation/example":123}}
{% endhighlight %}

## clamp_float

Set the range boundaries for a decimal value.

{% highlight twig %}
{% raw %}
{{clamp_float(-105.19,0,100)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
0
{% endhighlight %}

## clamp_int

Set the range boundaries for an integer value.

{% highlight twig %}
{% raw %}
{{clamp_int(110,-90,90)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
90
{% endhighlight %}

## cycle

Round-robin through a sequence.

{% highlight twig %}
{% raw %}
{% set options = ['odd','even'] %}
{% for n in 1..10 %}
* {{cycle(options, n)}}
{% endfor %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
* even
* odd
* even
* odd
* even
* odd
* even
* odd
* even
* odd
{% endhighlight %}

## date

Create a date object for use with the [date_modify](/docs/scripting/filters/#date_modify) filter.

{% highlight twig %}
{% raw %}
{% set d = date('1-Jan-2018 10:00am') %}
{{d|date_modify('+2 hours')|date('F d, Y g:ia')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
January 01, 2018 12:00pm
{% endhighlight %}

## date_lerp

Interpolate the timestamps between two dates with the given `unit` and `step`.

`date_lerp(date_range,unit,step,limit)`

**Arguments:**

|---
| Name | Notes
|-|-
| **date_range** | An absolute range like `2023-01-01 to 2023-12-31`, a relative range like `-7 days to now`, or a shortcut like `this month`. 
| **unit** | `minute`, `hour`, `day`, `week`, `month`, `year`
| **step** | The number of `unit` to increment (e.g. `5`). Default `1`.
| **limit** | The maximum number of results. Default `10000`.

**Returns:** An array of Unix timestamps.

{% highlight twig %}
{% raw %}
{{date_lerp('this month',unit='day',step=5)|map((v) => v|date('r'))|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
    "Sat, 01 Oct 2022 00:00:00 -0700",
    "Thu, 06 Oct 2022 00:00:00 -0700",
    "Tue, 11 Oct 2022 00:00:00 -0700",
    "Sun, 16 Oct 2022 00:00:00 -0700",
    "Fri, 21 Oct 2022 00:00:00 -0700",
    "Wed, 26 Oct 2022 00:00:00 -0700",
    "Mon, 31 Oct 2022 00:00:00 -0700"
]
{% endhighlight %}

## dict_set

You can use the **dict_set** function to quickly add, modify, or append items in an array or object.

`dict_set(object,path,value,delimiter) : object`

**Arguments:**

|---
|Name|Notes
|-|-
| **object** | The object to modify
| **path** | The key or key path (with delimiters) to set
| **value** | The new value for the given key or key path
| **delimiter** | Defaults to dot (`.`), but may be any character sequence (e.g. `||`)

**Returns:**
The function returns a modified version of `object`.

You can set deeply nested keys in a single line using dot-notation:

{% highlight twig %}
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.manager.name.first', 'Kina') %}
{% set var = dict_set(var, 'group.manager.name.last', 'Halpue') %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
  "group": {
    "name": "Support",
    "manager": {
      "name": {
        "first": "Kina",
        "last": "Halpue"
      }
    }
  }
}
{% endhighlight %}

Append items to an array by adding `.[]` to the key:

{% highlight twig %}
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.members.[]', 'Kina Halpue') %}
{% set var = dict_set(var, 'group.members.[]', 'William Portcullis') %}
{% set var = dict_set(var, 'group.members.[]', 'Steven Emplois') %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
  "group": {
    "name": "Support",
    "members": [
      "Kina Halpue",
      "William Portcullis",
      "Steven Emplois"
    ]
  }
}
{% endhighlight %}

Append to nested arrays:

{% highlight twig %}
{% raw %}
{% set var = [1,2,[3,4,[5,6]]] %}
{% set var = dict_set(var, '2.2.[]', 7) %}
{% set var = dict_set(var, '2.2.[]', 8) %}
{% set var = dict_set(var, '2.3', 9) %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
  1,
  2,
  [
    3,
    4,
    [
      5,
      6,
      7,
      8
    ],
    9
  ]
]
{% endhighlight %}

## dict_unset

You can use the **dict_unset** function to remove items by key from an array or object.

You can unset deeply nested keys in a single line using dot-notation:

{% highlight twig %}
{% raw %}
{% set person = {"person":{"name":{"first":"Jane","last":"Tester"},"age":28,"location":"Secret"}} %}
{% set person = dict_unset(person, ['person.name.last','person.age','person.location']) %}
{{person|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "person": {
        "name": {
            "first": "Jane"
        }
    }
}
{% endhighlight %}

## dns_get_record

(Added in [10.2.6](/releases/10.2.6/))

Resolve DNS records by hostname and type. This enables workflows like verifying domain ownership via TXT records, validating SPF/DKIM, verifying MX servers, etc.

`dns_get_record(hostname,type)`

* **hostname**: The lookup hostname.
* **type**: The record type (`a`, `aaaa`, `caa`, `cname`, `mx`, `ns`, `ptr`, `soa`, `srv`, `txt`)

{% highlight twig %}
{% raw %}
{{dns_get_record('cerb.ai','a')|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
    {
        "host": "cerb.ai",
        "class": "IN",
        "ttl": 77,
        "type": "A",
        "ip": "54.192.81.51"
    },
    {
        "host": "cerb.ai",
        "class": "IN",
        "ttl": 77,
        "type": "A",
        "ip": "54.192.81.69"
    }
]
{% endhighlight %}

## dns_host_by_ip

(Added in [10.2.6](/releases/10.2.6/))

Resolve a hostname from an IP. If a name can't be resolved for a valid IP, the IP is returned. If an invalid IP is provided, the result is an empty string.

`dns_host_by_ip(ip)`

* **ip**: The IP address to reverse lookup a hostname.

{% highlight twig %}
{% raw %}
{{dns_host_by_ip('54.148.127.4')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
cerb.email
{% endhighlight %}

## json_decode

You can decode a JSON-encoded string with the **json_decode** function:

{% highlight twig %}
{% raw %}
{% set json_string = "{\"name\":\"Joe Customer\",\"order_id\":12345}" %}
{% set json = json_decode(json_string) %}
Customer: {{json.name}}
Order #: {{json.order_id}}	
{% endraw %}
{% endhighlight %}

{% highlight text %}
Customer: Joe Customer
Order #: 12345
{% endhighlight %}

This returns an [object](/docs/scripting/arrays-objects/).

## jsonpath_set

This is nearly identical to [dict_set](#dict_set).

{% highlight twig %}
{% raw %}
{% set json_string = "{\"name\":\"Joe Customer\",\"order_id\":12345}" %}
{% set json = json_decode(json_string) %}
{% set json = jsonpath_set(json, 'order_id', '67890') %}
{{json.order_id}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
67890
{% endhighlight %}

You can specify an array by appending `[]` without a leading dot (`.`):

{% highlight twig %}
{% raw %}
{% set json_string = "{\"team\":{\"groups\":[]}}" %}
{% set json = json_decode(json_string) %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Support') %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Sales') %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Development') %}
{{json|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
  "team": {
    "groups": [
      "Support",
      "Sales",
      "Development"
    ]
  }
}
{% endhighlight %}

## kata_parse

Parses a KATA text block into an object.

{% highlight twig %}
{% raw %}
{% set kata %}
colors@list:
  red
  green
  blue
size@int: 100
{% endset %}
{{kata_parse(kata)|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "colors@list": "red\ngreen\nblue",
    "size@int": "100"
}
{% endhighlight %}

## max

Return the largest value in an array or object.

{% highlight twig %}
{% raw %}
{% set numbers = [1,9,8,4,2] %}
{{max(numbers)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
9
{% endhighlight %}

## min

Return the smallest value in an array or object.

{% highlight twig %}
{% raw %}
{% set numbers = [1,9,8,4,2] %}
{{min(numbers)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## random

Return a random item from a string or array, or a random number between 0 and the given number (inclusive).

{% highlight twig %}
{% raw %}
{{random([1,2,3,4,5,6,7,8,9,0])}}
{{random("abcdefghijklmnopqrstuvwxyz")}}
{{random(20)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
9
o
17
{% endhighlight %}

## random_string

Generate a random string of the given length.  This is useful for generating confirmation codes or temporary passwords.

{% highlight twig %}
{% raw %}
{{random_string(16)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
61AE3XG3ZMW8QDTM
{% endhighlight %}

## range

Return an array with values between `from` and `to` (inclusive).

`range(from,to,step)`

{% highlight twig %}
{% raw %}
{{range(5,15)|json_encode}}
{{range(5,15,2)|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[5,6,7,8,9,10,11,12,13,14,15]
[5,7,9,11,13,15]
{% endhighlight %}

## regexp_match_all

`regexp_match_all(pattern, string, group)`

{% highlight twig %}
{% raw %}
{% set headers = 
"X-Mailer: Cerb
From: customer@cerb.example
To: support@cerb.example
"
%}
{% set results = regexp_match_all("#^(.*?): (.*?)$#m", headers) %}
{{results|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
  [
    "X-Mailer: Cerb",
    "From: customer@cerb.example",
    "To: support@cerb.example"
  ],
  [
    "X-Mailer",
    "From",
    "To"
  ],
  [
    "Cerb",
    "customer@cerb.example",
    "support@cerb.example"
  ]
]
{% endhighlight %}

## shuffle

Randomize an array:

{% highlight twig %}
{% raw %}
{{shuffle([1,2,3,4,5])|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[2,4,5,1,3]
{% endhighlight %}

## validate_email

Validate an email address:

{% highlight twig %}
{% raw %}
{{validate_email('kina')|json_encode}}
{{validate_email('kina#cerb.example')|json_encode}}
{{validate_email('kina@cerb.example')|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
false
false
true
{% endhighlight %}

## validate_number

Validate a number:

{% highlight twig %}
{% raw %}
{{validate_number('abcde')|json_encode}}
{{validate_number('20.f')|json_encode}}
{{validate_number(10)|json_encode}}
{{validate_number('123.45')|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
false
false
true
true
{% endhighlight %}

## vobject_parse

Parse a block of text in VObject format (e.g. vCard, iCal).

`vobject_parse(text)`

**Arguments:**

|---
| Name | Notes
|-|-
| `text` | The VOBJECT text to parse

**Returns:** An object with properties and parameters.

{% highlight twig %}
{% raw %}
{% set vcard %}
begin:vcard
source:ldap://cn=Meister%20Berger,o=Universitaet%20Goerlitz,c=DE
name:Meister Berger
fn:Meister Berger
n:Berger;Meister
bday;value=date:1963-09-21
o:Universit=E6t G=F6rlitz
title:Mayor
title;language=de;value=text:Burgermeister
note:The Mayor of the great city of
  Goerlitz in the great country of Germany.
email;internet:mb@goerlitz.de
home.tel;type=fax,voice,msg:+49 3581 123456
home.label:Hufenshlagel 1234\n
 02828 Goerlitz\n
 Deutschland
end:vcard
{% endset %}
{{vobject_parse(vcard)|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "VCARD": [
        {
            "props": {
                "SOURCE": [
                    {
                        "params": [],
                        "value": "ldap://cn=Meister%20Berger,o=Universitaet%20Goerlitz,c=DE"
                    }
                ],
                "NAME": [
                    {
                        "params": [],
                        "value": "Meister Berger"
                    }
                ],
                "FN": [
                    {
                        "params": [],
                        "value": "Meister Berger"
                    }
                ],
                "N": [
                    {
                        "params": [],
                        "value": "Berger;Meister"
                    }
                ],
                "BDAY": [
                    {
                        "params": {
                            "value": "date"
                        },
                        "value": "1963-09-21"
                    }
                ],
                "O": [
                    {
                        "params": [],
                        "value": "Universit=E6t G=F6rlitz"
                    }
                ],
                "TITLE": [
                    {
                        "params": [],
                        "value": "Mayor"
                    },
                    {
                        "params": {
                            "language": "de",
                            "value": "text"
                        },
                        "value": "Burgermeister"
                    }
                ],
                "NOTE": [
                    {
                        "params": [],
                        "value": "The Mayor of the great city of Goerlitz in the great country of Germany."
                    }
                ],
                "EMAIL": [
                    {
                        "params": {
                            "internet": ""
                        },
                        "value": "mb@goerlitz.de"
                    }
                ],
                "HOME.TEL": [
                    {
                        "params": {
                            "type": "fax,voice,msg"
                        },
                        "value": "+49 3581 123456"
                    }
                ],
                "HOME.LABEL": [
                    {
                        "params": [],
                        "value": "Hufenshlagel 1234\n02828 Goerlitz\nDeutschland"
                    }
                ]
            }
        }
    ]
}
{% endhighlight %}

## xml_attr

Return a single attribute from an XML node.

`xml_attr(xml_node, attr)`

**Arguments:**

|---
| Name | Notes
|-|-
| `xml_node` | An single XML node, usually from [xml_xpath](#xml_xpath)
| `attr` | The name of an attribute

**Returns:** A string from the given XML attribute, or `false`.

{% highlight twig %}
{% raw %}
{% set xml_string %}
<?xml version = "1.0" encoding = "UTF-8"?>
<Movies>
    <Movie rating="R">
        <Title runtime="142">The Shawshank Redemption</Title>
        <Genre>Drama</Genre>
        <Director>
            <Name highratedmovie="The Mist">
                <First>Frank</First>
                <Last>Darabont</Last>
            </Name>
        </Director>
        <Studio>Columbia Pictures</Studio>
        <Year>1994</Year>
    </Movie>
</Movies>
{% endset %}
{% set xml = xml_decode(xml_string) %}
{% set movie = xml_xpath(xml, '//Movie')|first %}
{% set runtime = xml_attr(movie.Title,'runtime') %}
The runtime of {{movie.Title}} is {{runtime ? (60*runtime)|secs_pretty : 'unknown'}}.
{% endraw %}
{% endhighlight %}

{% highlight text %}
The runtime of The Shawshank Redemption is 2 hours, 22 mins.
{% endhighlight %}

## xml_attrs

Return all attributes from an XML node.

`xml_attrs(xml_node)`

**Arguments:**

|---
| Name | Notes
|-|-
| `xml_node` | An single XML node, usually from [xml_xpath](#xml_xpath)

**Returns:** An array of attribute keys and values.

{% highlight twig %}
{% raw %}
{% set xml_string %}
<?xml version = "1.0" encoding = "UTF-8"?>
<Movies>
    <Movie rating="R">
        <Title runtime="177">The Godfather</Title>
        <Genre> Crime Drama </Genre>
        <Director>
            <Name>
                <First>Francis Ford</First>
                <Last>Coppola</Last>
            </Name>
        </Director>
        <Studio>Paramount Pictures</Studio>
        <Year>1972</Year>
    </Movie>
    <Movie rating= "R">
        <Title runtime="142">The Shawshank Redemption</Title>
        <Genre>Drama</Genre>
        <Director>
            <Name highratedmovie="The Mist">
                <First>Frank</First>
                <Last>Darabont</Last>
            </Name>
        </Director>
        <Studio>Columbia Pictures</Studio>
        <Year>1994</Year>
    </Movie>
</Movies>
{% endset %}
{% set xml = xml_decode(xml_string) %}
{% set movies = xml_xpath(xml, '//Movie') %}
{{xml_attrs(movies[1])|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "rating": "R"
}
{% endhighlight %}

## xml_decode

You can decode an XML[^xml] string into an XML object with the **xml_decode** function.

Use the [xml_xpath](#xml_xpath) function to extract values with XPath[^xpath] queries.

`xml_decode(xml_string,namespaces,mode)`

* **xml_string**: The string of XML to convert into an object.
* **namespaces**: An optional array of namespaces.
* **mode**: Use `html` to convert an HTML DOM into an XML document.

{% highlight twig %}
{% raw %}
{% set string_of_xml = 
"<response>
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>"
-%}
{% set xml = xml_decode(string_of_xml) %}
{{xml_encode(xml)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
<?xml version="1.0"?>
<response>
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>
{% endhighlight %}

## xml_encode

You can encode an object as XML with the **xml_encode** function:

{% highlight twig %}
{% raw %}
{% set string_of_xml = 
"<response xmlns=\"http://www.example.com/api/\">
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>"
-%}
{% set xml = xml_decode(string_of_xml) %}
{{xml_encode(xml.client_id)}}	
{% endraw %}
{% endhighlight %}

{% highlight text %}
<client_id>1</client_id>
{% endhighlight %}

## xml_xpath

Use the **xml_xpath** function to extract values with XPath[^xpath] queries:

{% highlight twig %}
{% raw %}
{% set string_of_xml = 
"<response>
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set client_id = xml_xpath(xml, '//client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Client ID: 1
Invoice ID: 123
{% endhighlight %}

## xml_xpath_ns

You can define an XML namespace with the **xml_xpath_ns** function:

{% highlight twig %}
{% raw %}
{% set string_of_xml = 
"<response xmlns=\"http://www.example.com/api/\">
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set xml = xml_xpath_ns(xml, 'ns', 'http://www.example.com/api/') %}
{% set client_id = xml_xpath(xml, '//ns:client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//ns:invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Client ID: 1
Invoice ID: 123
{% endhighlight %}

## xml_xpath_remove

Remove elements from an XML document with an XPath query.

`xml_xpath_remove(xml,path)`

* **xml**: An XML object created by [xml_decode](#xml_decode).
* **path**: The [XPath](#xml_xpath) query to match elements for removal.

{% highlight twig %}
{% raw %}
{% set string_of_xml =
"<response>
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set xml = xml_xpath_remove(xml, '//invoice_id') %}
{{xml_encode(xml)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
<?xml version="1.0"?>
<response>
  <client_id>1</client_id>
</response>
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/commands/" class="prev">&lt; Commands</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/filters/" class="prev">Filters &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>