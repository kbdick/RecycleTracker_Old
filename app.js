var express = require("express");

// Create HTTP Server
var app = express();
var server = require("http").createServer(app);
// Attach Socket.io server 
var io = require("socket.io")(server);
// Indicate port 8080 as host
var port = process.env.PORT || 8080;

// Make the server listens on port 3000
server.listen(port, function() {
  console.log("Server listening on port %d", port);
});

// Routing to static files
app.use(express.static(__dirname + "/public"));

// Socket server listens on connection event
io.on("connection", function(socket) {
  console.log("Connected and ready!");


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
    
  });
});
