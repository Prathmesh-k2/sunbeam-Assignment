CREATE DATABASE PROJECT;
USE PROJECT;
CREATE TABLE USERS (
email varchar(20) primary key,
password varchar(20),
role enum("student","admin")
);
DROP TABLE coureses;

CREATE TABLE student (
    reg_no INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    email VARCHAR(20),
    course_id INT,               
    mobile_no int  ,      
    profile_pic BLOB,
    FOREIGN KEY (email) REFERENCES USERS(email),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
drop table student;
create table courses(
course_id int primary key,
course_name varchar(20),
description varchar(20),
fees int ,
start_date date,
end_date date,
video_expire_days int
);
show tables;
create table videos(
video_id int primary key,
course_id int ,
title varchar(20),
description varchar(20),
youtube_url varchar(255),
added_at date,
foreign key (course_id) references courses(course_id)
);
show tables 

desc videos
--user
insert into users values('s1','sunbeam','student');
insert into users values('s2','sunbeam','student');
insert into users values('s3','sunbeam','student');
insert into users values('A1','sunbeam','admin');
insert into users values('A2','sunbeam','student');

--courese
insert into courses values(1,"MARN","web",4000,"2025-12-1","2026-01-05",25);
insert into courses values(2,"Python","Programing",4000,"2025-12-1","2026-01-05",25);
insert into courses values(3,"Gen Ai","Ai",4000,"2025-12-1","2026-01-05",25);
insert into courses values(4,"JAVA","Programing",4000,"2025-12-1","2026-01-05",25);
--student
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student1', 's1', 1, '123456', NULL);
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student2', 's2', 2, '123456', NULL);
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student3', 's3', 3, '123456', NULL);
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student1', 's1', 4, '123456', NULL);
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student2', 's3', 3, '123456', NULL);
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)VALUES ('student3', 's2', 2, '123456', NULL);
--videos
insert into videos values(101,1,"hello","mern","https://chatgpt.com/c/693b9e59-d8d8-8324-a6cd-6137cad16c46",'2025-12-12');
insert into videos values(102,2,"hello","python","https://chatgpt.com/c/693b9e59-d8d8-8324-a6cd-6137cad16c46",'2025-12-12');
insert into videos values(103,3,"hello","AI","https://chatgpt.com/c/693b9e59-d8d8-8324-a6cd-6137cad16c46",'2025-12-12');
insert into videos values(104,4,"hello","java","https://chatgpt.com/c/693b9e59-d8d8-8324-a6cd-6137cad16c46",'2025-12-12');
insert into videos values(105,3,"hello","Ai","https://chatgpt.com/c/693b9e59-d8d8-8324-a6cd-6137cad16c46",'2025-12-12');

--1
select *from courses;
--2
select reg_no,name,email,mobile_no,s.course_id,course_name from student s
join courses c  on  s.course_id=c.course_id;
--3
select reg_no,name,email,mobile_no,s.course_id,course_name,description,fees,start_date,end_date,video_expire_days from student s
join courses c  on  s.course_id=c.course_id;
--4
select  c.course_id,course_name,start_date,end_date,video_expire_days,video_id,title,added_at from courses c
left join videos v on c.course_id=v.course_id