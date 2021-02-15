
-- CREACION DE TABLAS BASE DE DATOS PAQUETERIA

CREATE TABLE c_capacidad
(
    id_capacidad SERIAL      NOT NULL,
    capacidad    varchar(30) NOT NULL
);

CREATE TABLE c_entidad
(
    id_entidad     SERIAL      NOT NULL,
    nombre_entidad varchar(30) NOT NULL
);

CREATE TABLE c_funcion_vehiculo
(
    id_funcion_vehiculo SERIAL      NOT NULL,
    funcion             varchar(90) NOT NULL
);

CREATE TABLE c_genero
(
    id_genero SERIAL      NOT NULL,
    genero    varchar(20) NOT NULL
);

CREATE TABLE c_marca
(
    id_marca SERIAL      NOT NULL,
    marca    varchar(50) NOT NULL
);

CREATE TABLE c_municipio
(
    id_municipio     SERIAL      NOT NULL,
    nombre_municipio varchar(90) NOT NULL,
    id_entidad       int4        NOT NULL
);

CREATE TABLE c_prioridad
(
    id_prioridad SERIAL      NOT NULL,
    prioridad    varchar(30) NOT NULL
);

CREATE TABLE c_status
(
    id_status SERIAL      NOT NULL,
    status    varchar(40) NOT NULL
);

CREATE TABLE c_tipo_cliente
(
    id_tipo_cliente SERIAL      NOT NULL,
    tipo_cliente    varchar(20) NOT NULL
);

CREATE TABLE c_tipo_pago
(
    id_tipo_pago SERIAL      NOT NULL,
    tipo_pago    varchar(20) NOT NULL
);

CREATE TABLE c_tipo_producto
(
    id_tipo_producto SERIAL      NOT NULL,
    tipo_producto    varchar(60) NOT NULL
);

CREATE TABLE c_tipo_sucursal
(
    id_tipo_sucursal SERIAL NOT NULL,
    tipo_sucursal    varchar(30) NOT NULL
);

CREATE TABLE c_tipo_vehiculo
(
    id_tipo_vehiculo SERIAL      NOT NULL,
    tipo_vehiculo    varchar(30) NOT NULL
);

CREATE TABLE cliente
(
    id_cliente SERIAL NOT NULL,
    id_persona int4   NOT NULL
);

CREATE TABLE cliente_orden
(
    id_cliente_orden SERIAL NOT NULL,
    id_cliente       int4   NOT NULL,
    id_orden         int4   NOT NULL,
    id_tipo_cliente  int4   NOT NULL
);

CREATE TABLE detalle_orden
(
    id_detalle_orden SERIAL NOT NULL,
    cantidad         int4   NOT NULL,
    id_tipo_producto int4   NOT NULL,
    id_orden         int4   NOT NULL
);

CREATE TABLE detalle_sucursal
(
    id_detalle_sucursal SERIAL NOT NULL,
    id_orden            int4   NOT NULL,
    id_sucursal         int4   NOT NULL,
    id_tipo_sucursal    int4   NOT NULL
);

CREATE TABLE direccion
(
    id_direccion  SERIAL      NOT NULL,
    calle         varchar(60) NOT NULL,
    colonia       varchar(60) NOT NULL,
    codigo_postal varchar(60) NOT NULL,
    id_municipio  int4        NOT NULL
);

CREATE TABLE direccion_entrega
(
    id_direccion_entrega SERIAL NOT NULL,
    id_direccion         int4   NOT NULL
);

CREATE TABLE direccion_persona
(
    id_direccion_persona SERIAL NOT NULL,
    id_direccion         int4   NOT NULL,
    id_persona           int4   NOT NULL
);

CREATE TABLE empleado
(
    id_empleado SERIAL NOT NULL,
    id_persona  int4   NOT NULL,
    id_sucursal int4   NOT NULL
);

CREATE TABLE empresa
(
    id_empresa     SERIAL      NOT NULL,
    nombre_empresa varchar(90) NOT NULL,
    id_direccion   int4        NOT NULL
);

CREATE TABLE orden
(
    id_orden             SERIAL NOT NULL,
    alto                 float4 NOT NULL,
    ancho                float4 NOT NULL,
    largo                float4 NOT NULL,
    precio               float4 NOT NULL,
    peso                 float4 NOT NULL,
    fecha_entrega        date   NOT NULL,
    id_tipo_pago         int4   NOT NULL,
    id_direccion_entrega int4   NOT NULL,
    id_recepcionista     int4   NOT NULL,
    id_prioridad         int4   NOT NULL
);

CREATE TABLE orden_vehiculo
(
    id_orden_vehiculo   SERIAL NOT NULL,
    id_funcion_vehiculo int4   NOT NULL,
    id_orden            int4   NOT NULL,
    id_vehiculo         int4   NOT NULL
);

CREATE TABLE persona
(
    id_persona SERIAL      NOT NULL,
    nombre     varchar(60) NOT NULL,
    app        varchar(60) NOT NULL,
    apm        varchar(60),
    fecha_nac  date        NOT NULL,
    telefono   varchar(20) NOT NULL,
    email      varchar(60),
    id_genero  int4        NOT NULL
);

CREATE TABLE recepcionista
(
    id_recepcionista SERIAL NOT NULL,
    id_empleado      int4   NOT NULL
);

CREATE TABLE repartidor
(
    id_repartidor SERIAL NOT NULL,
    id_empleado   int4   NOT NULL
);

CREATE TABLE ruta
(
    id_ruta     SERIAL      NOT NULL,
    nombre_ruta varchar(90) NOT NULL,
    distancia   float4      NOT NULL
);
CREATE TABLE ruta_vehiculo
(
    id_ruta_vehiculo    SERIAL NOT NULL,
    fecha_ruta_vehiculo date   NOT NULL,
    id_repartidor       int4   NOT NULL,
    id_vehiculo         int4   NOT NULL,
    id_ruta             int4   NOT NULL
);

CREATE TABLE sucursal
(
    id_sucursal     SERIAL      NOT NULL,
    nombre_sucursal varchar(60) NOT NULL,
    id_direccion    int4        NOT NULL
);

CREATE TABLE sucursal_ruta
(
    id_sucursal_ruta SERIAL NOT NULL,
    id_sucursal      int4   NOT NULL,
    id_ruta          int4   NOT NULL
);

CREATE TABLE vehiculo
(
    id_vehiculo      SERIAL NOT NULL,
    id_marca         int4   NOT NULL,
    id_status        int4   NOT NULL,
    id_capacidad     int4   NOT NULL,
    id_tipo_vehiculo int4   NOT NULL
);
