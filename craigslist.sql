DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

USE craigslist;

CREATE TABLE user(
userid int(6) zerofill auto_increment,
password varchar(50) not null,
email varchar(50) not null,
type int(1) not null,
constraint user_userid_pk primary key(userid),
constraint user_email_uk unique(email)
);

CREATE TABLE admin(
userid int(6) zerofill,
adminid int(6) not null,
constraint admin_adminid_pk primary key(userid)
);

CREATE TABLE c_user_c_profile(
userid int(6) zerofill,
cprofileid int(6) zerofill not null auto_increment,
name varchar(100) not null,
contactno int(11) zerofill,
address varchar(100),
datecreated date not null,
constraint c_user_c_profile_userid_pk primary key(userid),
constraint c_user_c_profile_cprofileid_uk unique(cprofileid)
);

CREATE TABLE c_profile_info(
cprofileid int(6) zerofill not null,
isapproved varchar(50) default "PENDING",
dateapproved date
);

CREATE TABLE c_user_submits_c_profile(
cprofileid int(6) zerofill not null,
datesubmitted date
);

CREATE TABLE js_user_js_profile(
userid int(6) zerofill,
jsprofileid int(6) zerofill not null auto_increment,
name varchar(100) not null,
contactno int(11) zerofill,
address varchar(100),
datecreated date not null,
constraint js_user_js_profile_userid_pk primary key(userid),
constraint js_user_js_profile_jsprofileid_uk unique(jsprofileid)
);

CREATE TABLE js_profile_info(
jsprofileid int(6) zerofill not null,
datecreated date
);

CREATE TABLE js_profile_workbackground(
jsprofileid int(6) zerofill not null,
workbackground varchar(100)
);
CREATE TABLE js_profile_interest(
jsprofileid int(6) zerofill not null,
interest varchar(100)
);
CREATE TABLE js_profile_educbackground(
jsprofileid int(6) zerofill not null,
educbackground varchar(100)
);
CREATE TABLE js_profile_applies_for_job(
jsprofileid int(6) zerofill not null,
jobid int(11) zerofill not null,
dateapplied date not null,
status int(1) not null
);
CREATE TABLE job(
jobid int(11) zerofill auto_increment,
salary NUMERIC(7,2) not null,
description varchar(100) not null,
dateposted date not null,
position varchar(50) not null,
cprofileid int(6) zerofill not null,
constraint job_jobid_pk primary key(jobid),
constraint job_cprofileid_fk foreign key(cprofileid) references c_user_c_profile(cprofileid)
);

CREATE TABLE job_search_tag(
jobid int(11) zerofill not null,
searchtag varchar(50) not null
);
