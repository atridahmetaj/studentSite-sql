/*drop database if exists*/
DROP DATABASE [IF EXISTS] studentSite;
/*create database*/
CREATE DATABASE studentSite;
/*create user table*/
CREATE TABLE studentSite.`user` (
	id BIGINT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	surname varchar(100) NOT NULL,
	username varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	password varchar(200) NOT NULL,
	grade varchar(100) NULL,
	phone_number varchar(100) NULL,
	`role` varchar(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT user_PK PRIMARY KEY (id)
)
/*create departament table*/
CREATE TABLE studentSite.departament (
	id BIGINT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	fakultet_id BIGINT NOT NULL,
	cheef_id BIGINT NOT NULL,
	secretary_id BIGINT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT departament_PK PRIMARY KEY (id),
	CONSTRAINT fakultet_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id),
	CONSTRAINT cheef_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id),
	CONSTRAINT secretary_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id)
)
/*create dega table*/
CREATE TABLE studentSite.dega	 (
	id BIGINT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	departament_dega_id BIGINT NOT NULL,
	secretary_dega_id BIGINT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT course_PK PRIMARY KEY (id),
	CONSTRAINT departament_dega_id FOREIGN KEY (id) REFERENCES studentSite.`departament`(id),
	CONSTRAINT secretary_dega_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id)
	
)
/*create course table*/
CREATE TABLE studentSite.course	 (
	id BIGINT auto_increment NOT NULL,
	code varchar(100) NOT NULL,
	name varchar(100) NOT NULL,
	dega_id BIGINT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT course_PK PRIMARY KEY (id),
	CONSTRAINT dega_id FOREIGN KEY (id) REFERENCES studentSite.`dega`(id)
	
)
/*create grades table*/
CREATE TABLE studentSite.grades	 (
	id BIGINT auto_increment NOT NULL,
	student_id BIGINT NOT NULL,
	lecture_id BIGINT NOT NULL,
	course_id BIGINT NOT NULL,
	grade varchar(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT grades_PK PRIMARY KEY (id),
	CONSTRAINT student_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id),
	CONSTRAINT lecture_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id),
	CONSTRAINT course_id FOREIGN KEY (id) REFERENCES studentSite.`course`(id)
	
)
/*create university table*/
CREATE TABLE studentSite.university	 (
	id BIGINT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	city varchar(100) NOT NULL,
	rectore_id BIGINT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT university_PK PRIMARY KEY (id),
	CONSTRAINT rectore_id FOREIGN KEY (id) REFERENCES studentSite.`user`(id)
)
/*create fakultet table*/
CREATE TABLE studentSite.fakultet	 (
	id BIGINT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	university_id BIGINT NOT NULL,
	address varchar(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT fakultet_PK PRIMARY KEY (id),
	CONSTRAINT university_id FOREIGN KEY (id) REFERENCES studentSite.`university`(id)
)


