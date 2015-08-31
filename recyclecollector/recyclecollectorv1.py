#!/usr/bin/python
# -*- coding: ascii -*-

import time
import serial
from time import sleep
import json
import gspread
from oauth2client.client import SignedJwtAssertionCredentials

json_key = json.load(open('client_secret_262419920451.project.googleusercontent.com.json'))
scope = ['https://spreadsheets.google.com/feeds']

credentials = SignedJwtAssertionCredentials(json_key['262419920451.project.googleusercontent.com'], json_key['sldylM-l3_n_E_BjbmeuIquJ'], scope)

gc = gspread.authorize(credentials)

userSheetKey = '1LnQsIM5kSHl4g1aYNoT7-3bvB0yp2EWE1p20r56XEc8'
dataSheet = gc.open_by_key(userSheetKey).Data
   
dataname = raw_input()
datasuite = raw_input()
datafloor = raw_input()
dataspacetype = raw_input()
datawastetype = raw_input()

## Select and configure the port
ser = serial.Serial(
   port='/dev/ttyUSB0', 
   baudrate=9600, 
   parity=serial.PARITY_NONE, 
   stopbits=serial.STOPBITS_ONE, 
   bytesize=serial.EIGHTBITS,
   rtscts=1,
   dsrdtr=False,
   xonxoff=False,
   writeTimeout = 0,
   timeout = 5 
)

while True:
   dataweight = ser.read(ser.inWaiting())
   if len(dataweight) > 0:
      print "You entered " + dataweight
   sleep(1)
ser.close()

## Prepare the dictionary to write
dict = {}
dict['datadate'] = time.strftime('%m/%d/%Y')
dict['datatime'] = time.strftime('%H:%M:%S')
dict['dataname'] = dataname
dict['datasuite'] = datasuite
dict['datafloor'] = datafloor
dict['dataspacetype'] = dataspacetype
dict['datawastetype'] = datawastetype
dict['dataweight'] = dataweight
print dict

dataSheet.insert_row(dict, index=1)