create table uf(
  id_uf integer not null primary key,
  nm_uf varchar(60),
  vl_aliq numeric(2,1));
  
create table cidade(
  id_cidade integer not null primary key,
  id_uf integer references uf,
  nm_cidade varchar(60));
  
create table curso(
  id_curso integer not null primary key,
  nm_curso varchar(60),
  vl_carga_horaria integer,
  in_situacao char(1),
  vl_mensalidade numeric(7,2));
  
create table aluno(
  id_aluno integer not null primary key,
  id_cidade integer references cidade,
  id_curso integer references curso,
  nm_aluno varchar(100),
  nr_matricula integer,
  dt_nascimeto date,
  in_situacao char(1),
  in_sexo char(11),
  cpf char(11));
  
create table nota (
  id_aluno integer not null,
  vl_nota  numeric(2,1),
  dt_publicacao date,
  nr_sequencia integer,
  nr_ano integer,
  foreign key (id_aluno) references aluno,
  primary key (id_aluno));

Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('1','PARANA','2,5');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('2','SAO PAULO','2');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('3','RIO DE JANEIRO','2,3');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('4','MINAS GERAIS','2,4');
 
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('1','2','PRESIDENTE PRUDENTE');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('2','1','CURITIBA');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('3','3','NITEROI');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('4','1','LONDRINA');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('5','2','OSASCO');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('6','3','RIO DE JANEIRO');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('7','3','TERESOPOLIS');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('8','4','UBERLANDIA');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('9','2','SAO PAULO');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('10','2','SANTOS');
Insert into PROVA.CIDADE (ID_CIDADE,ID_UF,NM_CIDADE) values ('11','2','CAMPINAS');

Insert into PROVA.CURSO (ID_CURSO,NM_CURSO,VL_CARGA_HORARIA,IN_SITUACAO,VL_MENSALIDADE) values ('1','MEDICINA VETERINARIA','12000','A','1850');
Insert into PROVA.CURSO (ID_CURSO,NM_CURSO,VL_CARGA_HORARIA,IN_SITUACAO,VL_MENSALIDADE) values ('2','ENGENHARIA CIVIL','5000','A','900');
Insert into PROVA.CURSO (ID_CURSO,NM_CURSO,VL_CARGA_HORARIA,IN_SITUACAO,VL_MENSALIDADE) values ('3','ADMINISTRACAO','4500','A','500');

Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1000','1','1','JOSE DA SILVA SAURO',null,to_date('01/01/85','DD/MM/RR'),'A','M','15354214588');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1001','2','3','MARIA DAS GRACAS',null,to_date('31/12/89','DD/MM/RR'),'A','F','05789621540');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1002','3','3','FELIPE SANTOS',null,to_date('04/08/86','DD/MM/RR'),'A','M','01478514788');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1003','4','1','JOSEMAR FERREIRA',null,to_date('11/04/92','DD/MM/RR'),'A','M','55471238695');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1004','5','2','JESSICA SOUZA',null,to_date('10/07/87','DD/MM/RR'),'A','F','14578954122');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1005','6','3','HUGO MOREIRA',null,to_date('23/08/89','DD/MM/RR'),'A','M','14253698745');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1006','7','1','MARCELINO FERRAZ',null,to_date('10/10/90','DD/MM/RR'),'A','M','15147715899');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1007','8','2','FABIANA GONCALVES',null,to_date('07/06/97','DD/MM/RR'),'A','F','12566533500');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1008','1','3','CARLOS DIAS PONTES',null,to_date('08/01/88','DD/MM/RR'),'A','M','12354126600');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1009','2','1','DEBORA DA SILVA',null,to_date('15/11/89','DD/MM/RR'),'A','F','04578898844');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1010','3','2','JULIANA PIMENTEL',null,to_date('17/03/92','DD/MM/RR'),'A','F','00475558889');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1011','4','3','ISABELA OLIVEIRA',null,to_date('23/02/91','DD/MM/RR'),'A','F','04477444777');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1012','5','1','JAQUELINE GOMES',null,to_date('05/06/87','DD/MM/RR'),'A','F','75325285400');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1013','6','2','ALINE BUENO',null,to_date('09/09/88','DD/MM/RR'),'A','F','42255885633');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1014','7','3','MARCIA REZENDE',null,to_date('05/04/84','DD/MM/RR'),'A','F','57585452875');
Insert into PROVA.ALUNO (ID_ALUNO,ID_CIDADE,ID_CURSO,NM_ALUNO,NR_MATRICULA,DT_NASCIMETO,IN_SITUACAO,IN_SEXO,CPF) values ('1015','8','1','PEDRO PAULO DINIZ',null,to_date('23/02/78','DD/MM/RR'),'A','M','45287252527');

Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1000','7,5',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1001','6,9',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1002','7,1',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1003','8,5',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1004','9',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1005','7,3',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1006','8,8',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1007','6,5',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1008','7,8',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1009','3,4',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1010','1,5',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1011','9,1',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1012','8,6',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1013','7,5',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1014','4,6',null,null,'2011');
Insert into PROVA.NOTA (ID_ALUNO,VL_NOTA,DT_PUBLICACAO,NR_SEQUENCIA,NR_ANO) values ('1015','7,8',null,null,'2011');

2 -
 alter table aluno add nr_telefone varchar(10);
 
3- 
update aluno set nr_telefone = '111111111'  where (in_sexo = 'F');
update aluno set nr_telefone = '222222222'  where (in_sexo = 'M');
4- 

  insert into cidade (id_cidade,id_uf,nm_cidade) values (12,1,'Araraquaras');
  insert into cidade (id_cidade,id_uf,nm_cidade) values (13,1,'Paris');
  insert into cidade (id_cidade,id_uf,nm_cidade) values (14,3,'Uberlandia');
  insert into cidade (id_cidade,id_uf,nm_cidade) values (15,1,'Lisboa');
  insert into cidade (id_cidade,id_uf,nm_cidade) values (16,2,'Jeniopolis');
  
5- 
  select uf.nm_uf as Estado, cidade.nm_cidade as Cidade, aluno.nm_aluno as Aluno from aluno
  right join cidade on (cidade.id_cidade = aluno.id_cidade)
  inner join uf on (uf.id_uf = cidade.id_uf)
  order by aluno.nm_aluno asc

6-  
select a.id_aluno as Id, a.nm_aluno as Aluno, a.in_sexo as Sexo, avg(nota.vl_nota) as Media from aluno a
inner join nota on (nota.id_aluno = a.id_aluno)
group by a.id_aluno,a.nm_aluno,a.in_sexo
having avg(nota.vl_nota) > (select avg(vl_nota) from nota)
order by a.id_aluno asc

7-
resposta certa @@
  select uf.nm_uf as Cidade, count(aluno.id_aluno) as Quantidade from cidade
  inner join uf on (uf.id_uf = cidade.id_uf)
  inner join aluno on (aluno.id_cidade = cidade.id_cidade)
  group by uf.nm_uf 
  having count(aluno.id_aluno) = (
                      select 
                      max(count(aluno.id_aluno)) as quantidade from cidade
                      inner join uf on (uf.id_uf = cidade.id_uf)
                      inner join aluno on (aluno.id_cidade = cidade.id_cidade)
                      group by uf.nm_uf)
  
  
8-
a resposta certa @@
      select 
      cidade.nm_cidade, 
      count(aluno.id_aluno) as quantidade, 
      sum(curso.vl_mensalidade * 12) as Valor_Anual, 
      sum((curso.vl_mensalidade * 12) * uf.vl_aliq/100) as Imposto 
      from cidade
      inner join uf on (uf.id_uf = cidade.id_uf)
      left join aluno on (aluno.id_cidade = cidade.id_cidade)
      left join curso on (curso.id_curso = aluno.id_curso)
      group by cidade.nm_cidade
           
      
