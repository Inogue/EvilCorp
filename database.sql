create table `users`(id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY
 KEY,username VARCHAR(32) NOT NULL,name VARCHAR(32) NOT NULL,surnames VARCHAR(32),birthday DATE
NOT NULL,email VARCHAR(32) NOT NULL,phone VARCHAR(15) NOT NULL,country VARCHAR(64) NOT NULL,direction VARCHAR(64),password VARCHAR(32), date DATETIME NOT NULL DEFAULT now());
create user 'editor'@'localhost' identified by 'enti';
create user 'reader'@'localhost' identified by 'enti';
grant insert, update on EvilCorp.* to 'editor'@'localhost';
grant select on EvilCorp.* to 'reader'@'localhost';
flush privileges;
