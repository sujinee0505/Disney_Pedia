/* 컨텐츠 좋아요 테이블 */
create table dcontents_like(
  clike_num number not null,
  contents_num number not null,
  mem_num number not null,
  constraint dcontents_like_fk foreign key (mem_num) 
                         references dmember (mem_num)
);

/* 컨텐츠 평가(별점) 테이블*/
create table dcontents_grade(
  grade_num number not null,
  contents_num number not null,
  grade number(1) not null,
  mem_num number not null,
  constraint dcontents_like_fk foreign key (mem_num) 
                         references dmember (mem_num)
);

/* 컨텐츠 캘린더 테이블 */
create table dcontents_cal(
  cal_num number not null,
  custom_date date not null,
  contents_num number not null,
  mem_num number not null,
  constraint dcontents_like_fk foreign key (mem_num) 
                         references dmember (mem_num)
);