var express = require("express");
var socketio = require('socket.io');
var google = require('googleapis');
var GoogleSpreadsheet = require('google-spreadsheet');
var async = require('async');

// Create HTTP Server
var app = express();
var server = require("http").createServer(app);

// Attach Socket.io server 
var io = socketio.listen(server);

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

/* oauth2 authentication
var key = require('RecycleTracker-5353567360a6.json');
var scope = ['https://spreadsheets.google.com/feeds'];
var jwtClient = new google.auth.JWT(key.client_email, null, key.private_key, scope, null);

  jwtClient.authorize(function(err, tokens) {
    if (err) {
      console.log(err);
      return;
    }
  });
*/

// spreadsheet key is the long id in the sheets URL 
var doc = new GoogleSpreadsheet('1LnQsIM5kSHl4g1aYNoT7-3bvB0yp2EWE1p20r56XEc8');
var sheet;
 
async.series([
  function setAuth(step) {
    // see notes below for authentication instructions! 
    var creds = require('client_secret.json');
    // OR, if you cannot save the file locally (like on heroku) 
    var creds_json = {
      client_email: 'yourserviceaccountemailhere@google.com',
      private_key: 'your long private key stuff here'
    };
 
    doc.useServiceAccountAuth(creds, step);
  },
  function getInfoAndWorksheets(step) {
    doc.getInfo(function(err, info) {
      console.log('Loaded doc: '+info.title+' by '+info.author.email);
      sheet = info.worksheets[0];
      console.log('sheet 1: '+sheet.title+' '+sheet.rowCount+'x'+sheet.colCount);
      step();
    });
  },
  function workingWithRows(step) {
    // google provides some query options 
    sheet.getRows({
      offset: 1,
      limit: 20000,
      orderby: 'co3'
    }, function( err, rows ){
      console.log('Retrieved '+rows.length+' rows');
 
      step();
    });
  }
  
]);
/*
var query = new google.visualization.Query(https://docs.google.com/spreadsheets/d/1LnQsIM5kSHl4g1aYNoT7-3bvB0yp2EWE1p20r56XEc8/edit#gid=554063149);
query.setQuery('select weight, sum(weight) group by wastetype');
query.send(handleQueryResponse); 
*/