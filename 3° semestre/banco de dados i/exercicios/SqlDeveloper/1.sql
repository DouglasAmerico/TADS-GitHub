CREATE TABLE CAD_PRODUTO (
  CD_PRODUTO INTEGER   NOT NULL ,
  DS_PRODUTO VARCHAR(50)    ,
  VL_PRODUTO NUMBER(38,2),
  IN_SITUACAO CHAR(1)      ,
PRIMARY KEY(CD_PRODUTO));

CREATE TABLE CAD_VENDEDOR (
  CD_VENDEDOR INTEGER   NOT NULL ,
  NM_VENDEDOR VARCHAR(50)    ,
  PERC_COMISSAO NUMBER(38,2),
PRIMARY KEY(CD_VENDEDOR));

CREATE TABLE CAD_CIDADE (
  CD_CIDADE INTEGER   NOT NULL ,
  DS_CIDADE VARCHAR(50)    ,
  DS_UF CHAR(2)      ,
PRIMARY KEY(CD_CIDADE));

CREATE TABLE CAD_FORNECEDOR (
  CD_FORNECEDOR INTEGER   NOT NULL ,
  CD_CIDADE INTEGER   NOT NULL ,
  NR_CPFCNPJ VARCHAR(14)    ,
  NM_FORNECEDOR VARCHAR(50)    ,
  TP_PESSOA CHAR(1)      ,
PRIMARY KEY(CD_FORNECEDOR)  ,
  FOREIGN KEY(CD_CIDADE)
    REFERENCES CAD_CIDADE(CD_CIDADE));

CREATE TABLE CAD_CLIENTE (
  CD_CLIENTE INTEGER   NOT NULL ,
  CD_CIDADE INTEGER   NOT NULL ,
  NR_CPFCNPJ VARCHAR(14)    ,
  NM_CLIENTE VARCHAR(50)    ,
  TP_PESSOA CHAR(1)      ,
PRIMARY KEY(CD_CLIENTE)  ,
  FOREIGN KEY(CD_CIDADE)
    REFERENCES CAD_CIDADE(CD_CIDADE));

CREATE TABLE NF (
  NR_NF INTEGER   NOT NULL ,
  NR_SERIE CHAR(2)   NOT NULL ,
  NR_SEQUENCIA INTEGER   NOT NULL ,
  CD_CLIENTE INTEGER   NOT NULL ,
  CD_VENDEDOR INTEGER   NOT NULL ,
  DT_VENDA DATE      ,
PRIMARY KEY(NR_NF, NR_SERIE, NR_SEQUENCIA)    ,
  FOREIGN KEY(CD_VENDEDOR)
    REFERENCES CAD_VENDEDOR(CD_VENDEDOR),
  FOREIGN KEY(CD_CLIENTE)
    REFERENCES CAD_CLIENTE(CD_CLIENTE));

CREATE TABLE ITENS_NF (
  NR_SEQUENCIA INTEGER   NOT NULL ,
  NR_SERIE CHAR(2)   NOT NULL ,
  NR_NF INTEGER   NOT NULL ,
  CD_PRODUTO INTEGER   NOT NULL ,
  QT_PRODUTO INTEGER    ,
  VL_UNITARIO NUMBER(38,2),
PRIMARY KEY(NR_SEQUENCIA, NR_SERIE, NR_NF, CD_PRODUTO)    ,
  FOREIGN KEY(NR_NF, NR_SERIE, NR_SEQUENCIA)
    REFERENCES NF(NR_NF, NR_SERIE, NR_SEQUENCIA),
  FOREIGN KEY(CD_PRODUTO)
    REFERENCES CAD_PRODUTO(CD_PRODUTO));

CREATE TABLE FORNECEDOR_PRODUTO (
  CD_PRODUTO INTEGER   NOT NULL ,
  CD_FORNECEDOR INTEGER   NOT NULL   ,
PRIMARY KEY(CD_PRODUTO, CD_FORNECEDOR)    ,
  FOREIGN KEY(CD_FORNECEDOR)
    REFERENCES CAD_FORNECEDOR(CD_FORNECEDOR),
  FOREIGN KEY(CD_PRODUTO)
    REFERENCES CAD_PRODUTO(CD_PRODUTO));

ALTER TABLE CAD_FORNECEDOR MODIFY NR_CPFCNPJ VARCHAR(14) NOT NULL UNIQUE;
ALTER TABLE CAD_CLIENTE MODIFY NR_CPFCNPJ VARCHAR(14) NOT NULL UNIQUE;

ALTER TABLE CAD_FORNECEDOR MODIFY TP_PESSOA CHAR(1) NOT NULL CHECK (TP_PESSOA = 'F' OR TP_PESSOA = 'J');
ALTER TABLE CAD_CLIENTE MODIFY TP_PESSOA CHAR(1) NOT NULL CHECK (TP_PESSOA = 'F' OR TP_PESSOA = 'J');



Insert into CAD_CIDADE (CD_CIDADE,DS_CIDADE,DS_UF) values ('100','MARINGA','PR');
Insert into CAD_CIDADE (CD_CIDADE,DS_CIDADE,DS_UF) values ('200','LONDRINA','PR');
Insert into CAD_CIDADE (CD_CIDADE,DS_CIDADE,DS_UF) values ('300','CURITIBA','PR');
Insert into CAD_CIDADE (CD_CIDADE,DS_CIDADE,DS_UF) values ('400','SAO PAULO','SP');
Insert into CAD_CIDADE (CD_CIDADE,DS_CIDADE,DS_UF) values ('500','CAMPO MOURAO','PR');

Insert into CAD_CLIENTE (CD_CLIENTE,CD_CIDADE,NR_CPFCNPJ,NM_CLIENTE,TP_PESSOA) values ('1','100','12345678','JOSE SILVA','F');
Insert into CAD_CLIENTE (CD_CLIENTE,CD_CIDADE,NR_CPFCNPJ,NM_CLIENTE,TP_PESSOA) values ('2','200','987654321','TRANSPORTADORA PARANA','J');
Insert into CAD_CLIENTE (CD_CLIENTE,CD_CIDADE,NR_CPFCNPJ,NM_CLIENTE,TP_PESSOA) values ('3','300','123556','MERCADO BOM PRECO','J');
Insert into CAD_CLIENTE (CD_CLIENTE,CD_CIDADE,NR_CPFCNPJ,NM_CLIENTE,TP_PESSOA) values ('4','200','04857804789','AGOSTINHO CARRARA','F');
Insert into CAD_CLIENTE (CD_CLIENTE,CD_CIDADE,NR_CPFCNPJ,NM_CLIENTE,TP_PESSOA) values ('5','300','145634777','MARIA FONSECA','F');

Insert into CAD_FORNECEDOR (CD_FORNECEDOR,CD_CIDADE,NR_CPFCNPJ,NM_FORNECEDOR,TP_PESSOA) values ('1000','100','12345678911223','RENAULT','J');
Insert into CAD_FORNECEDOR (CD_FORNECEDOR,CD_CIDADE,NR_CPFCNPJ,NM_FORNECEDOR,TP_PESSOA) values ('1001','200','12345678912223','GM','J');
Insert into CAD_FORNECEDOR (CD_FORNECEDOR,CD_CIDADE,NR_CPFCNPJ,NM_FORNECEDOR,TP_PESSOA) values ('1002','300','12345678922223','FORD','J');
Insert into CAD_FORNECEDOR (CD_FORNECEDOR,CD_CIDADE,NR_CPFCNPJ,NM_FORNECEDOR,TP_PESSOA) values ('1004','200','04857804789','AGOSTINHO CARRARA','F');
Insert into CAD_FORNECEDOR (CD_FORNECEDOR,CD_CIDADE,NR_CPFCNPJ,NM_FORNECEDOR,TP_PESSOA) values ('1003','300','14789654112004','FIAT','J');

Insert into CAD_PRODUTO (CD_PRODUTO,DS_PRODUTO,VL_PRODUTO,IN_SITUACAO) values ('1','FUSION','110000','A');
Insert into CAD_PRODUTO (CD_PRODUTO,DS_PRODUTO,VL_PRODUTO,IN_SITUACAO) values ('2','CLIO','53000','A');
Insert into CAD_PRODUTO (CD_PRODUTO,DS_PRODUTO,VL_PRODUTO,IN_SITUACAO) values ('3','CRUZE','80000','A');
Insert into CAD_PRODUTO (CD_PRODUTO,DS_PRODUTO,VL_PRODUTO,IN_SITUACAO) values ('4','MALIBU','120000','A');
Insert into CAD_PRODUTO (CD_PRODUTO,DS_PRODUTO,VL_PRODUTO,IN_SITUACAO) values ('5','CAMARO','240000','I');

Insert into CAD_VENDEDOR (CD_VENDEDOR,NM_VENDEDOR,PERC_COMISSAO) values ('12','JOSE LUIZ DATENA','0,03');
Insert into CAD_VENDEDOR (CD_VENDEDOR,NM_VENDEDOR,PERC_COMISSAO) values ('15','MILTON NEVES','0,04');
Insert into CAD_VENDEDOR (CD_VENDEDOR,NM_VENDEDOR,PERC_COMISSAO) values ('11','GALVAO BUENO','0,02');

Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1000','A1','1','1','12',to_date('01/01/10','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1001','A1','2','1','12',to_date('01/11/10','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1456','A3','1','2','15',to_date('10/02/12','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1008','A2','1','3','12',to_date('15/07/11','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1009','A2','2','5','11',to_date('14/06/11','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1010','A2','3','4','15',to_date('01/03/11','DD/MM/RR'));
Insert into NF (NR_NF,NR_SERIE,NR_SEQUENCIA,CD_CLIENTE,CD_VENDEDOR,DT_VENDA) values ('1007','A1','3','5','12',to_date('01/08/12','DD/MM/RR'));

Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('1','A1','1000','1','2','110000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('2','A1','1001','2','1','53000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('1','A3','1456','3','4','80000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('1','A2','1008','4','1','120000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('2','A2','1009','5','1','240000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('3','A2','1010','1','1','110000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('3','A1','1007','2','2','53000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('1','A2','1008','3','1','80000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('2','A2','1009','1','1','120000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('3','A2','1010','4','5','240000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('3','A1','1007','3','4','110000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('1','A2','1008','5','13','53000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('2','A2','1009','2','1','80000');
Insert into ITENS_NF (NR_SEQUENCIA,NR_SERIE,NR_NF,CD_PRODUTO,QT_PRODUTO,VL_UNITARIO) values ('3','A2','1010','3','1','120000');

1. Encontre o valor mais baixo de todos os produtos.
select min(vl_produto) from cad_produto;

2. Encontre o valor mais alto de todos os produtos.
select max(vl_produto) from cad_produto;

3. Encontre o valor mais baixo, mais alto e médio de todos os produtos.
select max(vl_produto) as Maior, min(vl_produto) as Menor, avg(vl_produto) as Media from cad_produto; 

4. Apresente o valor mais alto e mais baixo de cada produto, baseando-se no preço da venda. 
select max(vl_unitario) as Maior, min(vl_unitario) as Menor from itens_nf;

5. Apresente a diferença entre o produto com o valor mais alto e mais baixo 
select (max(vl_produto) - min(vl_produto)) as diferenca from cad_produto;

6. Listar o nome de produto, valor e quantas vendas o mesmo possui.
select p.ds_produto as Produto, sum(qt_produto * i.vl_unitario) as Valor, sum(qt_produto) as venda from itens_nf i
inner join cad_produto p on (p.cd_produto = i.cd_produto)
group by p.ds_produto

7. Listar todos clientes, a cidade onde reside e quantas vendas o mesmo possui.
select cli.nm_cliente as Cliente, cid.ds_cidade as Cidade, count(nf.cd_cliente) as Vendas from nf 
right join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
inner join cad_cidade cid on (cid.cd_cidade = cli.cd_cidade)
group by cli.nm_cliente, cid.ds_cidade

8. Listar os clientes que possuem compras, a cidade onde reside e quantas vendas o mesmo possui.
select cli.nm_cliente as Cliente, cid.ds_cidade as Cidade, count(nf.cd_cliente) as Vendas from nf 
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
inner join cad_cidade cid on (cid.cd_cidade = cli.cd_cidade)
group by cli.nm_cliente, cid.ds_cidade

9. Listar todos clientes, quantas vendas o mesmo possui e a soma de todas vendas em R$. 
select cli.nm_cliente as Cliente, count(nf.cd_cliente) as Venda, sum(ite.vl_unitario * ite.qt_produto) as Valor from itens_nf ite
inner join nf on ( nf.nr_nf = ite.nr_nf)
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
group by cli.nm_cliente

10. Apresentar Nº, Série, data, nome do vendedor e nome do cliente de todas as Notas Fiscais.
select nf.nr_nf as Numero, nf.nr_serie as Serie, nf.dt_venda as Data, ven.nm_vendedor as vendedor, cli.nm_cliente as Cliente from nf
inner join cad_vendedor ven on (ven.cd_vendedor = nf.cd_vendedor)
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
group by nf.nr_nf, nf.nr_serie, nf.dt_venda, ven.nm_vendedor, cli.nm_cliente

11. Apresentar Nº, Série, data, nome do vendedor, nome do cliente, quantidade de produtos e total da nota em R$ de todas as Notas Fiscais
select nf.nr_nf as Numero, nf.nr_serie as Serie, nf.dt_venda as Data, ven.nm_vendedor as vendedor, cli.nm_cliente as Cliente, 
ite.qt_produto as Quantidade, sum(ite.qt_produto * vl_unitario) as RS from nf
inner join cad_vendedor ven on (ven.cd_vendedor = nf.cd_vendedor)
inner join cad_cliente cli on (cli.cd_cliente = nf.cd_cliente)
inner join itens_nf ite on (ite.nr_nf = nf.nr_nf)
group by nf.nr_nf, nf.nr_serie, nf.dt_venda, ven.nm_vendedor, cli.nm_cliente,ite.qt_produto

12. Listar todos vendedores, percentual de comissão e quantas vendas o mesmo possui.
select ven.nm_vendedor as Vendedor, ven.perc_comissao as Percentual, sum(nf.cd_vendedor) as Venda from cad_vendedor ven
inner join nf on (ven.cd_vendedor = nf.cd_vendedor)
group by ven.nm_vendedor, ven.perc_comissao

13. Listar o nome do produto, quantidade de vendas e total em R$ .
select p.ds_produto as Produto, ite.qt_produto as Quantidade, sum(ite.qt_produto * p.vl_produto) as RS from cad_produto p
inner join itens_nf ite on (p.cd_produto = ite.cd_produto)
group by p.ds_produto, ite.qt_produto

14. Listar o nome do vendedor, total em R$ de suas vendas e o percentual de comissão a receber.
select ven.nm_vendedor as Vendedor, sum(ite.qt_produto * ite.vl_unitario) as RS, sum(perc_comissao) as Comissao 
from cad_vendedor ven
inner join nf on (nf.cd_vendedor = ven.cd_vendedor)
inner join itens_nf ite on (ite.nr_nf = nf.nr_nf)
group by ven.nm_vendedor

recolocar ? dentro do outro sum
 * sum(nf.cd_vendedor)
