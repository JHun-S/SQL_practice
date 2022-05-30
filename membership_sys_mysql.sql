show databases;

CREATE DATABASE sql_mini_project;

USE sql_mini_project;

show tables;

drop table IF EXISTs membership;
drop table IF EXISTs subscriber;


CREATE TABLE membership (
    memno                int  NOT NULL AUTO_INCREMENT,	-- 회원번호
    mname                varchar(20) NOT NULL,	-- 회원이름
    phone                varchar(11) NOT NULL,	-- 전화번호
    joindate             datetime NOT NULL,	-- 가입날짜
    recom                int,	-- recommender 추천자의 회원번호
    CONSTRAINT pk_mem PRIMARY KEY ( memno )
 );


CREATE TABLE subscriber (
    subno               int  NOT NULL AUTO_INCREMENT,	-- 구독가입 순서
    memno               int  NOT NULL ,	-- 회원번호
    status              bit(2)  NOT NULL ,	-- 현재 구독여부 (1 : 구독중, 0 : 일반회원)
    startdate           datetime NOT NULL,	-- 구독 시작날짜
    enddate             datetime NOT NULL,	-- 구독 종료날짜
    CONSTRAINT pk_sub PRIMARY KEY ( subno )
 );
 

ALTER TABLE subscriber ADD CONSTRAINT fk_sub_memno FOREIGN KEY ( memno ) REFERENCES membership( memno ) ON DELETE NO ACTION ON UPDATE NO ACTION;


alter table membership change mname mname varchar(20) binary;
alter table subscriber change status status bit(1);


insert into membership values( 1, 'smith', '01011111111', STR_TO_DATE('1-5-2021','%d-%m-%Y'), null);
insert into membership values( 2, 'tom', '01022222222', STR_TO_DATE('9-2-2021','%d-%m-%Y'), null);
insert into membership values( 3, 'jhon', '01033333333', STR_TO_DATE('2-3-2021','%d-%m-%Y'), 1);
insert into membership values( 4, 'ford', '01044444444', STR_TO_DATE('13-3-2021','%d-%m-%Y'), 1);
insert into membership values( 5, 'jason', '01055555555', STR_TO_DATE('3-5-2021','%d-%m-%Y'), null);
insert into membership values( 6, 'kile', '01066666666', STR_TO_DATE('17-6-2021','%d-%m-%Y'), 2);
insert into membership values( 7, 'bob', '01077777777', STR_TO_DATE('20-8-2021','%d-%m-%Y'), 3);
insert into membership values( 8, 'son', '01088888888', STR_TO_DATE('22-9-2021','%d-%m-%Y'), 5);
insert into membership values( 9, 'kane', '01099999999', STR_TO_DATE('28-12-2021','%d-%m-%Y'), 4);


insert into subscriber values(1, 1, 1, STR_TO_DATE('30-5-2022','%d-%m-%Y'), STR_TO_DATE('30-6-2022','%d-%m-%Y'));
insert into subscriber values(2, 2, 1, now(), STR_TO_DATE('30-8-2022','%d-%m-%Y'));
insert into subscriber values(3, 3, 1, now(), STR_TO_DATE('30-8-2022','%d-%m-%Y'));
insert into subscriber values(4, 4, 1, now(), STR_TO_DATE('30-6-2022','%d-%m-%Y'));
insert into subscriber values(5, 5, 1, now(), STR_TO_DATE('30-5-2023','%d-%m-%Y'));


commit;


SELECT * FROM membership;
SELECT * FROM subscriber;
