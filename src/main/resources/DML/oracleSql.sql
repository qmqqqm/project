--회원
create table member(
	member_id NUMBER CONSTRAINT member_member_id_pk PRIMARY KEY,        ---회원 번호
	member_name VARCHAR2(10)  NOT NULL,			        					---회원 이름
	member_jumin NUMBER NOT NULL,				       					 ---주민 번호
	member_userid VARCHAR2(30) NOT NULL, 			        					---아이디
	member_pwd VARCHAR2(30) NOT NULL, 			        					---비밀번호
	member_email VARCHAR2(30) NOT NULL,			        					---이메일
	member_tel NUMBER(20) NOT NULL,				        					---번호
	member_admin NUMBER default 0 NOT NULL,
	member_isShow char(1) default 'Y'
);

-- 영화
drop table movie;
CREATE TABLE movie (
	movie_id        NUMBER       CONSTRAINT movie_movie_no_pk PRIMARY KEY , -- 영화코드
	movie_title         VARCHAR2(50) NOT NULL, -- 영화제목
	movie_time NUMBER       NOT NULL, -- 상영시간
	movie_Date   DATE         NOT NULL, -- 개봉일
	movie_endDate     DATE         NOT NULL, -- 상영종료일
	movie_foreman       VARCHAR2(30) NULL,     -- 감독
	movie_actor    VARCHAR2(30) NULL,     -- 출연배우
	movie_genre       VARCHAR2(30) NULL,     -- 장르
	movie_rating       VARCHAR2(30) CONSTRAINT EMP07_GENDER_CK CHECK (movie_rating IN('전체', '12세', '15세', '성인')),  -- 상영등급 
    movie_isshow    VARCHAR2(30)   --삭제여부
);


-- 영화정보
drop table movieInfo;
CREATE TABLE  movieInfo(
	movie_id    NUMBER         NOT NULL, -- 영화코드
	movieInfo_mainInfo VARCHAR2(1000) NOT NULL, -- 주요정보
	movieInfo_image    BLOB           NULL,     -- 스틸컷
    movieInfo_isshow    VARCHAR2(30),   --삭제여부
	movieInfo_review   VARCHAR2(500)  NULL ,     -- 리뷰
    movieInfo_grade     NUMBER     NOT NULL     -- 평점
);

-- 영화정보 외래키
ALTER TABLE movieInfo ADD CONSTRAINTS movieInfo_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);

--극장테이블
drop table theater;
CREATE TABLE theater (
   theater_id        NUMBER       CONSTRAINT theater_theater_id_pk PRIMARY KEY , -- 극장번호
   theater_name         VARCHAR2(50) NOT NULL, -- 극장이름
   theater_location   VARCHAR2(50)       NOT NULL, -- 지역
   theater_address   varchar2(100)         NOT NULL, -- 주소
   theater_phone     varchar2(50)         NOT NULL, -- 전화번호
    theater_isshow    VARCHAR2(30)      --삭제여부
);

--상영관테이블
drop table sangyg;
CREATE TABLE sangyg (
   sangyg_id        NUMBER, -- 상영관번호
   theater_id         NUMBER NOT NULL, -- 극장번호
   sangyg_name   varchar2(10)       NOT NULL, -- 극장이름(일반관)
    sangyg_isshow    VARCHAR2(30),   --삭제여부
   sangyg_seats   NUMBER         NOT NULL -- 총좌석수
);
ALTER TABLE sangyg ADD CONSTRAINTS sangyg_theater_id_fk FOREIGN KEY (theater_id) REFERENCES theater(theater_id);

--시간테이블
drop table times;
CREATE TABLE times (
   sangyg_id        NUMBER,    -- 상영관번호
   theater_id         NUMBER NOT NULL, -- 극장번호
       times_id   NUMBER    CONSTRAINT time_time_id_pk PRIMARY KEY ,--시간번호
   times_seat   NUMBER       NOT NULL, -- 남은좌석수
   times_time   DATE         NOT NULL, -- 상영시작시간.
       times_isshow    VARCHAR2(30),   --삭제여부
       movie_id    NUMBER       NOT NULL   --영화번호
);
ALTER TABLE times ADD CONSTRAINTS times_sangyg_id_fk FOREIGN KEY (sangyg_id) REFERENCES sangyg(sangyg_id);
ALTER TABLE times ADD CONSTRAINTS times_theater_id_fk FOREIGN KEY (theater_id) REFERENCES theater(theater_id);

--영화예약
drop table TICKET;
CREATE TABLE TICKET (
   TICKET_id        NUMBER    CONSTRAINT TICKET_TICKET_id_id_pk PRIMARY KEY, -- 티켓번호
   MEMBER_ID         VARCHAR2(10), -- 회원아이디
    movie_id   NUMBER     ,--영화번호
   theater_id   NUMBER       NOT NULL, -- 극장번호
   TICKET_DATE   DATE         NOT NULL, -- 날짜.
    TICKET_TIME    DATE       NOT NULL,   --시간
    TICKET_PRICE    VARCHAR2(10)       NOT NULL,--금액
    TICKET_QUANTITY    VARCHAR2(10)      NOT NULL,--수량
    sangyg_id    NUMBER       NOT NULL,--상영관
    TICKET_isshow    VARCHAR2(30),   --삭제여부
    TICKET_SEATS  VARCHAR2(30)    NOT NULL--좌석번호  
);
ALTER TABLE TICKET ADD CONSTRAINTS TICKET_sangyg_id_fk FOREIGN KEY (sangyg_id) REFERENCES sangyg(sangyg_id);
ALTER TABLE TICKET ADD CONSTRAINTS TICKET_theater_id_fk FOREIGN KEY (theater_id) REFERENCES theater(theater_id);
ALTER TABLE TICKET ADD CONSTRAINTS TICKET_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


drop sequence movie_seq;
drop sequence movieInformation_seq;
drop sequence theater_seq;
drop sequence sangyg_seq;
drop sequence times_seq;
drop sequence ticket_seq;
drop sequence member_seq;
CREATE SEQUENCE movie_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE movieInformation_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE theater_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE sangyg_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE times_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE ticket_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE member_seq INCREMENT BY 1 START WITH 1;
select*from tab;

-------- 자료입력

--멤버
insert into member values(member_seq.nextval,'전명재',770714,'wjsaudwo','111','wjsaudowo@naver.com',01059597924,0,'Y');
--극장정보입력
insert into theater values(theater_seq.nextval,'늘봄강남','서울','서울특별시 강남구 역삼동 814-6 스타플렉스','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄강변','서울','서울특별시 광진구 구의동 546-4 테크노마트 10층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄건대입구','서울','서울시 광진구 자양동 9-4 몰오브케이 3층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄구로','서울','서울특별시 구로구 구로5동 573번지 NC신구로점 6층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄대학로','서울','서울특별시 종로구 명륜2가 41-9','1544-1122','y');

insert into theater values(theater_seq.nextval,'늘봄경기광주','경기','경기도 광주시 역동16-1 2층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄고양행신','경기','경기도 고양시 덕양구 행신동 762-2,3 로터스플레이스 5F','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄광교','경기','경기도 수원시 영통구 하동 955-70 갤러리아백화점 10층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄광교상현','경기','경기도 용인시 수지구 상현동 1116-4 W스퀘어 2층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄구리','경기','경기도 구리시 인창동 676-2번지 2층','1544-1122','y');

insert into theater values(theater_seq.nextval,'늘봄계양','인천','인천광역시 계양구 작전동 899-1 메트로몰 8층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄남주안','인천','인천광역시 미추홀구 주안동 141-8','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄부평','인천','인천 광역시 부평구 청천동 386번지 아이즈빌아울렛','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄송도타임스페이스','인천','인천광역시 연수구 송도동 8-21 지하1층','1544-1122','y');
insert into theater values(theater_seq.nextval,'늘봄연수역','인천','인천광역시 연수구 청학동 496-4 8층','1544-1122','y');
insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄논산','대전/충청','충남 논산시 내동 452 시네마타워 3층','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄당진','대전/충청','충남 당진시 우두1로 88 (읍내동)','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대전','대전/충청','대전광역시 중구 문화동 1-16 세이2 6층','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대전가수원','대전/충청','대전광역시 서구 가수원동 1042번지 KD U PLAZA 5층~6층','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대전가오','대전/충청','대전광역시 동구 가오동 557 패션아일랜드 4층','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대구','대구','대구광역시 중구 사일동 15-1번지 5층-9층','1544-1122','y');

insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대구수성','대구','대구광역시 수성구 범물동 1273번지 동아백화점 8층','1544-1122','y');


insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대구스타디움','대구','대구시 수성구 대흥동 504번지 일대','1544-1122','y');


insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대구아카데미','대구','대구광역시 중구 남일동 65-1','1544-1122','y');


insert into theater(theater_id,theater_name,theater_location,theater_address,theater_phone,theater_isshow)
values(theater_seq.nextval,'늘봄대구월성','대구','대구광역시 달서구 월성동 1846번지 이래타워 4F','1544-1122','y');

-----상영관
--서울
insert into sangyg values(1,1,'일반관','y',100);
insert into sangyg values(2,1,'일반관','y',90);
insert into sangyg values(3,1,'일반관','y',80);
insert into sangyg values(4,1,'일반관','y',70);
insert into sangyg values(5,1,'일반관','y',60);

insert into sangyg values(1,2,'일반관','y',100);
insert into sangyg values(2,2,'일반관','y',90);
insert into sangyg values(3,2,'일반관','y',80);
insert into sangyg values(4,2,'일반관','y',70);
insert into sangyg values(5,2,'일반관','y',60);

insert into sangyg values(1,3,'일반관','y',100);
insert into sangyg values(2,3,'일반관','y',90);
insert into sangyg values(3,3,'일반관','y',80);
insert into sangyg values(4,3,'일반관','y',70);
insert into sangyg values(5,3,'일반관','y',60);

insert into sangyg values(1,4,'일반관','y',100);
insert into sangyg values(2,4,'일반관','y',90);
insert into sangyg values(3,4,'일반관','y',80);
insert into sangyg values(4,4,'일반관','y',70);
insert into sangyg values(5,4,'일반관','y',60);

insert into sangyg values(1,5,'일반관','y',100);
insert into sangyg values(2,5,'일반관','y',90);
insert into sangyg values(3,5,'일반관','y',80);
insert into sangyg values(4,5,'일반관','y',70);
insert into sangyg values(5,5,'일반관','y',60);

--경기
insert into sangyg values(1,6,'일반관','y',100);
insert into sangyg values(2,6,'일반관','y',90);
insert into sangyg values(3,6,'일반관','y',80);
insert into sangyg values(4,6,'일반관','y',70);

insert into sangyg values(1,7,'일반관','y',100);
insert into sangyg values(2,7,'일반관','y',90);
insert into sangyg values(3,7,'일반관','y',80);
insert into sangyg values(4,7,'일반관','y',70);

insert into sangyg values(1,8,'일반관','y',100);
insert into sangyg values(2,8,'일반관','y',90);
insert into sangyg values(3,8,'일반관','y',80);
insert into sangyg values(4,8,'일반관','y',70);

insert into sangyg values(1,9,'일반관','y',100);
insert into sangyg values(2,9,'일반관','y',90);
insert into sangyg values(3,9,'일반관','y',80);
insert into sangyg values(4,9,'일반관','y',70);

insert into sangyg values(1,10,'일반관','y',100);
insert into sangyg values(2,10,'일반관','y',90);
insert into sangyg values(3,10,'일반관','y',80);
insert into sangyg values(4,10,'일반관','y',70);

--인천	
insert into sangyg values(1,11,'일반관','y',100);
insert into sangyg values(2,11,'일반관','y',90);
insert into sangyg values(3,11,'일반관','y',80);

insert into sangyg values(1,12,'일반관','y',100);
insert into sangyg values(2,12,'일반관','y',90);
insert into sangyg values(3,12,'일반관','y',80);

insert into sangyg values(1,13,'일반관','y',100);
insert into sangyg values(2,13,'일반관','y',90);
insert into sangyg values(3,13,'일반관','y',80);

insert into sangyg values(1,14,'일반관','y',100);
insert into sangyg values(2,14,'일반관','y',90);
insert into sangyg values(3,14,'일반관','y',80);

insert into sangyg values(1,15,'일반관','y',100);
insert into sangyg values(2,15,'일반관','y',90);
insert into sangyg values(3,15,'일반관','y',80);
--대전/충청
insert into sangyg values(1,16,'일반관','y',100);
insert into sangyg values(2,16,'일반관','y',90);	

insert into sangyg values(1,17,'일반관','y',100);
insert into sangyg values(2,17,'일반관','y',90);	

insert into sangyg values(1,18,'일반관','y',100);
insert into sangyg values(2,18,'일반관','y',90);	

insert into sangyg values(1,19,'일반관','y',100);
insert into sangyg values(2,19,'일반관','y',90);

insert into sangyg values(1,20,'일반관','y',100);
insert into sangyg values(2,20,'일반관','y',90);	

--대구
insert into sangyg values(1,21,'일반관','y',100);
insert into sangyg values(2,21,'일반관','y',90);	

insert into sangyg values(1,22,'일반관','y',100);
insert into sangyg values(2,22,'일반관','y',90);	

insert into sangyg values(1,23,'일반관','y',100);
insert into sangyg values(2,23,'일반관','y',90);	

insert into sangyg values(1,24,'일반관','y',100);
insert into sangyg values(2,24,'일반관','y',90);

insert into sangyg values(1,25,'일반관','y',100);
insert into sangyg values(2,25,'일반관','y',90);	

--movie insert     
insert into movie(movie_id, movie_title, movie_time, movie_Date, movie_endDate,  movie_foreman, movie_actor, movie_genre, movie_rating,movie_isshow) 
    values(movie_seq.nextval,'고질라vs킹콩',120,sysdate ,sysdate, '애덤윈가드','알렉산더스카스가드','액션','12세','y');
insert into movie(movie_id, movie_title, movie_time, movie_Date, movie_endDate,  movie_foreman, movie_actor, movie_genre, movie_rating,movie_isshow) 
    values(movie_seq.nextval,'모탈 컴뱃',110,TO_DATE('2021-04-02','YYYY-MM-DD') ,TO_DATE('2021-04-30','YYYY-MM-DD'), '사이먼 맥쿼이드','루이스 탄, 조 타슬림','액션','성인','y');
insert into movie(movie_id, movie_title, movie_time, movie_Date, movie_endDate,  movie_foreman, movie_actor, movie_genre, movie_rating,movie_isshow) 
    values(movie_seq.nextval,'자산어보',126,TO_DATE('2021-04-05','YYYY-MM-DD') ,TO_DATE('2021-04-30','YYYY-MM-DD'), '이준익','설경구, 변요한','시대극','12세','y');
insert into movie(movie_id, movie_title, movie_time, movie_Date, movie_endDate,  movie_foreman, movie_actor, movie_genre, movie_rating,movie_isshow) 
    values(movie_seq.nextval,'노바디',92,TO_DATE('2021-04-08','YYYY-MM-DD') ,TO_DATE('2021-04-30','YYYY-MM-DD'), '일리야 나이슐러','밥 오덴커크','액션','15세','y');
insert into movie(movie_id, movie_title, movie_time, movie_Date, movie_endDate,  movie_foreman, movie_actor, movie_genre, movie_rating,movie_isshow) 
    values(movie_seq.nextval,'더 파더',97,TO_DATE('2021-04-11','YYYY-MM-DD') ,TO_DATE('2021-04-30','YYYY-MM-DD'), '플로리안 젤러','안소니 홉킨스','드라마','12세','y');
    

--movieInfo insert      
insert into movieInfo(movie_id, movieInfo_mainInfo, movieInfo_image, movieInfo_isshow, movieInfo_review,  movieInfo_grade) 
    values(1,'거대 몬스터들의 습격을 받은 지 3년 후, 콩은 스컬 아일랜드를 떠나 인간들의 보호관찰을 받고 있다. 한편, 인간들에게 등을 돌린 고질라는 비밀연구회사인 에이펙스에 존재하는 알 수 없는 힘에 이끌려 그곳을 쑥대밭으로 만든다. 위기 상황 속, 지구 안의 또 다른 지구인 할로우 어스의 에너지원을 찾아야만 인류가 안전할 수 있다는 판단하고 콩의 보호자들은 콩과 특별한 유대감을 형성하는 아이 지아와 함께 타이탄들의 고향일지 모르는 그 곳으로 위험한 여정을 떠난다. 그러던 중 분노에 찬 고질라의 공격을 받고, 마침내 맞붙게 된 두 전설의 장대한 대결은 앞으로 닥쳐올 대재앙의 서막에 불가했는데…
세상의 운명을 놓고, 지구상 가장 거대한 신화적 존재들의 스펙터클한 대격돌이 시작된다!','0','y','영상미가 대박이에요!',5);    
insert into movieInfo(movie_id, movieInfo_mainInfo, movieInfo_image, movieInfo_isshow, movieInfo_review,  movieInfo_grade) 
    values(2,'R등급 액션의 신화, 피니시!
어스렐름과 아웃월드의 최강 챔피언들이 지구의 운명을 걸고 벌이는 서바이벌 대혈전 모탈 컴뱃.
MMA 격투 선수 콜 영은 대전을 앞두고 선택 받은 전사들을 사전에 제거하려는 서브제로의 공격을 받는다. 지구와 가족을 보호하고 자기 혈통의 비밀을 알아내기 위해 모탈 컴뱃 토너먼트에 참가해 죽음의 전투를 치러야 한다!','0','y','그저 그래요',2); 
insert into movieInfo(movie_id, movieInfo_mainInfo, movieInfo_image, movieInfo_isshow, movieInfo_review,  movieInfo_grade) 
    values(3,'“이 양반은 대역 죄인이니 너무 잘해줄 생각들 말어”
순조 1년, 신유박해로 세상의 끝 흑산도로 유배된 ‘정약전’.
호기심 많은 정약전은 그 곳에서 바다 생물에 매료되어 책을 쓰기로 한다.
이에 바다를 훤히 알고 있는 청년 어부 ‘창대’에게 도움을 구하지만
‘창대’는 죄인을 도울 수 없다며 단칼에 거절한다.
“내가 아는 지식과 너의 물고기 지식을 바꾸자"
‘창대’가 혼자 글 공부를 하며 어려움을 겪고 있다는 것을 알게 된 ‘정약전’은
서로의 지식을 거래하자고 제안하고
거래라는 말에 ‘창대’는 못 이기는 척 받아들인다.
둘은 티격태격하면서도 점차 서로의 스승이자 벗이 되어 간다.
"너공부해서 출세하고 싶지?"
','0','y','잔잔하게 보기 좋아요',4); 
insert into movieInfo(movie_id, movieInfo_mainInfo, movieInfo_image, movieInfo_isshow, movieInfo_review,  movieInfo_grade) 
    values(4,'비범한 과거를 숨긴 채 남들과 다를 바 없는 평범한 일상을 사는 한 가정의 가장 ‘허치’
매일 출근을 하고, 분리수거를 하고 일과 가정 모두 나름 최선을 다하지만
아들한테는 무시당하고 아내와의 관계도 소원하다.
그러던 어느 날, 집안에 강도가 들고 허치는 한 번의 반항도 하지 못하고 당한다.
더 큰 위험으로부터 가족을 지키기 위한 선택이었는데 모두 무능력하다고 ‘허치’를 비난하고,
결국 그동안 참고 억눌렀던 분노가 폭발하고 만다.','0','y','액션만 좋네요',3); 
insert into movieInfo(movie_id, movieInfo_mainInfo, movieInfo_image, movieInfo_isshow, movieInfo_review,  movieInfo_grade) 
    values(5,'나는 런던에서 평화롭게 삶을 보내고 있었다.
무료한 일상 속 나를 찾아오는 건 딸 ‘앤’ 뿐이다.

그런데 앤이 갑작스럽게 런던을 떠난다고 말한다.
그 순간부터 앤이 내 딸이 아닌 것처럼 느껴졌다.
잠깐, 앤이 내 딸이 맞기는 한 걸까?

기억이 뒤섞여 갈수록 지금 이 현실과 사랑하는 딸,
그리고 나 자신까지 모든 것이 점점 더 의심스러워진다.','0','y','믿고보는 배우들!',5); 














---시간
insert into times values(1,1,times_seq.nextval,(select sangyg_seats from sangyg where sangyg_id = 1  and  theater_id= 1) ,TO_DATE('202104141430','YYYYMMDDHH24MI'),'y',1);

select * from times;


CREATE OR REPLACE VIEW ticket_view
as 
select mo.movie_id,mo.movie_title,mi.movieInfo_image,
th.theater_id,th.theater_name,th.theater_location,sa.sangyg_name,
sa.sangyg_seats,ti.times_seat,ti.times_time
from times ti,sangyg sa,theater th,movieInfo mi,movie mo
where mo.movie_id=mi.movie_id and mo.movie_id=ti.movie_id 
and ti.theater_id=th.theater_id and ti.theater_id=sa.theater_id ;

select movie_title from movie ;
commit;



