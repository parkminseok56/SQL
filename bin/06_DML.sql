-- 06_DML.sql

-- DML  (Data Management Language) 데이터 조작 언어

-- 테이블에 레코드를 조작(추가, 수정, 삭제, 조회)하기 위한 명령어들
-- INSERT (추가)
-- UPDATE(수정)
-- DELETE(삭제)
-- SELECT(조회 및 선택)


--[1] 샘플 테이블 생성
drop table exam01 purge;

create table exam01(
deptno  number(2),   -- 부서번호
dname  varchar2(14),  -- 부서명
loc  varchar2(14)   -- 위치
);


--[2] 레코드 추가
-- 레코드 추가 명령 사용1
-- insert into 테이블이름( 필드명1, 필드명2, ....) values(값1, 값2, ...)
-- 값은 문자('123')와 숫자(123)를 구분하여 입력합니다

-- 레코드 추가 명령 사용2
--insert into 테이블 이름 values (전체 column(필드, 열)에  넣을 값들);

-- 첫번째 방식은 필드명과 입력되어야 하는 값을 1:1 로 매핑하여 입력합니다
-- 널값이 있어도 되는 필드는 필드명, 또는 기본값이 있는 필드명은 필드명과 값을 생략하고 입력가능합니다
-- 두번째 방식은 모든 필드에 해당하는 데이터를 모두 입력하는 경우로서 필드명들을 명령어 속에 
-- 나열하지 않아도 되지만, 필드의 순서데로 빠짐없이 데이터가 나열되어야 하는 불편함도 있습니다.

-- 첫번째 방식의 레코드 추가
insert into exam01(deptno, dname, loc) values(10, 'ACCOUNT', 'NEW YORK');

-- 두번째 방식의 레코드 추가
insert into exam01 values(30, 'SALES', 'CHICHAGO');

-- 두가지 방법 모두 null 값을 입력할 수 있습니다
insert into exam01(deptno, dname) values(20, 'MARKETING'); -- 첫번째방법
insert into exam01 values(40, 'OPERATION', null); -- 두번째 방법

select * from exam01;


select * from booklist;
-- 두가지 방법중 자유롭게 선택하여서, booklist 테이블에 7개의 레코드를 추가해주세요. 
-- booknum 은 시퀀스를 이용합니다
-- grade  는 'all'   '13'  '18' 세가지만 골라서 입력해주세요. grade가 없으면 입력하지 않아도 됩니다
insert into booklist(booknum, subject, makeyear, inprice, rentprice, grade )
values(book_seq.nextVal , '좀비아이',  2020, 12000, 2500, 'all');
insert into booklist values( book_seq.nextVal , '가면산장 살인사건',  2018, 13320, 1500, '13');
insert into booklist values( book_seq.nextVal , '나미야 잡화점의 기적',  2017, 13320, 2000, '18');
insert into booklist values( book_seq.nextVal , '유튜브영상편집',  2020, 20700, 2500, 'all');
insert into booklist values( book_seq.nextVal , '이것이자바다',  2017, 30000, 3000, '18');
insert into booklist values( book_seq.nextVal , 'JSP웹프로그래밍',  2016, 25000, 2500, '13');
insert into booklist values( book_seq.nextVal , '오라클데이터베이스',  2020, 30000, 3000, 'all');




-- memberlist 에 10명의 데이터를 추가해주세요.  member_seq 를 이용해주세요
select * from memberlist;
insert into memberlist( membernum, name, phone ) 
values( member_seq.nextVal  , '홍길동', '010-1111-2222');
insert into memberlist( membernum, name, phone ) 
values( member_seq.nextVal  , '홍길서', '010-3333-4444');
insert into memberlist( membernum, name, phone ) 
values( member_seq.nextVal  , '홍길남', '010-5555-6666');
insert into memberlist( membernum, name, phone ) 
values( member_seq.nextVal  , '홍길북', '010-7777-8888');
INSERT INTO memberlist
VALUES(member_seq.nextVal, '추신수', '010-5656-1234', '84/07/07', 240,   'M' , 28);
INSERT INTO memberlist
VALUES(member_seq.nextVal,  '류현진', '010-3333-1234', '83/08/08', 142, 'F' , 27 );
INSERT INTO memberlist
VALUES(member_seq.nextVal,  '손흥민', '010-4444-1234', '82/09/23', 220,  'M' ,23 );
INSERT INTO memberlist
VALUES(member_seq.nextVal,  '이청용', '010-6666-1234', '81/06/14', 440,  'F',  36);
INSERT INTO memberlist
VALUES(member_seq.nextVal, '이영표', '010-2580-1234', '82/03/16', 140,  'M',  31);
INSERT INTO memberlist
VALUES(member_seq.nextVal, '최지만', '010-7777-1234', '83/04/14', 340,  'F',  29);


select * from booklist;
select * from memberlist;
--rentlist 테이블도 rent_seq 를 이용해서 10개의 데이터를 추가해주세요
INSERT INTO rentlist VALUES('2021/10/01', rent_seq.nextVal ,  3 , 2 , 100);
INSERT INTO rentlist VALUES('2022/10/01', rent_seq.nextVal,  3 , 3 , 100);
INSERT INTO rentlist VALUES('2023/10/02', rent_seq.nextVal,  8 , 4 , 200);
INSERT INTO rentlist VALUES('2022/10/02', rent_seq.nextVal,  9 , 5 , 100);
INSERT INTO rentlist VALUES('2023/10/03', rent_seq.nextVal,  9 , 6 , 200);
INSERT INTO rentlist VALUES('2023/10/03', rent_seq.nextVal,  6 , 6 , 300);
INSERT INTO rentlist VALUES('2022/10/04', rent_seq.nextVal,  3 , 7 , 100);
INSERT INTO rentlist VALUES('2023/10/04', rent_seq.nextVal,  1 , 8 , 300);
INSERT INTO rentlist VALUES('2022/10/05', rent_seq.nextVal,  2 , 9 , 100);
INSERT INTO rentlist VALUES('2023/10/05', rent_seq.nextVal,  4 , 10 , 200);
select * from rentlist;





--[3] 데이터 변경- 수정(UPDATE)
--UPDATE 테이블명 SET 변경내용 WHERE 검색조건
-- update memberlist set age=30 where membernum=3;

-- 명령문에 WHERE 이후 구문은 생략이 가능합니다.
-- 다만 이부분을 생략하면 모든 레코드를 대상으로해서 UPDATE 명령이 실행되어 모든 레코드가 수정됩니다.
-- 검색조건 : 필드명 (비교-관계연산자) 조건값   으로 이루어진 조건연산이며, 흔히 자바에서 if() 
-- 괄호안에 사용했던 연산을 그데로 사용하는게 보통입니다.
-- 나이가 29세 이상 -> WHERE AGE>=29

-- exam01 테이블에서 dname이 'ACCOUNT' 레코드의 deptno 을 10으로 수정합니다
update exam01 set deptno=10 where dname='ACCOUNT';

-- exam01 테이블에서 deptno 이 30 인 레코드의  dname이 'OPERATION' 으로 수정
update exam01 set dname='OPERATION'  where deptno=30;
-- exam01 테이블에서 deptno 이 20 인 레코드의  dname이 'MARKETING' 으로 수정
update exam01 set dname='MARKETING'  where deptno=20
-- exam01 테이블에서 deptno이 20 인 레코드의 loc 를 'BOSTON' 으로 수정
update exam01 set deptno=20 where loc='NEW YORK';
-- exam01 테이블에서 deptno이 40 인 레코드의 loc 를 'LA' 으로 수정
update exam01 set deptno=40 where loc='LA';

select * from exam01;

-- booklist 테이블의 도서 제목 '봉제인형 살인사건' 도서의 grade 를 '18' 으로 수정
update booklist set grade='18' where subject = '봉제인형 살인사건';

select * from emp;
select * from dept;
select * from bonus;
select * from salgrade;

-- emp 테이블의 모든 사원의 sal 값을 10% 씩 인상
update emp set sal = sal * 1.1;
-- emp 테이블에서 sal 값이 3000 이상인 사원의 급여 10% 삭감
update emp set sal = sal * 1.1 where sal>=3000;
-- emp 테이블의 hiredate 가 2002년 이전인 사원의 급여를  + 2000  -> (2001-12-31 보다 작거나 같은)
update emp set sal = sal + 2000 where hiredate <= '2002-01-01';

-- emp 테이블의 ename 이 j로 시작하는 사원의 job을  manager 로 변경
update emp set job='mamager'  where ename like 'j%';
update emp set job='mamager'  where ename like '%j';
update emp set job='mamager'  where ename like '%j%';

-- memberlist 테이블에서 bpoint 가 200이 넘는 사람만 bpoint*100 으로 변경
update memberlist set bpoint = bpoint*100 where bpoint>=200;

-- rentlist 테이블에서  할인금액이 100원이 넘으면 모두 할인 금액을 90으로 변경
update rentlist set discount = 90 where discount>=100;







-- [4]레코드의 삭제
-- delete from 테이블명 where  조건식

-- rentlist 테이블에서 discount가 100이하이 레코드를 삭제	
delete  from rentlist where discount<=10;	

-- where 절이 없으면 테이블 내의 모든 레코드를 삭제합니다


-- 삭제의 제한
delete from booklist where booknum=2;
-- 2번  도서가  rentlist 에 대여목록으로 존재하므로... 
-- 만약 booklist에서 해당 도서가 삭제되면 외래키의 참조무결성 에 위배됩니다 따라서 이 삭제명령은 에러가 발생합니다
select * from booklist;
select * from rentlist;
--  integrity constraint (SCOTT.FK1) violated - child record found 

-- 해결방법 #1
-- 이를 해결하려면 우선 rentlist  테이블에 해당 도서 대여목록 레코드를 모두 삭제한 후
-- booklist 테이블에서 해당 도서를 삭제해야 합니다
-- delete from rentlist where bnum=2;
-- delete from booklist where booknum=2;


-- 해결 방법 #2
-- 외래키 제약조건을 삭제한 후 다시 생성
-- 생성시에 "옵션을 추가해서"  참조되는 값이 삭제되면 참조하는 값도 같이 삭제되게 구성합니다

-- 외래키 삭제
alter table rentlist drop constraint fk1;
-- 새로운 외래키 추가
alter table rentlist add constraint fk1 FOREIGN KEY(bnum)
REFERENCES booklist(booknum) on delete cascade;
-- on delete cascade : booklist 의 도서가 삭제되면   rentlist 의 해당 도서 대여내역도 함께 삭제하는 옵션


-- memberlist 테이블에서  회원 한명을 삭제하면, rentlist테이블에서도 해당회원이 대여한 기록을 같이 삭제하도록 
-- 외래키 설정을 바꿔주세요(외래키 제약조건 삭제 후 재생성)
alter table rentlist drop constraint fk2;

alter table rentlist add constraint fk2 FOREIGN KEY(mnum)
REFERENCES memberlist(membernum) on delete cascade;


-- 참조되는 값의 삭제가 아니라 수정은 아직 적용되지 않습니다.
-- booklist 와 memberlist  테이블의  booknum, membernum 은 수정이 아직 불가능합니다
-- 이를 해결하기 위해서  외래키 설정시  on update cascade  옵션을 추가하면 될듯하지만
-- 이는 오라클에서 허용하지 않습니다
--  mysql 에서만 사용이 가능하며,  오라클에서는 뒷단원의 트리거를 공부하면서 외래키가 수정이 되도록 하겠습니다.

-- trigger도 없고, on update casecade 명령도 없는 현재는 아래와 같이 참조하는 테이블내 해당레코드를 먼저 수정하고, 
-- 참조되는 테이블의 해당 레코드를 나중에 수정합니다
-- update rentlist set bnum=2002  where bnum=2;
-- update booklist set booknum=2002  where booknum=2;






