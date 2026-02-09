DROP DATABASE IF EXISTS university; 
CREATE DATABASE university;

USE university;

CREATE TABLE Student
(
	studentID				INT				PRIMARY KEY 	NOT NULL,
    firstName		     VARCHAR(50)		NOT NULL,
    lastName			 VARCHAR(50)		NOT NULL
);

CREATE TABLE Instructor
(
  instructorID 				INT 			PRIMARY KEY		NOT NULL,
  instructorFirstName 	VARCHAR(50) 		NOT NULL,
  instructorLastName  	VARCHAR(50) 		NOT NULL
);

CREATE TABLE Classroom
(
  classroomID 				INT 			PRIMARY KEY		NOT NULL,
  classroomNumber 			VARCHAR(50) 	NOT NULL,
  classroomCapacity 		INT 			NOT NULL
);

CREATE TABLE Course
(
  courseID 					INT 			PRIMARY KEY		NOT NULL,
  courseName 				VARCHAR(50) 	NOT NULL,
  courseDescription 		VARCHAR(500)	NOT NULL,
  instructorID 				INT 			NOT NULL,
  classroomID 				INT 			NOT NULL
);

CREATE TABLE Registration
(
  studentID 				INT 			NOT NULL,
  courseID 					INT 			NOT NULL,
  grade 					VARCHAR(10),
  CONSTRAINT registration_pk PRIMARY KEY (studentID, courseID)
);


ALTER TABLE Course
ADD CONSTRAINT course_fk_instructor
FOREIGN KEY (instructorID) REFERENCES Instructor (instructorID);

ALTER TABLE Course
ADD CONSTRAINT course_fk_classroom
FOREIGN KEY (classroomID) REFERENCES Classroom (classroomID);

ALTER TABLE Registration
ADD CONSTRAINT registration_fk_student
FOREIGN KEY (studentID) REFERENCES Student (studentID);

ALTER TABLE Registration
ADD CONSTRAINT registration_fk_course
FOREIGN KEY (courseID) REFERENCES Course (courseID);