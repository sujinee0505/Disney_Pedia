/* 테스트용 */
/* 멤버 테이블 */
create table dmember(
    mem_num number not null,
    id varchar2(18) unique not null,
    auth number(1) default 2 not null, /*회원등급:0탈퇴회원,1정지회원,2일반회원,3관리자*/
    constraint dmember_pk primary key (mem_num)
);
/*멤버 디테일 테이블*/
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

/* 팔로우 테이블 */
create table dfollow(
 follow_num number not null,
 active_mem number not null,
 passive_mem number not null,
constraint dfollow_pk primary key (follow_num),
constraint dfollow_fk1 foreign key (active_mem) references dmember_detail (mem_num),
constraint dfollow_fk2 foreign key (passive_mem) references dmember_detail (mem_num)
 );
create sequence dfollow_seq;

/* 컨텐츠 좋아요 테이블 */
create table dcontents_like(
  clike_num number not null,
  contents_num number not null,
  mem_num number not null,
  constraint dcontents_like_pk primary key (clike_num),
  constraint dcontents_like_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_like_seq;

/* 컨텐츠 평가(별점) 테이블*/
create table dcontents_star(
  star_num number not null,
  contents_num number not null,
  star number(1) not null,
  mem_num number not null,
  constraint dcontents_star_pk primary key (star_num),
  constraint dcontents_star_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_grade_seq;

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

/* 리스트 테이블 */
create table dlist(
  list_num number not null,
  list_title varchar2(90) not null,
  list_content clob not null,
  reg_date date default sysdate not null,
  modify_date date,
  mem_num number not null,
  contents_num number not null,
  constraint dlist_pk primary key (list_num),
  constraint dlist_fk foreign key (mem_num) references dmember (mem_num)
);

create sequence dlist_seq;

/* 리스트 댓글 테이블 */
create table dlist_reply(
  re_num number not null,
  re_content varchar2(900) not null,
  re_date date default sysdate not null,
  re_modifydate date,
  list_num number not null,
  mem_num number not null,
  constraint dlist_reply_pk primary key (re_num),
  constraint dlist_reply_fk1 foreign key (list_num) references dlist (list_num),
  constraint dlist_reply_fk2 foreign key (mem_num) references dmember (mem_num)
);

create sequence dlist_reply_seq;

/* 리스트 좋아요 테이블 */
create table dlist_like(
  listLike_num number not null,
  list_num number not null,
  mem_num number not null,
  constraint dlist_like_pk primary key (listLike_num),
  constraint dlist_like_fk1 foreign key (list_num) references dlist (list_num),
  constraint dlist_like_fk2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dlist_like_seq;

/* 리뷰 테이블 */
create table dreview(
  review_num number not null,
  contents_num number not null,
  contetns_typ number not null,
  content clob not null,
  reg_date date not null,
  modify_date date,
  grade_num number not null,
  mem_num number not null,
  constraint dreview_pk primary key (review_num),
  constraint dreview_fk_1 foreign key (grade_num) references dcontents_grade (grade_num),
  constraint dreview_fk_2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dreview_seq;

/* 리뷰 좋아요 테이블 */
create table dreview_like(
  rlike_num number not null,
  review_num number not null,
  mem_num number not null,
  constraint dreview_like_pk primary key (rlike_num),
  constraint dreview_like_fk_1 foreign key (review_num) references dreview (review_num),
  constraint dreview_like_fk_2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dreview_like_seq;

/* 채팅방 테이블 */
create table dchatboard (
  chatboard_num number not null,
  mem_num number not null,
  title varchar2(150) not null,
  content clob not null,
  reg_date date default sysdate not null,
  hit number(5) default 0 not null,
  mate_state number default 0 not null, --0 구하는중 / 1 모집완료
  constraint dchatboard_pk primary key(chatboard_num),
  constraint dchatboard_fk1 foreign key(mem_num) references dmember_detail(mem_num)
);
create sequence dchatboard_seq;

/*채팅 정보 테이블*/
create table dchatting(
  dchat_num number not null,
  chatroom_num number not null,
  mem_num number not null,
  opponent_num number not null,
  content varchar2(900) not null,
  send_date date default sysdate,
  read_date date,
  read number(1) default 1,
  constraint dchatting_pk primary key(dchat_num),
  constraint dchatting_fk1 foreign key(chatroom_num) references Dchatboard(chatboard_num),
  constraint dchatting_fk2 foreign key(mem_num) references Dmember_detail(mem_num),
  constraint dchatting_fk3 foreign key(opponent_num) references Dmember_detail(mem_num)
);
CREATE SEQUENCE Dchatting_seq;


