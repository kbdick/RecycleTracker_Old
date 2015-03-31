#!/usr/bin/python

# https://www.mattcutts.com/blog/write-google-spreadsheet-from-python/

import time
import serial
import gdata.spreadsheet.service

email = 'kbdick@recycletracker.io'
password = '5chw@rtzg3r@t'
space = raw_input()
suitenum = raw_input()
floor = raw_input()
spacetype = raw_input()
wastetype = raw_input()

## Select and configure the port
myPort = serial.Serial('/dev/ttyS1', 115200, timeout = 10)

## Dump some data out of the port
myPort.write("ENQ")

## Wait for data to come in- one byte, only
x = myPort.read()

## Echo the data to the command prompt
print "You entered " + x

## Close the port so other applications can use it.
myPort.close()


# Find this value in the url with 'key=XXX' and copy XXX below
spreadsheet_key = '1LnQsIM5kSHl4g1aYNoT7-3bvB0yp2EWE1p20r56XEc8'
# All spreadsheets have worksheets. I think worksheet #1 by default always
# has a value of 'od6'
worksheet_id = 'od6'

spr_client = gdata.spreadsheet.service.SpreadsheetsService()
spr_client.email = email
spr_client.password = password
spr_client.source = 'RecycleTracker'
spr_client.ProgrammaticLogin()

# Prepare the dictionary to write
dict = {}
dict['date'] = time.strftime('%m/%d/%Y')
dict['time'] = time.strftime('%H:%M:%S')
dict['space'] = space
dict['suitenum'] = suitenum
dict['floor'] = floor
dict['spacetype'] = spacetype
dict['wastetype'] = wastetype
dict['weight'] = weight
print dict

entry = spr_client.InsertRow(dict, spreadsheet_key, worksheet_id)
if isinstance(entry, gdata.spreadsheet.SpreadsheetsList):
  print "Insert row succeeded."
else:
  print "Insert row failed."