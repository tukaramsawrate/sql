


select * from empf;

with d1 as(
select empno,ename,job,mgr,sal,deptno,dense_rank() over(partition by deptno order by sal desc)dr,
count(*) over(partition by deptno)cnt from empf)
select * from d1;
where dr=3 or(dr<3 and dr=cnt);

