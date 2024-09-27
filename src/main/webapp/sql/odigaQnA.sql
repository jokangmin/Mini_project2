--[QnA 게시판 테이블]
CREATE TABLE odigaQnA(
    seq number PRIMARY KEY,                 -- 글 번호
    qnaId varchar2(100) NOT NULL,          -- 글 작성자
    qnaCheck varchar2(1) NOT NULL,         -- 비밀 글 인지 아닌지
    qnaUserContent VARCHAR2(4000) NOT NULL,    -- 유저 문의 글 내용
    qnaAdminContent VARCHAR2(4000),               -- 관리자 답글 내용
    logtime date DEFAULT SYSDATE            -- 글 작성날짜
);

CREATE SEQUENCE qna_seq
    START WITH 1          -- 시작 값
    INCREMENT BY 1        -- 증가 값
    NOCACHE;              -- 캐시 사용 안 함