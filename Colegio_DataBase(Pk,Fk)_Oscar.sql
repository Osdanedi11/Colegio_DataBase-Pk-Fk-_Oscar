create database Colegio

create table SCHOOL (
SchoolId int primary key identity not null,
SchoolName varchar (50) not null,
SchoolDescription varchar (1000) null,
SchoolAddress varchar(50) null,
Phone varchar (50) null,
PostCode varchar (50) null,
PostAddress varchar (50) null
)

create table COURSE (
CourseId int primary key identity not null,
CourseName varchar (50) not null,
SchoolId int not null,
CourseDescription varchar(1000) null,
foreign key (SchoolId) references SCHOOL (SchoolId)
)

create table TEACHER (
TeacherId int primary key identity not null,
SchoolId int not null,
TeacherName varchar (50) not null,
TeacherDescription varchar (1000) null,
foreign key (SchoolId) references SCHOOL (SchoolId)
)

create table CLASS (
ClassId int primary key identity not null,
SchoolId int not null,
ClassName varchar (50) not null,
ClassDescription varchar (1000) null,
foreign key (SchoolId) references SCHOOL (SchoolId)
)

create table STUDENT (
StudentId int primary key identity not null,
ClassId int not null,
StudentName varchar (100) not null,
StudentNumber varchar (20) not null,
TotalGrade float null,
StudentAddress varchar (100) null,
Phone varchar (20) null,
EMail varchar (100) null,
foreign key (ClassId) references CLASS (ClassId)
)

create table STUDENT_COURSE (
StudentId int not null,
CourseId int not null,
primary key (StudentId, CourseId),
foreign key (StudentId) references STUDENT(StudentId), 
foreign key (CourseId) references COURSE(CourseId)
)

create table TEACHER_COURSE (
TeacherId int not null,
CourseId int not null
primary key (TeacherId, CourseId), 
foreign key (TeacherId) references TEACHER(TeacherId), 
foreign key (CourseId) references COURSE(CourseId)
)

create table GRADE (
GradeId int primary key identity not null,
StudentId int not null,
CourseId int not null,
Grade float not null,
Comment varchar (1000) null
foreign key (StudentId) references STUDENT(StudentId), 
foreign key (CourseId) references COURSE(CourseId)
)