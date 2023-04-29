create database if not exists EvilCorp;
drop table if exists `users`;
create table `users`(id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, username VARCHAR(32) NOT NULL, name VARCHAR(64) NOT NULL, surname VARCHAR(64), birthday DATE NOT NULL, email VARCHAR(32) NOT NULL, phone VARCHAR(15) NOT NULL, country VARCHAR(64) NOT NULL, direction VARCHAR(64), password VARCHAR(32), date DATETIME NOT NULL DEFAULT now());
insert into `users`(username, name, surname, birthday, email, phone, country, direction, password) values ("root", "Hilon", "Musgo", "1971-06-28", "hilonmusgo@gmail.com","27666666666","South Africa","EvilCorp666","e1e71757deb07460abff6678e3cd468f"); 
create user 'editor'@'localhost' identified by 'enti';
create user 'reader'@'localhost' identified by 'enti';
grant insert, update on EvilCorp.* to 'editor'@'localhost';
grant select on EvilCorp.* to 'reader'@'localhost';
flush privileges;
