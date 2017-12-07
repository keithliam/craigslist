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

var connection = mysql.createConnection({
	host	 : 'localhost',
	user	 : 'root',
	password : 'Amazing!',
	database : 'craigslist' 
})

connection.connect();

// Callback Functions
function isExisting(query, callback){
	try {
		connection.query('SELECT * FROM user WHERE email = ?', query, function(err, rows, fields){
			if(rows.length == 0){
				return callback(0, 0, 0, 0)
			} else {
				return callback(1, 0, rows, rows[0].type)
			}
		})
	} catch (e){
		return callback(0, 1, 0, 0)
	}
}

function getInfo(email, accountType, callback){
	if(accountType == 1){
		var table = 'js_user_js_profile'
	} else if(accountType == 2){
		var table = 'c_user_c_profile'
	} else {
		var table = 'admin'
	}
	try {
		connection.query('SELECT * FROM user x NATURAL JOIN `' + table + '` WHERE email = ?', email, function(err, rows, fields){
			if(accountType == 3){
				return callback(0, 0, rows[0], 0, 0, 0)
			} else if(accountType == 2){
				connection.query('SELECT * FROM c_profile_info WHERE cprofileid = ? AND isapproved = 1', rows[0].cprofileid, function(err, rows1, fields){
					if(rows1.length == 0){
						return callback(0, 0, rows[0], 0, 0, 0)
					} else {
						return callback(1, 0, rows[0], 0, 0, 0)
					}
				})
			} else {
				connection.query('SELECT educbackground FROM js_profile_educbackground WHERE jsprofileid = ?', rows[0].jsprofileid, function(err, rows1, fields){
					connection.query('SELECT workbackground FROM js_profile_workbackground  WHERE jsprofileid = ?', rows[0].jsprofileid, function(err, rows2, fields){
						connection.query('SELECT interest FROM js_profile_interest  WHERE jsprofileid = ?', rows[0].jsprofileid, function(err, rows3, fields){
							return callback(1, 0, rows[0], rows1, rows2, rows3)
						})
					})
				})
			}
		})
	} catch (e){
		return callback(0, 1, 0, 0, 0, 0)
	}
}

// Serve static files
app.use(express.static('public'));

// Views
app.get('/', function (req, res){
	res.sendFile(path.join(__dirname + '/views/index.html'))
});

app.get('/home', function(req, res){
	res.sendFile(path.join(__dirname + '/views/home.html'))
})

app.post('/api/auth', function(req, res){
	isExisting(req.body.email, function(exists, err, rows, accountType){
		if(!exists || err){
			res.send({
				existing	 : exists,
				error		 : err,
				incorrect	 : 0
			})
		} else {
			if(rows[0].password == req.body.pass){
				res
				.cookie('email', rows[0].email)
				.cookie('accountType', accountType)
				.send({
					existing	 : 1,
					error		 : 0,
					incorrect	 : 0
				})
			} else {
				res.send({
					existing	 : 1,
					error		 : 0,
					incorrect	 : 1
				})
			}
		}
	})
})

app.post('/api/get-info', function(req, res){
	getInfo(req.body.email, req.body.accountType, function(approved, err, info, educBG, workBG, interests){
		if(err){
			res.send({
				error	: 1
			})
		} else {
			if(req.body.accountType == 1){	
				res
				.cookie('isApproved', approved)
				.send({
					error	: 0,
					name	: info.name,
					contact	: info.contactno,
					address	: info.address,
					work	: workBG,
					educ	: educBG,
					interest: interests
				})
			} else if(req.body.accountType == 2){	
				res
				.cookie('isApproved', approved)
				.send({
					error	: 0,
					name	: info.name,
					contact	: info.contactno,
					address	: info.address
				})
			} else {	
				res
				.cookie('isApproved', approved)
				.send({
					error	: 0,
				})
			}
		}
	})
})

app.post('/api/edit-js', function(req, res){
	try {
		connection.query('UPDATE user NATURAL JOIN js_user_js_profile SET name = ?, address = ?, contactno = ? WHERE email = ?', [req.body.name, req.body.address, req.body.contact, req.body.email], function(err, rows, fields){})
		connection.query('SELECT jsprofileid FROM user NATURAL JOIN js_user_js_profile WHERE email = ?', req.body.email, function(err1, rows1, fields1){
			try{
				var ctr
				connection.query('DELETE FROM js_profile_educbackground WHERE jsprofileid = ?', rows1[0].jsprofileid, function(err2, rows2, fields2){})
				for(ctr = 0; ctr < req.body.educ.length; ctr++){
					connection.query('INSERT INTO js_profile_educbackground VALUES (?, ?)', [rows1[0].jsprofileid, req.body.educ[ctr].educbackground], function(err2, rows2, fields2){})
				}
				connection.query('DELETE FROM js_profile_workbackground WHERE jsprofileid = ?', rows1[0].jsprofileid, function(err2, rows2, fields2){})
				for(ctr = 0; ctr < req.body.work.length; ctr++){
					connection.query('INSERT INTO js_profile_workbackground VALUES (?, ?)', [rows1[0].jsprofileid, req.body.work[ctr].workbackground], function(err2, rows2, fields2){})
				}
				connection.query('DELETE FROM js_profile_interest WHERE jsprofileid = ?', rows1[0].jsprofileid, function(err2, rows2, fields2){})
				for(ctr = 0; ctr < req.body.interest.length; ctr++){
					connection.query('INSERT INTO js_profile_interest VALUES (?, ?)', [rows1[0].jsprofileid, req.body.interest[ctr].interest], function(err2, rows2, fields2){})
				}
				res.send({
					error 	: 0,
					message : 'Profile successfully updated'
				})
			} catch(e){
				res.send({
					error 	: 1,
					message	: 'There is an error in updating your educational background, work background, and interests'
				})
			}
		})
	} catch (e){
		res.send({
			error 	: 1,
			message : 'There is an error in updating your name, address, and contact no.'
		})
	}
})

app.post('/api/edit-company', function(req, res){
	try {
		connection.query('UPDATE user NATURAL JOIN c_user_c_profile SET name = ?, address = ?, contactno = ? WHERE email = ?', [req.body.name, req.body.address, req.body.contact, req.body.email], function(err, rows, fields){})
		res.send({
			error 	: 0,
			message : 'Profile successfully updated'
		})
	} catch (e){
		res.send({
			error 	: 1,
			message : 'There is an error in updating your name, address, and contact no.'
		})
	}
})

app.post('/api/add-job', function(req, res){
	try {
		connection.query('SELECT cprofileid FROM user NATURAL JOIN c_user_c_profile WHERE email = ?', req.body.email, function(err, rows, fields){
			connection.query('INSERT INTO job(salary, description, dateposted, position, cprofileid) VALUES (?, ?, DATE(NOW()), ?, ?)', [req.body.salary, req.body.description, req.body.position, rows[0].cprofileid], function(err1, rows1, fields1){})
			connection.query('SELECT jobid FROM job WHERE salary = ? and description = ? and position = ? and cprofileid = ?', [req.body.salary, req.body.description, req.body.position, rows[0].cprofileid], function(err2, rows2, fields2){
				var ctr
				for(ctr = 0; ctr < req.body.tags.length; ctr++){
					connection.query('INSERT INTO job_search_tag VALUES (?, ?)', [rows2[0].jobid, req.body.tags[ctr].tagname], function(err3, rows3, fields3){})
				}
			})
			res.send({
				error 	: 0,
				message : 'Job successfully posted'
			})
			
		})
	} catch (e){
		res.send({
			error 	: 1,
			message : 'There is an error in posting the job'
		})
	}
})
// connection.query('SELECT searchtag FROM job_search_tag WHERE jobid = ?', rows[ctr].jobid, function(err1, rows1, fields1){
app.post('/api/get-jobs', function(req, res){
	try {
		connection.query('SELECT jobid, salary, description, position, name FROM user NATURAL JOIN c_user_c_profile NATURAL JOIN job WHERE email = ?', req.body.email, function(err, rows, fields){
			res.send({
				error 	: 0,
				jobs 	: rows
			})
		})
	} catch (e){
		res.send({
			error 	: 1,
			message : 'There is an error in fetching job data'
		})
	}
})


app.get('/api/get-all-jobs', function(req, res){
	try {
		connection.query('SELECT jobid, salary, description, position, name FROM user NATURAL JOIN c_user_c_profile NATURAL JOIN job', function(err, rows, fields){
			res.send({
				error 	: 0,
				jobs 	: rows
			})
		})
	} catch (e){
		res.send({
			error 	: 1,
			message : 'There is an error in fetching job data'
		})
	}
})

app.post('/api/get-cprofiles', function(req, res){
	try {
		connection.query('SELECT cprofileid, name, address, contactno, datecreated, isapproved FROM user NATURAL JOIN c_user_c_profile NATURAL JOIN c_profile_info WHERE isapproved = ?', req.body.isapproved, function(err, rows, fields){
			res.send({
				error 	: 0,
				profiles 	: rows
			})
		})
	} catch (e){
		res.send({
			error 	: 1
		})
	}
})

app.post('/api/apply-job', function(req, res){
	try {
		connection.query('SELECT jsprofileid FROM user NATURAL JOIN js_user_js_profile WHERE email = ?', req.body.email, function(err, rows, fields){
			connection.query('INSERT INTO js_profile_applies_for_job VALUES (?, ?, DATE(NOW()))', [rows[0].jsprofileid, req.body.jobid], function(err1, rows1, fields1){})
			console.log(rows[0].jsprofileid + " - " + req.body.jobid)
			res.send({
				error 	: 0,
				message : 'Successfully applied for job'
			})
		})
	} catch (e){
		res.send({
			error  	: 1,
			message : 'There is an error in processing your application'
		})
	}
})

app.post('/api/accept-cprofile', function(req, res){
	try {
		connection.query('UPDATE c_profile_info SET isapproved = 1, dateapproved = DATE(NOW()) WHERE cprofileid = ?', req.body.cprofileid, function(err, rows, fields){
			res.send({
				error 	: 0
			})
		})
	} catch (e){
		res.send({
			error 	: 1
		})
	}
})

app.post('/api/signup', function(req, res){
	isExisting(req.body.email, function(exists, err, rows, accountType){
		if(exists || err){
			res.send({
				existing	 : exists,
				error		 : err
			})
		} else {
			try {
				connection.query('INSERT INTO user(password, email, type) VALUES (?, ?, ?)', [req.body.pass, req.body.email, req.body.type], function(err, rows, fields){})
				connection.query('SELECT userid FROM user WHERE password = ? AND email = ? AND type = ?', [req.body.pass, req.body.email, req.body.type], function(err1, rows1, fields1){
					if(req.body.type == 1){

						connection.query('INSERT INTO js_user_js_profile(userid, name, datecreated) VALUES (?, ?, DATE(NOW()))', [rows1[0].userid, req.body.name], function(err2, rows2, fields2){})
						connection.query('SELECT jsprofileid FROM js_user_js_profile WHERE userid = ?', rows1[0].userid, function(err3, rows3, fields3){
							connection.query('INSERT INTO js_profile_info VALUES (?, DATE(NOW()))', rows3[0].jsprofileid, function(err4, rows4, fields4){})
						})
					} else {
						connection.query('INSERT INTO c_user_c_profile(userid, name, datecreated) VALUES (?, ?, DATE(NOW()))', [rows1[0].userid, req.body.name], function(err2, rows2, fields2){})
						connection.query('SELECT cprofileid FROM c_user_c_profile WHERE userid = ?', rows1[0].userid, function(err3, rows3, fields3){
							connection.query('INSERT INTO c_profile_info VALUES (?, 0, DATE(NOW()))', rows3[0].cprofileid, function(err4, rows4, fields4){})
							connection.query('INSERT INTO c_user_submits_c_profile VALUES (?, DATE(NOW()))', rows3[0].cprofileid, function(err5, rows5, fields5){})
						})
					}
					res.send({
						existing 	: 0,
						error 	 	: 0
					})
				})
			} catch (e) {
				res.send({
					existing 	: 0,
					error 		: 1
				})
			}
		}
	})
})


server.listen(3000)
console.log('Server is running at http://localhost:3000')