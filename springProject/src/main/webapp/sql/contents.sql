/* 테스트용 */
/*회원관리*/
create table dmember(
    mem_num number not null,
    id varchar2(18) unique not null,
    auth number(1) default 2 not null, /*회원등급:0탈퇴회원,1정지회원,2일반회원,3관리자*/
    constraint dmember_pk primary key (mem_num)
);
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

create table dfollow(
 follow_num number not null,
 active_mem number not null,
 passive_mem number not null,
constraint dfollow_pk primary key (follow_num),
constraint dfollow_fk1 foreign key (active_mem) references dmember_detail (mem_num),
constraint dfollow_fk2 foreign key (passive_mem) references dmember_detail (mem_num)
 );
create sequence dfollow_seq;
