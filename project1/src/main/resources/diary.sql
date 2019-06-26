-- 일기쓰기
create table diary (
	num				number	 		not null 	primary key,	--글번호
	id				varchar2(30) 	not null,					--id
	emotion			varchar2(100), 								--기분
	weather			varchar2(100),								--날씨
	title			varchar2(3000),								--제목
	content 		varchar2(3000), 							--내용
	inputdate 		date 			default sysdate,			--작성날짜
	originalfile	varchar2(200),								--원본 파일(원래 이름)
	savedfile		varchar2(100)								--첨부파일(실제 저장된 이름)
);

--글번호 시퀀스
create sequence diary_seq start with 1 increment by 1;

--일기쓰기 레코드 예
insert into diary (num, id, emotion, weather, title, content) values (diary_seq.nextval, 'id', '����', '����', '����', '����');
