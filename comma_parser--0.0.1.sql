CREATE FUNCTION commaprs_start(internal,int4)
	RETURNS internal
	AS '$libdir/comma_parser.so'
	LANGUAGE 'c';

CREATE FUNCTION commaprs_getlexeme(internal,internal,internal)
	RETURNS internal
	AS '$libdir/comma_parser.so'
	LANGUAGE 'c';

CREATE FUNCTION commaprs_end(internal)
	RETURNS void
	AS '$libdir/comma_parser.so'
	LANGUAGE 'c';

CREATE FUNCTION commaprs_lextype(internal)
	RETURNS internal
	AS '$libdir/comma_parser.so'
	LANGUAGE 'c';


CREATE TEXT SEARCH PARSER comma_parser (
	START = commaprs_start,
 	GETTOKEN = commaprs_getlexeme,
	END = commaprs_end,
 	LEXTYPES = commaprs_lextype
 );
 
 CREATE TEXT SEARCH CONFIGURATION comma_parser (
	PARSER = "comma_parser"
 );
ALTER TEXT SEARCH CONFIGURATION comma_parser ADD MAPPING FOR word WITH simple;
ALTER TEXT SEARCH CONFIGURATION comma_parser ADD MAPPING FOR comma WITH simple;
--
