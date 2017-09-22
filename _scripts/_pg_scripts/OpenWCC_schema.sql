-- 2015, EASYVOX. 
--
--
-- author: Eric CRISPIN


DROP SCHEMA IF EXISTS easyvox_openwcc CASCADE;

CREATE SCHEMA easyvox_openwcc;



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_person_title
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_person_title CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_person_title (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE ("name")
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_adm_site
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_adm_site CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_adm_site (
    "id" SERIAL NOT NULL,                   --site id: autoincrementing integer 1 to 2147483647
    "name" VARCHAR(45) NOT NULL,            --site name account: provided by Administrator
    "country_code" varchar(2) NOT NULL,      -- ISO-3166 Country Codes 
    "language" varchar(2) NOT NULL,  -- ISO-639 Language Codes
    "timezone" varchar(6) NOT NULL,  -- ISO 8601 time zone
    "place" VARCHAR(45) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    PRIMARY KEY ("id"),
    UNIQUE ("name"),
    UNIQUE ("country_code"),
    UNIQUE ("language"),
    UNIQUE ("timezone")
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_adm_group
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_adm_group CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_adm_group (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,        --group name account: provided by Administrator
    "email" varchar(50) NOT NULL,       --group email account: provided by Administrator
    "sip" varchar(50) NOT NULL,         --group sip account: provided by Administrator
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    PRIMARY KEY ("id"),
    UNIQUE ("name"),
    UNIQUE ("email"),
    UNIQUE ("sip")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_adm_user
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_adm_user CASCADE;

CREATE TABLE easyvox_openwcc.wcc_adm_user (
    "id" SERIAL NOT NULL,               --user identifier : provided by DBMS  
    "login" varchar(50) NOT NULL,       --user login : provided by Administrator
    "password" varchar(50) NOT NULL,    --user password : provided by Administrator
    "group_id" integer NOT NULL REFERENCES easyvox_openwcc.wcc_adm_group(id), --Foreign Keys
    "is_admin" boolean DEFAULT false,   --is Administrator : provided by Administrator
    "is_superv" boolean DEFAULT false,  --is Supervisor : provided by Administrator
    "is_sales" boolean DEFAULT false,   --is Sales : provided by Administrator
    "is_locked" boolean DEFAULT true,   --is Locked : provided by Administrator
    "firstname" varchar(50) NOT NULL,   --user firstname: provided by Administrator
    "lastname" varchar(50) NOT NULL,        --user name: provided by Administrator
    "email" varchar(50) NOT NULL,       --user email: provided by Administrator
    "sip" varchar(50) NOT NULL,         --user sip account: provided by Administrator
    "country_code" varchar(2) NOT NULL, --user_country_code : ISO 3166-1 provided by Administrator
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    UNIQUE("id"),           -- Index
    PRIMARY KEY ("login"),  -- Index pkey
    UNIQUE("email"),        -- Index
    UNIQUE("sip")           -- Index
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_crm_task
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_crm_task CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_crm_task (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "customer_id" integer NOT NULL, --REFERENCES easyvox_openwcc.wcc_customer(id),
    "description" VARCHAR(45) NOT NULL,
    "category" varchar(50) NOT NULL,
    "status" VARCHAR(45) NOT NULL,  -- Future, Started On Time, Should Have Started, Overdue, Done !
    "work" VARCHAR(45) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    "assigned_user" VARCHAR(45) REFERENCES easyvox_openwcc.wcc_adm_user(login),
    "start_date" timestamp  NOT NULL, -- start_date
    "finish_date" timestamp  NOT NULL, -- finish_date
    "duration" varchar(20),
    "comments" text,
    PRIMARY KEY ("id"),
        UNIQUE("name") 
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_erp_task
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_erp_task CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_erp_task (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "project_id" integer NOT NULL, --REFERENCES easyvox_openwcc.wcc_project(id),
    "description" VARCHAR(45) NOT NULL,
    "category" varchar(50) NOT NULL,
    "status" VARCHAR(45) NOT NULL,  -- Future, Started On Time, Should Have Started, Overdue, Done !
    "work" VARCHAR(45) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    "assigned_user" VARCHAR(45) REFERENCES easyvox_openwcc.wcc_adm_user(login),
    "start_date" timestamp  NOT NULL, -- start_date
    "finish_date" timestamp  NOT NULL, -- finish_date
    "duration" varchar(20),
    "comments" text,
    PRIMARY KEY ("id"),
        UNIQUE("name") 
);

-----------------------********************-------------------------------------
--------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_company_legal_form
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_company_legal_form CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_company_legal_form (
  "id" SERIAL NOT NULL,
  "acronym" VARCHAR(20) NOT NULL,
  "description" varchar(50) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("acronym")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_company_category
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_company_category CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_company_category (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(20) NOT NULL,
  "description" varchar(50) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name")
);

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_company_legal_ref
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_company_legal_ref CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_company_legal_ref (
  "id" SERIAL NOT NULL,
  "country" VARCHAR(20) NOT NULL,
  "name" VARCHAR(20) NOT NULL,
  "description" varchar(50) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name")
);

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_company
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_company CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_company (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL, 
    "legal_form" VARCHAR(45) NOT NULL REFERENCES easyvox_openwcc.wcc_company_legal_form(acronym),
    "category" varchar(50) NOT NULL REFERENCES easyvox_openwcc.wcc_company_category(name),
    "is_webcompany" boolean NOT NULL,
    "web" varchar(50),
    "legal_ref_1" varchar(20) NOT NULL REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)SIREN
    "legal_ref_2" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)SIRET
    "legal_ref_3" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)APE
    "legal_ref_4" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)RCS
    "legal_ref_5" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)TVA
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    PRIMARY KEY ("id"),
        UNIQUE("name") 
);

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_company_site
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_company_site CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_company_site (
    "company_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_company(id),
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "location" VARCHAR(45) NOT NULL,
    "type" varchar(50) NOT NULL,
    "phone" VARCHAR(45) NOT NULL,
    "email" varchar(50),   
    "fax" VARCHAR(45),
    "sip" varchar(50),
    "web" varchar(50),
    "legal_ref_1" varchar(20) NOT NULL REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)SIREN
    "legal_ref_2" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)SIRET
    "legal_ref_3" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)APE
    "legal_ref_4" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)RCS
    "legal_ref_5" varchar(20) REFERENCES easyvox_openwcc.wcc_company_legal_ref(name),  --(FR)TVA
    "address" VARCHAR(45) NOT NULL,
    "shipping_address" VARCHAR(45) NOT NULL,
    "country_code" varchar(2) NOT NULL, --customer_country_code : ISO 3166-1 provided by Customer
    "country" varchar(35) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    PRIMARY KEY ("id")    
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_customer_b2b_jobtitle
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_customer_b2b_jobtitle CASCADE;

CREATE TABLE easyvox_openwcc.wcc_customer_b2b_jobtitle (
    "id" SERIAL NOT NULL,               --user identifier : provided by DBMS  
    "name" INT NOT NULL,
    "description" varchar(50) NOT NULL,   --user firstname: provided by Administrator
    PRIMARY KEY ("id"),
    UNIQUE("name")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_customer_b2b
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_customer_b2b CASCADE;

CREATE TABLE easyvox_openwcc.wcc_customer_b2b (
    "id" SERIAL NOT NULL,               --user identifier : provided by DBMS  
    "company_site_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_company_site(id),
    "jobtitle" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2b_jobtitle(id),
    "firstname" varchar(50) NOT NULL,   --user firstname: provided by Administrator
    "lastname" varchar(50) NOT NULL,        --user name: provided by Administrator
    "email" varchar(50) NOT NULL,       --user email: provided by Administrator
    "phone" VARCHAR(45) NOT NULL,
    "mobile" VARCHAR(45),
    "fax" VARCHAR(45),
    "sip" varchar(50),         --user sip account: provided by Administrator
    "country_code" varchar(2) NOT NULL, --user_country_code : ISO 3166-1 provided by Administrator
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    UNIQUE("id"),
    PRIMARY KEY ("email"),
    UNIQUE("phone"),
    UNIQUE("sip")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.bizshop_customer_b2b_order
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.bizshop_customer_b2b_order CASCADE;

CREATE  TABLE easyvox_openwcc.bizshop_customer_b2b_order (
  "id" SERIAL NOT NULL,
  "amount" DECIMAL(6,2) NOT NULL,
  "date_created" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "confirmation_number" INT NOT NULL,
  "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2b(id),
  PRIMARY KEY ("id")
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.bizshop_category
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.bizshop_category CASCADE;

CREATE  TABLE easyvox_openwcc.bizshop_category (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(45) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
  PRIMARY KEY ("id") 
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.bizshop_product
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.bizshop_product CASCADE;

CREATE TABLE easyvox_openwcc.bizshop_product (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "supplier_price" DECIMAL(5,2) NOT NULL,
    CHECK ("supplier_price" > 0),
  "selling_price" DECIMAL(5,2) NOT NULL, 
    CHECK ("selling_price" > "supplier_price"),
  "discounted_price" DECIMAL(5,2) NOT NULL,
    CHECK ("selling_price" > "discounted_price"),
  "description" VARCHAR NULL,
  "last_update" TIMESTAMP NOT NULL,
  "category_id" INT NOT NULL REFERENCES easyvox_openwcc.bizshop_category(id),
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
  PRIMARY KEY ("id"),
    UNIQUE ("name")
    
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.bizshop_ordered_product
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.bizshop_ordered_product CASCADE;

CREATE  TABLE easyvox_openwcc.bizshop_ordered_product (
  "customer_b2b_order_id" INT NOT NULL REFERENCES easyvox_openwcc.bizshop_customer_b2b_order(id) ON DELETE CASCADE,
  "product_id" INT NOT NULL REFERENCES easyvox_openwcc.bizshop_product(id) ON DELETE RESTRICT,
  "quantity" INT NOT NULL DEFAULT 1,
  PRIMARY KEY ("customer_b2b_order_id", "product_id")
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcb_b2b_record
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcb_b2b_record CASCADE;

CREATE TABLE easyvox_openwcc.wcb_b2b_record (
    "id" SERIAL NOT NULL,          --callback identifier: provided by WCC
    "topic" varchar(20) NOT NULL,       --callback topic: provided by Customer on a drop-down list
    "scheduled_date" date NOT NULL,        --callback date: provided by Customer on a Calendar
    "number" varchar(30) NOT NULL,      --callback number: provided by Customer
    "number_type" varchar(30) NOT NULL, --callback number type: provided by WCC {Mobile | Home | Work}
    "type" varchar(30) NOT NULL,        --callback type: provided by WCC {Personal | Campaign}
    "scheduled_time" time NOT NULL,      --callback_schedule_time : provided by Customer
    "status" varchar(30) NOT NULL,      --callback status : provided by WCC
    "attempt" int NOT NULL,                      --attempt : provided by WCC
    "call_timestamp" timestamp with time zone,      --call timestamp : provided by CTI_toolbar
    "call_result" varchar(30),          --call result : provided by CTI_toolbar
    "call_duration" time,               --call duration : provided by CTI_toolbar
    "call_comments" text,            --callback_comments : provided by CTI_toolbar                 
    "user_login" varchar(50) REFERENCES easyvox_openwcc.wcc_adm_user(login),    --operator username : provided by CTI_toolbar
    "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2b(id),          --customer identifier: provided by Customer
    "company_site_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_company_site(id),    
    PRIMARY KEY ("id")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.acw_b2b_report
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.acw_b2b_report CASCADE;

CREATE TABLE easyvox_openwcc.acw_b2b_report (
    "id" varchar(50) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    "reason" varchar(50), 
    "recording_id" varchar(50) NOT NULL, 
    "comments" text,
    "user_login" varchar(50) NOT NULL REFERENCES easyvox_openwcc.wcc_adm_user(login),    --operator username : provided by CTI_toolbar
    "company_site_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_company_site(id),
    "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2b(id),           --customer identifier: provided by Customer    
    PRIMARY KEY ("id"),
    UNIQUE("recording_id")
);


-- ----- -- ----- -- ----- -- ----- -- ----- -- ----- -- ----- -- ---- ----- --

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_customer_b2c_category
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_customer_b2c_category CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_customer_b2c_category (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(20) NOT NULL,
  "description" varchar(50) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name")
);

-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcc_customer_b2c
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcc_customer_b2c CASCADE;

CREATE  TABLE easyvox_openwcc.wcc_customer_b2c (
    "id" SERIAL NOT NULL,
    "firstname" VARCHAR(45) NOT NULL,
    "lastname" VARCHAR(45) NOT NULL,
    "category" varchar(50) NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2c_category(name),
    "is_webcustomer" boolean NOT NULL, 
    "email" VARCHAR(45) NOT NULL,
    "phone" VARCHAR(45) NOT NULL,
    "fax" VARCHAR(45),
    "sip" VARCHAR(45),
    "address" VARCHAR(45) NOT NULL,
    "shipping_address" VARCHAR(45) NOT NULL,
    "country_code" varchar(2) NOT NULL, --customer_country_code : ISO 3166-1 provided by Customer
    "country" varchar(35) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
    PRIMARY KEY ("id"),
        UNIQUE("email"),
        UNIQUE("phone") 
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.webshop_customer_b2c_order
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.webshop_customer_b2c_order CASCADE;

CREATE  TABLE easyvox_openwcc.webshop_customer_b2c_order (
  "id" SERIAL NOT NULL,
  "amount" DECIMAL(6,2) NOT NULL,
  "date_created" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "confirmation_number" INT NOT NULL,
  "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2c(id),
  PRIMARY KEY ("id")
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.webshop_category
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.webshop_category CASCADE;

CREATE  TABLE easyvox_openwcc.webshop_category (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(45) NOT NULL,
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
  PRIMARY KEY ("id") 
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.webshop_product
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.webshop_product CASCADE;

CREATE TABLE easyvox_openwcc.webshop_product (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "supplier_price" DECIMAL(5,2) NOT NULL,
    CHECK ("supplier_price" > 0),
  "selling_price" DECIMAL(5,2) NOT NULL, 
    CHECK ("selling_price" > "supplier_price"),
  "discounted_price" DECIMAL(5,2) NOT NULL,
    CHECK ("selling_price" > "discounted_price"),
  "description" VARCHAR NULL,
  "last_update" TIMESTAMP NOT NULL,
  "category_id" INT NOT NULL REFERENCES easyvox_openwcc.webshop_category(id),
    "created_by" varchar(20) NOT NULL,  -- created_by
    "created_date" timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP, -- created_date
    "updated_by" varchar(20),  -- updated_by
    "updated_date" timestamp DEFAULT CURRENT_TIMESTAMP, -- updated_date
  PRIMARY KEY ("id"),
    UNIQUE ("name")
    
);



-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.webshop_ordered_product
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.webshop_ordered_product CASCADE;

CREATE  TABLE easyvox_openwcc.webshop_ordered_product (
  "customer_b2c_order_id" INT NOT NULL REFERENCES easyvox_openwcc.webshop_customer_b2c_order(id) ON DELETE CASCADE,
  "product_id" INT NOT NULL REFERENCES easyvox_openwcc.webshop_product(id) ON DELETE RESTRICT,
  "quantity" INT NOT NULL DEFAULT 1,
  PRIMARY KEY ("customer_b2c_order_id", "product_id")
);




-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.wcb_b2c_record
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.wcb_b2c_record CASCADE;

CREATE TABLE easyvox_openwcc.wcb_b2c_record (
    "id" SERIAL NOT NULL,          --callback identifier: provided by WCC
    "topic" varchar(20) NOT NULL,       --callback topic: provided by Customer on a drop-down list
    "scheduled_date" date NOT NULL,        --callback date: provided by Customer on a Calendar
    "number" varchar(30) NOT NULL,      --callback number: provided by Customer
    "number_type" varchar(30) NOT NULL, --callback number type: provided by WCC {Mobile | Home | Work}
    "type" varchar(30) NOT NULL,        --callback type: provided by WCC {Personal | Campaign}
    "scheduled_time" time NOT NULL,      --callback_schedule_time : provided by Customer
    "status" varchar(30) NOT NULL,      --callback status : provided by WCC
    "attempt" int NOT NULL,                      --attempt : provided by WCC
    "call_timestamp" timestamp with time zone,      --call timestamp : provided by CTI_toolbar
    "call_result" varchar(30),          --call result : provided by CTI_toolbar
    "call_duration" time,               --call duration : provided by CTI_toolbar
    "call_comments" text,            --callback_comments : provided by CTI_toolbar                 
    "user_login" varchar(50) REFERENCES easyvox_openwcc.wcc_adm_user(login),    --operator username : provided by CTI_toolbar
    "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2c(id),          --customer identifier: provided by Customer    
    PRIMARY KEY ("id")
);


-- -----------------------------------------------------------------------------
-- Table easyvox_openwcc.acw_b2c_report
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS easyvox_openwcc.acw_b2c_report CASCADE;

CREATE TABLE easyvox_openwcc.acw_b2c_report (
    "id" varchar(50) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    "reason" varchar(50), 
    "recording_id" varchar(50) NOT NULL, 
    "comments" text,
    "user_login" varchar(50) NOT NULL REFERENCES easyvox_openwcc.wcc_adm_user(login),    --operator username : provided by CTI_toolbar
    "customer_id" INT NOT NULL REFERENCES easyvox_openwcc.wcc_customer_b2c(id),           --customer identifier: provided by Customer    
    PRIMARY KEY ("id"),
    UNIQUE("recording_id")
);

