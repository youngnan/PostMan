<?php
$connString = "host=localhost port=5432 user=postgres password=postgres";
$dbconn = pg_connect($connString);
if($dbconn != false)
	print "database connected.\r\n";
else
	exit;
$res = pg_query($dbconn,"CREATE DATABASE PostMan;");
pg_close($dbconn);
$connString = "host=localhost port=5432 user=postgres password=postgres dbname=postman";
$dbconn = pg_connect($connString);
if($dbconn != false)
	print "using database postman\r\n";
else
	exit;
$res = pg_query ($dbconn, 
		"CREATE TABLE Users (
			id		integer PRIMARY KEY,
			login_name	text NOT NULL,
			full_name	text,
			job_id		integer,
			mobile		text,
			email		text,
			birthday	timestamp);");
if ($res != false)
	print "user table created.\r\n";
$res = pg_query ($dbconn,
		"CREATE TABLE Jobs (
			id		integer PRIMARY KEY,
			name		text,
			description	text,
			salary_mouth	integer);");
if ($res != false)
	print "job table created.\r\n";
$res = pg_query ($dbconn, "CREATE TABLE Groups (
			id		integer PRIMARY KEY, 
			leader_id	integer, 
			name		text,
			desctiption 	text);");
if ($res != false)
	print "group table created.\r\n";
$res = pg_query ($dbconn, "CREATE TABLE Clients (
			id		integer PRIMARY KEY, 
			name 		text, 
			contact_id 	integer);");
if ($res != false)
	print "client table created.\r\n";
$res = pg_query ($dbconn, "CREATE TABLE Projects (
			id		integer PRIMARY KEY,
			name		text, 
			manager_id	integer REFERENCES Users(id),
			client_id	integer REFERENCES Clients(id),
			dir_struct	text, 
			dir_root	text);");
if ($res != false)
	print "project table created.\r\n";
/*
  FormT: Form globle template, it's system default.
  -------------------
  Field descriptions:
  -------------------
  field_id:	field id in the form, it's should be added use 'DEFUALT' value
  form_id:	field owner.
  display_name:	field display name.
  field_type:	field store type in SQL. 'integer', 'text'...
  value_ctrl:	HTML form input tag, 'TEXT','PASSWORD','FILE','TEXTAREA'...
		or some other tag like 'JQuery'.
  value_type:	value_type: how the value get.
		        0x0x:   mask - input by user
		        0x1x:   mask - calculate
		        1:      calculate when created
		        2:      calculate when open the form
		        3:      calculate by user
  css_style:	style string.
  breakline:	like flow layout, break current line
*/
$res = pg_query ($dbconn, "CREATE TABLE FormT (
			field_id	serail PRIMARY KEY,
			form_id		text NOT NULL,
			field_name	text,
			display_name	text,
			field_type	text,
			value_ctrl	text,
			value_type	integer,
			privilege	text,
			css_style	text,
			onclick		text,
			ondbclick	text,
			onmousedown	text,
			onmousemove	text,
			onmouseover	text,
			onmouseout	text,
			onmouseup	text,
			onkeydown	text,
			onkeypress	text,
			onkeyup		text,
			onabort		text,
			onload		text,
			onunload	text,
			onblur		text,
			onchange	text,
			onfocus		text,
			onselect	text,
			onsubmit	text,
			is_hiden	boolean,
			breakline	boolean);");
if ($res != false)
	print "form template table created.\r\n";
/*
view_level 	-- "All/By data/By Name" ...
view_name	-- "SELECT group, name, age, job FROM 'Users' GROUP BY age,name;"
display_name	-- {"Working Group", "User Name", "Age, Jobs"}
column_name	-- {"color='dark grey'","color='red'","",""}
*/
$res = pg_query ($dbconn, "CREATE TABLE ViewT (
			view_level	text,
			view_name	text,
			display_name	text[],
			column_style	text[]);");
if ($res != false)
	print "view template table created.\r\n";
$res = pg_query ($dbconn, "INSERT INTO Users VALUES (101, 'admin', 'Administrator', -1, '','','2000-01-01');");
if ($res != false)
	print "superuser 'admin' created.\r\n";
?>
