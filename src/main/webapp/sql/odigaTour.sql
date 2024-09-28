CREATE TABLE odigaTour (
    seq NUMBER PRIMARY KEY,                  -- 기본 키로 사용될 시퀀스 번호
    tourId VARCHAR2(50),                     -- 서울
    tourSubject VARCHAR2(100),                -- 서울 시티 투어
    description CLOB,                        -- 서울의 주요 명소를~~
    price VARCHAR2(20),                       -- 150,000
    tourImage VARCHAR2(255),                  -- 이미지
    logtime DATE                              -- 등록 시간
);

CREATE SEQUENCE seq_odigaTour
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;