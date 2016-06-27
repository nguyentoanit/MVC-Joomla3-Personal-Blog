INSERT INTO `#__content_types`
(`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`)
VALUES (
	0,
	'Document',
	'com_docstation.download',
	'{"special":{"dbtable":"#__docstation","key":"id","type":"Documents","prefix":"DocStationTable","config":"array()"}}',
	'',
	'{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"id","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"null", "core_featured":"null", "core_metadata":"null", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"ordering", "core_metakey":"null", "core_metadesc":"null", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"null"}]}',
	'DocStationHelperRoute::getDocumentRoute'
), (
	0,
	'Document Category',
	'com_docstation.category',
	'{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}',
	'',
	'{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}',
	'DocStationHelperRoute::getCategoryRoute'
);