CREATE TABLE #__docstation
(
	id serial NOT NULL,
	title character varying(255) NOT NULL,
	alias character varying(255) NOT NULL,
	description text NOT NULL DEFAULT ''::text,
	file_name character varying(255) NOT NULL,
	file_type character varying(255) NOT NULL,
	file_size character varying(255) NOT NULL,
	parent_type character varying(255) NOT NULL,
	parent_id integer NOT NULL DEFAULT 0,
	hits integer NOT NULL DEFAULT 0,
	ordering integer NOT NULL DEFAULT 0,
	access smallint NOT NULL DEFAULT 0::smallint,
	published smallint NOT NULL DEFAULT 0::smallint,
	created timestamp without time zone NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
	created_by integer NOT NULL,
	publish_up timestamp without time zone NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
	publish_down timestamp without time zone NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
	modified timestamp without time zone NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
	modified_by integer NOT NULL DEFAULT 0,
	checked_out integer NOT NULL DEFAULT 0,
	checked_out_time timestamp without time zone NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
	language character varying(7) NOT NULL DEFAULT ''::character varying,
	CONSTRAINT jdev_docstation_pkey PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
);

INSERT INTO #__content_types
(type_title, type_alias, "table", rules, field_mappings, router)
VALUES (
	'Document',
	'com_docstation.document',
	'{"special":{"dbtable":"#__docstation","key":"id","type":"Documents","prefix":"DocStationTable","config":"array()"}}',
	'',
	'{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"null", "core_featured":"null", "core_metadata":"null", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"ordering", "core_metakey":"null", "core_metadesc":"null", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"null"}]}',
	'DocStationHelperRoute::getDocumentRoute'
), (
	'Document Category',
	'com_docstation.category',
	'{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}',
	'',
	'{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}',
	'DocStationHelperRoute::getCategoryRoute'
);