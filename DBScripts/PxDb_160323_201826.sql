-- Device [Device]
create table `device` (
   `oid`  integer  not null,
   `device_id`  varchar(255),
   `notification_device_id`  varchar(255),
   `model`  varchar(255),
   `platform`  varchar(255),
   `platform_version`  varchar(255),
   `browser`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Role [Role]
create table `role` (
   `oid`  integer  not null,
   `rolename`  varchar(255),
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
  primary key (`oid`)
) ENGINE=InnoDB;


-- Animal [cls1]
create table `animal` (
   `oid`  integer  not null,
   `seen`  bit,
   `species`  varchar(255),
   `name`  varchar(255),
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


-- User_Animal [as1]
create table `user_animal` (
   `user_oid`  integer not null,
   `animal_oid`  integer not null,
  primary key (`user_oid`, `animal_oid`)
) ENGINE=InnoDB;


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


