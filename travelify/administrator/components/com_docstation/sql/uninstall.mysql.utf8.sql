DROP TABLE IF EXISTS `#__docstation`;

DELETE FROM `#__content_types`
WHERE `type_alias`='com_docstation.document' OR `type_alias`='com_docstation.category'