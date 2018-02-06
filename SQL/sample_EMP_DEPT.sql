DROP TABLE EMP;
DROP TABLE DEPT;

CREATE TABLE DEPT (
 DEPTNO              integer NOT NULL,
 DNAME               varchar(14),
 LOC                 varchar(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO));

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP (
 EMPNO               integer NOT NULL,
 ENAME               varchar(10),
 JOB                 varchar(9),
 MGR                 integer CONSTRAINT EMP_SELF_KEY REFERENCES EMP (EMPNO),
 HIREDATE            DATEtime,
 SAL                 money,
 COMM                money,
 DEPTNO              integer NOT NULL,
 CONSTRAINT EMP_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO));

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-81',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-82',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);


Select * from EMP;
Select * from DEPT;

--Display all the emp in the asceding order of name

Select * from EMP ORDER BY ENAME ASC;

--Display all the emp names in lower case

Select LOWER(ENAME) from EMP;

--Display all the ENAMES, SALARY, COMMISISON

Select ENAME, SAL, COMM from EMP;

--Display all the EMP WHOSE COMMISION is null
Select * from EMP where COMM IS NULL;

--Display all the EMP,SALARY,COMMISION, ANNUALSALARY as CTC
Select ENAME, SAL, COMM, (SAL* 12) + (ISNULL(COMM, 0 ) *12) as CTC from EMP;

-- Display all the emp having dept in 10
Select * from EMP where DEPTNO = 10;

-- Display all the emp having dept in 20
Select * from EMP where DEPTNO = 10 OR DEPTNO = 20;

-- Display all the details of emp Scott 
Select * from EMP where ENAME = 'SCOTT';

-- Display all the top 3 salary
Select TOP (3) ENAME, SAL, COMM, (SAL* 12) + (ISNULL(COMM, 0 ) *12) as CTC from EMP ORDER BY CTC DESC;

-- Display emp whose name starts with a
Select ENAME  from EMP WHERE ENAME LIKE 'A%';

-- Display emp whose name contains  s
Select ENAME  from EMP WHERE ENAME LIKE '%S%';

-- Display emp whose name ends with n
Select ENAME  from EMP WHERE ENAME LIKE '%N';

-- Display emp whose DEPT NO of SCOTT
Select *  from EMP WHERE DEPTNO = (Select DEPTNO from EMP WHERE ENAME ='SCOTT');

-- Display emp whose salary = SCOTT
Select *  from EMP WHERE SAL = (Select SAL from EMP WHERE ENAME ='SCOTT');

-- Display unique Dept no
Select DEPTNO  from EMP ;
Select DISTINCT(DEPTNO) as UNIQUE_DEPT from EMP ;

-- Display Date in DD-MM-YY format
Select Convert(varchar,CONVERT(date,HIREDATE,6),3)  from EMP ;

-- Display HEADCOUNT
Select COUNT(*) as HEADCOUNT  from EMP ;

-- Display Total Salary
Select SUM((SAL* 12) + (ISNULL(COMM, 0 ) *12)) as TOTAL_SAL  from EMP ;

-- Display Total Salary
Select COUNT(*) as EMP_IN_10  from EMP WHERE DEPTNO = 10 ;
