RecycleTracker
================

Copyright 2013, 2014, 2015, 2016 Kevin Dick.

RecycleTracker 

RecycleTracker is a web app designed to assist buildings in tracking their recycling rates by location using a simple scale with a serial (RS-232 is most common) connection, RaspberryPi or PCDuino with Python to collect scale data, Google Sheets for the data store, and a web app. 

The controller software ("RecycleCollector") collects the data using a barcode scanner and standard scale indicator, sending the information to Google Sheets (Google Sheets is easy and friendly for data analysis, but feel free to build your own back end). At the dock level, a building with a scale will connect with an app through the scale indicator. Using a barcode system, the building can track its waste and recycling on a daily basis. The dock app provides a visible data collection function, and sends the data to the front end app.

The front end of the app ("RecycleTracker", currently being repurposed to Angular) is a web page that displays on a tablet or tv and show the previous day's recycling rate, tips about how to recycle, graphs of progress over time, or other information - including a bullet chart for various recyclables, a leaderboard to show floor and/or suite rates in comparison, and a line graph for the rate of consumable recycling over time.

The app is designed to give building managers better real-time information on the recycling system to help them make improvements and get better recycling rates from tenants and visitors.


Dependencies:

For Collector

pySerial
A Google Apps Account (with OAUTH2 keys, etc.)

For Tracker

see package.json