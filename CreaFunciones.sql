--FUNCION QUE DEVUELVE UN VALOR

--Año de nacimiento segun su nombre
CREATE OR REPLACE FUNCTION fnc_anio_nac(pnombre varchar,
                                        papp varchar,
                                        papm varchar)
    RETURNS NUMERIC
AS
$$
DECLARE
    anio NUMERIC;
BEGIN
    anio = (SELECT DATE_PART('YEAR', fecha_nac) FROM persona WHERE nombre = pnombre AND app = papp AND apm = papm);
    RETURN anio;
END;
$$
    LANGUAGE 'plpgsql' VOLATILE;


SELECT nombre, app, apm, date_part('YEAR', fecha_nac)
FROM persona;

SELECT *
FROM fnc_anio_nac('Hedda', 'Mcintosh', 'Franco');


--------------------------------------------------- --------------------------------------------------------------------

--FUNCION QUE DEVUELVE UNA TABLA

--Cantidad de vehiculos por marca

CREATE OR REPLACE FUNCTION fnc_vehiculos_por_marca(
    pmarca VARCHAR
)
    RETURNS TABLE
            (
                otipo_vehiculo VARCHAR,
                ocantidad      BIGINT
            )
AS
$$
BEGIN
    RETURN QUERY SELECT tipo_vehiculo, COUNT(id_vehiculo)
                 FROM vehiculo
                          JOIN c_marca cm on vehiculo.id_marca = cm.id_marca
                          JOIN c_tipo_vehiculo ctv on vehiculo.id_tipo_vehiculo = ctv.id_tipo_vehiculo
                 WHERE marca = pmarca
                 GROUP BY tipo_vehiculo;
END
$$
    LANGUAGE 'plpgsql' VOLATILE;


SELECT tipo_vehiculo, COUNT(id_vehiculo)
FROM vehiculo
         JOIN c_marca cm on vehiculo.id_marca = cm.id_marca
         JOIN c_tipo_vehiculo ctv on vehiculo.id_tipo_vehiculo = ctv.id_tipo_vehiculo
WHERE marca = 'Ford'
GROUP BY tipo_vehiculo;

SELECT*
FROM fnc_vehiculos_por_marca('Mercedes Benz');


------------------------------------------------------- ----------------------------------------------------------------

--FUNCION QUE REALIZA UNA RUTINA (ACCION A LA BASE DE DATOS)

--Agregar un nuevo recepcionista
CREATE OR REPLACE FUNCTION fnc_agregar_recep(pnombre VARCHAR,
                                                  papp VARCHAR,
                                                  papm VARCHAR,
                                                  pfecha_nac DATE,
                                                  ptel VARCHAR,
                                                  pemal VARCHAR,
                                                  pgenero VARCHAR,
                                                  psucursal INTEGER)
    RETURNS VARCHAR
AS
$$
DECLARE
    pid_persona      INTEGER;
    pidgenero        INTEGER;
    pidempleado      INTEGER;
    pidrecepcionista INTEGER;
BEGIN

    pid_persona = (SELECT MAX(id_persona) FROM persona) + 1;
    pidgenero = (SELECT id_genero FROM c_genero WHERE genero = pgenero);
    pidempleado = (SELECT MAX(id_empleado) FROM empleado) + 1;
    pidrecepcionista = (SELECT MAX(id_recepcionista) FROM recepcionista) + 1;

    INSERT INTO persona VALUES (pid_persona, TRIM(pnombre), TRIM(papp), TRIM(papm), pfecha_nac, TRIM(ptel), TRIM(pemal), pidgenero);
    INSERT INTO empleado VALUES (pidempleado, pid_persona, psucursal);
    INSERT INTO recepcionista VALUES (pidrecepcionista, pidempleado);

    RETURN 'Recepcionista Agregado Exitosamente';
END;
$$
    LANGUAGE 'plpgsql' VOLATILE;



--Prueba
SELECT * FROM fnc_agregar_recep('      Jorge ','Robles','Gomez','1990-10-02','89390029',NULL,'M',1);

