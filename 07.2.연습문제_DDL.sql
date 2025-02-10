/*07.DDL 실습문제
도서관리 프로그램을 만들기 위한 테이블들 만들기
이때, 제약조건에 이름을 부여할 것.
       각 컬럼에 주석달기
*/

/* 1. 출판사들에 대한 데이터를 담기위한 출판사 테이블(TB_PUBLISHER)
            컬럼 : PUB_NO(출판사번호) NUMBER -- 기본키(PUBLISHER_PK) 
            PUB_NAME(출판사명) VARCHAR2(50) -- NOT NULL(PUBLISHER_NN)
            PHONE(출판사전화번호) VARCHAR2(13) - 제약조건 없음
*/
CREATE TABLE TB_PUBLISHER(
    PUB_NO NUMBER PRIMARY KEY,
    PUB_NAME VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(13)
);
/*
오류 : ORA-02273: 고유/기본 키가 외부 키에 의해 참조되었습니다
ALTER TABLE TB_PUBLISHER
DROP CONSTRAINT SYS_C007469;

ALTER TABLE TB_PUBLISHER
ADD CONSTRAINT PUBLISHER_PK PRIMARY KEY(PUB_NO);
*/

-- 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_PUBLISHER VALUES (1, '자바', '010-1234-1234');
INSERT INTO TB_PUBLISHER VALUES (2, '오라클', '010-5678-4321');
INSERT INTO TB_PUBLISHER VALUES (3, 'CSS', '010-8765-5678');

/* 2. 도서들에 대한 데이터를 담기위한 도서 테이블(TB_BOOK)
           컬럼  :  BK_NO (도서번호) NUMBER -- 기본키(BOOK_PK)
            BK_TITLE (도서명) VARCHAR2(50) -- NOT NULL(BOOK_NN_TITLE)
            BK_AUTHOR(저자명) VARCHAR2(20) -- NOT NULL(BOOK_NN_AUTHOR)
            BK_PRICE(가격) NUMBER
            BK_PUB_NO(출판사번호) NUMBER -- 외래키(BOOK_FK) (TB_PUBLISHER 테이블을 참조하도록)
                             이때 참조하고 있는 부모데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정
*/
CREATE TABLE TB_BOOK (
    BK_NO NUMBER PRIMARY KEY,
    BK_AUTHOR VARCHAR2(50) NOT NULL,
    BK_PRICE NUMBER,
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER ON DELETE CASCADE
);

-- 5개 정도의 샘플 데이터 추가하기
INSERT INTO TB_BOOK VALUES (1, '자바', '20000', 1);
INSERT INTO TB_BOOK VALUES (2, '오라클', '30000', 2);
INSERT INTO TB_BOOK VALUES (3, 'CSS', '40000', 3);
INSERT INTO TB_BOOK VALUES (4, 'JSP', '30000', 2);
INSERT INTO TB_BOOK VALUES (5, 'HTML', '20000', 1);

/* 3. 회원에 대한 데이터를 담기위한 회원 테이블 (TB_MEMBER)
           컬럼명 : MEMBER_NO(회원번호) NUMBER -- 기본키(MEMBER_PK)
           MEMBER_ID(아이디) VARCHAR2(30) -- 중복금지(MEMBER_UQ)
           MEMBER_PWD(비밀번호)  VARCHAR2(30) -- NOT NULL(MEMBER_NN_PWD)
           MEMBER_NAME(회원명) VARCHAR2(20) -- NOT NULL(MEMBER_NN_NAME)
           GENDER(성별)  CHAR(1)-- 'M' 또는 'F'로 입력되도록 제한(MEMBER_CK_GEN)
           ADDRESS(주소) VARCHAR2(70)
           PHONE(연락처) VARCHAR2(13)
           STATUS(탈퇴여부) CHAR(1) - 기본값으로 'N' 으로 지정, 그리고 'Y' 혹은 'N'으로만 입력되도록 제약조건(MEMBER_CK_STA)
           ENROLL_DATE(가입일) DATE -- 기본값으로 SYSDATE, NOT NULL 제약조건(MEMBER_NN_EN)
*/
CREATE TABLE TB_MEMBER (
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ID VARCHAR2(30) NOT NULL UNIQUE,
    MEMBER_PWD VARCHAR2(30) NOT NULL,
    MEMBER_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(1) CHECK(GENDER IN ('M', 'F')),
    ADDRESS VARCHAR2(70),
    PHONE VARCHAR2(70),
    STATUS CHAR(1) CHECK(STATUS IN ('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL
);

-- 5개 정도의 샘플 데이터 추가하기
INSERT INTO TB_MEMBER VALUES (1, 'user1', 'user1', '김김김', 'M', '서울특별시 강남구', '010-1234-1234', 'N', '25/02/09');
INSERT INTO TB_MEMBER VALUES (2, 'user2', 'user2', '이이이', 'F', '서울특별시 서초구', '010-2222-9898', 'N', '24/02/19');
INSERT INTO TB_MEMBER VALUES (3, 'user3', 'user3', '박박박', 'M', '서울특별시 송파구', '010-7777-2323', 'N', '25/01/22');
INSERT INTO TB_MEMBER VALUES (4, 'user4', 'user4', '최최최', 'F', '경기도 수원시', '010-1234-5656', 'N', DEFAULT);
INSERT INTO TB_MEMBER VALUES (5, 'user5', 'user5', '한한한', 'F', '경기도 남양주시', '010-3333-7894', 'N', '24/02/25');

/* 4. 어떤 회원이 어떤 도서를 대여했는지에 대한 대여목록 테이블(TB_RENT)
           컬럼  :  RENT_NO(대여번호) NUMBER -- 기본키(RENT_PK)
            RENT_MEM_NO(대여회원번호) NUMBER -- 외래키(RENT_FK_MEM) TB_MEMBER와 참조하도록
                    이때 부모 데이터 삭제시 자식 데이터 값이 NULL이 되도록 옵션 설정
            RENT_BOOK_NO(대여도서번호) NUMBER -- 외래키(RENT_FK_BOOK) TB_BOOK와 참조하도록
                    이때 부모 데이터 삭제시 자식 데이터 값이 NULL값이 되도록 옵션 설정
            RENT_DATE(대여일) DATE -- 기본값 SYSDATE
*/
CREATE TABLE TB_RENT (
    RENT_NO NUMBER PRIMARY KEY,
    RENT_MEM_NO NUMBER REFERENCES TB_MEMBER ON DELETE SET NULL,
    RENT_BOOK_NO NUMBER REFERENCES TB_MEMBER ON DELETE SET NULL,
    RENT_DATE DATE DEFAULT SYSDATE NOT NULL
);

-- 3개 정도 샘플데이터 추가하기
INSERT INTO TB_RENT VALUES (1, 2, 3, '25/01/22');
INSERT INTO TB_RENT VALUES (2, 1, 4, DEFAULT);
INSERT INTO TB_RENT VALUES (3, 4, 5, '25/02/09');112
