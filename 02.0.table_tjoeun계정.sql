DROP TABLE DEPARTMENT;
DROP TABLE EMPLOYEE;
DROP TABLE JOB;
DROP TABLE LOCATION;
DROP TABLE NATIONAL;
DROP TABLE SAL_GRADE;

-------------------------------------------------
--- DDL for Table DEPARTMENT
-------------------------------------------------
CREATE TABLE DEPARTMENT(
DEPT_ID CHAR(2) PRIMARY KEY,
DEPT_TITLE VARCHAR2(35),
LOCATION_ID CHAR(2)
);

COMMENT ON COLUMN DEPARTMENT.DEPT_ID IS '부서코드';
COMMENT ON COLUMN DEPARTMENT.DEPT_TITLE IS '부서명';
COMMENT ON COLUMN DEPARTMENT.LOCATION_ID IS '부서위치';
COMMENT ON TABLE DEPARTMENT IS '부서';

INSERT INTO DEPARTMENT VALUES('D1','인사관리부','L1');
INSERT INTO DEPARTMENT VALUES('D2','회계관리부','L1');
INSERT INTO DEPARTMENT VALUES('D3','마케팅부','L1');
INSERT INTO DEPARTMENT VALUES('D4','국내영업부','L1');
INSERT INTO DEPARTMENT VALUES('D5','해외영업1부','L2');
INSERT INTO DEPARTMENT VALUES('D6','해외영업2부','L3');
INSERT INTO DEPARTMENT VALUES('D7','해외영업3부','L4');
INSERT INTO DEPARTMENT VALUES('D8','기술지원부','L5');
INSERT INTO DEPARTMENT VALUES('D9','총무부','L1');

-------------------------------------------------
--- DDL for Table EMPLOYEE
-------------------------------------------------
CREATE TABLE EMPLOYEE(
EMP_ID VARCHAR2(3) PRIMARY KEY,
EMP_NAME VARCHAR2(20) NOT NULL,
EMP_NO CHAR(14) NOT NULL,
EMAIL VARCHAR2(25),
PHONE VARCHAR2(12),
DEPT_CODE CHAR(2),
JOB_CODE CHAR(2) NOT NULL,
SALARY NUMBER,
BONUS NUMBER,
MANAGER_ID VARCHAR2(3),
HIRE_DATE DATE,
END_DATE DATE,
ENT_YN CHAR(1) DEFAULT 'N'
);

COMMENT ON COLUMN EMPLOYEE.EMP_ID IS '사원번호';
COMMENT ON COLUMN EMPLOYEE.EMP_NAME IS '사원명';
COMMENT ON COLUMN EMPLOYEE.EMP_NO IS '주민등록번호';
COMMENT ON COLUMN EMPLOYEE.EMAIL IS '이메일';
COMMENT ON COLUMN EMPLOYEE.PHONE IS '전화번호';
COMMENT ON COLUMN EMPLOYEE.DEPT_CODE IS '부서코드';
COMMENT ON COLUMN EMPLOYEE.JOB_CODE IS '직급코드';
COMMENT ON COLUMN EMPLOYEE.SALARY IS '급여';
COMMENT ON COLUMN EMPLOYEE.BONUS IS '보너스율';
COMMENT ON COLUMN EMPLOYEE.MANAGER_ID IS '관리자사번';
COMMENT ON COLUMN EMPLOYEE.HIRE_DATE IS '입사일';
COMMENT ON COLUMN EMPLOYEE.END_DATE IS '퇴사일';
COMMENT ON COLUMN EMPLOYEE.ENT_YN IS '퇴직여부';
COMMENT ON TABLE EMPLOYEE IS '사원';

INSERT INTO EMPLOYEE VALUES('200','김정보','651102-1234561', 'kim@tjoeun.or.kr','01033332222','D9','J1',8000000,0.3,null,'90/02/06',null,'N');
INSERT INTO EMPLOYEE VALUES('201','이정하','661102-1234562', 'lee_tjoeun@tjoeun.or.kr','01033332223','D9','J2',6000000,null,200,'01/09/01',null,'N');
INSERT INTO EMPLOYEE VALUES('202','박정보','671102-1234563', 'park@tjoeun.or.kr','01133332224','D9','J2',3700000,null,201,'01/01/01',null,'N');
INSERT INTO EMPLOYEE VALUES('203','홍정보','681102-2234564', 'hong_tjoeun@tjoeun.or.kr','01033332225','D6','J4',2800000,null,204,'96/05/03',null,'N');
INSERT INTO EMPLOYEE VALUES('204','조정연','691102-1234565', 'jo@tjoeun.or.kr','01033332226','D6','J3',3400000,0.2,200,'00/12/29',null,'N');
INSERT INTO EMPLOYEE VALUES('205','최하보','701102-1234566', 'choe_tjoeun@tjoeun.or.kr','01033332227','D6','J3',3900000,null,204,'99/09/09',null,'N');
INSERT INTO EMPLOYEE VALUES('206','지정보','711102-2234567', 'ji@tjoeun.or.kr','01033332228','D5','J7',1800000,null,207,'08/04/02',null,'N');
INSERT INTO EMPLOYEE VALUES('207','장정보','721102-2234568', 'jang@tjoeun.or.kr','01133332229','D5','J5',2200000,0.1,200,'94/07/07',null,'N');
INSERT INTO EMPLOYEE VALUES('208','정보','751102-1234569', 'jeong@tjoeun.or.kr','01033332230','D5','J5',2500000,null,207,'04/04/30',null,'N');
INSERT INTO EMPLOYEE VALUES('209','강정보','771102-1234570', 'gang@tjoeun.or.kr','01033332231','D5','J3',3500000,0.15,207,'11/11/11',null,'N');
INSERT INTO EMPLOYEE VALUES('210','전지연','781102-2234571', 'jeoneji@tjoeun.or.kr','01033332232','D5','J7',2000000,null,207,'01/02/03',null,'N');
INSERT INTO EMPLOYEE VALUES('211','선정보','811102-1234572', 'seon@tjoeun.or.kr','01033332233','D8','J6',2000000,null,200,'12/12/12',null,'N');
INSERT INTO EMPLOYEE VALUES('212','오정보','831102-2234573', 'oh@tjoeun.or.kr','01133332234','D8','J6',2550000,0.25,211,'15/06/17',null,'N');
INSERT INTO EMPLOYEE VALUES('213','현정보','851102-1234574', 'hyeon@tjoeun.or.kr','01033332235',null,'J6',2320000,0.1,null,'99/12/31',null,'N');
INSERT INTO EMPLOYEE VALUES('214','왕정보','881102-1234575', 'wang@tjoeun.or.kr','01033332236','D1','J7',1380000,null,200,'10/04/04',null,'N');
INSERT INTO EMPLOYEE VALUES('215','유하보','891102-1234577', 'yu@tjoeun.or.kr','01033332237','D5','J5',3760000,null,null,'17/06/19',null,'N');
INSERT INTO EMPLOYEE VALUES('216','하정연','911102-1234578', 'han@tjoeun.or.kr','01033332238','D1','J6',2780000,0.2,214,'13/03/01',null,'N');
INSERT INTO EMPLOYEE VALUES('217','문정보','931102-2234579', 'mun_tjoeun@tjoeun.or.kr','01133332239','D1','J6',3660000,0.3,214,'07/03/20',null,'N');
INSERT INTO EMPLOYEE VALUES('218','선우정보','951102-1234580', 'yang@tjoeun.or.kr','01033332240',null,'J7',2890000,null,null,'16/11/28',null,'N');
INSERT INTO EMPLOYEE VALUES('219','구정하','961102-1234581', 'gu@tjoeun.or.kr',null,'D2','J4',1550000,null,null,'99/09/09',null,'N');
INSERT INTO EMPLOYEE VALUES('220','황정보','971102-1234582', 'hwang@tjoeun.or.kr',null,'D2','J4',2490000,null,null,'14/09/18',null,'N');
INSERT INTO EMPLOYEE VALUES('221','배정보','991102-2234583', 'bae_tjoeun@tjoeun.or.kr',null,'D2','J4',2480000,null,null,'94/01/20',null,'N');
INSERT INTO EMPLOYEE VALUES('222','전정보','801102-2234584', 'jeon@tjoeun.or.kr','01011112244','D8','J6',2436240,0.35,100,'97/09/12','17/09/12','Y');

-------------------------------------------------
--- DDL for Table JOB
-------------------------------------------------
CREATE TABLE JOB(
JOB_CODE CHAR(2) PRIMARY KEY,
JOB_NAME VARCHAR2(35)
);

COMMENT ON COLUMN JOB.JOB_CODE IS '직급코드';
COMMENT ON COLUMN JOB.JOB_NAME IS '직급명';
COMMENT ON TABLE DEPARTMENT IS '직급';

INSERT INTO JOB VALUES('J1','대표');
INSERT INTO JOB VALUES('J2','부사장');
INSERT INTO JOB VALUES('J3','부장');
INSERT INTO JOB VALUES('J4','차장');
INSERT INTO JOB VALUES('J5','과장');
INSERT INTO JOB VALUES('J6','대리');
INSERT INTO JOB VALUES('J7','사원');

-------------------------------------------------
--- DDL for Table LOCATION
-------------------------------------------------
CREATE TABLE LOCATION(
    LOCAL_CODE CHAR(2) PRIMARY KEY,
    NATIONAL_CODE CHAR(2) NOT NULL,
    LOCAL_NAME VARCHAR2(40)
);

COMMENT ON COLUMN LOCATION.LOCAL_CODE IS '지역코드';
COMMENT ON COLUMN LOCATION.NATIONAL_CODE IS '국가코드';
COMMENT ON COLUMN LOCATION.LOCAL_NAME IS '지역명';
COMMENT ON TABLE LOCATION IS '지역';

INSERT INTO LOCATION VALUES('L1','KO','ASIA1');
INSERT INTO LOCATION VALUES('L2','JP','ASIA2');
INSERT INTO LOCATION VALUES('L3','CH','ASIA3');
INSERT INTO LOCATION VALUES('L4','US','AMERICA');
INSERT INTO LOCATION VALUES('L5','RU','EU');

-------------------------------------------------
--- DDL for Table NATIONAL
-------------------------------------------------
CREATE TABLE NATIONAL(
    NATIONAL_CODE CHAR(2) PRIMARY KEY,
    NATIONAL_NAME VARCHAR2(35) NOT NULL
);

COMMENT ON COLUMN NATIONAL.NATIONAL_CODE IS '국가코드';
COMMENT ON COLUMN NATIONAL.NATIONAL_NAME IS '국가명';
COMMENT ON TABLE NATIONAL IS '국가';

INSERT INTO NATIONAL VALUES('KO','한국');
INSERT INTO NATIONAL VALUES('JP','일본');
INSERT INTO NATIONAL VALUES('CH','중국');
INSERT INTO NATIONAL VALUES('US','미국');
INSERT INTO NATIONAL VALUES('RU','러시아');

-------------------------------------------------
--- DDL for Table SAL_GRADE
-------------------------------------------------
CREATE TABLE SAL_GRADE(
    SAL_LEVEL CHAR(2) PRIMARY KEY,
    MIN_SAL NUMBER,
    MAX_SAL NUMBER
);

COMMENT ON COLUMN SAL_GRADE.SAL_LEVEL IS '급여등급';
COMMENT ON COLUMN SAL_GRADE.MIN_SAL IS '최소급여';
COMMENT ON COLUMN SAL_GRADE.MAX_SAL IS '최대급여';
COMMENT ON TABLE SAL_GRADE IS '급여등급';

INSERT INTO SAL_GRADE VALUES('S1',6000000,10000000);
INSERT INTO SAL_GRADE VALUES('S2',5000000,5999999);
INSERT INTO SAL_GRADE VALUES('S3',4000000,4999999);
INSERT INTO SAL_GRADE VALUES('S4',3000000,3999999);
INSERT INTO SAL_GRADE VALUES('S5',2000000,2999999);
INSERT INTO SAL_GRADE VALUES('S6',1000000,1999999);