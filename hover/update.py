#!/usr/bin/env python

from __future__ import print_function

from api import HoverException
from api import HoverInterface

import fcntl
import socket
import struct
import sys
import urllib

try:
    import simplejson as json
except ImportError:
    import json

def get_domain_details(hover, domain):
    domains = hover.call('/dns', method='GET')['domains']
    filtered = filter(lambda x: domain in x['domain_name'], domains)
    return json.dumps(filtered)

def get_ip_address(ifname):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(s.fileno(), 0x8915, \
                            struct.pack('256s', ifname[:15]))[20:24])

def update_a_records(hover, domain, ip):
    domains = hover.call('/dns', method='GET')['domains']
    filtered = filter(lambda x: domain == x['domain_name'], domains)

    if filtered == []:
        return json.dumps({'error': 'Unknown domain'})

    for record in filtered[0]['entries']:
        if record['type'] != 'A' or record['content'] == ip:
            continue

        uri = '/dns/{0}'.format(record['id'])
        data = urllib.urlencode({'content': ip})
        hover.call(uri, method='PUT', data=data)
        record['content'] = ip

    return json.dumps(filtered[0]['entries'])

if __name__ == '__main__':
    from argparse import ArgumentParser

    try:
        socket.gethostbyname('google.com')
    except:
        sys.exit(255)

    argparse = ArgumentParser()
    argparse.add_argument('username', help='account username')
    argparse.add_argument('password', help='account password')
    argparse.add_argument('domain', help='domain to update')

    argparse.add_argument('-u', '--update', dest='update',
                          default=False, action='store_true',
                          help='update record with IP address')

    args = argparse.parse_args()
    hover = HoverInterface(args.username, args.password)

    if args.update:
        update_a_records(hover, args.domain, get_ip_address('enp0s20f0'))
    else:
        print(get_domain_details(hover, args.domain))

    sys.exit(0)

