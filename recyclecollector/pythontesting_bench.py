#!/usr/bin/python
# -*- coding: ascii -*-

import pychecker.checker
import time
import serial

def serialConnect():
  serlocations=['/dev/ttyACM', '/dev/ttyACM0', '/dev/ttyACM0', '/dev/ttyACM1', '/dev/ttyACM2', '/dev/ttyACM3', '/dev/ttyACM4', '/dev/ttyACM5', '/dev/ttyUSB0', '/dev/ttyUSB1', '/dev/ttyUSB2', '/dev/ttyUSB3', '/dev/ttyUSB4', '/dev/ttyUSB5', '/dev/ttyUSB6', '/dev/ttyUSB7', '/dev/ttyUSB8', '/dev/ttyUSB9', '/dev/ttyUSB10', '/dev/ttyS0', '/dev/ttyS1',  '/dev/ttyS2', 'com1', 'com2', 'com3', 'com4', 'com5', 'com6', 'com7', 'com8', 'com9', 'com10', 'com11', 'com12', 'com13', 'com14', 'com15', 'com16', 'com17', 'com18', 'com19', 'com20', 'com21', 'end']   
for device in serlocations:
      try:
        ser = serial.Serial(
          port=device,
          baudrate=9600,
          parity=serial.PARITY_ODD,
          stopbits=serial.STOPBITS_ONE,
          bytesize=serial.SEVENBITS
          )
        print device
        return ser
      except:
          x=0
      if device == 'end':
        print "No Device Found"
        
ser = serialConnect()
if ser:
  ser.write("Test")
  ser.timeout=5
  for i in ser.readlines():
      print i

dataName = raw_input()
dataSuite = raw_input()
dataFloor = raw_input()
dataSpaceType = raw_input()
dataWasteType = raw_input()

## Select and configure the port
myPort = serial.Serial('/dev/ttyS1', 9600, timeout = 10)

## Dump some data out of the port
myPort.write("ENQ")

## Wait for data to come in- one byte, only
dataWeight = myPort.read()

## Echo the data to the command prompt
print "You entered " + dataWeight

## Close the port so other applications can use it.
myPort.close()

# Prepare the dictionary to write
dict = {}
dict['date'] = time.strftime('%m/%d/%Y')
dict['time'] = time.strftime('%H:%M:%S')
dict['dataName'] = dataName
dict['dataSuite'] = dataSuite
dict['dashboardFloor'] = dataFloor
dict['dashboardType'] = dataSpaceType
dict['dashboardWastetype'] = dataWasteType
dict['dashboardWeight'] = dataWeight
print dict