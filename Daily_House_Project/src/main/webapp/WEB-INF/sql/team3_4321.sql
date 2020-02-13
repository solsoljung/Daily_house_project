create table tbl_member(
    userid varchar2(50) primary key,        -- 아이디
    userpw varchar2(50) not null,           -- 비밀번호
    username varchar2(50) not null,         -- 이름
    email varchar2(50),                     -- 이메일
    regdate timestamp default sysdate,      -- 가입일
    updatedate timestamp default sysdate    -- 수정일
);

create table tbl_board(
    bno number primary key,                 -- 글번호
    title varchar2(200) not null,           -- 글제목
    content varchar2(2000),                 -- 글내용
    writer varchar2(100) not null,          -- 작성자
    regdate timestamp default sysdate,      -- 작성일
    veiwcnt number default 0                -- 조회수
);

create sequence seq_board_bno;



create table tbl_reply(
    rno NUMBER PRIMARY KEY,
    bno NUMBER REFERENCES tbl_board(bno), 
    reply_text VARCHAR2(500) not null,
    replyer VARCHAR2(50) REFERENCES tbl_member(userid),
    reg_date TIMESTAMP DEFAULT SYSDATE,
    update_date TIMESTAMP DEFAULT SYSDATE
);

create SEQUENCE seq_reply_rno;



--첫페이지의 첫번째 글의 글번호
select max(bno) from tbl_board; 

select * from tbl_reply order by rno desc;





create table tbl_message(
    message_id NUMBER PRIMARY KEY,
    target_id VARCHAR2(50) REFERENCES tbl_member(userid),
    sender varchar2(50) REFERENCES tbl_member(userid),
    message_text varchar2(50) not null,
    open_date TIMESTAMP,
    send_date TIMESTAMP DEFAULT SYSDATE
);

create SEQUENCE seq_message_id;

select * from tbl_message;
select * from tbl_member;

--멤버테이블에 포인트 컬럼 추가
alter table tbl_member add(member_point NUMBER DEFAULT 0);




--게시판 테이블에 댓글 갯수 컬럼 추가
alter table tbl_board add(reply_cnt NUMBER DEFAULT 0);

select max(bno) from tbl_board;
select count(*) from tbl_reply where bno = 525;
update tbl_board set reply_cnt = 4 where bno = 525;
commit;


