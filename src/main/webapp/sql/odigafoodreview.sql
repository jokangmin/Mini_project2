CREATE TABLE odigafoodreview(
seq NUMBER NOT NULL,                -- 글번호 (시퀀스 객체 이용)
reviewid VARCHAR2(20) NOT NULL,     -- 아이디
reviewname VARCHAR2(40) NOT NULL,   -- 이름
subject VARCHAR2(255) NOT NULL,     -- 제목
content VARCHAR2(4000) NOT NULL,    -- 내용
ref NUMBER NOT NULL,                -- 그룹번호
step NUMBER DEFAULT 0 NOT NULL,     -- 글순서
grade NUMBER DEFAULT 0,             -- 평점
likes NUMBER DEFAULT 0,             -- 좋아요
hit NUMBER DEFAULT 0,               -- 조회수
image1 varchar2(200),				-- 이미지
logtime DATE DEFAULT SYSDATE        -- 작성시간
);