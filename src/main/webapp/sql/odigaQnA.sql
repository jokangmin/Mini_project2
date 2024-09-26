--[QnA 게시판 테이블]
CREATE TABLE odigaQnA(
    seq number PRIMARY KEY,                 -- 글 번호
    qna_Id varchar2(100) NOT NULL,          -- 글 작성자
    qna_title varchar2(255) NOT NULL,       -- 글 제목
    qna_content VARCHAR2(4000) NOT NULL,    -- 글 내용
    ref number not null,                    -- 그룹 번호(seq 번호와 동일한 값)
    step number default 0 NOT NULL,         -- 답글 순서
    logtime date DEFAULT SYSDATE            -- 글 작성날짜
);
--[QnA 게시판 seq 시퀀스]
CREATE SEQUENCE qna_seq
    START WITH 1          -- 시작 값
    INCREMENT BY 1        -- 증가 값
    NOCACHE;              -- 캐시 사용 안 함