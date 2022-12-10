use Education;

/* select - запросы */

/* 1 */
select * from subject;

/* 2 */
select * from institute;

/* 3 */
select distinct stipendia from student;

/* 4 */
select distinct course from student;

/* 5 */ 
select family, name, last_name from student order by family;
select family, name, last_name from student order by name;
select family, name, last_name from student order by last_name;
select family, name, last_name from student order by birthday;

/* 6 */
select family, course, birthday from student order by course asc;
select family, course, birthday from student order by birthday desc;

/* 7 */
select lect_id, family, name, last_name from lecturer;

/* 8 */
select * from student where stipendia != 0 order by stipendia desc; 
select * from student where stipendia != 0 order by family asc; 

/* 9 */
select * from student where course = 1 order by family asc; 

/* 10 */
select * from student where course = 2 or course = 3;

/* 11 */
select * from student where not course = 1 and not course = 3;
select * from student where course != 1 and course != 3;

/* 12 */
select distinct nagr_id, subj_name from exam, subject where nagr_id = subj_id and mark = 5;

/* 13 */ 
select distinct subj_name, hour 
from subject, knowledge, nagruzka, exam 
where subject.subj_id = knowledge.subj_id 
and knowledge.kvant_id = nagruzka.kvant_id 
and nagruzka.nagr_id = exam.nagr_id 
and mark = 2;

/* 14 */
select distinct family, town_name from student, parents, town, exam, subject, knowledge, nagruzka 
where (student.student_id = parents.parent_id and town.town_id = parents.town_id) 
and town_name = 'Березовский'
and student.student_id = exam.student_id
and mark > 2
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and subject.subj_id = 5;

/* 15 */
select family, subj_name, mark from student, subject, exam, knowledge, nagruzka, attest
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and attest.attest_id=knowledge.attest_id
and knowledge.subj_id = subject.subj_id
and attest.attest_id = 1
and mark > 2
order by subj_name asc;

select family, subj_name, mark from student, subject, exam, knowledge, nagruzka, attest
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and attest.attest_id=knowledge.attest_id
and knowledge.subj_id = subject.subj_id
and attest.attest_id = 1
and mark > 2
order by mark desc;

select family, subj_name, mark from student, subject, exam, knowledge, nagruzka, attest
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and attest.attest_id=knowledge.attest_id
and knowledge.subj_id = subject.subj_id
and attest.attest_id = 1
and mark > 2
order by family asc;

/* 16 */ 
select family, subj_name, mark from student, exam, subject, nagruzka, knowledge
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
and subj_name = 'Высшая математика'
order by family asc;

/* 17 */
select family, town_name, name_medal from student, medali, town, parents, medalist
where medalist.student_id = student.student_id
and student.student_id = parents.student_id
and parents.town_id = town.town_id
and medalist.medal_id = medali.medal_id
and medali.medal_id = 2;

/* 18 */
select family, subj_name, exam_date from student, exam, subject, knowledge, nagruzka
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
order by subj_name asc;

select family, subj_name, exam_date from student, exam, subject, knowledge, nagruzka
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
order by family asc;

/* 19 */
select distinct family, subj_name, exam_date from student, subject, exam, knowledge, nagruzka
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
and (exam_date = '2019-05-24' or exam_date = '2019-06-13');

/* 20 */
select student.family, lecturer.family, exam_date, subj_name 
from student, lecturer, subject, exam, knowledge, nagruzka
where student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and lecturer.lect_id = nagruzka.lect_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 5;

/* 21 */
select inst_name, lecturer.family, hour from institute, subject, lecturer, nagruzka, knowledge, exam, student
where (institute.inst_id = lecturer.inst_id
and lecturer.lect_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.hour > 80)
and (student.student_id = exam.student_id
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2);

/* встроеные функции */

/* 2 */
select distinct sin(hour) from knowledge; /* синус */

select distinct floor(222.666) from knowledge; /* округление вниз */

select distinct ceiling(222.666) from knowledge; /* округление вверх */

select distinct exp(hour) from knowledge; /* экспонент */

select distinct sqrt(hour) from knowledge; /* квадратный корень */

select round(54321.5525, 3) from knowledge; /* округление */

select distinct log(hour) from knowledge; /* значение логарифма */

select distinct log10(hour) from knowledge; /* значение десятичного логарифма */

/* 3 */
select family, left(name, 1), left(last_name, 1) from student 
where SUBSTRING(family, 1, 1) = 'С';

select family + left(name, 1) + left(last_name, 1) from student 
where SUBSTRING(family, 1, 1) = 'С';

select family + ' ' + left(name, 1) + '.' + ' ' + left(last_name, 1) + '.' from student 
where SUBSTRING(family, 1, 1) = 'С';

select subj_name from subject where CHARINDEX('С', subj_name) > 0;

select LEFT('##############################', 24 - LEN(family)/2) + family + LEFT('##############################', 24 - LEN(family)/2) as result from lecturer;

select replace(subj_name, 'Культура', 'семерова') from subject;

/* 4 */ 
select SYSDATETIME();
select GETDATE();

select DATEADD(day, 7, current_timestamp);
select DATEADD(month, 2, current_timestamp);
select DATEADD(year, -4, current_timestamp);

/* 5 */
select DATEDIFF(month, '1996-05-03', '1996-07-15');

/* 6 */
select POWER(2.0, 3);
select POWER(2, 0.1);
select POWER(0.02, 3);