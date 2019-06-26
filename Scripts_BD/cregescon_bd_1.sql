create database cregescon;
use cregescon;
-- TABLAS DE SEGURIDAD
create table seg_perfil(
  n_id_perfil int(6) NOT NULL auto_increment primary key,
  v_desc_corta varchar(20) not null,
  v_descripcion varchar(50) not null unique
);
create table seg_usuario(
  v_usuario varchar(20) primary key,
  v_contrasenia varchar(25) not null,
  v_nombres varchar(50) not null,
  v_ap_paterno varchar(50) not null,
  v_ap_materno varchar(50) not null
);
create table seg_usuario_perfil(
  v_usuario varchar(20) ,
  n_id_perfil int(6) NOT NULL ,
  constraint pk_usuaperf primary key (v_usuario,n_id_perfil),
  constraint fk_usua_usuaperf foreign key(v_usuario) references seg_usuario(v_usuario),
  constraint fk_perf_usuaperf foreign key(n_id_perfil) references seg_perfil(n_id_perfil)
);
create table seg_modulo(
  n_id_modulo int(6) NOT NULL auto_increment primary key,
  v_modulo varchar(45) not null unique,
  v_descripcion varchar(100) not null 
);
create table seg_perfil_modulo(
  n_id_modulo int(6) NOT NULL ,
  n_id_perfil int(6) NOT NULL ,
  constraint pk_perfmod primary key (n_id_modulo,n_id_perfil),
  constraint fk_mod_perfmod  foreign key(n_id_modulo) references seg_modulo(n_id_modulo),
  constraint fk_perf_perfmod  foreign key(n_id_perfil) references seg_perfil(n_id_perfil)
);
create table mae_parametros_sistema(
  v_parametro varchar(45) not null primary key,
  v_descripcion varchar(100) ,
  v_tipo_dato varchar(30) ,
  v_valor varchar(100) not null
);
-- VISTAS DE SEGURIDAD
CREATE VIEW view_modulo_usuario AS
SELECT u.v_usuario as "usuario"
     , p.n_id_perfil as "id_perfil"
	 , p.v_desc_corta as "perfil"
     , m.v_modulo as "modulo"
FROM seg_usuario u
INNER JOIN seg_usuario_perfil up ON(u.v_usuario=up.v_usuario)
INNER JOIN seg_perfil p ON(up.n_id_perfil=p.n_id_perfil)
INNER JOIN seg_perfil_modulo pm ON(p.n_id_perfil=pm.n_id_perfil)
INNER JOIN seg_modulo m ON(m.n_id_modulo=pm.n_id_modulo);

-- DATA DE PRUEBA DE SEGURIDAD
insert into seg_perfil(v_desc_corta,v_descripcion) values("PERF_ADMIN","PERFIL DE ADMINISTRADOR DEL SISTEMA");
insert into seg_perfil(v_desc_corta,v_descripcion) values("PERF_INT_NEG","PERFIL DE INTELIGENCIA DE NEGOCIOS");
insert into seg_usuario(v_usuario,v_contrasenia,v_nombres,v_ap_paterno,v_ap_materno) values("ADMIN","12345","VIERI","GARCIA","MORENO");
insert into seg_usuario_perfil(v_usuario,n_id_perfil) values("ADMIN",1);
insert into seg_modulo(v_modulo,v_descripcion) values("DEFINICION_CAMPANIA","Modulo que permite definir campañas comerciales a los usuarios.");
insert into seg_modulo(v_modulo,v_descripcion) values("GESTION_CAMPANIA","Modulo que permite gestionar las campañas definidas.");
insert into seg_modulo(v_modulo,v_descripcion) values("REPOSITORIO_CAMPANIA","Modulo que deposita las campañas ejecutadas para su posterior uso.");
insert into seg_modulo(v_modulo,v_descripcion) values("CARGA_INFO","Modulo que cargar información transaccional al sistema.");
insert into seg_modulo(v_modulo,v_descripcion) values("PARAMETROS_SISTEMA","Modulo que establecer valores a los parámetros de configuración del sistema.");
insert into seg_modulo(v_modulo,v_descripcion) values("SEGURIDAD","Modulo que permite mantener información de perfiles, usuarios y accesos en el sistema.");
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,1);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,2);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,3);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,4);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,5);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(1,6);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(2,1);
insert into seg_perfil_modulo(n_id_perfil,n_id_modulo) values(2,3);
-- DATA DE PRUEBA DE PARAMETROS DEL SISTEMA
insert into mae_parametros_sistema(v_parametro,v_descripcion,v_tipo_dato,v_valor) values("Máximo Indicadores","Cantidad de indicadores máxima que puede tener una campaña.","Entero","5");
insert into mae_parametros_sistema(v_parametro,v_descripcion,v_tipo_dato,v_valor) values("Fecha Inicio de Simulación","Fecha de la transaccion inicial a partir de la cual se considera al realizar simulaciones.","Fecha","01-01-18 00:00");
insert into mae_parametros_sistema(v_parametro,v_descripcion,v_tipo_dato,v_valor) values("Máximo Etapas","Cantidad de etapas máxima que puede tener una campaña.","Entero","3");