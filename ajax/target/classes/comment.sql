--리플 저장 테이블
create table usercomment (
	num		number primary key,		--일련번호
	name	varchar2(30) not null,	--작성자
	text	varchar2(300)not null	--리플 내용
);

--리플 일련번호 시퀀스
create sequence usercomment_seq;

--저장 예
insert into usercomment values (usercomment_seq.nextval, 'abc', '리플내용');