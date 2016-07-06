var express = require("express");
var http = require('http');
var https = require('https');
var path = require('path');
var fs = require('fs');
var socketio = require('socket.io');

// Create HTTP Server
var app = express();
var server = require("http").createServer(app);

// Attach Socket.io server 
var io = socketio.listen(server)
// Indicate port 8080 as host
var port = process.env.PORT || 8080;

// Make the server listens on port 3000
server.listen(process.env.PORT || 3000, process.env.IP || "0.0.0.0", function(){
  var addr = server.address();
  console.log("Server listening at", addr.address + ":" + addr.port);
    });

// Routing to static files
app.use(express.static(__dirname + "/public"));

// Socket server listens on connection event
io.on("connection", function(socket) {
  console.log("Connected and ready!");
    });


// Get data from Google Sheets
var Spreadsheet = require('edit-google-spreadsheet');
 
Spreadsheet.load({
  debug: true,
  spreadsheetName: 'RecycleTracker_mmart',
  worksheetName: 'RawData',
  oauth2: 'recyclecollector/RecycleTracker-5353567360a6.json'
  });
    
  function sheetReady(err, spreadsheet) {
  if(err) throw err;
 
  spreadsheet.receive(function(err, rows, info) {
    if(err) throw err;
    console.log("Found rows:", rows);
    // Found rows: { '3': { '5': 'hello!' } } 
  });
}