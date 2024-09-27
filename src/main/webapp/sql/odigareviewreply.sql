CREATE TABLE odigareviewreply(
seq number not null,                     -- 글번호 (시퀀스 객체 이용)
replyid VARCHAR2(20) NOT NULL,           -- 아이디
replycontent VARCHAR2(4000) NOT NULL,    -- 댓글 내용
ref NUMBER NOT NULL,                     -- 그룹번호
step NUMBER DEFAULT 1 NOT NULL,          -- 글순서
likes NUMBER DEFAULT 0,                  -- 좋아요
logtime DATE DEFAULT SYSDATE             -- 작성시간
);

CREATE SEQUENCE odigareviewreply_seq
START WITH 1         -- 시작 값
INCREMENT BY 1      -- 증가 값
NOCACHE;            -- 캐시 사용 안 함 (원하는 경우 CACHE 설정 가능)