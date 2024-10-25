create database EF1;

USE EF1;


create table if not exists participantes(
part_num_inscricao int,
part_cpf varchar(20),
primary key (part_num_inscricao, part_cpf),
part_nome varchar(100) not null,
part_nasc date not null,
part_empresa varchar(100)
);

alter table participantes add email varchar(20);
alter table participantes drop column email;

create table if not exists locais(
loc_id int primary key,
loc_nome varchar(100) not null,
loc_log varchar(100) not null,
loc_numlog int,
loc_bairro varchar(100) not null,
loc_cidade varchar(100) not null,
loc_uf char(2) not null,
loc_cep varchar (20) not null,
loc_capacidade int not null
);

create table if not exists eventos(
even_id int primary key,
even_nome varchar(100) not null,
even_data date not null,
even_entidade varchar(100) not null,
even_local int,
constraint fk_eventos_locais foreign key (even_local) references locais(loc_id)
);

create table if not exists atividades(
ativ_id int primary key not null,
ativ_nome varchar(100) not null,
ativ_data date not null,
ativ_hora time not null,
ativ_evento int,
constraint fk_atividades_eventos foreign key (ativ_evento) references eventos(even_id)
);

create table if not exists participante_evento(
prvn_inscricao int not null,
prvn_cpf varchar(20) not null,
prvn_evento int not null,
primary key (prvn_inscricao, prvn_cpf, prvn_evento),
constraint prvn_pkfk_part_insc_cpf foreign key (prvn_inscricao, prvn_cpf) references participantes(part_num_inscricao, part_cpf),
constraint prvn_pkfk_part_evento foreign key (prvn_evento) references eventos(even_id)
);

create table if not exists participantes_atividades(
prtv_inscricao int not null,
prtv_cpf varchar(20) not null,
prtv_ativ int not null,
primary key (prtv_inscricao, prtv_cpf, prtv_ativ),
constraint prtv_pkfk_part_insc_cpf foreign key (prtv_inscricao, prtv_cpf) references participantes(part_num_inscricao, part_cpf),
constraint prtv_pkfk_ativ_ativ foreign key (prtv_ativ) references atividades(ativ_id)
);
