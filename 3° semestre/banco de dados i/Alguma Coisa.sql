5/
select nf.nr_nf as Nota, nf.nr_serie as Serie, nf.dt_venda as Data,cli.nm_cliente as Cliente ,ven.nm_vendedor as Vendedor from cad_vendedor ven
inner join nf on (ven.cd_vendedor = nf.cd_vendedor)
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
where nf.nr_nf = (select min(nr_nf) from nf)
group by nf.nr_nf,nf.nr_serie,nf.dt_venda,cli.nm_cliente,ven.nm_vendedor
order by nf.nr_nf asc
---------------------------------------------------
6/
select nf.nr_nf as Nota, nf.nr_serie as Serie, nf.dt_venda as Data,cli.nm_cliente as Cliente ,ven.nm_vendedor as Vendedor from cad_vendedor ven
inner join nf on (ven.cd_vendedor = nf.cd_vendedor)
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
where nf.nr_nf = (select max(nr_nf) from nf)
group by nf.nr_nf,nf.nr_serie,nf.dt_venda,cli.nm_cliente,ven.nm_vendedor
order by nf.nr_nf asc
---------------------------------------------------
7/
select ds_cidade as Cidade from cad_cidade
where

select max(count(cli.cd_cidade)) as Quantidade from cad_cliente cli
group by cli.cd_cidade

----------------------------------------------------
8/
select pro.ds_produto as Produto, ite.vl_unitario as Valor from itens_nf ite
inner join cad_produto pro on (pro.cd_produto = ite.cd_produto)
where (ite.qt_produto*ite.vl_unitario) = (select max(qt_produto*vl_unitario) from itens_nf)
group by pro.ds_produto,ite.vl_unitario

----------------------------------------------------
9/
select * from itens_nf

select max(count(cd_produto)),(select cd_produto from itens_nf) from itens_nf
group by cd_produto

order by cd_produto


select max(count(cd_produto)) from itens_nf
group by cd_produto
----------------------------------------------------


