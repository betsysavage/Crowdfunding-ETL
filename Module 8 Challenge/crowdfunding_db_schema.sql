-- Create ERD structure for table relationships

campaign
-
cf_id int PK
contact_id int FK - contacts.contact_id
company_name varchar(100)
description text
goal numeric(10,2)
pledged numeric(10,2)
outcome varchar(50)
backers_count int
country varchar(10)
currency varchar(10)
launch_date date
end_date date
category_id varchar(10) FK >- category.category_id
subcategory_id varchar(10) FK >- subcategory.subcategory_id

category
-
category_id varchar(10) PK
category_name varchar(50)

subcategory
-
subcategory_id varchar(10) PK
subcategory_name varchar(50)

contacts
-
contact_id int PK
first_name varchar(50)
last_name varchar(50)
email varchar(100)

backers
-
backer_id int PK
cf_id int FK - campaign.cf_id
first_name varchar(50)
last_name varchar(50)
email varchar(100)

--Making tables and uploading data

CREATE TABLE campaign (
	cf_id int,
	contact_id int,
	company_name varchar(100),
	description text,
	goal numeric(10,2),
	pledged numeric(10,2),
	outcome varchar(50),
	backers_count int,
	country varchar(10),
	currency varchar(10),
	launch_date date,
	end_date date,
	category_id varchar(10),
	subcategory_id varchar(10),
FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
FOREIGN KEY (category_id) REFERENCES category (category_id),
FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id),
	PRIMARY KEY (cf_id)
);

CREATE TABLE category (
	category_id varchar(10),
	category_name varchar(50),
	PRIMARY KEY (category_id)
);

CREATE TABLE subcategory (
	subcategory_id varchar(10),
	subcategory_name varchar(50),
	PRIMARY KEY (subcategory_id)
);

CREATE TABLE contacts (
	contact_id int,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
	PRIMARY KEY (contact_id)
);

CREATE TABLE backers (
	backer_id varchar(10),
	cf_id int,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
FOREIGN KEY (cf_id) REFERENCES campaign (cf_id),
	PRIMARY KEY (backer_id)
);

SELECT * FROM backers;