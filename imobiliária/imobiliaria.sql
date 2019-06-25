create database imobiliaria;

use imobiliaria;

create table imovel(
inscricao int primary key not null,
preco_venda float not null,
area_total float not null,
area_construida float not null
);

create table proprietario(
cpf varchar(11) not null primary key,
nome varchar(30) not null,
estado_civil varchar(15) not null,
inscricao_imovel int,
FOREIGN KEY (inscricao_imovel) REFERENCES imovel(inscricao)
);


create table comprador(
cpf varchar(11) not null primary key,
nome varchar(30) not null,
profissao varchar(25) not null
);

create table corretor(
creci int(5) not null primary key,
nome varchar(30) not null,
admissao date not null,
cpf_proprietario varchar(11) not null,
foreign key (cpf_proprietario) references proprietario(cpf)
);

create table venda(
data_venda date not null,
preco_venda float not null,
comissao float,
cpf_comprador varchar(11) not null,
creci_corretor int(8) not null,
inscricao_imovel int not null,
foreign key (cpf_comprador) references comprador(cpf),
foreign key (creci_corretor) references corretor(creci),
foreign key (inscricao_imovel) references imovel(inscricao)
);

-- inserir dados de imovel
insert into imovel values(11111,140000,39,36);
insert into imovel values(22222,200000,45,40);
insert into imovel values(33333,360000,50,50);
insert into imovel values(44444,100000,30,29);
insert into imovel values(55555,500000,40,40);

select * from imovel;

-- inserir dados do proprietario
insert into proprietario values(02021039080,"lucas brizola","solteiro",11111);
insert into proprietario values(33394029070,"neiva brizola","divorciada",22222);
insert into proprietario values(33345526010,"neli brizola","solteira",33333);
insert into proprietario values(22234415009,"matheus brizola","casado",44444);
insert into proprietario values(11123304998,"protazio brizola","divorciado",55555);

select * from proprietario;

-- inserir dados do comprador
insert into comprador values(02131038015,"aliz santos", "professora");
insert into comprador values(03004005020,"karolina souza", "desenvolvedora");
insert into comprador values(34567890140,"lucielee souza", "nutricionista");
insert into comprador values(06566677761,"augusto moreira", "advogado");
insert into comprador values(04005006067,"luis paim", "atleta");

select * from comprador;

-- inserir dados do corretor
insert into corretor values(54560, "leticia maria", 20171210, 33394029070);
insert into corretor values(45500, "sandy alvor", 20171010, 02021039080);
insert into corretor values(65432, "vivi martins", 20150505, 33345526010);
insert into corretor values(54321, "vanessa limana", 20180201, 22234415009);
insert into corretor values(12345, "fernanda limana", 20180201, 11123304998);

select * from corretor;

-- inserir dados da venda
insert into venda values(20190525,"500000",null,02131038015,12345,55555);
insert into venda values(20180710,"140000",null,2021039080,45500,11111);
insert into venda values(20181212,"100000",null,34567890140,54321,44444);
insert into venda values(20190525,"200000",null,06566677761,54560,22222);
insert into venda values(20190525,"360000",null,04005006067,65432,33333);

update venda set comissao = preco_venda * 0.1;

select * from venda;

-- checar as foreign keys

SELECT * FROM corretor LEFT JOIN proprietario ON corretor.cpf_proprietario = proprietario.cpf;

select * from proprietario left join imovel on proprietario.inscricao_imovel = imovel.inscricao;