show databases;

use kbd;

show tables;

select * from users;
select * from boards;
select * from grade;


-- 1. son이 이용한 킥보드의 차번호, 등급, 할인율을 검색하기.
select b.boardNo, g.grade, g.discount as 할인율
from grade g, boards b 
where g.gradeNo = (
			select gradeNo
			from boards
			where boardNo = (
						select boardNo 
						from users
						where user_name = 'son'
		)
)and b.gradeNo = g.gradeNo;


-- 2. 요금이 1만원 이상 나온 사람들의 모든 차량정보를 차량번호 오름차순으로 정렬하기.
select b.*, u.charged 
from boards b, users u
where b.boardNo in (
		select boardNo
		from users
		where charged >= 10000
)
and u.boardNo = b.boardNo 
order by b.boardNo asc;


-- 3. 할인율이 가장 높은 차량을 탄 사람 이름을 검색하기.
select user_name
from users
where boardNo = (
		select boardNo 
		from boards
		where gradeNo = (
				select gradeNo
				from grade
				where discount = (
						select max(discount) 
						from grade
				)
		)
);


-- 4. kane이 지금 탑승종료했을때 나오는 요금을 구하기.
select charge * abs(cast((timediff(now(), b.time_on))/10000 as decimal(65,2))) as '현재 요금'
from grade g ,boards b 
where g.gradeNo = (
		select gradeNo 
		from boards
		where boardNo = (
				select boardNo
				from users
				where user_name = 'kane'
		)
)and g.gradeNo = b.gradeNo;

