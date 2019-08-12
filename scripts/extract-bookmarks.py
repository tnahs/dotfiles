#!/usr/bin/env python

"""
https://docs.python.org/dev/library/plistlib.html
"""

import os
import plistlib

# load bookmarks plist into dict
relpath = 'Library/Safari/Bookmarks.plist'
fullpath = os.path.join(os.environ['HOME'], relpath)
plist = plistlib.readPlist(fullpath)

# get the reading list node
for child in plist['Children']:
  if child.get('Title', None) == 'com.apple.ReadingList':
    bookmarks = child['Children']

# extract urls from each
urls = (bookmark['URLString'] for bookmark in bookmarks)
print('\n'.join(urls))