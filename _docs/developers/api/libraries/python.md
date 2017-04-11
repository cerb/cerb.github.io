---
title: Cerb Web-API Library for Python
permalink: /docs/api/libraries/python/
jumbotron:
  title: Cerb Web-API Library for Python
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

The Python library for the Cerb API was contributed by [SteveMcGrath](https://github.com/SteveMcGrath) on GitHub.

You can find it at: <https://github.com/cerb-plugins/CerbAPI-Python.git>

# Cerb7.py

<pre>
<code class="language-python">
import httplib2
import urllib
import rfc822
import datetime
import hashlib
import base64
import sys
import json

DEBUG = False

class API(object):
  accessKey     = None
  secretKey     = None
  host          = None
  base          = None
  
  def __init__(self, username, password, base='http://localhost/cerb/rest'):
    self.accessKey  = username
    self.secretKey  = password
    self.base       = base
    self.ext        = 'json'
    
  def get(self, url):
    return self.__connect('GET', url)
  
  def put(self, url, payload):
    return self.__connect('PUT', url, payload)
  
  def post(self, url, payload):
    return self.__connect('POST', url, payload)
  
  def delete(self, url):
    return self.__connect('DELETE', url)
  
  def __getRFC822Date(self):
    return rfc822.formatdate(
            rfc822.mktime_tz(
              rfc822.parsedate_tz(
                datetime.datetime.now().strftime('%a, %d %b %Y %H:%M:%S'))))
  
  def __connect(self, verb, url, payload={}):
    headers   = {
        'Date': self.__getRFC822Date(),
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
    }
    splitUrl  = urllib.splitquery(url)
    path      = splitUrl[0]
    if splitUrl[1] is not None:
      query   = splitUrl[1]
      fullUrl = '%s/%s.%s?%s' % (self.base, path, self.ext, query)
    else:
      query   = ''
      fullUrl = '%s/%s.%s' % (self.base, path, self.ext)
    verb      = verb.upper()
    http      = httplib2.Http()

    # Building the Authentication
    md5       = hashlib.md5()
    md5.update(self.secretKey)
    secret    = md5.hexdigest()
    fpath     = urllib.splitquery('/' + '/'.join(fullUrl.split('/')[3:]))[0]
    payload   = urllib.urlencode(payload)
    signMe    = '%s\n%s\n%s\n%s\n%s\n%s\n' % (verb,
                                              headers['Date'],
                                              fpath,
                                              query,
                                              payload,
                                              secret
                                             )
    md5      = hashlib.md5()
    md5.update(signMe)
    headers['Cerb-Auth']  = '%s:%s' % (self.accessKey, md5.hexdigest())
    
    # Now we perform the request
    if verb == 'PUT' or verb == 'POST':
      headers['Content-Length'] = str(len(str(payload)))
      response, data = http.request(fullUrl, 
                                    verb, 
                                    headers=headers,
                                    body=payload)    
    else:
      response, data = http.request(fullUrl, 
                                    verb, 
                                    headers=headers)
    
    if DEBUG:
      print '--- REQUEST ---'
      print verb, fullUrl
      print 'HEADERS:'
      for header in headers:
        print '%20s : %s' % (header, headers[header])
      print 'PAYLOAD:\n%s' % payload
      print '\n--- RESPONSE ---'
      print 'HEADERS:'
      for header in response:
        print '%20s : %s' % (header, response[header])
      print 'PAYLOAD:'
      print data
    return json.loads(data)
</code>
</pre>

Usage
=====

Retrieving the current worker's record:

<pre>
<code class="language-python">
from Cerb7 import API as Cerb7

cerb = Cerb7('&lt;access key&gt;','&lt;secret key&gt;','https://cerb.example.com/rest')

me = cerb.get('workers/me?expand=address_')

print me["id"]
print me["_label"]
print me["address_address"]
print me["gender"]
</code>
</pre>

Creating a new ticket:

<pre>
<code class="language-python">
from Cerb7 import API as Cerb7

cerb = Cerb7('&lt;access key&gt;','&lt;secret key&gt;','https://cerb.example.com/rest')

payload = {
  'expand': 'bucket_,group_,custom_',
  'group_id': '1',
  'bucket_id': '5',
  'to': 'customer@example.com',
  'subject': 'This is a new ticket',
  'content_format': 'markdown',
  'content': 'This is\na multi-line\nmessage\n\n-- \nSignature',
  'status': '0', # 0=open, 1=closed, 2=waiting
}
response = cerb.post('tickets/compose', payload )
</code>
</pre>

{% include api_toc.html %}