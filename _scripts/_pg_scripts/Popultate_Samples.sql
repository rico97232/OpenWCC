-- 2015, EASYVOX. 
--
--
-- author: Eric CRISPIN
--
-- POPULATE DATEBASE

-- -----------------------------------------------------------------------------
-- WCC_SITE
-- -----------------------------------------------------------------------------

--INSERT INTO easyvox_openwcc.wcc_adm_site ("name", "country", "country_code" , "international_code", "timezone", "place") 
	--VALUES ('Zikak','Martinique', 'MQ','596', 'UTC−04:00', 'Ducos');

--INSERT INTO easyvox_openwcc.wcc_adm_site ("name", "country", "country_code" , "international_code", "timezone", "place") 
	--VALUES ('Bellevue','France', 'FR','33', 'UTC+02:00', 'Boulogne-Billancourt');


-- -----------------------------------------------------------------------------
-- WCC_GROUP
-- -----------------------------------------------------------------------------

INSERT INTO easyvox_openwcc.wcc_adm_group ("name", "email" , "sip", "created_by") 
	VALUES ('admin', 'admin@easyvox.org','admin@mySip.net', 'System');

INSERT INTO easyvox_openwcc.wcc_adm_group ("name", "email" , "sip", "created_by") 
	VALUES ('support', 'support@easyvox.org','support@mySip.net', 'Sample');

INSERT INTO easyvox_openwcc.wcc_adm_group ("name", "email" , "sip", "created_by") 
	VALUES ('sales', 'sales@easyvox.org','sales@mySip.net', 'Sample');


-- -----------------------------------------------------------------------------
-- WCC_USER
-- -----------------------------------------------------------------------------

INSERT INTO easyvox_openwcc.wcc_adm_user ("login", "password", "group_id", "is_admin", "is_superv", "is_sales", "is_locked", "firstname", "lastname","email", "sip", "country_code", "created_by") 
	VALUES ('rico','rico', '1', 'true', 'true', 'false', 'false', 'eric','CRISPIN','eric.crispin@test.mq', 'rico@test.mq', 'MQ', 'Sample');

INSERT INTO easyvox_openwcc.wcc_adm_user ("login", "password", "group_id", "is_admin", "is_superv", "is_sales", "is_locked", "firstname", "lastname","email", "sip", "country_code", "created_by") 
	VALUES ('bob','bob','2', 'false', 'true', 'false', 'false', 'bob','MQ','bob.mq@test.mq', 'bob@test.mq', 'MQ', 'Sample');

INSERT INTO easyvox_openwcc.wcc_adm_user ("login", "password", "group_id", "is_admin", "is_superv", "is_sales", "is_locked", "firstname", "lastname","email", "sip", "country_code", "created_by")
	VALUES ('agent','agent','2', 'false', 'false', 'false','false', 'krilin','PAKAMOLI','krilin.pakamoli@test.mq', 'agent@test.mq','MQ','Sample');

INSERT INTO easyvox_openwcc.wcc_adm_user ("login", "password", "group_id", "is_admin", "is_superv", "is_sales", "is_locked", "firstname", "lastname","email", "sip", "country_code", "created_by")
	VALUES ('salesMan','salesMan','3', 'false', 'false', 'true','false', 'Bob','PASAMOLI','bob.pasamoli@test.fr', 'agent2@test.fr','FR', 'Sample');


-- -----------------------------------------------------------------------------
-- WCC_CUSTOMER_CATEGORY
-- -----------------------------------------------------------------------------

--INSERT INTO easyvox_openwcc.wcc_customer_b2c_category ("name", "description") 
--	VALUES ('VIP', 'VIP');


-- -----------------------------------------------------------------------------
-- WCC_CUSTOMER
-- -----------------------------------------------------------------------------

--INSERT INTO easyvox_openwcc.wcc_customer_b2c (firstname, "lastname", category, is_webcustomer, email, phone, fax, sip, address, shipping_address, country_code, country, created_by, created_date) 
--	VALUES ('Bob', 'Marley', 'VIP', true, 'B.M@mq.fr', '0696505562', '0596505562', 'roots@vip.mq', 'Bo kay ou', 'Marvel ', 'MQ', 'Martinique', 'rico', '2012-11-30 18:16:43.416');

--INSERT INTO easyvox_openwcc.wcc_customer_b2c (firstname, "lastname", category, is_webcustomer, email, phone, fax, sip, address, shipping_address, country_code, country, created_by, created_date) 
--	VALUES ('Bob2', 'Marley2', 'VIP', true, 'B.M2@mq.fr', '0696505563', '0596505563', 'roots2@vip.mq', 'Bo kay ou', 'Marvel ', 'MQ', 'Martinique', 'rico', '2012-11-30 18:16:43.416');


-- -----------------------------------------------------------------------------
-- WCB: Web Call Back
-- -----------------------------------------------------------------------------


--INSERT INTO easyvox_openwcc.wcb_b2c_record ("topic", "scheduled_date", "number", "number_type", "type", "scheduled_time", "status", "attempt" , "user_login", "customer_id") 
--	VALUES ('TechnicalSupport','2012-11-30', '0596505524', 'Mobile', 'Personal_CallBack', '21:30:00', 'Waiting', '0' , 'rico', '1');

-- -----------------------------------------------------------------------------
-- ACW: After Call Works
-- -----------------------------------------------------------------------------

--INSERT INTO "public".acw_reports ("call_id", "call_timestamp", "operator_id", "operator_username", "caller_country_code", "caller_id", "caller_category", "call_reason", "call_record_id", "call_comments") 
--	VALUES ('000000000a005654649494984f549894', '2012-10-11 14:59:53.66-05', '007', 'rico', 'MQ', '16548994', 'VIP', 'TechSupport', 'fze8f4z98ef494z4fzefze8494f', 'Ok - update code todo !');

--INSERT INTO "public".acw_reports ("call_id", "call_timestamp", "operator_id", "operator_username", "caller_country_code", "caller_id", "caller_category", "call_reason", "call_record_id", "call_comments") 
--	VALUES ('000000000a005654649494984f549895', '2012-10-12 08:40:05.55-05', '007', 'rico', 'FR', '16547777', 'B2B', 'TechSupport', 'fze8f4z98ef494z4fzefze8495c', 'Ok - Product Feature Request ...');

