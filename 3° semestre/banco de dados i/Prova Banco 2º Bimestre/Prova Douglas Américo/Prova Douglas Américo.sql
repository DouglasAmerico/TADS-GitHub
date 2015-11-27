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
  
alter table aluno add nr_telefone varchar(10);

Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('1','PARANA','2,5');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('2','SAO PAULO','2');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('3','RIO DE JANEIRO','2,3');
Insert into PROVA.UF (ID_UF,NM_UF,VL_ALIQ) values ('4','MINAS GERAIS','2,4');
 
