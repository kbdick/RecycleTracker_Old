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
      client_email: 'recycletracker@recycletracker-1013.iam.gserviceaccount.com',
      private_key: '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCQwABWGseYc/tK\nERx737+GO7FJAz99TJjFj3rOeRIWCf/6u1Lvo6PTF+3C/gTSSckmbOJxB/mwgFCu\nObY/MGLmtnsLffgAuUVa6+OWBJmR3vBfLBUiOjxdswuLeP6y8fU2j2rqp90C97IC\nkmbAAlUD/r0lOrx2V7toDwetuCARJaLFTlyKekKtJ0wILdFi0vP4FwjXipdsRob3\nVsc+siKcmA16AKo+eGA4qswK5B2ekBjf0q0sWRh9Q/1IdK7Bjx2g9n0Jk3LiZzKr\n2CN28JQ7/uBLg1hiK485LIuPG/Ls4ju5UAw73yJAzSNofRFd7L9H1IRF0R8B3gLd\nFvkQYEyBAgMBAAECggEASxGIGx+gS8w6klr1brjHVxI2CyuIDa9fu3WBtvrLCmr9\nOkdT57vyBlPulqWuUnC5xRfLB9ue/o5NSU3c2kB5yjTw8zDNIXL0KQcU7IROMHxy\nJKlz/GA/Vki4wAhr7tnU1gri4/dSg2t6AiNy7jlHZd8CsQAZJTaylnDVBp7q4nja\nyMirmreZJOMqVhgGE8bhJMSA9W9XkhA4VY3HFDJNYpEi7Srq6WcPbIFqq2zEe6FP\nOB9hUpCNO6Ng83vqR0LQmn1E9unlkbnrUAnHAzg//LWBnjqy5bCPJHW57+cxMn2s\nhZRSD8AHJGvp9Vw1VPLXqO/HTpQeoBmUB8yY9vWwAQKBgQDqBZFgCcvhPqZ6E8lj\ny36uXy26w1Jv0d013H8hT64iRtfArNEwnm0DgTZs5+T/sDEx8P4M6AlW3sO4P7YO\npe/9zDBpNWjqKNRir5Rn/egQy+Zp08cpTTVV/bQOzw0YIdkOJUm1RuR7C9T++SKi\nUDtmrC0FtIhyxnSm6PNo1DVOoQKBgQCeWCGU7R5twB5OdyGaLrdyfbklodmifGAE\n7Vzmmq0ZdJVi1oqc0AYdFsYtFljPO6qXziblPvb4RTnyITPH8ZWa1ciz5iGVFJCT\nO2e+JY2oAaJP74XS8lk4BP3/bzcgvQEr3dUsS3Yv/GU/wHE4e4JPsRRoA4jd+OME\nJkSEm92R4QKBgQCZA4j5VY50OYWafoOId87d7qe03O9y47KS/Bg3zKScDtwVRCoH\ncx7uUrcmYD2wHSEdeWhzQeiRX1hziVzdmQwhUzg4Ik72BDpSSGFt2Wu6R8fhXDJ1\nw+Di1966bBEwvTjx8dmO6MqN1b+v82/81x7v1BYgC9nHyhEN7XTyDwbH4QKBgBmJ\nKvlCeDrI1dpfmfqseActwVMRU/DBUBbbVLUX0rydMY47/SSm46WDS7hvtyjMfYl3\nxIwJ6HhHab3jnt8q1a6ftXtVrKrHIz2rQeLHWZ3zjYKIpTNMxBilrXSpMeHEuVCi\nuMMo9Elu0cFDPr8WJADIFPtlPohVn/7GURx1qnjhAoGBAJaH8Qs7iHn0x3AC/VoM\nD/zme+3MLtlgLXRaS711zNY1a+YzJF7OiqButs2V2tILx0vc6oRfkRs0jwYvtAUX\ns76grxWVtC74dZn/LYzUemgMA06o7Qhg5pMHmoF1cNXPkBE/x83lWs/fUnI/agRk\nJmgbUTs0MgyAsaLz7trOUwnD\n-----END PRIVATE KEY-----\n'
    };
 
    doc.useServiceAccountAuth(creds_json, step);
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