#
#<?php die('Forbidden.'); ?>
#Date: 2016-02-16 10:46:09 UTC
#Software: Joomla Platform 13.1.0 Stable [ Curiosity ] 24-Apr-2013 00:00 GMT

#Fields: datetime	priority clientip	category	message
2016-02-16T10:46:09+00:00	ERROR ::1	com_cjblog	createMenuItems: Another menu item has the same alias in Root (remember it may be a trashed item). Root is the top level parent.| Alias: blog| Table: JTableMenu Object
(
    [parent_id] => 1
    [level] => 1
    [lft] => 
    [rgt] => 
    [alias] => blog
    [_location:protected] => last-child
    [_location_id:protected] => 1
    [_cache:protected] => Array
        (
        )

    [_debug:protected] => 0
    [_tbl:protected] => #__menu
    [_tbl_key:protected] => id
    [_tbl_keys:protected] => Array
        (
            [0] => id
        )

    [_db:protected] => JDatabaseDriverMysqli Object
        (
            [name] => mysqli
            [nameQuote:protected] => `
            [nullDate:protected] => 0000-00-00 00:00:00
            [_database:JDatabaseDriver:private] => Travelify
            [connection:protected] => mysqli Object
                (
                    [affected_rows] => 1
                    [client_info] => mysqlnd 5.0.11-dev - 20120503 - $Id: bf9ad53b11c9a57efdb1057292d73b928b8c5c77 $
                    [client_version] => 50011
                    [connect_errno] => 0
                    [connect_error] => 
                    [errno] => 0
                    [error] => 
                    [error_list] => Array
                        (
                        )

                    [field_count] => 24
                    [host_info] => localhost via TCP/IP
                    [info] => 
                    [insert_id] => 0
                    [server_info] => 5.6.17
                    [server_version] => 50617
                    [stat] => Uptime: 21525  Threads: 1  Questions: 13034  Slow queries: 0  Opens: 171  Flush tables: 1  Open tables: 115  Queries per second avg: 0.605
                    [sqlstate] => 00000
                    [protocol_version] => 10
                    [thread_id] => 472
                    [warning_count] => 0
                )

            [count:protected] => 122
            [cursor:protected] => 
            [debug:protected] => 
            [limit:protected] => 0
            [log:protected] => Array
                (
                )

            [timings:protected] => Array
                (
                )

            [callStacks:protected] => Array
                (
                )

            [offset:protected] => 0
            [options:protected] => Array
                (
                    [driver] => mysqli
                    [host] => localhost
                    [user] => root
                    [password] => 
                    [database] => Travelify
                    [prefix] => hyxu5_
                    [select] => 1
                    [port] => 3306
                    [socket] => 
                )

            [sql:protected] => JDatabaseQueryMysqli Object
                (
                    [offset:protected] => 0
                    [limit:protected] => 0
                    [db:protected] => JDatabaseDriverMysqli Object
 *RECURSION*
                    [sql:protected] => 
                    [type:protected] => select
                    [element:protected] => 
                    [select:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => SELECT
                            [elements:protected] => Array
                                (
                                    [0] => *
                                )

                            [glue:protected] => ,
                        )

                    [delete:protected] => 
                    [update:protected] => 
                    [insert:protected] => 
                    [from:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => FROM
                            [elements:protected] => Array
                                (
                                    [0] => #__menu
                                )

                            [glue:protected] => ,
                        )

                    [join:protected] => 
                    [set:protected] => 
                    [where:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => WHERE
                            [elements:protected] => Array
                                (
                                    [0] => `alias` = 'blog'
                                    [1] => `parent_id` = '1'
                                    [2] => `client_id` = '0'
                                    [3] => `language` = '*'
                                )

                            [glue:protected] =>  AND 
                        )

                    [group:protected] => 
                    [having:protected] => 
                    [columns:protected] => 
                    [values:protected] => 
                    [order:protected] => 
                    [autoIncrementField:protected] => 
                    [call:protected] => 
                    [exec:protected] => 
                    [union:protected] => 
                    [unionAll:protected] => 
                )

            [tablePrefix:protected] => hyxu5_
            [utf:protected] => 1
            [errorNum:protected] => 0
            [errorMsg:protected] => 
            [transactionDepth:protected] => 0
            [disconnectHandlers:protected] => Array
                (
                )

        )

    [_trackAssets:protected] => 
    [_rules:protected] => 
    [_locked:protected] => 
    [_autoincrement:protected] => 1
    [_observers:protected] => JObserverUpdater Object
        (
            [observers:protected] => Array
                (
                )

            [doCallObservers:protected] => 1
        )

    [_columnAlias:protected] => Array
        (
        )

    [_jsonEncode:protected] => Array
        (
        )

    [_errors:protected] => Array
        (
            [0] => Another menu item has the same alias in Root (remember it may be a trashed item). Root is the top level parent.
        )

    [id] => 
    [menutype] => cjblogmenu
    [title] => CjBlog
    [note] => 
    [path] => blog
    [link] => index.php?option=com_cjblog&view=categories
    [type] => component
    [published] => 1
    [component_id] => 10015
    [checked_out] => 
    [checked_out_time] => 
    [browserNav] => 
    [access] => 1
    [img] =>  
    [template_style_id] => 
    [params] => {"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}
    [home] => 0
    [language] => *
    [client_id] => 0
)

2016-02-18T04:27:45+00:00	ERROR ::1	com_cjblog	createMenuItems: Another menu item has the same alias in Root (remember it may be a trashed item). Root is the top level parent.| Alias: blog| Table: JTableMenu Object
(
    [parent_id] => 1
    [level] => 1
    [lft] => 
    [rgt] => 
    [alias] => blog
    [_location:protected] => last-child
    [_location_id:protected] => 1
    [_cache:protected] => Array
        (
        )

    [_debug:protected] => 0
    [_tbl:protected] => #__menu
    [_tbl_key:protected] => id
    [_tbl_keys:protected] => Array
        (
            [0] => id
        )

    [_db:protected] => JDatabaseDriverMysqli Object
        (
            [name] => mysqli
            [nameQuote:protected] => `
            [nullDate:protected] => 0000-00-00 00:00:00
            [_database:JDatabaseDriver:private] => Travelify
            [connection:protected] => mysqli Object
                (
                    [affected_rows] => 1
                    [client_info] => mysqlnd 5.0.11-dev - 20120503 - $Id: bf9ad53b11c9a57efdb1057292d73b928b8c5c77 $
                    [client_version] => 50011
                    [connect_errno] => 0
                    [connect_error] => 
                    [errno] => 0
                    [error] => 
                    [error_list] => Array
                        (
                        )

                    [field_count] => 24
                    [host_info] => localhost via TCP/IP
                    [info] => 
                    [insert_id] => 0
                    [server_info] => 5.6.17
                    [server_version] => 50617
                    [stat] => Uptime: 48795  Threads: 1  Questions: 11060  Slow queries: 0  Opens: 354  Flush tables: 1  Open tables: 188  Queries per second avg: 0.226
                    [sqlstate] => 00000
                    [protocol_version] => 10
                    [thread_id] => 367
                    [warning_count] => 0
                )

            [count:protected] => 123
            [cursor:protected] => 
            [debug:protected] => 
            [limit:protected] => 0
            [log:protected] => Array
                (
                )

            [timings:protected] => Array
                (
                )

            [callStacks:protected] => Array
                (
                )

            [offset:protected] => 0
            [options:protected] => Array
                (
                    [driver] => mysqli
                    [host] => localhost
                    [user] => root
                    [password] => 
                    [database] => Travelify
                    [prefix] => hyxu5_
                    [select] => 1
                    [port] => 3306
                    [socket] => 
                )

            [sql:protected] => JDatabaseQueryMysqli Object
                (
                    [offset:protected] => 0
                    [limit:protected] => 0
                    [db:protected] => JDatabaseDriverMysqli Object
 *RECURSION*
                    [sql:protected] => 
                    [type:protected] => select
                    [element:protected] => 
                    [select:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => SELECT
                            [elements:protected] => Array
                                (
                                    [0] => *
                                )

                            [glue:protected] => ,
                        )

                    [delete:protected] => 
                    [update:protected] => 
                    [insert:protected] => 
                    [from:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => FROM
                            [elements:protected] => Array
                                (
                                    [0] => #__menu
                                )

                            [glue:protected] => ,
                        )

                    [join:protected] => 
                    [set:protected] => 
                    [where:protected] => JDatabaseQueryElement Object
                        (
                            [name:protected] => WHERE
                            [elements:protected] => Array
                                (
                                    [0] => `alias` = 'blog'
                                    [1] => `parent_id` = '1'
                                    [2] => `client_id` = '0'
                                    [3] => `language` = '*'
                                )

                            [glue:protected] =>  AND 
                        )

                    [group:protected] => 
                    [having:protected] => 
                    [columns:protected] => 
                    [values:protected] => 
                    [order:protected] => 
                    [autoIncrementField:protected] => 
                    [call:protected] => 
                    [exec:protected] => 
                    [union:protected] => 
                    [unionAll:protected] => 
                )

            [tablePrefix:protected] => hyxu5_
            [utf:protected] => 1
            [errorNum:protected] => 0
            [errorMsg:protected] => 
            [transactionDepth:protected] => 0
            [disconnectHandlers:protected] => Array
                (
                )

        )

    [_trackAssets:protected] => 
    [_rules:protected] => 
    [_locked:protected] => 
    [_autoincrement:protected] => 1
    [_observers:protected] => JObserverUpdater Object
        (
            [observers:protected] => Array
                (
                )

            [doCallObservers:protected] => 1
        )

    [_columnAlias:protected] => Array
        (
        )

    [_jsonEncode:protected] => Array
        (
        )

    [_errors:protected] => Array
        (
            [0] => Another menu item has the same alias in Root (remember it may be a trashed item). Root is the top level parent.
        )

    [id] => 
    [menutype] => cjblogmenu
    [title] => CjBlog
    [note] => 
    [path] => blog
    [link] => index.php?option=com_cjblog&view=categories
    [type] => component
    [published] => 1
    [component_id] => 10073
    [checked_out] => 
    [checked_out_time] => 
    [browserNav] => 
    [access] => 1
    [img] =>  
    [template_style_id] => 
    [params] => {"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}
    [home] => 0
    [language] => *
    [client_id] => 0
)

