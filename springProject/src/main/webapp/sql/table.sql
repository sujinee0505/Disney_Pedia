/* 멤버-회원정보  */
create table dmember(
    mem_num number not null,
    id varchar2(18) unique not null,
    auth number(1) default 2 not null, /*회원등급:0탈퇴회원,1정지회원,2일반회원,3관리자*/
    constraint dmember_pk primary key (mem_num)
);
/*멤버 디테일-회원상세정보 */
create table dmember_detail(
    mem_num number not null,
    name varchar2(18) not null,
    passwd varchar2(18) not null,
    photo blob,
 	photo_name varchar2(100),
    introduction varchar2(900),
    reg_date date default sysdate not null,
    modify_date date,
    constraint dmember_detail_pk primary key (mem_num),
    constraint dmember_detail_fk foreign key (mem_num) references dmember (mem_num)
 );
create sequence dmember_seq;

/* 팔로우  */
create table dfollow(
 follow_num number not null,
 active_mem number not null,
 passive_mem number not null,
constraint dfollow_pk primary key (follow_num),
constraint dfollow_fk1 foreign key (active_mem) references dmember_detail (mem_num),
constraint dfollow_fk2 foreign key (passive_mem) references dmember_detail (mem_num)
 );
create sequence dfollow_seq;

/* 컨텐츠 보고싶어요 */
create table dcontents_like(
  clike_num number not null,
  contents_num number not null,
  contents_type varchar2(5) not null,
  mem_num number not null,
  constraint dcontents_like_pk primary key (clike_num),
  constraint dcontents_like_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_like_seq;

/* 컨텐츠 평가(별점) */
create table dcontents_star( 
  star_num number not null,
  contents_num number not null,
  contents_type varchar2(5) not null, 
  star number(5,1) not null,
  mem_num number not null,
  constraint dcontents_star_pk primary key (star_num),
  constraint dcontents_star_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_star_seq;

/* 코멘트  */
create table dcomment(
  comment_num number not null, 
  contents_num number not null,
  contents_type varchar2(5) not null,
  content varchar2(4000) not null, 
  reg_date date not null,
  modify_date date,
  star_num number, 
  mem_num number not null,
  constraint dcomment_pk primary key (comment_num), 
  constraint dcomment_fk_2 foreign key (mem_num) references dmember (mem_num) 
);
create sequence dcomment_seq; 

/* 코멘트 좋아요 테이블 */
create table dcomment_like( 
  commentlike_num number not null, 
  comment_num number not null, 
  mem_num number not null,
  constraint dcomment_like_pk primary key (commentlike_num), 
  constraint dcomment_like_fk_1 foreign key (comment_num) references dcomment (comment_num),
  constraint dcomment_like_fk_2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dcomment_like_seq; 

/* 코멘트 댓글 테이블*/
create table dcomment_reply(
 reply_num number not null,
 comment_num number not null,
 mem_num number not null,
 content varchar2(900) not null,
 reg_date date default sysdate, 
 modify_date date,
 constraint dcomment_reply_pk primary key (reply_num),
 constraint dcomment_reply_fk_1 foreign key (comment_num) references dcomment (comment_num),
 constraint dcomment_reply_fk_2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dcomment_reply_seq;

/* 컨텐츠 캘린더 테이블 */
create table dcontents_cal(
  cal_num number not null,
  custom_date date not null,
  contents_num number not null,
  contents_type varchar2(5) not null,
  poster_path clob ,
  mem_num number not null,
  constraint dcontents_cal_pk primary key (cal_num),
  constraint dcontents_cal_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_cal_seq;

/* 채팅방 테이블 */
create table dchatboard (
  chatboard_num number not null,
  mem_num number not null,
  title varchar2(150) not null,
  content clob not null,
  reg_date date default sysdate not null, 
  hit number(5) default 0 not null, 
  mate_state number default 0 not null, --0 구하는중 / 1 모집완료 --*
  constraint dchatboard_pk primary key(chatboard_num),
  constraint dchatboard_fk1 foreign key(mem_num) references dmember_detail(mem_num)
);
create sequence dchatboard_seq;

/*채팅(chatting) 테이블 영역*/
CREATE TABLE dchatting(
   chat_num number not null, --채팅번호
   to_num number not null, --메시지수신번호(글작성자회원번호)
   from_num number not null, --메시지발신번호(선채팅자회원번호)
   chatstate_num number(1) default 0 not null, --읽기상태(0읽지 않음, 1 읽음)
   content varchar2(900) not null,
   chatboard_num number not null,
   send_date date default sysdate,
   --read_date date,
   constraint dchatting_pk primary key (chat_num),
   constraint dchatting_fk1 foreign key (to_num) references dmember (mem_num),
   constraint dchatting_fk2 foreign key (from_num) references dmember (mem_num),
   constraint dchatting_fk3 foreign key (chatboard_num) references dchatboard (chatboard_num)
);
CREATE SEQUENCE Dchatting_seq;

