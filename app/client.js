var express = require('express')
var app = express()
var server = require('http').createServer(app)
var mysql = require('mysql')
var path = require('path')
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

// Serve static files
app.use(express.static('public'));

// Views
app.get('/', function (req, res){
	res.sendFile(path.join(__dirname + '/views/index.html'))
});

app.get('/home', function(req, res){
	res.sendFile(path.join(__dirname + '/views/home.html'))
})


server.listen(3001)
console.log('Server is running at http://localhost:3001')