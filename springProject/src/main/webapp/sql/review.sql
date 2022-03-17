/* 리뷰 테이블 */
create table dreview(
  review_num number not null,
  content clob not null,
  reg_date date not null,
  modify_date date,
  grade_num number not null,
  mem_num number not null,
  constraint dreview_fk_1 foreign key (grade_num) 
                         references dcontents_grade (grade_num)
  constraint dreview_fk_2 foreign key (mem_num) 
                         references dmember (mem_num)
);
create sequence dreview_seq;

/* 리뷰 좋아요 테이블 */
create table dreview_like(
  rlike_num number not null,
  review_num number not null,
  mem_num number not null,
  constraint dreview_like_fk_1 foreign key (review_num)
                         references dreview (review_num)
  constraint dreview_like_fk_2 foreign key (mem_num) 
                         references dmember (mem_num)
);
create sequence dreview_like_seq;