-- Device [Device]
create table `device` (
   `oid`  integer  not null,
   `device_id`  varchar(255),
   `notification_device_id`  varchar(255),
   `model`  varchar(255),
   `platform`  varchar(255),
   `platform_version`  varchar(255),
   `browser`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Role [Role]
create table `role` (
   `oid`  integer  not null,
   `rolename`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `token`  varchar(255),
   `token_expiration_date`  datetime,
   `secretkey`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Animal [cls1]
create table `animal` (
   `oid`  integer  not null,
   `seen`  bit,
   `name`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
   `species`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Animal_Location [cls10]
create table `animal_location` (
   `oid`  integer  not null,
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Animal_Sighting [cls11]
create table `animal_sighting` (
   `oid`  integer  not null,
   `comment`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
   `address`  varchar(255),
   `latitude`  double precision,
   `longitude`  double precision,
   `image`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Geofence [cls12]
create table `geofence` (
   `oid`  integer  not null,
   `radius`  double precision,
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- blog_post [cls13]
create table `blog_post` (
   `oid`  integer  not null,
   `date_created`  datetime,
   `body`  varchar(255),
   `title`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- User_Type [cls2]
create table `user_type` (
   `oid`  integer  not null,
   `description`  varchar(255),
   `name`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Image [cls3]
create table `image` (
   `oid`  integer  not null,
   `image`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
   `address`  varchar(255),
   `latitude`  double precision,
   `longitude`  double precision,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Park [cls5]
create table `park` (
   `oid`  integer  not null,
   `description`  varchar(255),
   `link`  varchar(255),
   `name`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Location [cls6]
create table `location` (
   `oid`  integer  not null,
   `latitude`  double precision,
   `longitude`  double precision,
   `createdat`  datetime,
   `updatedat`  datetime,
   `address`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Map [cls7]
create table `map` (
   `oid`  integer  not null,
   `file`  varchar(255),
   `createdat`  datetime,
   `updatedat`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- User_Device [User2Device_Device2User]
alter table `device`  add column  `user_oid`  integer;


-- User_Role [User2Role_Role2User]
create table `user_role` (
   `user_oid`  integer not null,
   `role_oid`  integer not null,
  primary key (`user_oid`, `role_oid`)
) ENGINE=InnoDB;


-- Image_Location [as12]
alter table `location`  add column  `image_oid`  integer;


-- Animal_Sighting_Animal [as14]
alter table `animal_sighting`  add column  `animal_oid`  integer;


-- User_Animal_Sighting [as15]
alter table `animal_sighting`  add column  `user_oid`  integer;


-- Park_Animal [as16]
alter table `animal`  add column  `park_oid`  integer;


-- Geofence_Location [as19]
alter table `location`  add column  `geofence_oid`  integer;


-- User_Animal_Image [as2]
alter table `image`  add column  `animal_oid`  integer;


-- Park_Geofence [as20]
alter table `geofence`  add column  `park_oid`  integer;


-- User_blog_post [as21]
alter table `blog_post`  add column  `user_oid`  integer;


-- User_User_Type [as4]
alter table `user`  add column  `user_type_oid`  integer;


-- Animal_Location_Animal [as5]
alter table `animal`  add column  `animal_location_oid`  integer;


-- Animal_Location_Location [as6]
alter table `location`  add column  `animal_location_oid`  integer;


-- Map_Animal_Location [as7]
alter table `animal_location`  add column  `map_oid`  integer;


-- Park_Map [as8]
alter table `map`  add column  `park_oid`  integer;


-- Park_Location [as9]
alter table `location`  add column  `park_oid`  integer;


-- Data Services Mapping
create table WR_DELETE_HISTORY(
  `OID`  integer  not null,
  `OBJECT_ID` varchar(200) not null,
  `CLASS_ID` varchar(32) not null,
  `DELETED_AT` datetime not null,
  primary key (`OID`))
ENGINE=InnoDB;

create index IDX_WR_CLASS_ID on WR_DELETE_HISTORY(`CLASS_ID`);
create index IDX_WR_OBJECT_ID on WR_DELETE_HISTORY(`DELETED_AT`);


