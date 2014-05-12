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
		
		
		/* Event Handlers */
		onCreated       text,       -- Event handler: when new form
		onLoad          text,       -- Event handler: when load a form
		/* Event Handler finished */
		
		break_line      boolean,    -- like flow layout, break current line
);
