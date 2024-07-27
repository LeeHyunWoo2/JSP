create table member(
	id varchar2(10) not null, -- id
	pass varchar2(10) not null, -- pw
	name varchar2(30) not null, -- name
	regidate date default sysdate not null, -- 생성일
	primary key(id) -- 기본키 생성
) -- 회원용 테이블


create table board(
	num number primary key,                 -- 게시물 번호(시퀀스)
	title varchar2(200) not null,           -- 제목
	content varchar2(2000) not null,        -- 내용
	id varchar2(10) not null,               -- 작성자. 위에꺼 member 테이블에 id랑 맞춰야함
	postdate date default sysdate not null, -- 작성일
	visitcount number(6)                    -- 조회수
)

-- 외래키 설정 (부모 member -> 자식 board)
alter table board add constraint board_member_fk foreign key(id) references member(id);

-- 시퀀스 설정 (자동번호 주입)
create sequence seq_board_num
	increment by 1 -- 증가값 1
	start with 1   -- 시작값 1
	minvalue 1     -- 최소값 1
	nomaxvalue     -- 최대값 없음
	nocycle        -- 반복 없음
	nocache;

drop sequence seq_board_num; -- 시퀀스 객체 삭제


insert into member(id, pass, name) values('kkw', '1234', '김기원');
insert into member(id, pass, name) values('lhw', '1234', '이현우');
insert into member(id, pass, name) values('kwh', '1234', '김우혁');
insert into member(id, pass, name) values('kth', '1234', '김태희');


insert into board(num, title, content, id, postdate, visitcount) -- 그냥 생성하면 안됨 아이디를 만들어놔야 넣어짐
values(seq_board_num.nextval, '제목1', '내용1', 'kkw', sysdate, 0);
insert into board(num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval, '제목2', '내용2', 'lhw', sysdate, 0);
insert into board(num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval, '제목3', '내용3', 'kwh', sysdate, 0);
insert into board(num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval, '제목4', '내용4', 'kth', sysdate, 0);
insert into board(num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval, '제목5', '내용5', 'kkw', sysdate, 0);


select * from MEMBER;
select * from BOARD;

drop table member;
drop table board;

select * from member where id='kkw' and pass='1234';
-- DAO에서 쿼리문 제대로 쓴건가 확인할때 sql파일에서 테스트하는게 좋다

select count(*) from board where title like '%제목%'

select B.*, M.name from member M inner join board B on M.id = B.id where num=3;

update board set visitcount = visitcount+1 where num=2;