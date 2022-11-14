-- Begin sesion with the following command on the terminal (en mac: psql -U postgres -W)

-- Database creation

CREATE DATABASE desafio_Diego_Almeida_986;

--selection of the database

\c desafio_Diego_Almeida_986;

--table creation

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);
--INSERT
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021','Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

-- PREGUNTAS

--1. Cuantos Registros Hay?:

SELECT COUNT(*) FROM Inscritos
    
    --Respuesta: 16

--2. Cuantos Registros hay en total?:

SELECT SUM(cantidad) FROM inscritos;

    -- Respuesta: 774

--3. Cuales son los registros con mayor antigüedad?:

SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

    -- Respuesta: Registros de enero 2021, para blog y pagina

--4. Cuantos inscritos hay por dia?

SELECT fecha, SUM(CANTIDAD)FROM Inscritos GROUP BY fecha ORDER BY fecha DESC;

--5. Cuantos inscritos hay por fuente?

SELECT fuente AS Fuente,  SUM(cantidad) as total FROM inscritos GROUP BY fuente; 

    -- Respuesta: 
        --5.1 PAGINA: 441
        --5.2 BLOG: 333

--6. Que dia se inscribieron la mayor cantidad de personas: 

SELECT fecha, SUM(cantidad) AS suma FROM INSCRITOS GROUP BY fecha ORDER BY suma DESC LIMIT 1;

    -- Respuesta: El 1 de Agosto de 2021 se registraron 182 Personas

--7. Que dias se inscribieron la mayor cantidad de personas utilizando el blog y cuantas personas fueron:

SELECT * FROM INSCRITOS WHERE cantidad = (SELECT MAX (cantidad) FROM INSCRITOS WHERE fuente = 'Blog') LIMIT 1;

    -- Respuesta: El 1 de agosto de 2021 se se cuentan 83 Registros para el Blog

--8. Cuantas personas en promedio se inscriben en un dia?

SELECT ROUND (AVG(cantidad)) FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha) inscritos;


-- 9. Que dias se inscribieron mas de 50 personas?
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING sum(cantidad) > 50;

-- 10. Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT AVG (cantidad) AS "promedio", fecha FROM inscritos WHERE > '01/03/2021' GROUP BY fecha ORDER BY fecha ASC;



-- fin del trabajo