select * from (select job, avg(sal) as media from emp
                group by job) e
where e.media > 2000

select
    (select max(sal) from emp) as maior_salario,
    (select max(hisal) from salgrade) as teto from dual;
    
    
 select max(cd_produto) from itens_nf