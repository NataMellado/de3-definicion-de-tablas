-- 1. Crear una base de datos llamada películas.
CREATE DATABASE peliculas;

-- 2. Cargar ambos archivos a su tabla correspondiente y aplicar el truncado de estas.
CREATE TABLE peliculas (
    id INT PRIMARY KEY,
    Pelicula VARCHAR(100),
    Año_estreno INT,
    Director VARCHAR(100)
);

CREATE TABLE reparto (
    id_pelicula INT,
    actor VARCHAR(100),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- Se importan archivos CSV en Oracle SQL Developer con la función 'Importar datos'
TRUNCATE TABLE reparto;
TRUNCATE TABLE peliculas;

select * from reparto;
select * from peliculas;

-- 3. Obtener el ID de la película “Titanic”.
SELECT pelicula, id 
from peliculas
where pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic.
SELECT reparto.actor 
FROM reparto
JOIN peliculas on reparto.id_pelicula = peliculas.id
where peliculas.Pelicula = 'Titanic';

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*)
FROM reparto
JOIN peliculas ON reparto.id_pelicula = peliculas.id
WHERE reparto.actor = 'Harrison Ford' AND peliculas.id <= 100;

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT peliculas.Pelicula, Año_estreno
FROM peliculas
WHERE Año_estreno BETWEEN 1990 AND 1999
ORDER BY Pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.
SELECT peliculas.Pelicula, LENGTH(Pelicula) AS longitud_titulo
FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT peliculas.Pelicula, LENGTH(Pelicula) AS longitud_titulo
FROM peliculas
ORDER BY longitud_titulo DESC
FETCH FIRST 1 ROW ONLY;

