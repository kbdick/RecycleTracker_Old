#!/usr/bin/python
# -*- coding: ascii -*-

import time
import serial
import readline
from time import sleep
import json
import gspread
from oauth2client.service_account import ServiceAccountCredentials
print 'Ready to receive data...'
## Prepare the dictionary to write - this works, but puts the array string in instead of the data
dict = {}

recycledate = time.strftime('%m/%d/%y')
dict['recycledate'] = recycledate

recycletime = time.asctime( time.localtime(time.time()) )
dict['recycletime'] = recycletime

recycletimestamp = time.time()
dict['recycletimestamp'] = recycletimestamp

name = raw_input('Scan the name of the tenant: ')
dict['name'] = name
print "Received %s." % name

suite = raw_input('Scan the suite of the tenant: ')
dict['suite'] = suite
print "Received %s." % suite

floor = raw_input('Scan the floor of the tenant: ')
dict['floor'] = floor
print "Received %s." % floor

spacetype = raw_input('Scan the space type: ')
dict['spacetype'] = spacetype
print "Received %s." % spacetype

wastetype = raw_input('Scan the waste type: ')
dict['wastetype'] = wastetype
print "Received %s." % wastetype

custodian = raw_input('Scan the custodian entering the data: ')
dict['custodian'] = custodian
print "Received %s." % custodian
"""
## Select and configure the port
   ser = serial.Serial(
   port='/dev/ttyUSB0', 
   baudrate=1200, 
   parity=serial.PARITY_NONE, 
   stopbits=serial.STOPBITS_ONE, 
   bytesize=serial.EIGHTBITS,
   rtscts=1,
   dsrdtr=False,
   xonxoff=False,
   writeTimeout = 0,
   timeout = 5 
)

enquirecode = "005\r"
ser.write(bytes(enquirecode))

while True:
   weight = ser.read(ser.inWaiting())
   if len(weight) > 0:
      dict[weight] = weight
      print "Received " + weight
   sleep(1)
ser.close()

"""

data = [recycledate, recycletime, recycletimestamp, name, suite, floor, spacetype, wastetype, custodian]

print 'Pushing data to server...'

scope = ['https://spreadsheets.google.com/feeds']

credentials = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)

gc = gspread.authorize(credentials)

dataSheet = gc.open('RecycleTracker_mmart').worksheet('RawData')

dataSheet.append_row(data)

print "Success"
print dict