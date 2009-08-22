--
-- PostgreSQL database dump
--

SET client_encoding = 'ISO_8859_5';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

--
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    AS '$libdir/plpgsql', 'plpgsql_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO postgres;

--
-- Name: plpgsql_validator(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_validator(oid) RETURNS void
    AS '$libdir/plpgsql', 'plpgsql_validator'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_validator(oid) OWNER TO postgres;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: public; Owner: 
--

CREATE TRUSTED PROCEDURAL LANGUAGE plpgsql HANDLER plpgsql_call_handler VALIDATOR plpgsql_validator;


--
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    AS '$libdir/libpostgis.dll', 'box3d_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.box3d_in(cstring) OWNER TO postgres;

--
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'box3d_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.box3d_out(box3d) OWNER TO postgres;

--
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = box3d_in,
    OUTPUT = box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box3d OWNER TO postgres;

--
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    AS '$libdir/libpostgis.dll', 'CHIP_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.chip_in(cstring) OWNER TO postgres;

--
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'CHIP_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.chip_out(chip) OWNER TO postgres;

--
-- Name: chip; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = chip_in,
    OUTPUT = chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


ALTER TYPE public.chip OWNER TO postgres;

--
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_analyze'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_analyze(internal) OWNER TO postgres;

--
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_in(cstring) OWNER TO postgres;

--
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'geometry_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_out(geometry) OWNER TO postgres;

--
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = geometry_in,
    OUTPUT = geometry_out,
    ANALYZE = geometry_analyze,
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.geometry OWNER TO postgres;

--
-- Name: histogram2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION histogram2d_in(cstring) RETURNS histogram2d
    AS '$libdir/libpostgis.dll', 'histogram2d_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.histogram2d_in(cstring) OWNER TO postgres;

--
-- Name: histogram2d_out(histogram2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION histogram2d_out(histogram2d) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'histogram2d_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.histogram2d_out(histogram2d) OWNER TO postgres;

--
-- Name: histogram2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE histogram2d (
    INTERNALLENGTH = variable,
    INPUT = histogram2d_in,
    OUTPUT = histogram2d_out,
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.histogram2d OWNER TO postgres;

--
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/libpostgis.dll', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.spheroid_in(cstring) OWNER TO postgres;

--
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'ellipsoid_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.spheroid_out(spheroid) OWNER TO postgres;

--
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = spheroid_in,
    OUTPUT = spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.spheroid OWNER TO postgres;

--
-- Name: wkb_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wkb_in(cstring) RETURNS wkb
    AS '$libdir/libpostgis.dll', 'WKB_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.wkb_in(cstring) OWNER TO postgres;

--
-- Name: wkb_out(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wkb_out(wkb) RETURNS cstring
    AS '$libdir/libpostgis.dll', 'WKB_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.wkb_out(wkb) OWNER TO postgres;

--
-- Name: wkb_recv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wkb_recv(internal) RETURNS wkb
    AS '$libdir/libpostgis.dll', 'WKB_recv'
    LANGUAGE c STRICT;


ALTER FUNCTION public.wkb_recv(internal) OWNER TO postgres;

--
-- Name: wkb_send(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wkb_send(wkb) RETURNS bytea
    AS '$libdir/libpostgis.dll', 'WKBtoBYTEA'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.wkb_send(wkb) OWNER TO postgres;

--
-- Name: wkb; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE wkb (
    INTERNALLENGTH = variable,
    INPUT = wkb_in,
    OUTPUT = wkb_out,
    RECEIVE = wkb_recv,
    SEND = wkb_send,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.wkb OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;

	rec RECORD;
	schema_ok bool;
	real_schema name;

	fixgeomres text;

BEGIN

	IF ( not ( (new_type ='GEOMETRY') or
		   (new_type ='GEOMETRYCOLLECTION') or
		   (new_type ='POINT') or 
		   (new_type ='MULTIPOINT') or
		   (new_type ='POLYGON') or
		   (new_type ='MULTIPOLYGON') or
		   (new_type ='LINESTRING') or
		   (new_type ='MULTILINESTRING')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are: 
			GEOMETRY, GEOMETRYCOLLECTION, POINT, 
			MULTIPOINT, POLYGON, MULTIPOLYGON, 
			LINESTRING, or MULTILINESTRING ';
		return 'fail';
	END IF;

	IF ( (new_dim >3) or (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		return 'fail';
	END IF;


	IF ( schema_name != '' ) THEN
		schema_ok = 'f';
		FOR rec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			schema_ok := 't';
		END LOOP;

		if ( schema_ok <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;

	ELSE
		SELECT current_schema() into real_schema;
	END IF;



	-- Add geometry column

	EXECUTE 'ALTER TABLE ' ||

		quote_ident(real_schema) || '.' || quote_ident(table_name)



		|| ' ADD COLUMN ' || quote_ident(column_name) || 
		' geometry ';


	-- Delete stale record in geometry_column (if any)

	EXECUTE 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') || 
		' AND f_table_schema = ' ||

		quote_literal(real_schema) || 



		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);


	-- Add record in geometry_column 

	EXECUTE 'INSERT INTO geometry_columns VALUES (' ||
		quote_literal('') || ',' ||

		quote_literal(real_schema) || ',' ||



		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim || ',' || new_srid || ',' ||
		quote_literal(new_type) || ')';

	-- Add table checks

	EXECUTE 'ALTER TABLE ' || 

		quote_ident(real_schema) || '.' || quote_ident(table_name)



		|| ' ADD CONSTRAINT "enforce_srid_' || 
		column_name || '" CHECK (SRID(' || quote_ident(column_name) ||
		') = ' || new_srid || ')' ;

	IF (not(new_type = 'GEOMETRY')) THEN
		EXECUTE 'ALTER TABLE ' || 

		quote_ident(real_schema) || '.' || quote_ident(table_name)



		|| ' ADD CONSTRAINT "enforce_geotype_' ||
		column_name || '" CHECK (geometrytype(' ||
		quote_ident(column_name) || ')=' ||
		quote_literal(new_type) || ' OR (' ||
		quote_ident(column_name) || ') is null)';
	END IF;

	SELECT fix_geometry_columns() INTO fixgeomres;

	return 

		real_schema || '.' || 

		table_name || '.' || column_name ||
		' SRID:' || new_srid ||
		' TYPE:' || new_type || '
 ' ||
		'geometry_column ' || fixgeomres;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION area(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'area2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.area(geometry) OWNER TO postgres;

--
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'area2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.area2d(geometry) OWNER TO postgres;

--
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asbinary(geometry) RETURNS wkb
    AS '$libdir/libpostgis.dll', 'asbinary_simple'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asbinary(geometry) OWNER TO postgres;

--
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asbinary(geometry, text) RETURNS wkb
    AS '$libdir/libpostgis.dll', 'asbinary_specify'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asbinary(geometry, text) OWNER TO postgres;

--
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/libpostgis.dll', 'assvg_geometry'
    LANGUAGE c;


ALTER FUNCTION public.assvg(geometry, integer, integer) OWNER TO postgres;

--
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    AS '$libdir/libpostgis.dll', 'assvg_geometry'
    LANGUAGE c;


ALTER FUNCTION public.assvg(geometry, integer) OWNER TO postgres;

--
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry) RETURNS text
    AS '$libdir/libpostgis.dll', 'assvg_geometry'
    LANGUAGE c;


ALTER FUNCTION public.assvg(geometry) OWNER TO postgres;

--
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION astext(geometry) RETURNS text
    AS '$libdir/libpostgis.dll', 'astext_geometry'
    LANGUAGE c STRICT;


ALTER FUNCTION public.astext(geometry) OWNER TO postgres;

--
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'boundary'
    LANGUAGE c STRICT;


ALTER FUNCTION public.boundary(geometry) OWNER TO postgres;

--
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(geometry) RETURNS box
    AS '$libdir/libpostgis.dll', 'geometry2box'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box(geometry) OWNER TO postgres;

--
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    AS '$libdir/libpostgis.dll', 'get_bbox_of_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3d(geometry) OWNER TO postgres;

--
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    AS '$libdir/libpostgis.dll', 'box3dtobox'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3dtobox(box3d) OWNER TO postgres;

--
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'buffer'
    LANGUAGE c STRICT;


ALTER FUNCTION public.buffer(geometry, double precision) OWNER TO postgres;

--
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'buffer'
    LANGUAGE c STRICT;


ALTER FUNCTION public.buffer(geometry, double precision, integer) OWNER TO postgres;

--
-- Name: build_histogram2d(histogram2d, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text) RETURNS histogram2d
    AS '$libdir/libpostgis.dll', 'build_histogram2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.build_histogram2d(histogram2d, text, text) OWNER TO postgres;

--
-- Name: build_histogram2d(histogram2d, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text, text) RETURNS histogram2d
    AS $_$
BEGIN
	EXECUTE 'SET local search_path = '||$2||',public';
	RETURN public.build_histogram2d($1,$3,$4);
END
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.build_histogram2d(histogram2d, text, text, text) OWNER TO postgres;

--
-- Name: bytea(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(wkb) RETURNS bytea
    AS '$libdir/libpostgis.dll', 'WKBtoBYTEA'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bytea(wkb) OWNER TO postgres;

--
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'centroid'
    LANGUAGE c STRICT;


ALTER FUNCTION public.centroid(geometry) OWNER TO postgres;

--
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'collect_garray'
    LANGUAGE c;


ALTER FUNCTION public.collect_garray(geometry[]) OWNER TO postgres;

--
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'collector'
    LANGUAGE c;


ALTER FUNCTION public.collector(geometry, geometry) OWNER TO postgres;

--
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/libpostgis.dll', 'combine_bbox'
    LANGUAGE c;


ALTER FUNCTION public.combine_bbox(box3d, geometry) OWNER TO postgres;

--
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION compression(chip) RETURNS integer
    AS '$libdir/libpostgis.dll', 'compression_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.compression(chip) OWNER TO postgres;

--
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'contains'
    LANGUAGE c STRICT;


ALTER FUNCTION public.contains(geometry, geometry) OWNER TO postgres;

--
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'convexhull'
    LANGUAGE c STRICT;


ALTER FUNCTION public.convexhull(geometry) OWNER TO postgres;

--
-- Name: create_histogram2d(box3d, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION create_histogram2d(box3d, integer) RETURNS histogram2d
    AS '$libdir/libpostgis.dll', 'create_histogram2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.create_histogram2d(box3d, integer) OWNER TO postgres;

--
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'crosses'
    LANGUAGE c STRICT;


ALTER FUNCTION public.crosses(geometry, geometry) OWNER TO postgres;

--
-- Name: database_size(name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION database_size(name) RETURNS bigint
    AS '$libdir/dbsize', 'database_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.database_size(name) OWNER TO postgres;

--
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION datatype(chip) RETURNS integer
    AS '$libdir/libpostgis.dll', 'datatype_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.datatype(chip) OWNER TO postgres;

--
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'difference'
    LANGUAGE c STRICT;


ALTER FUNCTION public.difference(geometry, geometry) OWNER TO postgres;

--
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'dimension'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dimension(geometry) OWNER TO postgres;

--
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'disjoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.disjoint(geometry, geometry) OWNER TO postgres;

--
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.distance(geometry, geometry) OWNER TO postgres;

--
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'distance_ellipsoid'
    LANGUAGE c STRICT;


ALTER FUNCTION public.distance_spheroid(geometry, geometry, spheroid) OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN



	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;




 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);



	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN


	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;


	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||

		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||

		' f_table_name = ' || quote_literal(table_name);
	
	-- Remove table 
	EXECUTE 'DROP TABLE '

		|| quote_ident(real_schema) || '.' ||

		quote_ident(table_name);

	RETURN

		real_schema || '.' ||

		table_name ||' dropped.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    AS $_$SELECT DropGeometryTable('',$1,$2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying, character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    AS $_$SELECT DropGeometryTable('','',$1)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying) OWNER TO postgres;

--
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'endpoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.endpoint(geometry) OWNER TO postgres;

--
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'envelope'
    LANGUAGE c STRICT;


ALTER FUNCTION public.envelope(geometry) OWNER TO postgres;

--
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.equals(geometry, geometry) OWNER TO postgres;

--
-- Name: estimate_histogram2d(histogram2d, box); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION estimate_histogram2d(histogram2d, box) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'estimate_histogram2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.estimate_histogram2d(histogram2d, box) OWNER TO postgres;

--
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    AS '$libdir/libpostgis.dll', 'expand_bbox'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.expand(box3d, double precision) OWNER TO postgres;

--
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'expand_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.expand(geometry, double precision) OWNER TO postgres;

--
-- Name: explode_histogram2d(histogram2d, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION explode_histogram2d(histogram2d, text) RETURNS histogram2d
    AS '$libdir/libpostgis.dll', 'explode_histogram2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.explode_histogram2d(histogram2d, text) OWNER TO postgres;

--
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'exteriorring_polygon'
    LANGUAGE c STRICT;


ALTER FUNCTION public.exteriorring(geometry) OWNER TO postgres;

--
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION factor(chip) RETURNS real
    AS '$libdir/libpostgis.dll', 'factor_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.factor(chip) OWNER TO postgres;

--
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box3d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	okay boolean;
 myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||schemaname||'"."'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.find_extent(text, text, text) OWNER TO postgres;

--
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_extent(text, text) RETURNS box3d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	okay boolean;
 myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.find_extent(text, text) OWNER TO postgres;

--
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    AS $_$DECLARE
   schem text;
   tabl text;
   sr int4;
BEGIN
   IF $1 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - schema is NULL!';
   END IF;
   IF $2 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - table name is NULL!';
   END IF;
   IF $3 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - column name is NULL!';
   END IF;
   schem = $1;
   tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
   IF ( schem = '' and tabl LIKE '%.%' ) THEN
     schem = substr(tabl,1,strpos(tabl,'.')-1);
     tabl = substr(tabl,length(schem)+2);
   ELSE
     schem = schem || '%';
   END IF;

   select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
   IF NOT FOUND THEN
       RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
   END IF;
  return sr;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE;


ALTER FUNCTION public.find_srid(character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    AS $_$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;

	foundschema integer;

BEGIN


	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to 
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
                WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
                OR f_table_schema NOT IN (
                        SELECT nspname::varchar
                        FROM pg_namespace nn, pg_class cc, pg_attribute aa
                        WHERE cc.relnamespace = nn.oid
                        AND cc.relname = f_table_name::name
                        AND aa.attrelid = cc.oid
                        AND aa.attname = f_geometry_column::name))
                AND f_table_name::name = c.relname
                AND c.oid = a.attrelid
                AND c.relnamespace = n.oid
                AND f_geometry_column::name = a.attname
                AND sridcheck.conrelid = c.oid
                --AND sridcheck.conname = '$1'
		AND sridcheck.consrc LIKE '(srid(% = %)'
                AND typecheck.conrelid = c.oid
                --AND typecheck.conname = '$2'
		AND typecheck.consrc LIKE
	'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
                AND sridcheck.consrc ~ textcat(' = ', srid::text)
                AND typecheck.consrc ~ textcat(' = ''', type::text)
                AND NOT EXISTS (
                        SELECT oid FROM geometry_columns gc
                        WHERE c.relname::varchar = gc.f_table_name

                        AND n.nspname::varchar = gc.f_table_schema

                        AND a.attname::varchar = gc.f_geometry_column
                );

	GET DIAGNOSTICS foundschema = ROW_COUNT;



	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;


	-- fix linking to system tables
	SELECT 0 INTO linked;
	FOR mislinked in
		SELECT gc.oid as gcrec,
			a.attrelid as attrelid, a.attnum as attnum
                FROM geometry_columns gc, pg_class c,

		pg_namespace n, pg_attribute a



                WHERE ( gc.attrelid IS NULL OR gc.attrelid != a.attrelid 
			OR gc.varattnum IS NULL OR gc.varattnum != a.attnum)

                AND n.nspname = gc.f_table_schema::name
                AND c.relnamespace = n.oid

                AND c.relname = gc.f_table_name::name
                AND a.attname = f_geometry_column::name
                AND a.attrelid = c.oid
	LOOP
		UPDATE geometry_columns SET
			attrelid = mislinked.attrelid,
			varattnum = mislinked.attnum,
			stats = NULL
			WHERE geometry_columns.oid = mislinked.gcrec;
		SELECT linked+1 INTO linked;
	END LOOP; 


	-- remove stale records
	DELETE FROM geometry_columns WHERE attrelid IS NULL;

	GET DIAGNOSTICS deleted = ROW_COUNT;

	result = 

		'fixed:' || foundschema::text ||

		' linked:' || linked::text || 
		' deleted:' || deleted::text;

	return result;

END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.fix_geometry_columns() OWNER TO postgres;

--
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'force_2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.force_2d(geometry) OWNER TO postgres;

--
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'force_3d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.force_3d(geometry) OWNER TO postgres;

--
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'force_collection'
    LANGUAGE c STRICT;


ALTER FUNCTION public.force_collection(geometry) OWNER TO postgres;

--
-- Name: gbox_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gbox_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'gbox_penalty'
    LANGUAGE c;


ALTER FUNCTION public.gbox_penalty(internal, internal, internal) OWNER TO postgres;

--
-- Name: gbox_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gbox_picksplit(internal, internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'gbox_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gbox_picksplit(internal, internal) OWNER TO postgres;

--
-- Name: gbox_same(box, box, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gbox_same(box, box, internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'gbox_same'
    LANGUAGE c;


ALTER FUNCTION public.gbox_same(box, box, internal) OWNER TO postgres;

--
-- Name: gbox_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gbox_union(bytea, internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'gbox_union'
    LANGUAGE c;


ALTER FUNCTION public.gbox_union(bytea, internal) OWNER TO postgres;

--
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/libpostgis.dll', 'geom_accum'
    LANGUAGE c;


ALTER FUNCTION public.geom_accum(geometry[], geometry) OWNER TO postgres;

--
-- Name: geomcollfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_gc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: geomcollfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_gc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromtext(geometry) OWNER TO postgres;

--
-- Name: geomcollfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'GCfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: geomcollfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'GCfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromwkb(wkb) OWNER TO postgres;

--
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'CHIP_to_geom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(chip) OWNER TO postgres;

--
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'get_geometry_of_bbox'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(box3d) OWNER TO postgres;

--
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(text) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(text) OWNER TO postgres;

--
-- Name: geometry(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometryfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(wkb) OWNER TO postgres;

--
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'geometry_cmp'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_cmp(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_contain'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_contain(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_contained'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_contained(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_eq'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_eq(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_ge'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_ge(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_gt'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_gt(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_inter(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_inter(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_inter'
    LANGUAGE c;


ALTER FUNCTION public.geometry_inter(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_le'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_le(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_left'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_left(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_lt'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_lt(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_overlap'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_overlap(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_overleft'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_overleft(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_overright'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_overright(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_right'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_right(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'geometry_same'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_same(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_size(geometry, opaque); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_size(geometry, opaque) RETURNS real
    AS '$libdir/libpostgis.dll', 'geometry_size'
    LANGUAGE c;


ALTER FUNCTION public.geometry_size(geometry, opaque) OWNER TO postgres;

--
-- Name: geometry_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_union(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_union'
    LANGUAGE c;


ALTER FUNCTION public.geometry_union(geometry, geometry) OWNER TO postgres;

--
-- Name: geometryfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometryfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: geometryfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometryfromtext(geometry) OWNER TO postgres;

--
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometryn_collection'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometryn(geometry, integer) OWNER TO postgres;

--
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    AS '$libdir/libpostgis.dll', 'geometrytype'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometrytype(geometry) OWNER TO postgres;

--
-- Name: geomfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: geomfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromtext(geometry) OWNER TO postgres;

--
-- Name: geomfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometryfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromwkb(wkb) OWNER TO postgres;

--
-- Name: geomfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometryfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geomunion'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geomunion(geometry, geometry) OWNER TO postgres;

--
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'GEOSnoop'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geosnoop(geometry) OWNER TO postgres;

--
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    AS $_$SELECT proj4text::text FROM spatial_ref_sys WHERE srid= $1$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.get_proj4_from_srid(integer) OWNER TO postgres;

--
-- Name: ggeometry_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ggeometry_compress(internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'ggeometry_compress'
    LANGUAGE c;


ALTER FUNCTION public.ggeometry_compress(internal) OWNER TO postgres;

--
-- Name: ggeometry_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ggeometry_consistent(internal, geometry, integer) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'ggeometry_consistent'
    LANGUAGE c;


ALTER FUNCTION public.ggeometry_consistent(internal, geometry, integer) OWNER TO postgres;

--
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION height(chip) RETURNS integer
    AS '$libdir/libpostgis.dll', 'height_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.height(chip) OWNER TO postgres;

--
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'interiorringn_polygon'
    LANGUAGE c STRICT;


ALTER FUNCTION public.interiorringn(geometry, integer) OWNER TO postgres;

--
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'intersection'
    LANGUAGE c STRICT;


ALTER FUNCTION public.intersection(geometry, geometry) OWNER TO postgres;

--
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'intersects'
    LANGUAGE c STRICT;


ALTER FUNCTION public.intersects(geometry, geometry) OWNER TO postgres;

--
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'isclosed'
    LANGUAGE c STRICT;


ALTER FUNCTION public.isclosed(geometry) OWNER TO postgres;

--
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'isempty'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isempty(geometry) OWNER TO postgres;

--
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'isring'
    LANGUAGE c STRICT;


ALTER FUNCTION public.isring(geometry) OWNER TO postgres;

--
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issimple(geometry) OWNER TO postgres;

--
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'isvalid'
    LANGUAGE c STRICT;


ALTER FUNCTION public.isvalid(geometry) OWNER TO postgres;

--
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'length2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.length(geometry) OWNER TO postgres;

--
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'length3d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.length3d(geometry) OWNER TO postgres;

--
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'length3d_ellipsoid'
    LANGUAGE c STRICT;


ALTER FUNCTION public.length3d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'length_ellipsoid'
    LANGUAGE c STRICT;


ALTER FUNCTION public.length_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'line_interpolate_point'
    LANGUAGE c STRICT;


ALTER FUNCTION public.line_interpolate_point(geometry, double precision) OWNER TO postgres;

--
-- Name: linefromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_line'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linefromtext(geometry, integer) OWNER TO postgres;

--
-- Name: linefromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_line'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linefromtext(geometry) OWNER TO postgres;

--
-- Name: linefromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'LinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linefromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: linefromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'LinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linefromwkb(wkb) OWNER TO postgres;

--
-- Name: linestringfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_line'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromtext(geometry) OWNER TO postgres;

--
-- Name: linestringfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_line'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: linestringfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'LinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: linestringfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'LinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromwkb(wkb) OWNER TO postgres;

--
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'max_distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.max_distance(geometry, geometry) OWNER TO postgres;

--
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'mem_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.mem_size(geometry) OWNER TO postgres;

--
-- Name: mlinefromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromtext(geometry, integer) OWNER TO postgres;

--
-- Name: mlinefromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromtext(geometry) OWNER TO postgres;

--
-- Name: mlinefromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MLinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: mlinefromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MLinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromwkb(wkb) OWNER TO postgres;

--
-- Name: mpointfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: mpointfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromtext(geometry) OWNER TO postgres;

--
-- Name: mpointfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: mpointfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromwkb(wkb) OWNER TO postgres;

--
-- Name: mpolyfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: mpolyfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromtext(geometry) OWNER TO postgres;

--
-- Name: mpolyfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: mpolyfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromwkb(wkb) OWNER TO postgres;

--
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'fluffType'
    LANGUAGE c STRICT;


ALTER FUNCTION public.multi(geometry) OWNER TO postgres;

--
-- Name: multilinefromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinefromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MLinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multilinefromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: multilinefromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinefromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MLinefromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multilinefromwkb(wkb) OWNER TO postgres;

--
-- Name: multilinestringfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinestringfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multilinestringfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: multilinestringfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinestringfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multilinestringfromtext(geometry) OWNER TO postgres;

--
-- Name: multipointfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: multipointfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromtext(geometry) OWNER TO postgres;

--
-- Name: multipointfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: multipointfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromwkb(wkb) OWNER TO postgres;

--
-- Name: multipolyfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolyfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipolyfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: multipolyfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolyfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'MPolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipolyfromwkb(wkb) OWNER TO postgres;

--
-- Name: multipolygonfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolygonfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipolygonfromtext(geometry) OWNER TO postgres;

--
-- Name: multipolygonfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolygonfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_mpoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multipolygonfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'npoints'
    LANGUAGE c STRICT;


ALTER FUNCTION public.npoints(geometry) OWNER TO postgres;

--
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'nrings'
    LANGUAGE c STRICT;


ALTER FUNCTION public.nrings(geometry) OWNER TO postgres;

--
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'numgeometries_collection'
    LANGUAGE c STRICT;


ALTER FUNCTION public.numgeometries(geometry) OWNER TO postgres;

--
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'numinteriorrings_polygon'
    LANGUAGE c STRICT;


ALTER FUNCTION public.numinteriorrings(geometry) OWNER TO postgres;

--
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'numpoints_linestring'
    LANGUAGE c STRICT;


ALTER FUNCTION public.numpoints(geometry) OWNER TO postgres;

--
-- Name: optimistic_overlap(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION optimistic_overlap(geometry, geometry, double precision) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'optimistic_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.optimistic_overlap(geometry, geometry, double precision) OWNER TO postgres;

--
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'overlaps'
    LANGUAGE c STRICT;


ALTER FUNCTION public."overlaps"(geometry, geometry) OWNER TO postgres;

--
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'perimeter2d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.perimeter(geometry) OWNER TO postgres;

--
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'perimeter3d'
    LANGUAGE c STRICT;


ALTER FUNCTION public.perimeter3d(geometry) OWNER TO postgres;

--
-- Name: pg_database_size(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_database_size(oid) RETURNS bigint
    AS '$libdir/dbsize', 'pg_database_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_database_size(oid) OWNER TO postgres;

--
-- Name: pg_dir_ls(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_dir_ls(text, boolean) RETURNS SETOF text
    AS '$libdir/admin', 'pg_dir_ls'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_dir_ls(text, boolean) OWNER TO postgres;

--
-- Name: pg_file_length(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_length(text) RETURNS bigint
    AS $_$SELECT len FROM pg_file_stat($1) AS s(len int8, c timestamp, a timestamp, m timestamp, i bool)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.pg_file_length(text) OWNER TO postgres;

--
-- Name: pg_file_read(text, bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_read(text, bigint, bigint) RETURNS text
    AS '$libdir/admin', 'pg_file_read'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_file_read(text, bigint, bigint) OWNER TO postgres;

--
-- Name: pg_file_rename(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_rename(text, text, text) RETURNS boolean
    AS '$libdir/admin', 'pg_file_rename'
    LANGUAGE c;


ALTER FUNCTION public.pg_file_rename(text, text, text) OWNER TO postgres;

--
-- Name: pg_file_rename(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_rename(text, text) RETURNS boolean
    AS $_$SELECT pg_file_rename($1, $2, NULL); $_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.pg_file_rename(text, text) OWNER TO postgres;

--
-- Name: pg_file_stat(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_stat(text) RETURNS record
    AS '$libdir/admin', 'pg_file_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_file_stat(text) OWNER TO postgres;

--
-- Name: pg_file_unlink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_unlink(text) RETURNS boolean
    AS '$libdir/admin', 'pg_file_unlink'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_file_unlink(text) OWNER TO postgres;

--
-- Name: pg_file_write(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_file_write(text, text, boolean) RETURNS bigint
    AS '$libdir/admin', 'pg_file_write'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_file_write(text, text, boolean) OWNER TO postgres;

--
-- Name: pg_logdir_ls(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_logdir_ls() RETURNS SETOF record
    AS '$libdir/admin', 'pg_logdir_ls'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_logdir_ls() OWNER TO postgres;

--
-- Name: pg_postmaster_starttime(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_postmaster_starttime() RETURNS timestamp without time zone
    AS '$libdir/admin', 'pg_postmaster_starttime'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_postmaster_starttime() OWNER TO postgres;

--
-- Name: pg_relation_size(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_relation_size(oid) RETURNS bigint
    AS '$libdir/dbsize', 'pg_relation_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_relation_size(oid) OWNER TO postgres;

--
-- Name: pg_reload_conf(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_reload_conf() RETURNS integer
    AS '$libdir/admin', 'pg_reload_conf'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.pg_reload_conf() OWNER TO postgres;

--
-- Name: pg_size_pretty(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_size_pretty(bigint) RETURNS text
    AS '$libdir/dbsize', 'pg_size_pretty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_size_pretty(bigint) OWNER TO postgres;

--
-- Name: pg_tablespace_size(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_tablespace_size(oid) RETURNS bigint
    AS '$libdir/dbsize', 'pg_tablespace_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pg_tablespace_size(oid) OWNER TO postgres;

--
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'point_inside_circle'
    LANGUAGE c STRICT;


ALTER FUNCTION public.point_inside_circle(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: pointfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: pointfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromtext(geometry) OWNER TO postgres;

--
-- Name: pointfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: pointfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PointfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromwkb(wkb) OWNER TO postgres;

--
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'pointn_linestring'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pointn(geometry, integer) OWNER TO postgres;

--
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'pointonsurface'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pointonsurface(geometry) OWNER TO postgres;

--
-- Name: polyfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: polyfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromtext(geometry) OWNER TO postgres;

--
-- Name: polyfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: polyfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromwkb(wkb) OWNER TO postgres;

--
-- Name: polygonfromtext(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromtext(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromtext(geometry, integer) OWNER TO postgres;

--
-- Name: polygonfromtext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromtext(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromtext(geometry) OWNER TO postgres;

--
-- Name: polygonfromwkb(wkb, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromwkb(wkb, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromwkb(wkb, integer) OWNER TO postgres;

--
-- Name: polygonfromwkb(wkb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromwkb(wkb) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'PolyfromWKB_SRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromwkb(wkb) OWNER TO postgres;

--
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_full_version() RETURNS text
    AS $$
DECLARE
	libver text;
	projver text;
	geosver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	fullver = fullver || ' DBPROC="' || dbproc || '"';
	fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (needs proc upgrade)';
	END IF;

	RETURN fullver;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.postgis_full_version() OWNER TO postgres;

--
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    AS '$libdir/libpostgis.dll', 'postgis_geos_version'
    LANGUAGE c;


ALTER FUNCTION public.postgis_geos_version() OWNER TO postgres;

--
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'postgis_gist_sel'
    LANGUAGE c;


ALTER FUNCTION public.postgis_gist_sel(internal, oid, internal, integer) OWNER TO postgres;

--
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    AS '$libdir/libpostgis.dll', 'postgis_lib_version'
    LANGUAGE c;


ALTER FUNCTION public.postgis_lib_version() OWNER TO postgres;

--
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    AS '$libdir/libpostgis.dll', 'postgis_proj_version'
    LANGUAGE c;


ALTER FUNCTION public.postgis_proj_version() OWNER TO postgres;

--
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    AS $$SELECT '0.0.1'::text AS version$$
    LANGUAGE sql;


ALTER FUNCTION public.postgis_scripts_installed() OWNER TO postgres;

--
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    AS '$libdir/libpostgis.dll', 'postgis_scripts_released'
    LANGUAGE c;


ALTER FUNCTION public.postgis_scripts_released() OWNER TO postgres;

--
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    AS '$libdir/libpostgis.dll', 'postgis_uses_stats'
    LANGUAGE c;


ALTER FUNCTION public.postgis_uses_stats() OWNER TO postgres;

--
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_version() RETURNS text
    AS $$SELECT '0.9 USE_GEOS=1 USE_PROJ=1 USE_STATS=1'::text AS version$$
    LANGUAGE sql;


ALTER FUNCTION public.postgis_version() OWNER TO postgres;

--
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    AS $_$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t, 

			pg_namespace n,

			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid

		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid

		AND sridcheck.conrelid = c.oid
		--AND sridcheck.conname = '$1'
		AND sridcheck.consrc LIKE '(srid(% = %)'
		AND typecheck.conrelid = c.oid
		--AND typecheck.conname = '$2';
		AND typecheck.consrc LIKE
	'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,

		n.nspname::varchar as f_table_schema,



		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from substr(sridcheck.consrc,
			strpos(sridcheck.consrc, '=')))::integer as srid,
		trim(both ' =)''' from substr(typecheck.consrc, 
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type





		FROM pg_class c, pg_attribute a, pg_type t, 

			pg_namespace n,

			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid

		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid

		AND sridcheck.conrelid = c.oid
		--AND sridcheck.conname = '$1'
		AND sridcheck.consrc LIKE '(srid(% = %)'
		AND typecheck.conrelid = c.oid
		--AND typecheck.conname = '$2'
		AND typecheck.consrc LIKE
	'((geometrytype(%) = ''%''::text) OR (% IS NULL))'

                AND NOT EXISTS (
                        SELECT oid FROM geometry_columns gc
                        WHERE c.relname::varchar = gc.f_table_name

                        AND n.nspname::varchar = gc.f_table_schema

                        AND a.attname::varchar = gc.f_geometry_column
                );

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

        RETURN 'probed:'||probed||
		' inserted:'||inserted||
		' conflicts:'||probed-inserted||
		' stale:'||stale;
END

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.probe_geometry_columns() OWNER TO postgres;

--
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    AS '$libdir/libpostgis.dll', 'relate_full'
    LANGUAGE c STRICT;


ALTER FUNCTION public.relate(geometry, geometry) OWNER TO postgres;

--
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'relate_pattern'
    LANGUAGE c STRICT;


ALTER FUNCTION public.relate(geometry, geometry, text) OWNER TO postgres;

--
-- Name: relation_size(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION relation_size(text) RETURNS bigint
    AS '$libdir/dbsize', 'relation_size'
    LANGUAGE c STRICT;


ALTER FUNCTION public.relation_size(text) OWNER TO postgres;

--
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    AS $$
UPDATE pg_constraint 
	SET conname = textcat('enforce_geotype_', a.attname)
	FROM pg_attribute a
	WHERE
		a.attrelid = conrelid
		AND a.attnum = conkey[1]
		AND consrc LIKE '((geometrytype(%) = %';

UPDATE pg_constraint
	SET conname = textcat('enforce_srid_', a.attname)
	FROM pg_attribute a
	WHERE
		a.attrelid = conrelid
		AND a.attnum = conkey[1]
		AND consrc LIKE '(srid(% = %)';

SELECT 'spatial table constraints renamed'::text;

$$
    LANGUAGE sql;


ALTER FUNCTION public.rename_geometry_table_constraints() OWNER TO postgres;

--
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'HWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.reverse(geometry) OWNER TO postgres;

--
-- Name: rtree_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rtree_decompress(internal) RETURNS internal
    AS '$libdir/libpostgis.dll', 'rtree_decompress'
    LANGUAGE c;


ALTER FUNCTION public.rtree_decompress(internal) OWNER TO postgres;

--
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'segmentize'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.segmentize(geometry, double precision) OWNER TO postgres;

--
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    AS '$libdir/libpostgis.dll', 'setfactor_chip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setfactor(chip, real) OWNER TO postgres;

--
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    AS '$libdir/libpostgis.dll', 'setsrid_chip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setsrid(chip, integer) OWNER TO postgres;

--
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'geometry_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setsrid(geometry, integer) OWNER TO postgres;

--
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'simplify'
    LANGUAGE c STRICT;


ALTER FUNCTION public.simplify(geometry, double precision) OWNER TO postgres;

--
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION srid(chip) RETURNS integer
    AS '$libdir/libpostgis.dll', 'srid_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.srid(chip) OWNER TO postgres;

--
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION srid(geometry) RETURNS integer
    AS '$libdir/libpostgis.dll', 'srid_geom'
    LANGUAGE c STRICT;


ALTER FUNCTION public.srid(geometry) OWNER TO postgres;

--
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'startpoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.startpoint(geometry) OWNER TO postgres;

--
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION summary(geometry) RETURNS text
    AS '$libdir/libpostgis.dll', 'summary'
    LANGUAGE c STRICT;


ALTER FUNCTION public.summary(geometry) OWNER TO postgres;

--
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'symdifference'
    LANGUAGE c STRICT;


ALTER FUNCTION public.symdifference(geometry, geometry) OWNER TO postgres;

--
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'symdifference'
    LANGUAGE c STRICT;


ALTER FUNCTION public.symmetricdifference(geometry, geometry) OWNER TO postgres;

--
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'touches'
    LANGUAGE c STRICT;


ALTER FUNCTION public.touches(geometry, geometry) OWNER TO postgres;

--
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    AS $_$BEGIN
 RETURN transform_geometry( $1 , get_proj4_from_srid(SRID( $1 ) ), get_proj4_from_srid( $2 ), $2 );
 END;$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.transform(geometry, integer) OWNER TO postgres;

--
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'transform_geom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.transform_geometry(geometry, text, text, integer) OWNER TO postgres;

--
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'translate'
    LANGUAGE c STRICT;


ALTER FUNCTION public.translate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/libpostgis.dll', 'unite_garray'
    LANGUAGE c;


ALTER FUNCTION public.unite_garray(geometry[]) OWNER TO postgres;

--
-- Name: update_geometry_stats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_geometry_stats() RETURNS text
    AS $$ SELECT 'update_geometry_stats() has been obsoleted. Statistics are automatically built running the ANALYZE command'::text$$
    LANGUAGE sql;


ALTER FUNCTION public.update_geometry_stats() OWNER TO postgres;

--
-- Name: update_geometry_stats(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_geometry_stats(character varying, character varying) RETURNS text
    AS $$SELECT update_geometry_stats();$$
    LANGUAGE sql;


ALTER FUNCTION public.update_geometry_stats(character varying, character varying) OWNER TO postgres;

--
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION width(chip) RETURNS integer
    AS '$libdir/libpostgis.dll', 'width_chip'
    LANGUAGE c STRICT;


ALTER FUNCTION public.width(chip) OWNER TO postgres;

--
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    AS '$libdir/libpostgis.dll', 'within'
    LANGUAGE c STRICT;


ALTER FUNCTION public.within(geometry, geometry) OWNER TO postgres;

--
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION x(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'x_point'
    LANGUAGE c STRICT;


ALTER FUNCTION public.x(geometry) OWNER TO postgres;

--
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_xmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xmax(box3d) OWNER TO postgres;

--
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_xmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xmin(box3d) OWNER TO postgres;

--
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION y(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'y_point'
    LANGUAGE c STRICT;


ALTER FUNCTION public.y(geometry) OWNER TO postgres;

--
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_ymax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ymax(box3d) OWNER TO postgres;

--
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_ymin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ymin(box3d) OWNER TO postgres;

--
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION z(geometry) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'z_point'
    LANGUAGE c STRICT;


ALTER FUNCTION public.z(geometry) OWNER TO postgres;

--
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_zmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.zmax(box3d) OWNER TO postgres;

--
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    AS '$libdir/libpostgis.dll', 'box3d_zmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.zmin(box3d) OWNER TO postgres;

--
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE collect (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = collect_garray
);


ALTER AGGREGATE public.collect(geometry) OWNER TO postgres;

--
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE extent (
    BASETYPE = geometry,
    SFUNC = combine_bbox,
    STYPE = box3d
);


ALTER AGGREGATE public.extent(geometry) OWNER TO postgres;

--
-- Name: geomunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE geomunion (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = unite_garray
);


ALTER AGGREGATE public.geomunion(geometry) OWNER TO postgres;

--
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE memcollect (
    BASETYPE = geometry,
    SFUNC = collector,
    STYPE = geometry
);


ALTER AGGREGATE public.memcollect(geometry) OWNER TO postgres;

--
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE memgeomunion (
    BASETYPE = geometry,
    SFUNC = public.geomunion,
    STYPE = geometry
);


ALTER AGGREGATE public.memgeomunion(geometry) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = postgis_gist_sel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&& (geometry, geometry) OWNER TO postgres;

--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (geometry, geometry) OWNER TO postgres;

--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (geometry, geometry) OWNER TO postgres;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geometry, geometry) OWNER TO postgres;

--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (geometry, geometry) OWNER TO postgres;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geometry, geometry) OWNER TO postgres;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geometry, geometry) OWNER TO postgres;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geometry, geometry) OWNER TO postgres;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geometry, geometry) OWNER TO postgres;

--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (geometry, geometry) OWNER TO postgres;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (geometry, geometry) OWNER TO postgres;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (geometry, geometry) OWNER TO postgres;

--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.~= (geometry, geometry) OWNER TO postgres;

--
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


ALTER OPERATOR CLASS public.btree_geometry_ops USING btree OWNER TO postgres;

--
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box ,
    OPERATOR 1 <<(geometry,geometry) RECHECK ,
    OPERATOR 2 &<(geometry,geometry) RECHECK ,
    OPERATOR 3 &&(geometry,geometry) RECHECK ,
    OPERATOR 4 &>(geometry,geometry) RECHECK ,
    OPERATOR 5 >>(geometry,geometry) RECHECK ,
    OPERATOR 6 ~=(geometry,geometry) RECHECK ,
    OPERATOR 7 ~(geometry,geometry) RECHECK ,
    OPERATOR 8 @(geometry,geometry) RECHECK ,
    FUNCTION 1 ggeometry_consistent(internal,geometry,integer) ,
    FUNCTION 2 gbox_union(bytea,internal) ,
    FUNCTION 3 ggeometry_compress(internal) ,
    FUNCTION 4 rtree_decompress(internal) ,
    FUNCTION 5 gbox_penalty(internal,internal,internal) ,
    FUNCTION 6 gbox_picksplit(internal,internal) ,
    FUNCTION 7 gbox_same(box,box,internal);


ALTER OPERATOR CLASS public.gist_geometry_ops USING gist OWNER TO postgres;

SET search_path = pg_catalog;

--
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.box3dtobox(public.box3d);


--
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.geometry(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.box(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.box3d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.astext(public.geometry);


--
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.geometry(text) AS IMPLICIT;


--
-- Name: CAST (public.wkb AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.wkb AS bytea) WITH FUNCTION public.bytea(public.wkb) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario character varying(20) NOT NULL,
    nombre_usuario character varying(30) NOT NULL,
    tipo character varying(30) NOT NULL,
    "password" character varying(50) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.usuario OWNER TO cdiazz;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON TABLE usuario IS 'tablas de usuarios';


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE cliente (
    id_cliente character varying(30) NOT NULL,
    nombre_cliente character varying(30),
    direccion character varying(50),
    telefono character varying(20)
)
INHERITS (usuario);


ALTER TABLE public.cliente OWNER TO cdiazz;

--
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    "type" character varying(30) NOT NULL
);


ALTER TABLE public.geometry_columns OWNER TO postgres;

--
-- Name: orden; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE orden (
    orden character varying(20) NOT NULL,
    referencia character varying(10) NOT NULL,
    unidades integer NOT NULL,
    ingreso integer DEFAULT date_part('epoch'::text, now()),
    especie character varying(50),
    tipo character varying(50),
    corte character varying(50),
    peso character varying(50),
    ancho character varying(50),
    largo character varying(50),
    espesor character varying(50),
    calidad character varying(50),
    novedad character varying(50)
);


ALTER TABLE public.orden OWNER TO cdiazz;

--
-- Name: TABLE orden; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON TABLE orden IS 'donde se guarda los lotes que llegan del cliente';


--
-- Name: COLUMN orden.orden; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN orden.orden IS 'Orden de ingreso';


--
-- Name: COLUMN orden.referencia; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN orden.referencia IS 'Referencia del lote';


--
-- Name: COLUMN orden.unidades; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN orden.unidades IS 'cantidad ';


--
-- Name: COLUMN orden.ingreso; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN orden.ingreso IS 'fecha y hora de ingreso del material';


--
-- Name: pg_logdir_ls; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_logdir_ls AS
    SELECT a.filetime, a.filename FROM pg_logdir_ls() a(filetime timestamp without time zone, filename text);


ALTER TABLE public.pg_logdir_ls OWNER TO postgres;

--
-- Name: proceso; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE proceso (
    id_proceso character varying(15) NOT NULL,
    nombre character varying(20),
    descripcion character varying(50),
    obligatorio boolean DEFAULT false,
    orden_proceso integer
);


ALTER TABLE public.proceso OWNER TO cdiazz;

--
-- Name: TABLE proceso; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON TABLE proceso IS 'nombre de los procesos';


--
-- Name: COLUMN proceso.id_proceso; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN proceso.id_proceso IS 'codigo del proceso';


--
-- Name: COLUMN proceso.nombre; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN proceso.nombre IS 'Nombre del proceso';


--
-- Name: COLUMN proceso.descripcion; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN proceso.descripcion IS 'descripcion del proceso';


--
-- Name: COLUMN proceso.obligatorio; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN proceso.obligatorio IS 'determina si el proceso es obligatorio';


--
-- Name: COLUMN proceso.orden_proceso; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN proceso.orden_proceso IS 'es el orden consecutivo de los procesos';


--
-- Name: seguimiento; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE seguimiento (
    orden character varying(20) NOT NULL,
    proceso character varying(15),
    unidad integer NOT NULL,
    inicio integer DEFAULT date_part('epoch'::text, now()),
    finalizacion integer
);


ALTER TABLE public.seguimiento OWNER TO cdiazz;

--
-- Name: TABLE seguimiento; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON TABLE seguimiento IS 'Es el seguimiento a los procesos de cada orden';


--
-- Name: COLUMN seguimiento.orden; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN seguimiento.orden IS 'Orden de ingreso del material';


--
-- Name: COLUMN seguimiento.proceso; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN seguimiento.proceso IS 'Identificacion del codigo de barras';


--
-- Name: COLUMN seguimiento.inicio; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN seguimiento.inicio IS 'fecha y hora de inicio del proceso';


--
-- Name: COLUMN seguimiento.finalizacion; Type: COMMENT; Schema: public; Owner: cdiazz
--

COMMENT ON COLUMN seguimiento.finalizacion IS 'fecha y hora de finalizacion del proceso';


--
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


ALTER TABLE public.spatial_ref_sys OWNER TO postgres;

--
-- Name: unidades; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE unidades (
    unidad serial NOT NULL,
    orden character varying(20) NOT NULL
);


ALTER TABLE public.unidades OWNER TO cdiazz;

--
-- Name: unidades_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: cdiazz
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('unidades', 'unidad'), 1158, true);


--
-- Name: usuario_control; Type: TABLE; Schema: public; Owner: cdiazz; Tablespace: 
--

CREATE TABLE usuario_control (
    cedula character varying(20) NOT NULL,
    nombre character varying(50)
)
INHERITS (usuario);


ALTER TABLE public.usuario_control OWNER TO cdiazz;

--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: cdiazz
--



--
-- Data for Name: geometry_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: cdiazz
--

INSERT INTO orden VALUES ('2345', 'CR2345', 5, 1215462729, 'WWWW', 'WSSS', 'DFFF', '10', '10', '15', '12', 'BUENA', 'NINGUNA');


--
-- Data for Name: proceso; Type: TABLE DATA; Schema: public; Owner: cdiazz
--

INSERT INTO proceso VALUES ('CR001', 'CRUDA', '', false, NULL);
INSERT INTO proceso VALUES ('RF001', 'REFRIGERACION', '', false, NULL);
INSERT INTO proceso VALUES ('CUR001', 'CURTIDO', '', false, NULL);
INSERT INTO proceso VALUES ('REM001', 'REMOJO', '', false, NULL);
INSERT INTO proceso VALUES ('BLA001', 'BLANQUEO', '', false, NULL);
INSERT INTO proceso VALUES ('ACA001', 'ACABADO', '', false, NULL);
INSERT INTO proceso VALUES ('MOV001', 'MOVILIZACION', '', false, NULL);
INSERT INTO proceso VALUES ('RECU001', 'RECURTIDO', '', false, NULL);
INSERT INTO proceso VALUES ('PEL001', 'PELAMBRE', '', false, NULL);
INSERT INTO proceso VALUES ('PICK001', 'PICKALADA', '', false, NULL);
INSERT INTO proceso VALUES ('EX001', 'EXPORTACION', '', false, NULL);
INSERT INTO proceso VALUES ('TEJ001', 'TEJIDO', '', false, NULL);


--
-- Data for Name: seguimiento; Type: TABLE DATA; Schema: public; Owner: cdiazz
--

INSERT INTO seguimiento VALUES ('2345', 'CR001', 1154, 1215465072, 1215465084);
INSERT INTO seguimiento VALUES ('2345', 'CR001', 1155, 1215465141, 1215465170);
INSERT INTO seguimiento VALUES ('2345', 'CR001', 1156, 1215465146, 1215465192);
INSERT INTO seguimiento VALUES ('2345', 'CR001', 1157, 1215465152, 1215465207);
INSERT INTO seguimiento VALUES ('2345', 'CR001', 1158, 1215465157, 1215465220);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: cdiazz
--

INSERT INTO unidades VALUES (1154, '2345');
INSERT INTO unidades VALUES (1155, '2345');
INSERT INTO unidades VALUES (1156, '2345');
INSERT INTO unidades VALUES (1157, '2345');
INSERT INTO unidades VALUES (1158, '2345');


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: cdiazz
--



--
-- Data for Name: usuario_control; Type: TABLE DATA; Schema: public; Owner: cdiazz
--

INSERT INTO usuario_control VALUES ('71319726', 'darcila', 'usuario', '6c26fc9d4bf493a4b65d531ed1896471', false, '71319726', 'DIEGO ARCILA HERRERA');
INSERT INTO usuario_control VALUES ('1234567', 'USUARIO', 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', false, '1234567', 'USUARIO');
INSERT INTO usuario_control VALUES ('70033031', 'cdiazz', 'admin', '0dfd44e44b4e4bb70b6ff1afb4c3acb6', true, '70033031', 'CARLOS ARTURO');


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


ALTER INDEX public.cliente_pkey OWNER TO cdiazz;

--
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


ALTER INDEX public.geometry_columns_pk OWNER TO postgres;

--
-- Name: orden_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (orden);


ALTER INDEX public.orden_pkey OWNER TO cdiazz;

--
-- Name: proceso_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY proceso
    ADD CONSTRAINT proceso_pkey PRIMARY KEY (id_proceso);


ALTER INDEX public.proceso_pkey OWNER TO cdiazz;

--
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


ALTER INDEX public.spatial_ref_sys_pkey OWNER TO postgres;

--
-- Name: unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT unidades_pkey PRIMARY KEY (unidad);


ALTER INDEX public.unidades_pkey OWNER TO cdiazz;

--
-- Name: usuario_lineadigital_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY usuario_control
    ADD CONSTRAINT usuario_lineadigital_pkey PRIMARY KEY (cedula);


ALTER INDEX public.usuario_lineadigital_pkey OWNER TO cdiazz;

--
-- Name: usuario_nombre_usuario_key; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nombre_usuario_key UNIQUE (nombre_usuario);


ALTER INDEX public.usuario_nombre_usuario_key OWNER TO cdiazz;

--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: cdiazz; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


ALTER INDEX public.usuario_pkey OWNER TO cdiazz;

--
-- Name: fk_orden; Type: FK CONSTRAINT; Schema: public; Owner: cdiazz
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT fk_orden FOREIGN KEY (orden) REFERENCES orden(orden) ON UPDATE CASCADE;


--
-- Name: seguimiento_orden_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cdiazz
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT seguimiento_orden_fkey FOREIGN KEY (orden) REFERENCES orden(orden) ON UPDATE CASCADE;


--
-- Name: seguimiento_proceso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cdiazz
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT seguimiento_proceso_fkey FOREIGN KEY (proceso) REFERENCES proceso(id_proceso) ON UPDATE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO lineadigital;


--
-- PostgreSQL database dump complete
--

