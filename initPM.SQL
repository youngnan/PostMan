CREATE DATABASE PostMan;

CREATE TABLE Users (
		id		integer,
		login_name	text,
		full_name	text,
		job_id		integer,
		mobile		text,
		email		text,
		birthday	timestamp,
);
CREATE TABLE Jobs (
		id		integer,
		name		text,
		description	text,
		salary_mouth	integer,
);
CREATE	TABLE Groups (
		id		integer,
		name		text,
		desctiption	text,
);
CREATE TABLE FormT (
/*
	Form Template for both 'work' and 'task'. All these field for one field in the form.
*/
		form_id         text,	    -- which form that this field for
		field_name      text,	    -- field name, it is SQL field name
		display_name    text,       -- display name for user view
		field_type      text,	    -- SQL field type, 'integer', 'text'...
		value_ctrl      text,       -- HTML form input tag, 'TEXT','PASSWORD','FILE','TEXTAREA'...
		value_type      integer,
		/*
		    value_type: how the value get.
		        0x0x:   mask - input by user
		        0x1x:   mask - calculate
		        1:      calculate when created
		        2:      calculate when open the form
		        3:      calculate by user
		*/
		
		/* Style Define */
		css_style	text,		
		
		/* Event Handlers */
		onclick		text,	-- Fires on a mouse click on the element
		ondbclick	text,	-- Fires on a mouse double-click on the element
		onmousedown	text,	-- Fires when a mouse button is pressed down on an element
		onmousemove	text,	-- Fires when the mouse pointer moves over an element
		onmouseover	text,	-- Fires when the mouse pointer moves over an element
		onmouseout	text,	-- Fires when the mouse pointer moves out of an element
		onmouseup	text,	-- Fires when a mouse button is released over an element

		onkeydown	text,	-- Fires when a user is pressing a key
		onkeypress	text,	-- Fires when a user presses a key
		onkeyup		text,	-- Fires when a user releases a key

		onabort		text,	-- Script to be run on abort
		onload		text,	-- Fires after the page is finished loading
		onunload	text,	-- Fires once a page has unloaded (or the browser window has been closed)

		onblur		text,	-- Fires the moment that the element loses focus
		onchange	text,	-- Fires the moment when the value of the element is changed
		onfocus		text,	-- Fires the moment when the element gets focus
		onselect	text,	-- Fires after some text has been selected in an element
		onsubmit	text,	-- Fires when a form is submitted
		/* Event Handler finished */
		
		break_line      boolean,    -- like flow layout, break current line
);

CREATE TABLE ViewT (
		
		view_level	text,	-- "All/By data/By Name" ...
		view_query	text,	-- "SELECT group, name, age, job FROM 'Users' GROUP BY age,name;"
		display_names	text[],	-- {"Working Group", "User Name", "Age, Jobs"}
		column_styles	text[],	-- {"color='dark grey'","color='red'","",""}
);
