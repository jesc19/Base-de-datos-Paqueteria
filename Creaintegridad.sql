
--Llaves Primarias
ALTER TABLE c_capacidad ADD CONSTRAINT PKc_capacidad PRIMARY KEY(id_capacidad);
ALTER TABLE c_entidad ADD CONSTRAINT PKc_entidad PRIMARY KEY(id_entidad);
ALTER TABLE c_funcion_vehiculo ADD CONSTRAINT PKc_func_vehi PRIMARY KEY(id_funcion_vehiculo);
ALTER TABLE c_genero ADD CONSTRAINT PKc_genero PRIMARY KEY(id_genero);
ALTER TABLE c_marca ADD CONSTRAINT PKc_marca PRIMARY KEY(id_marca);
ALTER TABLE c_municipio ADD CONSTRAINT PKc_municipio PRIMARY KEY(id_municipio);
ALTER TABLE c_prioridad ADD CONSTRAINT PKc_prioridad PRIMARY KEY(id_prioridad);
ALTER TABLE c_status ADD CONSTRAINT PKc_status PRIMARY KEY(id_status);
ALTER TABLE c_tipo_cliente ADD CONSTRAINT PKc_tipo_cliente PRIMARY KEY(id_tipo_cliente);
ALTER TABLE c_tipo_pago ADD CONSTRAINT PKc_tipo_pago PRIMARY KEY(id_tipo_pago);
ALTER TABLE c_tipo_producto ADD CONSTRAINT PKc_tipo_producto PRIMARY KEY(id_tipo_producto);
ALTER TABLE c_tipo_sucursal ADD CONSTRAINT PKc_tipo_suc PRIMARY KEY(id_tipo_sucursal);
ALTER TABLE c_tipo_vehiculo ADD CONSTRAINT PKc_tipo_vehi PRIMARY KEY(id_tipo_vehiculo);
ALTER TABLE cliente ADD CONSTRAINT PKcliente PRIMARY KEY(id_cliente);
ALTER TABLE cliente_orden ADD CONSTRAINT PKcliente_orden PRIMARY KEY(id_cliente_orden);
ALTER TABLE detalle_orden ADD CONSTRAINT PKdetalle_orden PRIMARY KEY(id_detalle_orden);
ALTER TABLE detalle_sucursal ADD CONSTRAINT PKdetalle_suc PRIMARY KEY(id_detalle_sucursal);
ALTER TABLE direccion ADD CONSTRAINT PKdireccion PRIMARY KEY(id_direccion);
ALTER TABLE direccion_entrega ADD CONSTRAINT PKdireccion_entrega PRIMARY KEY(id_direccion_entrega);
ALTER TABLE direccion_persona ADD CONSTRAINT PKdireccion_persona PRIMARY KEY(id_direccion_persona);
ALTER TABLE empleado ADD CONSTRAINT PKempleado PRIMARY KEY(id_empleado);
ALTER TABLE empresa ADD CONSTRAINT PKempresa PRIMARY KEY(id_empresa);
ALTER TABLE orden ADD CONSTRAINT PKc_orden PRIMARY KEY(id_orden);
ALTER TABLE orden_vehiculo ADD CONSTRAINT PKorden_vehi PRIMARY KEY(id_orden_vehiculo);
ALTER TABLE persona ADD CONSTRAINT PKpersona PRIMARY KEY(id_persona);
ALTER TABLE recepcionista ADD CONSTRAINT PKrecepcionista PRIMARY KEY(id_recepcionista);
ALTER TABLE repartidor ADD CONSTRAINT PKrepartidor PRIMARY KEY(id_repartidor);
ALTER TABLE ruta ADD CONSTRAINT PKruta PRIMARY KEY(id_ruta);
ALTER TABLE ruta_vehiculo ADD CONSTRAINT PKruta_vehi PRIMARY KEY(id_ruta_vehiculo);
ALTER TABLE sucursal ADD CONSTRAINT PKsucursal PRIMARY KEY(id_sucursal);
ALTER TABLE sucursal_ruta ADD CONSTRAINT PKsuc_ruta PRIMARY KEY(id_sucursal_ruta);
ALTER TABLE vehiculo ADD CONSTRAINT PKvehiculo PRIMARY KEY(id_vehiculo);


--Llaves Foraneas
ALTER TABLE persona ADD CONSTRAINT FKpersona597973 FOREIGN KEY (id_genero) REFERENCES c_genero (id_genero);
ALTER TABLE direccion_persona ADD CONSTRAINT FKdireccion_714423 FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);
ALTER TABLE direccion_persona ADD CONSTRAINT FKdireccion_215165 FOREIGN KEY (id_persona) REFERENCES persona (id_persona);
ALTER TABLE direccion ADD CONSTRAINT FKdireccion823204 FOREIGN KEY (id_municipio) REFERENCES c_municipio (id_municipio);
ALTER TABLE c_municipio ADD CONSTRAINT FKc_municipi752432 FOREIGN KEY (id_entidad) REFERENCES c_entidad (id_entidad);
ALTER TABLE empresa ADD CONSTRAINT FKempresa504390 FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);
ALTER TABLE direccion_entrega ADD CONSTRAINT FKdireccion_851452 FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);
ALTER TABLE orden ADD CONSTRAINT FKorden596255 FOREIGN KEY (id_direccion_entrega) REFERENCES direccion_entrega (id_direccion_entrega);
ALTER TABLE cliente ADD CONSTRAINT FKcliente943628 FOREIGN KEY (id_persona) REFERENCES persona (id_persona);
ALTER TABLE empleado ADD CONSTRAINT FKempleado505066 FOREIGN KEY (id_persona) REFERENCES persona (id_persona);
ALTER TABLE cliente_orden ADD CONSTRAINT FKcliente_or428520 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE cliente_orden ADD CONSTRAINT FKcliente_or604448 FOREIGN KEY (id_orden) REFERENCES orden (id_orden);
ALTER TABLE orden ADD CONSTRAINT FKorden338998 FOREIGN KEY (id_tipo_pago) REFERENCES c_tipo_pago (id_tipo_pago);
ALTER TABLE cliente_orden ADD CONSTRAINT FKcliente_or722745 FOREIGN KEY (id_tipo_cliente) REFERENCES c_tipo_cliente (id_tipo_cliente);
ALTER TABLE recepcionista ADD CONSTRAINT FKrecepcioni52468 FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);
ALTER TABLE empleado ADD CONSTRAINT FKempleado542726 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal);
ALTER TABLE detalle_orden ADD CONSTRAINT FKdetalle_or266696 FOREIGN KEY (id_tipo_producto) REFERENCES c_tipo_producto (id_tipo_producto);
ALTER TABLE detalle_orden ADD CONSTRAINT FKdetalle_or408357 FOREIGN KEY (id_orden) REFERENCES orden (id_orden);
ALTER TABLE orden_vehiculo ADD CONSTRAINT FKorden_vehi6909 FOREIGN KEY (id_orden) REFERENCES orden (id_orden);
ALTER TABLE orden_vehiculo ADD CONSTRAINT FKorden_vehi559447 FOREIGN KEY (id_vehiculo) REFERENCES vehiculo (id_vehiculo);
ALTER TABLE ruta_vehiculo ADD CONSTRAINT FKruta_vehic479485 FOREIGN KEY (id_vehiculo) REFERENCES vehiculo (id_vehiculo);
ALTER TABLE ruta_vehiculo ADD CONSTRAINT FKruta_vehic516794 FOREIGN KEY (id_ruta) REFERENCES ruta (id_ruta);
ALTER TABLE vehiculo ADD CONSTRAINT FKvehiculo820687 FOREIGN KEY (id_status) REFERENCES c_status (id_status);
ALTER TABLE vehiculo ADD CONSTRAINT FKvehiculo166997 FOREIGN KEY (id_marca) REFERENCES c_marca (id_marca);
ALTER TABLE vehiculo ADD CONSTRAINT FKvehiculo709060 FOREIGN KEY (id_capacidad) REFERENCES c_capacidad (id_capacidad);
ALTER TABLE orden ADD CONSTRAINT FKorden53145 FOREIGN KEY (id_recepcionista) REFERENCES recepcionista (id_recepcionista);
ALTER TABLE detalle_sucursal ADD CONSTRAINT FKdetalle_su797231 FOREIGN KEY (id_orden) REFERENCES orden (id_orden);
ALTER TABLE detalle_sucursal ADD CONSTRAINT FKdetalle_su487630 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal);
ALTER TABLE detalle_sucursal ADD CONSTRAINT FKdetalle_su339424 FOREIGN KEY (id_tipo_sucursal) REFERENCES c_tipo_sucursal (id_tipo_sucursal);
ALTER TABLE sucursal_ruta ADD CONSTRAINT FKsucursal_r237913 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal);
ALTER TABLE sucursal_ruta ADD CONSTRAINT FKsucursal_r534431 FOREIGN KEY (id_ruta) REFERENCES ruta (id_ruta);
ALTER TABLE orden_vehiculo ADD CONSTRAINT FKorden_vehi374667 FOREIGN KEY (id_funcion_vehiculo) REFERENCES c_funcion_vehiculo (id_funcion_vehiculo);
ALTER TABLE vehiculo ADD CONSTRAINT FKvehiculo184655 FOREIGN KEY (id_tipo_vehiculo) REFERENCES c_tipo_vehiculo (id_tipo_vehiculo);
ALTER TABLE repartidor ADD CONSTRAINT FKrepartidor699675 FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);
ALTER TABLE ruta_vehiculo ADD CONSTRAINT FKruta_vehic304716 FOREIGN KEY (id_repartidor) REFERENCES repartidor (id_repartidor);
ALTER TABLE sucursal ADD CONSTRAINT FKsucursal283174 FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);
ALTER TABLE orden ADD CONSTRAINT FKorden491489 FOREIGN KEY (id_prioridad) REFERENCES c_prioridad (id_prioridad);


--UNICIDAD
ALTER TABLE cliente ADD CONSTRAINT UNQcliente_idpersona UNIQUE (id_persona);
ALTER TABLE direccion_entrega ADD CONSTRAINT UNQdireccion_entrega1 UNIQUE (id_direccion);
ALTER TABLE empleado ADD CONSTRAINT UNQempleado1 UNIQUE (id_persona);
ALTER TABLE recepcionista ADD CONSTRAINT UNQrecep12 UNIQUE (id_empleado);
ALTER TABLE repartidor ADD CONSTRAINT UNQrapart90 UNIQUE (id_empleado);
ALTER TABLE sucursal ADD CONSTRAINT UNQsucursal23 UNIQUE (id_direccion);

--CHECKS
ALTER TABLE c_genero ADD CONSTRAINT chk_genero CHECK( genero IN ('M','F'));
ALTER TABLE c_tipo_pago ADD CONSTRAINT chk_tipopago CHECK ( tipo_pago IN('Efectivo','Tarjeta') );
ALTER TABLE c_funcion_vehiculo ADD CONSTRAINT chk_funcion_vehiculo CHECK ( funcion IN ('Envio a sucursal','Entrega final a domicilio') );
ALTER TABLE c_prioridad ADD CONSTRAINT chk_prioridad CHECK ( prioridad IN ('Alta','Media','Baja') );
ALTER TABLE c_status ADD CONSTRAINT chk_status_vehi CHECK ( status IN ('Nuevo','Viejo','Intermedio') );
ALTER TABLE c_capacidad ADD CONSTRAINT chk_capacidad_vehi CHECK( capacidad IN ('Alta','Media','Baja'));
ALTER TABLE c_tipo_cliente ADD CONSTRAINT chk_tipocliente CHECK ( tipo_cliente IN ('Envia','Recibe') );
ALTER TABLE c_tipo_sucursal ADD CONSTRAINT chk_tipo_suc CHECK ( tipo_sucursal IN ('Salida','Llegada') );
ALTER TABLE detalle_orden ADD CONSTRAINT chk_cantidad CHECK ( cantidad > 0 );
ALTER TABLE orden ADD CONSTRAINT chk_alto CHECK ( alto > 0 );
ALTER TABLE orden ADD CONSTRAINT chk_largo CHECK ( largo > 0 );
ALTER TABLE orden ADD CONSTRAINT chk_ancho CHECK ( ancho > 0 );
ALTER TABLE orden ADD CONSTRAINT chk_peso CHECK ( peso > 0 );
ALTER TABLE orden ADD CONSTRAINT chk_precio CHECK ( precio > 0 );