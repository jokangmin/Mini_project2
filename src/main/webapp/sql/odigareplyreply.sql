CREATE TABLE odigareplyreply(
seq number not null,                     -- 글번호 (시퀀스 객체 이용)
replyreplyid VARCHAR2(20) NOT NULL,           -- 아이디
replyreplycontent VARCHAR2(4000) NOT NULL,    -- 댓글 내용
ref NUMBER NOT NULL,   
step NUMBER DEFAULT 2 NOT NULL,          -- 글순서
logtime DATE DEFAULT SYSDATE,             -- 작성시간
refref NUMBER NOT NULL
);

CREATE SEQUENCE odigareplyreply_seq
START WITH 1         -- 시작 값
INCREMENT BY 1      -- 증가 값
NOCACHE;            -- 캐시 사용 안 함 (원하는 경우 CACHE 설정 가능)