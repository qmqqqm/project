-- 개인회원정보 조회
SELECT 	mno,id,pwd,name,email,joindate,isshow 
FROM 		MEMBER
WHERE		isshow = 'Y'
				AND mno=50 AND  id = 'leeid';
				

-- 회원수조회
-- count(*) : null포함한 수
-- count(컬럼명) : null아닌 수
SELECT COUNT(*) as cnt
FROM   MEMBER	
WHERE	 isshow = 'Y';

-- 회원목록조회
SELECT 	mno,id,pwd,name,email,joindate,isshow 
FROM 		MEMBER
WHERE		isshow = 'Y';

-- 회원상세조회
SELECT 	id,pwd,name,email,joindate,isshow 
FROM 		MEMBER
WHERE		joindate<SYSDATE    id='hongid';

-- 회원가입
insert into member(mno, id, pwd, name, email, joinDate, isShow)
values(seq_mno.nextval, id?, pwd?, name?, email?, SYSDATE, 'Y');

-- 회원정보수정
UPDATE 	MEMBER
SET			pwd  = pwd?,
				email= email?
WHERE		id	 = id?;

-- 회원삭제
UPDATE 	MEMBER
SET			isshow = 'N'
WHERE		id	   = id?;










