#!/usr/bin/env python

from __future__ import print_function

try:
    import simplejson as json
except ImportError:
    import json

import cookielib
import urllib
import urllib2

class HoverException(Exception):
    pass

class HoverInterface(object):
    def _open_connection(self, url, headers={}, method='GET', data=None):
        request = urllib2.Request(url, headers=headers, data=data)
        request.get_method = lambda: method
        return self.__opener.open(request)

    def __init__(self, username, password):
        '''
        Authenticate with the endpoint, get us some cookies.
        '''
        self.__endpoint = 'https://www.hover.com/api'
        handler = urllib2.HTTPCookieProcessor(cookielib.CookieJar())
        self.__opener = urllib2.build_opener(handler)

        headers = {'Context-Type': 'application/x-www-form-urlencoded'}
        data = {'username': username, 'password': password}
        response = self.call('/login', headers=headers, method='POST',
                                 data=urllib.urlencode(data))

    def call(self, uri, headers={}, method='GET', data=None):
        '''
        Invoke method using endpoint, unserialize and return the response.
        '''
        try:
            connection = self._open_connection(self.__endpoint + uri,
                                               headers=headers, method=method,
                                               data=data)

            response = json.loads(connection.read())
            if 'succeeded' not in response or not response['succeeded']:
                raise HoverException('Endpoint signaled a failure')

            return response

        except (urllib2.HTTPError, urllib2.URLError) as err:
            raise HoverException(err.reason)

        except (TypeError, ValueError):
            raise HoverException('Received a malformed response')

