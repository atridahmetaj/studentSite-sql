/*drop database if exists*/
DROP DATABASE [IF EXISTS] studentSite;
/*create database*/
CREATE DATABASE studentSite;
/*create user table*/
CREATE TABLE studentSite.`user` (
	`id` BIGINT auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	`surname` varchar(100) NOT NULL,
	`username` varchar(100) NOT NULL,
	`email` varchar(100) NOT NULL,
	`password` varchar(200) NOT NULL,
	`grade` varchar(100) NULL,
	`phone_number` varchar(100) NULL,
	`role` varchar(100) NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

/*create university table*/
CREATE TABLE studentSite.university	 (
	`id` BIGINT auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	`city` varchar(100) NOT NULL,
	`rectore_id` BIGINT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `rectore_univeristy_fk` 
	FOREIGN KEY (rectore_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

/*create fakultet table*/
CREATE TABLE studentSite.fakultet	 (
	`id` BIGINT auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	`university_id` BIGINT NOT NULL,
	`address` varchar(100) NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `university_fakultet_fk` 
	FOREIGN KEY (university_id) 
	REFERENCES studentSite.`university`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

/*create departament table*/
CREATE TABLE studentSite.departament (
	`id` BIGINT auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	`fakultet_id` BIGINT NOT NULL,
	`cheef_id` BIGINT NOT NULL,
	`secretary_id` BIGINT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `fakultet_departament_fk`
	FOREIGN KEY (fakultet_id) 
	REFERENCES studentSite.`fakultet`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `cheef_departament_fk` 
	FOREIGN KEY (cheef_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `secretary_departament_fk` 
	FOREIGN KEY (secretary_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
/*create dega table*/
CREATE TABLE studentSite.dega	 (
	`id` BIGINT auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	`departament_dega_id` BIGINT NOT NULL,
	`secretary_dega_id` BIGINT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `departament_dega_fk` 
	FOREIGN KEY (departament_dega_id) 
	REFERENCES studentSite.`departament`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `secretary_dega_fk`
	FOREIGN KEY (secretary_dega_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	
);
/*create course table*/
CREATE TABLE studentSite.course	 (
	`id` BIGINT auto_increment NOT NULL,
	`code` varchar(100) NOT NULL,
	`name` varchar(100) NOT NULL,
	`dega_id` BIGINT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `dega_course_fk` 
	FOREIGN KEY (dega_id) 
	REFERENCES studentSite.`dega`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	
);
/*create grades table*/
CREATE TABLE studentSite.grades	 (
	`id` BIGINT auto_increment NOT NULL,
	`student_id` BIGINT NOT NULL,
	`lecture_id` BIGINT NOT NULL,
	`course_id` BIGINT NOT NULL,
	`grade` varchar(100) NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `student_grades_fk` 
	FOREIGN KEY (student_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `lecture_grades_fk` 
	FOREIGN KEY (lecture_id) 
	REFERENCES studentSite.`user`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `course_grades_fk`
	FOREIGN KEY (course_id) 
	REFERENCES studentSite.`course`(id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	
);




