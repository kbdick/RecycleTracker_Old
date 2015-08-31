#!/usr/bin/python
# -*- coding: ascii -*-

import time
import serial
import requests
import os
from flask import Flask
from firebase import firebase
app = Flask('RecycleTracker')

firebase = firebase.FirebaseApplication('https://recycletracker.firebaseio.com', None)
result = firebase.get('/users', '2')
print result

app.run(host=os.getenv(‘IP’, ‘0.0.0.0’),port=int(os.getenv(‘PORT’, 8080)))
"""
dataname = raw_input()
datasuite = raw_input()
datafloor = raw_input()
dataspacetype = raw_input()
datawastetype = raw_input()

## Select and configure the port
myPort = serial.Serial('/dev/ttyS1', 115200, timeout = 10)

## Dump some data out of the port
myPort.write("ENQ")

## Wait for data to come in- one byte, only
dataweight = myPort.read()

## Echo the data to the command prompt
print "You entered " + dataweight

## Close the port so other applications can use it.
myPort.close()

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
"""