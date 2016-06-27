CREATE TABLE IF NOT EXISTS `#__docstation` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL,
	`alias`	VARCHAR(255) NOT NULL,
	`description` TEXT NOT NULL,
	`file_name` TINYTEXT NOT NULL,
	`file_type` TINYTEXT NOT NULL,
	`file_size` TINYTEXT NOT NULL,
	`parent_type` TINYTEXT NOT NULL,
	`parent_id` INT NOT NULL DEFAULT '0',
	`hits` INT NOT NULL DEFAULT '0',
	`ordering` INT NOT NULL,
	`access` TINYINT NOT NULL,
	`published` TINYINT NOT NULL,
	`created` DATETIME NOT NULL,
	`created_by` INT NOT NULL,
	`publish_up` DATETIME NOT NULL,
	`publish_down` DATETIME NOT NULL,
	`modified` DATETIME NOT NULL,
	`modified_by` INT NOT NULL,
	`checked_out` INT NOT NULL,
	`checked_out_time` TIMESTAMP NOT NULL,
	`language` CHAR(7) NOT NULL,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `#__content_types`
(`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`)
VALUES (
	0,
	'Document',
	'com_docstation.document',
	'{"special":{"dbtable":"#__docstation","key":"id","type":"Documents","prefix":"DocStationTable","config":"array()"}}',
	'',
	'{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"null", "core_featured":"null", "core_metadata":"null", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"ordering", "core_metakey":"null", "core_metadesc":"null", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"null"}]}',
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