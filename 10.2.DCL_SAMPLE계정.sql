-- 10.1. DCL_관리자계정.sql 확인

-- 3. 권한 부여받은 후
CREATE TABLE TEST (
    TEST_ID NUMBER,
    TEST_NAME VARCHAR(20)
);

-- 4. 권한 부여받은 후
INSERT INTO TEST VALUES (1, 'HI');

-- 5.권한 부여받은 후
SELECT * 
FROM TJOEUN.EMPLOYEE;

-- 6. 
INSERT INTO TJOEUN.EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE) 
                                VALUES (302, '홍길동', '210324-7894768', 'J2');
COMMIT;

-- 7.
-- 권한을 회수하였기 때문에 오류 발생, 접근 불가 : 권한이 불충분합니다
SELECT * 
FROM TJOEUN.EMPLOYEE;

-- 권한을 회수하였기 때문에 오류 발생, 접근 불가 : 테이블 또는 뷰가 존재하지 않습니다
INSERT INTO TJOEUN.EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE) 
                                VALUES (303, '홍길동', '210324-7894768', 'J2');
