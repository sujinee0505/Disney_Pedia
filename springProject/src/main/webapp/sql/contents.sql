/* 테스트용 */
/* 멤버 테이블*/
create table dmember(
    mem_num number not null,
    id varchar2(18) unique not null,
    auth number(1) default 2 not null, /*회원등급:0탈퇴회원,1정지회원,2일반회원,3관리자*/
    constraint dmember_pk primary key (mem_num)
);
/* 멤버 디테일 테이블 */
create table dmember_detail(
    mem_num number not null,
    name varchar2(18) not null,
    passwd varchar2(18) not null,
    phone varchar2(100),
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
  constraint dcontents_like_fk foreign key (mem_num) 
                         references dmember (mem_num)
);
create sequence dcontents_like_seq;

/* 컨텐츠 평가(별점) 테이블*/
create table dcontents_grade(
  grade_num number not null,
  contents_num number not null,
  grade number(1) not null,
  mem_num number not null,
  constraint dcontents_grade_pk primary key (grade_num),
  constraint dcontents_grade_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_grade_seq;

/* 컨텐츠 캘린더 테이블 */
create table dcontents_cal(
  cal_num number not null,
  custom_date date not null,
  contents_num number not null,
  mem_num number not null,
  constraint dcontents_cal_pk primary key (cal_num),
  constraint dcontents_cal_fk foreign key (mem_num) references dmember (mem_num)
);
create sequence dcontents_cal_seq;

/*DLIST*/
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

/*DLIST_REPLY*/
create table dlist_reply(
  re_num number not null,
  re_content varchar2(900) not null,
  re_date date default sysdate not null,
  re_modifydate date,
  list_num number not null,
  mem_num number not null,
  constraint dlist_reply_pk primary key (re_num),
  constraint reply_dlist_fk1 foreign key (list_num) references dlist (list_num),
  constraint reply_dmember_fk2 foreign key (mem_num) references dmember (mem_num)
);

create sequence dlist_reply_seq;

/*DLIST_LIKE*/
create table dlist_like(
  listLike_num number not null,
  list_num number not null,
  mem_num number not null,
  constraint dlist_like_pk primary key (listLike_num),
  constraint like_dlist_fk1 foreign key (list_num) references dlist (list_num),
  constraint like_dmember_fk2 foreign key (mem_num) references dmember (mem_num)
);
create sequence dlist_like_seq;
