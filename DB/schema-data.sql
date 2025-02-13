/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2/02/2025 3:26:06 p. m.                      */
/*==============================================================*/


drop index if exists ubicacion_almacen_FK;

drop index if exists tienda_almacen_FK;

drop index if exists Almacen_PK;

drop table if exists Almacen;

drop index if exists ubicacion_tienda_FK;

drop index if exists Tienda_PK;

drop table if exists Tienda;

drop index if exists Ubicacion_PK;

drop table if exists Ubicacion;

drop index if exists Usuario_PK;

drop table if exists Usuario;

drop index if exists categoria_PK;

drop table if exists categoria;

drop index if exists ubicacion_cliente_FK;

drop index if exists usuario_cliente_FK;

drop index if exists cliente_PK;

drop table if exists cliente;

drop index if exists usuario_empleado_FK;

drop index if exists tienda_empleado_FK;

drop index if exists rol_empleado_FK;

drop index if exists empleado_PK;

drop table if exists empleado;

drop index if exists venta_historicoventas_FK;

drop index if exists historico_ventas_PK;

drop table if exists historico_ventas;

drop index if exists almacen_producto_FK;

drop index if exists almacen_producto2_FK;

drop index if exists inventario_PK;

drop table if exists inventario;

drop index if exists metodo_pago_PK;

drop table if exists metodo_pago;

drop index if exists status_orden_FK;

drop index if exists cliente_orden_FK;

drop index if exists orden_PK;

drop table if exists orden;

drop index if exists orden_producto_FK;

drop index if exists orden_producto2_FK;

drop index if exists orden_producto_PK;

drop table if exists orden_producto;

drop index if exists pago_metodo_FK;

drop index if exists orden_pago_FK;

drop index if exists pago_PK;

drop table if exists pago;

drop index if exists categoria_producto_FK;

drop index if exists producto_PK;

drop table if exists producto;

drop index if exists rol_PK;

drop table if exists rol;

drop index if exists status_PK;

drop table if exists status;

/*==============================================================*/
/* Table: Almacen                                               */
/*==============================================================*/
create table Almacen (
                         id_almacen           VARCHAR(36)          not null,
                         id_tienda            VARCHAR(36)          null,
                         id_ubicacion         INT4                 not null,
                         is_central           BOOL                 not null,
                         constraint PK_ALMACEN primary key (id_almacen)
);

/*==============================================================*/
/* Index: Almacen_PK                                            */
/*==============================================================*/
create unique index Almacen_PK on Almacen (
                                           id_almacen
    );

/*==============================================================*/
/* Index: tienda_almacen_FK                                     */
/*==============================================================*/
create  index tienda_almacen_FK on Almacen (
                                            id_tienda
    );

/*==============================================================*/
/* Index: ubicacion_almacen_FK                                  */
/*==============================================================*/
create  index ubicacion_almacen_FK on Almacen (
                                               id_ubicacion
    );

/*==============================================================*/
/* Table: Tienda                                                */
/*==============================================================*/
create table Tienda (
                        id_ubicacion         INT4                 not null,
                        id_tienda            VARCHAR(36)          not null,
                        nombre_tienda        VARCHAR(64)          not null,
                        constraint PK_TIENDA primary key (id_tienda)
);

/*==============================================================*/
/* Index: Tienda_PK                                             */
/*==============================================================*/
create unique index Tienda_PK on Tienda (
                                         id_tienda
    );

/*==============================================================*/
/* Index: ubicacion_tienda_FK                                   */
/*==============================================================*/
create  index ubicacion_tienda_FK on Tienda (
                                             id_ubicacion
    );

/*==============================================================*/
/* Table: Ubicacion                                             */
/*==============================================================*/
create table Ubicacion (
                           id_ubicacion         INT4                 not null,
                           direccion            VARCHAR(64)          not null,
                           constraint PK_UBICACION primary key (id_ubicacion)
);

/*==============================================================*/
/* Index: Ubicacion_PK                                          */
/*==============================================================*/
create unique index Ubicacion_PK on Ubicacion (
                                               id_ubicacion
    );

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario (
                         id_usuario           VARCHAR(36)          not null,
                         username             VARCHAR(32)          not null,
                         password             VARCHAR(60)          not null,
                         role                 VARCHAR(32)          not null,
                         mail                 VARCHAR(32)          not null,
                         constraint PK_USUARIO primary key (id_usuario)
);

/*==============================================================*/
/* Index: Usuario_PK                                            */
/*==============================================================*/
create unique index Usuario_PK on Usuario (
                                           id_usuario
    );

/*==============================================================*/
/* Table: categoria                                             */
/*==============================================================*/
create table categoria (
                           id_categoriaPK       INT4                 not null,
                           descripcion_categoria VARCHAR(128)         not null,
                           nombre_categoria     VARCHAR(32)          not null,
                           constraint PK_CATEGORIA primary key (id_categoriaPK)
);

/*==============================================================*/
/* Index: categoria_PK                                          */
/*==============================================================*/
create unique index categoria_PK on categoria (
                                               id_categoriaPK
    );

/*==============================================================*/
/* Table: cliente                                               */
/*==============================================================*/
create table cliente (
                         id_clientePK         VARCHAR(36)          not null,
                         id_usuarioFK         VARCHAR(36)          not null,
                         id_ubicacionFK       INT4                 not null,
                         nombres              VARCHAR(32)          not null,
                         apellidos            VARCHAR(32)          not null,
                         direccion            VARCHAR(32)          not null,
                         constraint PK_CLIENTE primary key (id_clientePK)
);

/*==============================================================*/
/* Index: cliente_PK                                            */
/*==============================================================*/
create unique index cliente_PK on cliente (
                                           id_clientePK
    );

/*==============================================================*/
/* Index: usuario_cliente_FK                                    */
/*==============================================================*/
create  index usuario_cliente_FK on cliente (
                                             id_usuarioFK
    );

/*==============================================================*/
/* Index: ubicacion_cliente_FK                                  */
/*==============================================================*/
create  index ubicacion_cliente_FK on cliente (
                                               id_ubicacionFK
    );

/*==============================================================*/
/* Table: empleado                                              */
/*==============================================================*/
create table empleado (
                          id_usuario           VARCHAR(36)          not null,
                          id_empleado          VARCHAR(32)          not null,
                          id_role              INT4                 not null,
                          id_tienda            VARCHAR(36)          not null,
                          constraint PK_EMPLEADO primary key (id_usuario, id_empleado)
);

/*==============================================================*/
/* Index: empleado_PK                                           */
/*==============================================================*/
create unique index empleado_PK on empleado (
                                             id_usuario,
                                             id_empleado
    );

/*==============================================================*/
/* Index: rol_empleado_FK                                       */
/*==============================================================*/
create  index rol_empleado_FK on empleado (
                                           id_role
    );

/*==============================================================*/
/* Index: tienda_empleado_FK                                    */
/*==============================================================*/
create  index tienda_empleado_FK on empleado (
                                              id_tienda
    );

/*==============================================================*/
/* Index: usuario_empleado_FK                                   */
/*==============================================================*/
create  index usuario_empleado_FK on empleado (
                                               id_usuario
    );

/*==============================================================*/
/* Table: historico_ventas                                      */
/*==============================================================*/
create table historico_ventas (
                                  id_historico         INT8                 not null,
                                  id_productoPK        VARCHAR(36)          not null,
                                  id_clientePK         VARCHAR(36)          not null,
                                  id_ordenPK           VARCHAR(36)          not null,
                                  precio_unitario      NUMERIC(10,2)        not null,
                                  descuento            NUMERIC(5,2)         not null,
                                  constraint PK_HISTORICO_VENTAS primary key (id_historico, id_productoPK, id_clientePK, id_ordenPK)
);

/*==============================================================*/
/* Index: historico_ventas_PK                                   */
/*==============================================================*/
create unique index historico_ventas_PK on historico_ventas (
                                                             id_historico,
                                                             id_productoPK,
                                                             id_clientePK,
                                                             id_ordenPK
    );

/*==============================================================*/
/* Index: venta_historicoventas_FK                              */
/*==============================================================*/
create  index venta_historicoventas_FK on historico_ventas (
                                                            id_productoPK,
                                                            id_clientePK,
                                                            id_ordenPK
    );

/*==============================================================*/
/* Table: inventario                                            */
/*==============================================================*/
create table inventario (
                            id_productoPK        VARCHAR(36)          not null,
                            id_almacen           VARCHAR(36)          not null,
                            cantidad             INT4                 not null,
                            constraint PK_INVENTARIO primary key (id_productoPK, id_almacen)
);

/*==============================================================*/
/* Index: inventario_PK                                         */
/*==============================================================*/
create unique index inventario_PK on inventario (
                                                 id_productoPK,
                                                 id_almacen
    );

/*==============================================================*/
/* Index: almacen_producto2_FK                                  */
/*==============================================================*/
create  index almacen_producto2_FK on inventario (
                                                  id_almacen
    );

/*==============================================================*/
/* Index: almacen_producto_FK                                   */
/*==============================================================*/
create  index almacen_producto_FK on inventario (
                                                 id_productoPK
    );

/*==============================================================*/
/* Table: metodo_pago                                           */
/*==============================================================*/
create table metodo_pago (
                             id_metodopago        INT4                 not null,
                             nombre_metodo        VARCHAR(32)          not null,
                             constraint PK_METODO_PAGO primary key (id_metodopago)
);

/*==============================================================*/
/* Index: metodo_pago_PK                                        */
/*==============================================================*/
create unique index metodo_pago_PK on metodo_pago (
                                                   id_metodopago
    );

/*==============================================================*/
/* Table: orden                                                 */
/*==============================================================*/
create table orden (
                       id_clientePK         VARCHAR(36)          not null,
                       id_ordenPK           VARCHAR(36)          not null,
                       id_statusFK          INT4                 not null,
                       total                DECIMAL(10,2)        not null,
                       updated_at           DATE                 not null,
                       constraint PK_ORDEN primary key (id_clientePK, id_ordenPK)
);

/*==============================================================*/
/* Index: orden_PK                                              */
/*==============================================================*/
create unique index orden_PK on orden (
                                       id_clientePK,
                                       id_ordenPK
    );

/*==============================================================*/
/* Index: cliente_orden_FK                                      */
/*==============================================================*/
create  index cliente_orden_FK on orden (
                                         id_clientePK
    );

/*==============================================================*/
/* Index: status_orden_FK                                       */
/*==============================================================*/
create  index status_orden_FK on orden (
                                        id_statusFK
    );

/*==============================================================*/
/* Table: orden_producto                                        */
/*==============================================================*/
create table orden_producto (
                                id_productoPK        VARCHAR(36)          not null,
                                id_clientePK         VARCHAR(36)          not null,
                                id_ordenPK           VARCHAR(36)          not null,
                                cantidad_producto    INT4                 not null,
                                constraint PK_ORDEN_PRODUCTO primary key (id_productoPK, id_clientePK, id_ordenPK)
);

/*==============================================================*/
/* Index: orden_producto_PK                                     */
/*==============================================================*/
create unique index orden_producto_PK on orden_producto (
                                                         id_productoPK,
                                                         id_clientePK,
                                                         id_ordenPK
    );

/*==============================================================*/
/* Index: orden_producto2_FK                                    */
/*==============================================================*/
create  index orden_producto2_FK on orden_producto (
                                                    id_clientePK,
                                                    id_ordenPK
    );

/*==============================================================*/
/* Index: orden_producto_FK                                     */
/*==============================================================*/
create  index orden_producto_FK on orden_producto (
                                                   id_productoPK
    );

/*==============================================================*/
/* Table: pago                                                  */
/*==============================================================*/
create table pago (
                      id_clientePK         VARCHAR(36)          not null,
                      id_ordenPK           VARCHAR(36)          not null,
                      id_pago              VARCHAR(36)          not null,
                      id_metodopago        INT4                 not null,
                      amount               DECIMAL(10,2)        not null,
                      fecha_pago           DATE                 not null,
                      transaccion          VARCHAR(64)          not null,
                      constraint PK_PAGO primary key (id_clientePK, id_ordenPK, id_pago)
);

/*==============================================================*/
/* Index: pago_PK                                               */
/*==============================================================*/
create unique index pago_PK on pago (
                                     id_clientePK,
                                     id_ordenPK,
                                     id_pago
    );

/*==============================================================*/
/* Index: orden_pago_FK                                         */
/*==============================================================*/
create  index orden_pago_FK on pago (
                                     id_clientePK,
                                     id_ordenPK
    );

/*==============================================================*/
/* Index: pago_metodo_FK                                        */
/*==============================================================*/
create  index pago_metodo_FK on pago (
                                      id_metodopago
    );

/*==============================================================*/
/* Table: producto                                              */
/*==============================================================*/
create table producto (
                          id_productoPK        VARCHAR(36)          not null,
                          id_categoriaPK       INT4                 not null,
                          nombre_producto      VARCHAR(64)          not null,
                          precio_producto      DECIMAL(10,2)        not null,
                          desc_producto        VARCHAR(64)          not null,
                          url_imagen           VARCHAR(128)         not null,
                          constraint PK_PRODUCTO primary key (id_productoPK)
);

/*==============================================================*/
/* Index: producto_PK                                           */
/*==============================================================*/
create unique index producto_PK on producto (
                                             id_productoPK
    );

/*==============================================================*/
/* Index: categoria_producto_FK                                 */
/*==============================================================*/
create  index categoria_producto_FK on producto (
                                                 id_categoriaPK
    );

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol (
                     id_role              INT4                 not null,
                     nombre_rol           VARCHAR(32)          not null,
                     constraint PK_ROL primary key (id_role)
);

/*==============================================================*/
/* Index: rol_PK                                                */
/*==============================================================*/
create unique index rol_PK on rol (
                                   id_role
    );

/*==============================================================*/
/* Table: status                                                */
/*==============================================================*/
create table status (
                        id_status            INT4                 not null,
                        nombre_status        VARCHAR(32)          not null,
                        constraint PK_STATUS primary key (id_status)
);

/*==============================================================*/
/* Index: status_PK                                             */
/*==============================================================*/
create unique index status_PK on status (
                                         id_status
    );

alter table Almacen
    add constraint FK_ALMACEN_TIENDA_AL_TIENDA foreign key (id_tienda)
        references Tienda (id_tienda)
        on delete restrict on update restrict;

alter table Almacen
    add constraint FK_ALMACEN_UBICACION_UBICACIO foreign key (id_ubicacion)
        references Ubicacion (id_ubicacion)
        on delete restrict on update restrict;

alter table Tienda
    add constraint FK_TIENDA_UBICACION_UBICACIO foreign key (id_ubicacion)
        references Ubicacion (id_ubicacion)
        on delete restrict on update restrict;

alter table cliente
    add constraint FK_CLIENTE_UBICACION_UBICACIO foreign key (id_ubicacionFK)
        references Ubicacion (id_ubicacion)
        on delete restrict on update restrict;

alter table cliente
    add constraint FK_CLIENTE_USUARIO_C_USUARIO foreign key (id_usuarioFK)
        references Usuario (id_usuario)
        on delete restrict on update restrict;

alter table empleado
    add constraint FK_EMPLEADO_ROL_EMPLE_ROL foreign key (id_role)
        references rol (id_role)
        on delete restrict on update restrict;

alter table empleado
    add constraint FK_EMPLEADO_TIENDA_EM_TIENDA foreign key (id_tienda)
        references Tienda (id_tienda)
        on delete restrict on update restrict;

alter table empleado
    add constraint FK_EMPLEADO_USUARIO_E_USUARIO foreign key (id_usuario)
        references Usuario (id_usuario)
        on delete restrict on update restrict;

alter table historico_ventas
    add constraint FK_HISTORIC_VENTA_HIS_ORDEN_PR foreign key (id_productoPK, id_clientePK, id_ordenPK)
        references orden_producto (id_productoPK, id_clientePK, id_ordenPK)
        on delete restrict on update restrict;

alter table inventario
    add constraint FK_INVENTAR_ALMACEN_P_PRODUCTO foreign key (id_productoPK)
        references producto (id_productoPK)
        on delete restrict on update restrict;

alter table inventario
    add constraint FK_INVENTAR_ALMACEN_P_ALMACEN foreign key (id_almacen)
        references Almacen (id_almacen)
        on delete restrict on update restrict;

alter table orden
    add constraint FK_ORDEN_CLIENTE_O_CLIENTE foreign key (id_clientePK)
        references cliente (id_clientePK)
        on delete restrict on update restrict;

alter table orden
    add constraint FK_ORDEN_STATUS_OR_STATUS foreign key (id_statusFK)
        references status (id_status)
        on delete restrict on update restrict;

alter table orden_producto
    add constraint FK_ORDEN_PR_ORDEN_PRO_PRODUCTO foreign key (id_productoPK)
        references producto (id_productoPK)
        on delete restrict on update restrict;

alter table orden_producto
    add constraint FK_ORDEN_PR_ORDEN_PRO_ORDEN foreign key (id_clientePK, id_ordenPK)
        references orden (id_clientePK, id_ordenPK)
        on delete restrict on update restrict;

alter table pago
    add constraint FK_PAGO_ORDEN_PAG_ORDEN foreign key (id_clientePK, id_ordenPK)
        references orden (id_clientePK, id_ordenPK)
        on delete restrict on update restrict;

alter table pago
    add constraint FK_PAGO_PAGO_METO_METODO_P foreign key (id_metodopago)
        references metodo_pago (id_metodopago)
        on delete restrict on update restrict;

alter table producto
    add constraint FK_PRODUCTO_CATEGORIA_CATEGORI foreign key (id_categoriaPK)
        references categoria (id_categoriaPK)
        on delete restrict on update restrict;





select * from producto;

insert into categoria (id_categoriapk, descripcion_categoria, nombre_categoria)
values
    (1, 'Artesanias hechas de cerámica tradicional', 'Cerámica'),
    (2, 'Artesanias hechas de madera', 'Madera'),
    (3, 'Artesanias hechas de tela', 'Tejido'),
    (4,'Joyas artesanales','Joyería artesanal'),
    (5,'Vajillas y utensilios','Vajillas y utensilios'),
    (6,'Cestas y canastos','Cestas y canastos');

insert into producto (id_productopk, id_categoriapk, nombre_producto, precio_producto, desc_producto, url_imagen)
values (gen_random_uuid(),1,'Jarrón de cerámica', 99.99, 'Jarrón de cerámica hecho a mano', 'url1'),
       (gen_random_uuid(),1,'Plato de cerámica', 49.99, 'Plato de cerámica hecho a mano', 'url2'),
       (gen_random_uuid(),1,'Taza de cerámica', 19.99, 'Taza de cerámica hecha a mano', 'url3'),
       (gen_random_uuid(),2,'Cuchara de madera', 9.99, 'Cuchara de madera tallada a mano', 'url4'),
       (gen_random_uuid(),2,'Tenedor de madera', 9.99, 'Tenedor de madera tallada a mano', 'url5'),
       (gen_random_uuid(),2,'Cuchillo de madera', 9.99, 'Cuchillo de madera tallada a mano', 'url6'),
       (gen_random_uuid(),3,'Manta tejida', 29.99, 'Manta tejida a mano', 'url7'),
       (gen_random_uuid(),3,'Bufanda tejida', 19.99, 'Bufanda tejida a mano', 'url8'),
       (gen_random_uuid(),3,'Gorro tejido', 14.99, 'Gorro tejido a mano', 'url9'),
       (gen_random_uuid(),4,'Anillo de plata', 49.99, 'Anillo de plata hecho a mano', 'url10'),
       (gen_random_uuid(),4,'Collar de plata', 99.99, 'Collar de plata hecho a mano', 'url11'),
       (gen_random_uuid(),4,'Pulsera de plata', 29.99, 'Pulsera de plata hecha a mano', 'url12'),
       (gen_random_uuid(),5,'Plato de cerámica', 19.99, 'Plato de cerámica hecho a mano', 'url13'),
       (gen_random_uuid(),5,'Taza de cerámica', 9.99, 'Taza de cerámica hecha a mano', 'url14'),
       (gen_random_uuid(),5,'Cuchara de madera', 4.99, 'Cuchara de madera tallada a mano', 'url15'),
       (gen_random_uuid(),6,'Cesta de mimbre', 29.99, 'Cesta de mimbre hecha a mano', 'url16'),
       (gen_random_uuid(),6,'Canasto de mimbre', 19.99, 'Canasto de mimbre hecho a mano', 'url17'),
       (gen_random_uuid(),6,'Cesto de mimbre', 14.99, 'Cesto de mimbre hecho a mano', 'url18');
/* Tiendas */
INSERT INTO Tienda (id_ubicacion, id_tienda, nombre_tienda) 
VALUES 
(1, gen_random_uuid(), 'Artesanías del Sol'),
(2, gen_random_uuid(), 'Manos Creativas');
/*Almacenes  */
INSERT INTO Almacen (id_almacen, id_tienda, id_ubicacion, is_central) 
VALUES 
(gen_random_uuid(), 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 1, TRUE),
(gen_random_uuid(), 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 1, FALSE),
(gen_random_uuid(), 'b2c3d4e5-f678-9012-abcd-0987654321fe', 2, TRUE),
(gen_random_uuid(), 'b2c3d4e5-f678-9012-abcd-0987654321fe', 2, FALSE);
