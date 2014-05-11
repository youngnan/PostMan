CREATE DATABASE PostMan;

CREATE TABLE FormT (
/*
	Form Template for both 'work' and 'task'. All these field for one field in the form.
*/
		form            text,	    -- which form that this field for
		field_name      text,	    -- field name, it is SQL field name
		display_name    text,       -- display name for user view
		field_type      text,	    -- SQL field type, 'integer', 'text'...
		value_ctrl      text,       -- HTML form input tag, 'TEXT','PASSWORD','FILE','TEXTAREA'...
		
		break_line      boolean,    -- like flow layout, break current line
);
