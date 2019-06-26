-- 회원정보 테이블
create table web4_member (
	id			varchar2(20) primary key,	--아이디
	password 	varchar2(20) not null,		--비밀번호
	name		varchar2(20) not null		--이름
);

-- 데이터 예
insert into web4_member values ('aaa', 'aaa', '홍길동');
