/*
    <GROUP BY절>
    그룹을 기준으로 하나의 그룹으로 묶어서 처리할 목적으로 사용
*/
-- 각 부서별 총 급여액
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 사원수
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 사원수와 합계
SELECT DEPT_CODE,COUNT(*),  SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 직급별 사원수와 급여의 총합
SELECT COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 직급별 총 사원수와 보너스를 받는 사원수, 급여의 합, 평균 급여, 최저 급여, 최고 급여를 직급별 오름차순 정렬
SELECT JOB_CODE, 
        COUNT(*) 사원수,
        COUNT(BONUS) "보너스를 받는 사원수",
        SUM(SALARY) "급여의 합", ROUND(AVG(SALARY), -1) 평균급여,
        MIN(SALARY) 최저급여, MAX(SALARY) 최고급여
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 남, 여별 사원수
SELECT DECODE(SUBSTR(EMP_NO,8,1), '1', '남', '2', '여', '3', '남' , '4', '여') 성별, COUNT(*) 사원수
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),
                 '1', '남', '2', '여', '3', '남' , '4', '여');

-- GROUP BY절에서 여러 컬럼 기술 가능
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;
-----------------------------------------------------------------------------------------------------
/*
    <HAVING절>
    그룹에 대한 조건을 제시할 때 사용되는 구문
*/
-- 각 부서별 평균 급여가 300만원 이상인 부서만 조회
SELECT DEPT_CODE, CEIL(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;







