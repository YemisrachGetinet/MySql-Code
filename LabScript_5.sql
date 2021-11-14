CREATE DATABASE UniDB;
USE UniDB;
CREATE TABLE STUDENT(ID INT PRIMARY KEY, Name VARCHAR(15), Major VARCHAR(21), Dept VARCHAR(15));
SHOW DATABASES;

ALTER TABLE STUDENT MODIFY COLUMN Major VARCHAR(21);

INSERT INTO STUDENT VALUES (16,'Jack','Bioengineering','CS'), 
							(17,'Ryan','Mechatronics','MIE'), 
							(18,'Sally','DataScience','CS'), 
                            (19,'Jane','SoftwareEngineering','MIE');
CREATE TABLE COURSE(Name VARCHAR(15), Code VARCHAR(15),Credit INT,Dept VARCHAR(15));

ALTER TABLE COURSE MODIFY COLUMN Name VARCHAR(18);


INSERT INTO COURSE VALUES('DataStructures','CCPS305',3,'CS'), 
						('DataOrganization','CIND110',4,'MIE'),
                        ('DataAnalytics','CIND123',2,'MIE'),
                        ('PythonProgramming','CIND830',3,'MIE');

CREATE TABLE SECTION(ID VARCHAR(15), C_Code VARCHAR(15), Term VARCHAR(15) , Year INT, Instructor VARCHAR(15));

INSERT INTO SECTION VALUES ('YJ5' , 'CIND123' , 'Spring' , 2020 , 'Sally'),
									('KJ2' , 'CCPS305' , 'Fall' , 2021 , 'King'),
									('YJ2' , 'CIND110' , 'Winter' , 2019 , 'Larry'),
									('YJ3' , 'CIND110' , 'Fall' , 2020 , 'Sandy'),
									('KJ3' , 'CIND110' , 'Winter' , 2019 , 'King');

CREATE TABLE GRADE(Std_ID INT, Sec_ID VARCHAR(15), Pct_Grade VARCHAR(15), Ltr_Grade VARCHAR(15));

INSERT INTO GRADE VALUES 
(16 , 'YJ2' , 74 , 'B'),
(17 , 'YJ2' , 75 , 'B'),
(18 , 'YJ3' , 65 , 'C'),
(17 , 'KJ3' , 88 , 'A'),
(19 , 'YJ3' , 74 , 'B');

SELECT DISTINCT * FROM SECTION
WHERE Year > 2019;

SELECT DISTINCT *
FROM SECTION
WHERE Year > 2019 AND Term ='Fall';

SELECT DISTINCT *
FROM SECTION
WHERE C_Code LIKE 'CIND%' AND Term = 'Fall'
OR
C_Code LIKE 'CCPS%' AND Term = 'Fall' ;


SELECT DISTINCT *
FROM SECTION
WHERE C_Code LIKE 'CIND%'
OR
C_Code LIKE 'CCPS%'
AND
Term = 'Fall' ;

SELECT DISTINCT Instructor
FROM SECTION;

SELECT DISTINCT C.Code, C.Name, C.Dept
FROM COURSE AS C
WHERE Credit <> 3;

#LESS THAN OR GREATER THAN 3
SELECT DISTINCT C.Code AS Course_Code,
C.Name AS Course_Name,
C.Dept AS Department
FROM COURSE AS C
WHERE Credit <> 3;

#same column name?
SELECT DISTINCT Instructor FROM SECTION
UNION
SELECT DISTINCT Name FROM STUDENT;

#DIFFERENT DEGREE
SELECT DISTINCT Instructor, Year FROM SECTION
UNION
SELECT DISTINCT Name FROM STUDENT;

SELECT DISTINCT Instructor FROM SECTION
WHERE Instructor IN
(SELECT DISTINCT Name FROM STUDENT);

SELECT DISTINCT Instructor FROM SECTION
WHERE Instructor NOT IN
(SELECT DISTINCT Name FROM STUDENT);


SELECT DISTINCT Name FROM STUDENT
WHERE Name NOT IN
(SELECT DISTINCT Instructor FROM SECTION);


SELECT DISTINCT Instructor, Dept
FROM COURSE CROSS JOIN SECTION;

SELECT DISTINCT *
FROM STUDENT CROSS JOIN COURSE CROSS JOIN SECTION CROSS JOIN GRADE;


SELECT DISTINCT *
FROM STUDENT AS S INNER JOIN GRADE AS G
ON S.ID = G.Std_ID;

#distinct meaning with cross join... and difference between cross join and inner join here
SELECT DISTINCT *
FROM STUDENT AS S CROSS JOIN GRADE AS G
WHERE S.ID = G.Std_ID;

SELECT DISTINCT S.Name, K.Instructor
FROM STUDENT AS S LEFT OUTER JOIN SECTION AS K
ON S.Name = K.Instructor;

SELECT DISTINCT S.Name, K.Instructor
FROM STUDENT AS S RIGHT OUTER JOIN SECTION AS K
ON S.Name = K.Instructor;


SELECT Dept, COUNT(Code) As Count_Courses
FROM COURSE
GROUP BY Dept;


SELECT Dept, COUNT(Code) As Count_Courses
FROM COURSE
GROUP BY Dept
HAVING Count_Courses >= 3;


