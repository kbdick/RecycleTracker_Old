#!/usr/bin/python
# -*- coding: ascii -*-

import time
import serial
from time import sleep

dataname = raw_input()
datasuite = raw_input()
datafloor = raw_input()
dataspacetype = raw_input()
datawastetype = raw_input()

## Select and configure the port
ser = serial.Serial(
  port='/dev/ttyS1', 
  baudrate=1200, 
  parity=serial.PARITY_NONE,
  stopbits=serial.STOPBITS_ONE,
  bytesize=serial.EIGHTBITS,
  rtscts=1,
  dsrdtr=False,
  xonxoff=False,
  writeTimeout=0,
  timeout=5)
  
while True:
  ## Dump some data out of the port
  ser.write("ENQ")
  dataweight=ser.read(ser.inWaiting())
  if len(dataweight) > 0:
    print "You entered " + dataweight
  sleep(1)
ser.close()

# Prepare the dictionary to write
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
