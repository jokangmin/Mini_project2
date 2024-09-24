--oracle
CREATE TABLE odigaMember (
    name varchar2(30) NOT NULL,
    id varchar2(30) PRIMARY KEY, -- 기본키, unique, not null, 무결성 제약 조건
    pwd varchar2(30) NOT NULL,
    gender varchar2(3),
    email1 varchar2(20),
    email2 varchar2(20),
    tel1 varchar2(10),
    tel2 varchar2(10),
    tel3 varchar2(10),
    zipcode varchar2(10),
    addr1 varchar2(100),
    addr2 varchar2(100),
    report_count NUMBER DEFAULT 0, -- 신고 횟수, 기본값 0
    blocked CHAR(1) DEFAULT 'N', -- 차단 여부, 기본값 'N' (차단되지 않음)
    logtime date
);