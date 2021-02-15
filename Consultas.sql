
--Consulta sencilla
/*
 Se obtendran las tuplas del 30 al 39 de la tabla persona. Unicamente se desea obtener
 el id, nombre apellido paterno, aperllido maternp y su email. Los datos se ordenran conforme al id (ascendente)
 */
SELECT id_persona, nombre, app, apm, email
FROM persona
WHERE id_persona BETWEEN 30 AND 50
ORDER BY id_persona
LIMIT 10;

-- Subconsulta con 3 niveles
/*
 Vamos a obtener todos los datos de aquellos individuos que sean clientes, con la característica
enviar algún paquete, NO DE RECIBIR
 */
SELECT *
FROM persona
WHERE id_persona IN
      (SELECT DISTINCT (id_persona)
       FROM cliente
       WHERE id_cliente IN
             (SELECT DISTINCT (id_cliente)
              FROM cliente_orden
              WHERE id_tipo_cliente = 1
             )
      );


-- Consulta Compuesta
/*
 Obtener los datos del paquete enviado, o recibido, dirección a la que se envía, forma de pago
 y la prioridad de la transacción
 */
SELECT orden.id_orden,
       id_cliente,
       tipo_cliente,
       alto,
       ancho,
       largo,
       precio,
       peso,
       tipo_pago,
       prioridad,
       calle,
       colonia,
       codigo_postal
FROM orden
         JOIN direccion_entrega de on orden.id_direccion_entrega = de.id_direccion_entrega
         JOIN direccion d on de.id_direccion = d.id_direccion
         JOIN cliente_orden co on orden.id_orden = co.id_orden
         JOIN c_tipo_cliente ON co.id_tipo_cliente = c_tipo_cliente.id_tipo_cliente
         JOIN c_tipo_pago ctp on orden.id_tipo_pago = ctp.id_tipo_pago
         JOIN c_prioridad cp on orden.id_prioridad = cp.id_prioridad
ORDER BY orden.id_orden;

CREATE EXTENSION tablefunc;

SELECT *
FROM CROSSTAB(
             'SELECT DATE_PART(''YEAR'',fecha_entrega) anio,DATE_PART(''MONTH'',fecha_entrega) mes,COUNT(id_orden) cantidad
         FROM orden
         GROUP BY anio,mes
         ORDER BY anio, mes',
             'SELECT DISTINCT DATE_PART(''MONTH'',fecha_entrega) mes
         FROM orden
         ORDER BY mes'
         ) AS resultado(Anio double precision,Ene bigint, Feb bigint, Mar bigint, Abr bigint, May bigint, Jun bigint,
             Jul bigint, Ago bigint,Sep bigint, Oct bigint, Nov bigint, Dic bigint);


--Paginacion
--Nombre completo y email de las personas registradas
SELECT id_persona,nombre ||' '|| app||' '|| apm nombre_completo, email
FROM persona
ORDER BY id_persona
OFFSET 20 FETCH NEXT 30 ROWS ONLY;

--AGRUPACION

--Cuantos productos se entregaron por tipo y fecha
SELECT tipo_producto, fecha_entrega,SUM(cantidad) cant
FROM detalle_orden
    JOIN c_tipo_producto ctp on detalle_orden.id_tipo_producto = ctp.id_tipo_producto
    JOIN orden o on detalle_orden.id_orden = o.id_orden
GROUP BY tipo_producto, fecha_entrega
ORDER BY tipo_producto, fecha_entrega;

--Cuanto productos hay en total de cada tipo
SELECT tipo_producto,SUM(cantidad) total
FROM detalle_orden
    JOIN c_tipo_producto ctp on detalle_orden.id_tipo_producto = ctp.id_tipo_producto
    JOIN orden o on detalle_orden.id_orden = o.id_orden
GROUP BY tipo_producto
ORDER BY tipo_producto;

--Funcion de ventana
--Cuantos productos se entregaron por tipo y por fecha y la cantidad total de cada tipo
SELECT tipo_producto,fecha_entrega, cantidad, SUM(cantidad) OVER (PARTITION BY tipo_producto) total
FROM detalle_orden
    JOIN c_tipo_producto ctp on detalle_orden.id_tipo_producto = ctp.id_tipo_producto
    JOIN orden o on detalle_orden.id_orden = o.id_orden
ORDER BY tipo_producto, fecha_entrega;