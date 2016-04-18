-- blog_post [cls13]
alter table `blog_post`  add column  `animal_sighting_id`  varchar(255);
alter table `blog_post`  add column  `user_id`  integer;


-- Animal_Sighting_blog_post [as1]
alter table `blog_post`  add column  `animal_sighting_oid`  integer;


