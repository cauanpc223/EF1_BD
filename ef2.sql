create database ef2;
use ef2;
 
create table if not exists grupos(
id_grupo int primary key,
nome_grupo varchar(100) not null,
descricao_grupo text not null);
 
create table if not exists usuarios(
id_usuario int primary key,
nome_usuario varchar(100) not null,
sobrenome varchar(100) not null,
email varchar(20) not null
);
 
create table if not exists postagens(
id_post int primary key,
texto_post text,
imagem_post blob,
data_hora datetime not null,
usuario int not null,
constraint fk_usuario foreign key (usuario) references usuarios(id_usuario)
);
 
create table if not exists comentarios(
id_comentario int primary key,
texto text not null,
datahora datetime not null,
usuario int not null,
post int not null,
constraint fk_comm_usuario foreign key (usuario) references usuarios(id_usuario), 
constraint fk_comm_post foreign key (post) references postagens(id_post)
);
 
create table if not exists usuarios_grupos(
ug_usuario int,
ug_grupo int,
constraint fk_ug_usuario foreign key (ug_usuario) references usuario(id_usuario),
constraint fk_ug_grupo foreign key (ug_grupos) references grupos(id_grupo)
);
 
create table if not exists usuarios_seguidores(
us_usuario int,
us_seguidor int,
primary key(us_usuario, us_seguidor),
constraint fk_us_usuario foreign key (us_usuario) references usuarios(id_usuario), 
constraint fk_us_seguidor foreign key (us_seguidor) references usuario(id_usuario)
 );
