create database education;
use education;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
create table student(
student_id int not null primary key,
student_name varchar(100) not null,
birth_date date ,
major varchar(150) not null );

insert into student values 
(1,'Sudarshan','2000-4-17','Computer Science'),
(2,'Pavan','2000-4-14','Marketing'),
(3,'Sujit','1999-6-25','History'),
(4,'Sanket','1998-12-31','Biology'),
(5,'Suraj','1998-7-29','History'),
(6,'Yogesh','1995-3-19','Computer Science'),
(7,'Aniket','2001-2-20','Computer Science'),
(8,'Pavan','1999-10-25','History'),
(9,'Utkarsha','2001-5-16','Biology'),
(10,'Snehal','2000-1-28','Marketing'),
(11,'Aadarsh','1997-3-13','Computer Science'),
(12,'Shubhangi','1999-11-21','Biology');

Select * from student;

create table course(
course_id int not null primary key,
course_name varchar(100) not null,
credit_hrs int not null );

insert into course values
(101,'Java',5),(102,'Sales and Marketing',6),(103,'Math',8),(104,'Python',9),(105,'Time Management',3),(106,'Arts and History',10);

select * from course;

create table enrollment(
enrollment_id int not null primary key,
student_id int not null, constraint stdkey foreign key (student_id) references student(student_id),
course_id int not null, constraint crkey foreign key(course_id) references course(course_id),
enrollment_date date not null);

insert into enrollment values 
(1001,1,104,'2023-9-26'),(1002,2,105,'2023-11-29'), (1003,3,106,'2023-10-15'),(1004,5,106,'2023-10-17'),
(1005,6,101,'2023-12-10'),(1006,7,101,'2023-7-13'),(1007,8,103,'2023-9-29'),(1008,9,103,'2023-5-14'),
(1009,10,102,'2023-8-24'),(1010,11,101,'2023-6-10');

select * from enrollment;

/*1.Select all students and their majors. */
select student_name, major
from student
group by student_id;

-- 2.List the names of courses with more than 3 credit hours.
select course_name,credit_hrs from course
where credit_hrs>3;

-- 3.Find the students born after 2000.
select student_name, year(birth_date) from student
where year(birth_date) > 2000;

-- 4.Count the number of courses in each major.
select count(course_id) as TotalCourse,(select major from student s where e.student_id = s.student_id )as MajorName
from enrollment e
group by student_id;

-- 5.Show the name and birth date of the oldest student
select student_name, birth_date from student
order by birth_date limit 1;

-- 6.Update the major of a specific student.
update student 
set major = 'Biology'
where student_name = 'Snehal';

select * from student;

-- 7. List all students who have not enrolled in any courses.
select student_id,student_name 
from student 
where student_id not in (select student_id from enrollment);

-- 8.Find the course with the highest number of credit hours.
select course_name, credit_hrs from course
order by  credit_hrs desc limit 1;

-- 9.Calculate the average birth year of all students.
select avg(year(birth_date)) from student;

-- 10.Delete all students majoring in 'History'.
select * from enrollment;

alter table enrollment
drop foreign key student_id;

-- 11. Show the names and birth dates of students majoring in 'Computer Science'.
select birth_date, major from student
where major='Computer Science';

-- 12. Find the student with the highest number of credit hours enrolled.
select student_id, sum(credit_hrs)as Max from enrollment e, course c 
where e.course_id = c.course_id
group by student_id
order by Max desc limit 1;

-- 13. List the majors and the number of students in each major
select major, count(student_id) as NumberOfStd from student 
group by major;

-- 14. Find students with similar birth years (having at least one year in common).
select student_id, student_name
from student A 
where year(A.birth_date)in (select year(s.birth_date) from student s where s.student_id!=A.student_id);

-- 15. Show the majors with students born before 1995.
select student_id,student_name, major from student
where year(birth_date) <=1995;

-- 16. Count the total number of credit hours for each major.
select sum(credit_hrs), major from course c,student s, enrollment e
where e.student_id = s.student_id and c.course_id= e.course_id
group by s.major;

-- 17. Update the birth date of all students majoring in 'Biology'.
update student
set birth_date = '1997-12-29'
where major = 'Biology';

select * from student;

-- 18. Find the courses with no enrolled students.
select course_name from course
where course_id not in(select course_id from enrollment);

-- 19. List the students and their majors, ordered by birth date (ascending order).
select student_name, major,birth_date from student
order by birth_date asc;

-- 20. Show the students born in the last ten years.
select student_name,birth_date from student
where year(birth_date)<=2023 and year(birth_date)>=2013; 

-- 21.Find the courses with names containing the word 'Math'.
select course_id,course_name from course
where course_name like '%math%';

-- 22. Calculate the total number of credit hours for all courses.
select sum(credit_hrs) from course;

select e.course_id, sum(credit_hrs) from course c,enrollment e
where e.course_id = c.course_id
group by e.course_id;

-- 23.Show the students with the highest and lowest credit hours enrolled.
select student_name from student 
where student_id in(select sum(credit_hrs) as Maximum from enrollment e , course c
					where e.course_id = c.course_id
                    group by student_id
                    order by maximum)
limit 1;

select student_id, sum(credit_hrs)as Max from enrollment e, course c 
where e.course_id = c.course_id
group by student_id
order by Max desc limit 1;

select student_id, sum(credit_hrs)as Max from enrollment e, course c 
where e.course_id = c.course_id
group by student_id
order by Max asc limit 1;

-- 24. Find students who have enrolled in consecutive years.
SELECT DISTINCT s.student_id
FROM enrollment s
WHERE (year(s.enrollment_date)-1) IN (SELECT year(enrollment_date) FROM enrollment e WHERE s.student_id!=e.student_id);

-- 25. Delete all courses with less than 2 credit hours.
delete from course 
where credit_hrs < 2;