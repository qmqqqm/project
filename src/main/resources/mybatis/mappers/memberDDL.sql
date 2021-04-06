
DROP TABLE member;

CREATE TABLE member(
 mno			number			constraint member_mno_pk	primary key,
 id				varchar2(20),
 pwd			varchar2(20), 
 name			varchar2(60), 
 email		varchar2(100),
 joinDate	Date 				default SYSDATE,	/*가입일*/
 isShow		char(1) 		default 'Y'  	
					constraint 	member_isShow_ck
					check(isShow in('Y','N'))			/*노출여부*/
);

DROP SEQUENCE seq_mno;

CREATE  SEQUENCE seq_mno;


insert into member(mno, id, pwd, name, email, joinDate, isShow)
		 values(seq_mno.nextval, 'hongid', '1234', '홍GD', 'hongid@test.com', SYSDATE, 'Y');
insert into member(mno, id, pwd, name, email, joinDate, isShow)
		 values(seq_mno.nextval, 'leeid', '1234', '이sh', 'leeid@test.com', SYSDATE, 'Y');
insert into member(mno, id, pwd, name, email, joinDate, isShow)
		 values(seq_mno.nextval, 'kimid', '1234', '김9', 'kimid@test.com', SYSDATE, 'Y');
insert into member(mno, id, pwd, name, email, joinDate, isShow)
		 values(seq_mno.nextval, 'jangid', '1234', '장영실', 'jangid@test.com', SYSDATE, 'Y');
insert into member(mno, id, pwd, name, email, joinDate, isShow)
		 values(seq_mno.nextval, 'anid', '1234', '안중근', 'anid@test.com', SYSDATE, 'Y');
		 
commit;

SELECT * FROM member;