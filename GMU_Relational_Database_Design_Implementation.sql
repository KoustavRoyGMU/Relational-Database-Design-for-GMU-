
/*------------------------------------------/*Creating Tables*/-------------------------------------------------*/



/*Creating DEPARTMENT Table*/


Create table DEPARTMENT(
Dept_ID	INT Primary Key,
Dept_Name varchar(255),
Web_Address varchar(255),
Phone_No VARCHAR(255),
Email VARCHAR(255),
Street VARCHAR(255),
City VARCHAR(255),
State VARCHAR(255),
Zip_Code VARCHAR(255),
Mailing_Address as (Street||','||City||','||State||','||Zip_Code));


/*Creating EMPLOYEE Table*/


Create table EMPLOYEE(
Unique_ID INT Primary Key,
Name VARCHAR(255),
Date_of_Birth DATE);


/*Creating DEPARTMENT_HAS_EMPLOYEE Table*/


Create Table DEPARTMENT_HAS_EMPLOYEE(
Dept_ID INT,
Unique_ID INT,
PRIMARY KEY (Dept_ID,Unique_ID),
FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT(Dept_ID),
FOREIGN KEY (Unique_ID) REFERENCES EMPLOYEE(Unique_ID));


/*Creating BUILDING Table*/


Create Table BUILDING(
Name VARCHAR(255) Primary Key,
No_of_Rooms INT,
No_of_Floors INT);


/*Creating Room Table*/


Create Table Room(
Building_Name VARCHAR(255),
Room_Number VARCHAR(255),
Area_in_sq_yards Decimal(4,2),
L_FLAG VARCHAR(1),
O_FLAG VARCHAR(1),
C_FLAG VARCHAR(1),
PRIMARY KEY (Building_Name,Room_Number),
FOREIGN KEY (Building_Name) REFERENCES BUILDING(Name));


/*Creating MEASUREMENT Table*/


Create table MEASUREMENT(
Building_Name VARCHAR(255),
Room_Number VARCHAR(255),
Record_Date	DATE,
Record_Time	VARCHAR(255),
Light_in_LUX Decimal(6,2),
Sound_in_dB	Decimal(6,2),
Temp_in_F Decimal(6,2),
PRIMARY KEY (Building_Name,Room_Number,Record_Date,Record_Time),
FOREIGN KEY (Building_Name,Room_Number) REFERENCES Room(Building_Name,Room_Number));


/*Creating EMPLOYEE_WORKSIN_ROOM Table*/


Create table EMPLOYEE_WORKSIN_ROOM(
Unique_ID INT,
Building_Name VARCHAR(255),
Room_No	VARCHAR(255),
PRIMARY KEY (Unique_ID,Building_Name,Room_No),
FOREIGN KEY (Unique_ID) REFERENCES EMPLOYEE(Unique_ID),
FOREIGN KEY (Building_Name,Room_No) REFERENCES Room(Building_Name,Room_Number));


/*Creating Room_Phone_No Table*/


Create table Room_Phone_No(
Building_Name VARCHAR(255),
Room_Number	VARCHAR(255),
Phone_No VARCHAR(15),
PRIMARY KEY (Building_Name,Room_Number,Phone_No),
FOREIGN KEY (Building_Name,Room_Number) REFERENCES Room(Building_Name,Room_Number));


/*Creating EMPLOYEE_EMAIL Table*/


create table EMPLOYEE_EMAIL(
Unique_ID INT,
Email VARCHAR(255),
PRIMARY KEY (Unique_ID,Email),
FOREIGN KEY (Unique_ID) REFERENCES Employee(Unique_ID));


/*-------------------------------------/*Inserting Tuples into Table*/----------------------------------------------------------------*/


/*Inserting Tuples into Table Department*/


insert into Department (Dept_ID,Dept_Name,Web_Address,Phone_No,Email,Street,City,State,Zip_Code) values
(1,'Engineering','Engineering.GMU.EDU','1122334455','Engineering@GMU.EDU','1st Street','Fairfax','VA','22030');

insert into Department (Dept_ID,Dept_Name,Web_Address,Phone_No,Email,Street,City,State,Zip_Code) values
(2,'Science','Science.GMU.EDU','1122334456','Science@GMU.EDU','2nd Street','Fairfax','VA','22030');

insert into Department (Dept_ID,Dept_Name,Web_Address,Phone_No,Email,Street,City,State,Zip_Code) values
(3,'Arts','Arts.GMU.EDU','1122334457','Arts@GMU.EDU','3rd Street','Fairfax','VA','22030');

insert into Department (Dept_ID,Dept_Name,Web_Address,Phone_No,Email,Street,City,State,Zip_Code) values
(4,'Law','Law.GMU.EDU','1122334458','Law@GMU.EDU','4th Street','Fairfax','VA','22030');

insert into Department (Dept_ID,Dept_Name,Web_Address,Phone_No,Email,Street,City,State,Zip_Code) values
(5,'Business','Business.GMU.EDU','1122334459','Business@GMU.EDU','5th Street','Fairfax','VA','22030');


/*Inserting Tuples into Table Employee*/


insert into EMPLOYEE Values(1001,'Karen Jennings',TO_DATE('12/02/1995','DD/MM,YYYY'));
insert into EMPLOYEE Values(1002,'Kim Fuller',TO_DATE('22/02/1996','DD/MM,YYYY'));
insert into EMPLOYEE Values(1003,'Betsy Moreno',TO_DATE('12/06/1997','DD/MM,YYYY'));
insert into EMPLOYEE Values(1004,'Caleb Brady',TO_DATE('12/02/1998','DD/MM,YYYY'));
insert into EMPLOYEE Values(1005,'Dana Cobb',TO_DATE('09/02/1999','DD/MM,YYYY'));
insert into EMPLOYEE Values(1006,'Emanuel Jimenez',TO_DATE('27/02/2000','DD/MM,YYYY'));
insert into EMPLOYEE Values(1007,'Leon Becker',TO_DATE('25/11/2001','DD/MM,YYYY'));
insert into EMPLOYEE Values(1008,'Brett Obrien',TO_DATE('12/02/2002','DD/MM,YYYY'));
insert into EMPLOYEE Values(1009,'Andrew Hansen',TO_DATE('01/02/2003','DD/MM,YYYY'));
insert into EMPLOYEE Values(1010,'Glen Stevenson',TO_DATE('12/07/2004','DD/MM,YYYY'));


/*Inserting Tuples into Table Department_Has_Employee*/


insert into Department_Has_Employee Values(1,1001);
insert into Department_Has_Employee Values(2,1002);
insert into Department_Has_Employee Values(3,1003);
insert into Department_Has_Employee Values(4,1004);
insert into Department_Has_Employee Values(5,1005);
insert into Department_Has_Employee Values(5,1006);
insert into Department_Has_Employee Values(4,1007);
insert into Department_Has_Employee Values(3,1008);
insert into Department_Has_Employee Values(2,1009);
insert into Department_Has_Employee Values(1,1010);


/*Inserting Tuples into Table Building*/


insert into Building values('Horizon Hall',4,4);
insert into Building values('Arts Sciences Building',3,3);
insert into Building values('James Buchanan Hall',2,2);
insert into Building values('Fenwick Library',5,5);


/*Inserting Tuples into Table Room*/


insert into Room Values ('Horizon Hall','100',55,'X','X','');
insert into Room Values ('Horizon Hall','200',62,'','X','');
insert into Room Values ('Horizon Hall','300',61,'X','','X');
insert into Room Values ('Horizon Hall','400',55,'','X','');
insert into Room Values ('Arts Sciences Building','100',81,'X','X','');
insert into Room Values ('Arts Sciences Building','200',70,'','','X');
insert into Room Values ('Arts Sciences Building','300',96,'X','','');
insert into Room Values ('James Buchanan Hall','100',80,'','X','X');
insert into Room Values ('James Buchanan Hall','200',67,'X','X','');
insert into Room Values ('Fenwick Library','100',75,'X','','');
insert into Room Values ('Fenwick Library','200',50,'','X','X');
insert into Room Values ('Fenwick Library','300',56,'','','X');
insert into Room Values ('Fenwick Library','400',23,'','X','');
insert into Room Values ('Fenwick Library','500',14,'X','','X');


/*Inserting Tuples into Table Measurement*/


insert into measurement values('Horizon Hall','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',5,15,56);
insert into measurement values('Horizon Hall','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',10,45,68);
insert into measurement values('Horizon Hall','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',15,34,78);
insert into measurement values('Horizon Hall','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',20,54,64);
insert into measurement values('Horizon Hall','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',25,34,Null);
insert into measurement values('Horizon Hall','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',30,33,Null);
insert into measurement values('Horizon Hall','400',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',35,76,67);
insert into measurement values('Horizon Hall','400',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',40,56,60);
insert into measurement values('Arts Sciences Building','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',15,78,74);
insert into measurement values('Arts Sciences Building','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',25,54,54);
insert into measurement values('Arts Sciences Building','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',35,56,64);
insert into measurement values('Arts Sciences Building','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',45,44,56);
insert into measurement values('Arts Sciences Building','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',55,34,57);
insert into measurement values('Arts Sciences Building','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',65,65,77);
insert into measurement values('James Buchanan Hall','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',20,44,Null);
insert into measurement values('James Buchanan Hall','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',30,56,58);
insert into measurement values('James Buchanan Hall','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',40,54,65);
insert into measurement values('James Buchanan Hall','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',50,56,51);
insert into measurement values('Fenwick Library','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',55,76,50);
insert into measurement values('Fenwick Library','100',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',65,54,63);
insert into measurement values('Fenwick Library','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',75,46,Null);
insert into measurement values('Fenwick Library','200',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',85,45,Null);
insert into measurement values('Fenwick Library','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',95,87,51);
insert into measurement values('Fenwick Library','300',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',20,65,72);
insert into measurement values('Fenwick Library','400',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',26,65,71);
insert into measurement values('Fenwick Library','400',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',43,88,66);
insert into measurement values('Fenwick Library','500',TO_DATE('01/03/2023','DD/MM/YYYY'),'00:00:00',65,65,54);
insert into measurement values('Fenwick Library','500',TO_DATE('01/03/2023','DD/MM/YYYY'),'12:00:00',43,45,54);


/*Inserting Tuples into Table Employee_Worksin_Room*/


insert into Employee_Worksin_Room values(1001,'Horizon Hall','100');
insert into Employee_Worksin_Room values(1002,'Horizon Hall','200');
insert into Employee_Worksin_Room values(1003,'Horizon Hall','300');
insert into Employee_Worksin_Room values(1004,'Horizon Hall','400');
insert into Employee_Worksin_Room values(1005,'Arts Sciences Building','100');
insert into Employee_Worksin_Room values(1006,'Arts Sciences Building','200');
insert into Employee_Worksin_Room values(1007,'Arts Sciences Building','300');
insert into Employee_Worksin_Room values(1008,'James Buchanan Hall','100');
insert into Employee_Worksin_Room values(1009,'James Buchanan Hall','200');
insert into Employee_Worksin_Room values(1010,'Fenwick Library','100');
insert into Employee_Worksin_Room values(1001,'Arts Sciences Building','200');
insert into Employee_Worksin_Room values(1002,'Arts Sciences Building','300');
insert into Employee_Worksin_Room values(1003,'James Buchanan Hall','100');
insert into Employee_Worksin_Room values(1004,'James Buchanan Hall','200');
insert into Employee_Worksin_Room values(1005,'Fenwick Library','100');


/*Inserting Tuples into Table Room_Phone_No*/


insert into Room_Phone_No values('Horizon Hall','100','3943511324');
insert into Room_Phone_No values('Horizon Hall','200','9348277345');
insert into Room_Phone_No values('Horizon Hall','300','1796358550');
insert into Room_Phone_No values('Horizon Hall','400','7301702070');
insert into Room_Phone_No values('Arts Sciences Building','100','1914147371');
insert into Room_Phone_No values('Arts Sciences Building','200','5197138851');
insert into Room_Phone_No values('Arts Sciences Building','300','6392956308');
insert into Room_Phone_No values('James Buchanan Hall','100','7828967907');
insert into Room_Phone_No values('James Buchanan Hall','200','7392332181');
insert into Room_Phone_No values('Fenwick Library','100','2327390821');
insert into Room_Phone_No values('Fenwick Library','200','5793589177');
insert into Room_Phone_No values('Fenwick Library','300','9556418611');
insert into Room_Phone_No values('Fenwick Library','400','2681565955');
insert into Room_Phone_No values('Fenwick Library','500','1063987235');
insert into Room_Phone_No values('Horizon Hall','100','9839691177');
insert into Room_Phone_No values('Horizon Hall','200','7694018166');
insert into Room_Phone_No values('Horizon Hall','300','2274993981');
insert into Room_Phone_No values('Horizon Hall','400','9666653853');
insert into Room_Phone_No values('Arts Sciences Building','100','2137115169');
insert into Room_Phone_No values('Arts Sciences Building','200','9909244688');
insert into Room_Phone_No values('Arts Sciences Building','300','8174944983');
insert into Room_Phone_No values('James Buchanan Hall','100','5763148542');
insert into Room_Phone_No values('James Buchanan Hall','200','3316082677');
insert into Room_Phone_No values('Fenwick Library','100','5481939687');
insert into Room_Phone_No values('Fenwick Library','200','9858899789');
insert into Room_Phone_No values('Fenwick Library','300','7037698063');
insert into Room_Phone_No values('Fenwick Library','400','6758830045');
insert into Room_Phone_No values('Fenwick Library','500','4314808686');
insert into Room_Phone_No values('Horizon Hall','100','2662797340');
insert into Room_Phone_No values('Horizon Hall','200','2497197975');
insert into Room_Phone_No values('Horizon Hall','300','2203959190');
insert into Room_Phone_No values('Horizon Hall','400','6680313763');
insert into Room_Phone_No values('Arts Sciences Building','100','4716289270');
insert into Room_Phone_No values('Arts Sciences Building','200','9569481897');


/*Inserting Tuples into Table Employee_Email*/


insert into Employee_Email values (1001,'Karen.Jennings1@gmail.com');
insert into Employee_Email values (1002,'Kim.Fuller1@gmail.com');
insert into Employee_Email values (1003,'Betsy.Moreno1@gmail.com');
insert into Employee_Email values (1004,'Caleb.Brady1@gmail.com');
insert into Employee_Email values (1005,'Dana.Cobb1@gmail.com');
insert into Employee_Email values (1006,'Emanuel.Jimenez1@gmail.com');
insert into Employee_Email values (1007,'Leon.Becker1@gmail.com');
insert into Employee_Email values (1008,'Brett.Obrien1@gmail.com');
insert into Employee_Email values (1009,'Andrew.Hansen1@gmail.com');
insert into Employee_Email values (1010,'Glen.Stevenson1@gmail.com');
insert into Employee_Email values (1001,'Karen.Jennings2@gmail.com');
insert into Employee_Email values (1002,'Kim.Fuller2@gmail.com');
insert into Employee_Email values (1003,'Betsy.Moreno2@gmail.com');
insert into Employee_Email values (1004,'Caleb.Brady2@gmail.com');
insert into Employee_Email values (1005,'Dana.Cobb2@gmail.com');


/*------------------------------------/*SQL Queries*/----------------------------------------------*/


/*List the phone number and department name and street address for each department*/

Select Dept_Id,Dept_Name,Phone_no,street from department;


/*Count the number of rooms for each building*/

Select Building_Name,Count(*) as Number_Of_Rooms from Room group by Building_Name;


/* Find the building name and the room number of each lab that is also used as office*/


Select Building_Name, Room_Number from Room where L_Flag='X' and O_Flag='X';


/*Find the average temperature for each room*/


select Building_Name,Room_Number,avg(Temp_in_F) as AVERAGE_TEMP_IN_FARENHEIT from measurement group by Building_Name,Room_Number;


/*Find the area of each conference room that hasn’t had any temperature recorded yet*/


select Building_Name,Room_Number,Area_in_sq_Yards from room where C_FLAG='X' and Building_Name||Room_Number not in (
    select distinct Building_Name||Room_Number from Measurement where TEMP_IN_F is not null);

    
/*Find the id of each employee who has exactly two email addresses*/


Select Unique_Id from employee_email group by unique_id having count(*)=2;






















