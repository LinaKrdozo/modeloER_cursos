-- Obtener los 5 cursos con más unidades: Escribe una consulta que devuelva los títulos de los 5 cursos que tienen más unidades. 
-- Los resultados deben estar ordenados en orden descendente por el número de unidades.

SELECT * FROM cursos;

SELECT cursos.titulo, COUNT(unidades.titulo) as total_unidades
FROM cursos
JOIN unidades
ON cursos.id = unidades.cursos_id
GROUP BY cursos.titulo 
ORDER BY total_unidades DESC
LIMIT 5;

-- Obtener la media de unidades por curso: Escribe una consulta que calcule la media de unidades por curso. 
-- Los resultados deben estar agrupados por el título del curso.

SELECT AVG(conteo_unidades) AS promedio_unidades_por_curso
FROM (
    SELECT COUNT(unidades.id) AS conteo_unidades
    FROM cursos 
    JOIN unidades  
    ON cursos.id = unidades.cursos_id
    GROUP BY cursos.id
) AS promedio_total;


-- Obtener los usuarios asociados a más de 3 cursos: Escribe una consulta que devuelva los nombres de los 
-- usuarios que están asociados a más de 3 cursos. Los resultados deben estar ordenados en orden 
-- ascendente por el nombre del usuario 

SELECT * FROM usuarios;
SELECT * FROM usuarios_has_cursos;
 
 -- cantidad de usuarios asociados a cursos
SELECT usuarios.nombre, COUNT(usuarios_has_cursos.cursos_id) AS cantidad_cursos
FROM usuarios
JOIN usuarios_has_cursos 
ON usuarios.id = usuarios_has_cursos.usuarios_id
JOIN cursos
ON cursos.id = usuarios_has_cursos.cursos_id
GROUP BY usuarios.id, usuarios.nombre
HAVING cantidad_cursos > 3
ORDER BY usuarios.nombre ASC;


-- Obtener las 10 primeras clases que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva las 10 primeras clases que comienzan después de una 
-- fecha determinada. Los resultados deben estar ordenados en orden ascendente por la fecha de inicio.

SELECT * FROM clases;

SELECT titulo, fecha_inicio
FROM clases
WHERE fecha_inicio > 01-02-2024
ORDER BY fecha_inicio ASC
LIMIT 10;

-- Obtener el número de bloques por tipo para una clase específica: Escribe una consulta que 
-- devuelva el número de bloques por tipo para una clase específica. Los resultados deben estar 
-- agrupados por el tipo de bloque.

SELECT * FROM bloques;

SELECT clases.titulo AS clase_titulo, bloques.tipo AS tipo_bloque, COUNT(*) AS cantidad_bloques
FROM bloques 
JOIN clases
ON clases.id = bloques.clases_id
GROUP BY clases.titulo, bloques.tipo;

-- Obtener el nombre y el apellido de los usuarios, sustituyendo los valores nulos por una cadena
-- vacía: Escribe una consulta que devuelva el nombre y el apellido de los usuarios, utilizando una 
-- función para sustituir los valores nulos por una cadena vacía.

INSERT INTO usuarios (nombre, apellido, contraseña, categoria_id) 
VALUES(NULL, NULL, 'pass1234', 1);

SELECT * FROM usuarios;

SELECT COALESCE(nombre, '') AS nombre, COALESCE(apellido, '') AS apellido
FROM usuarios;

-- Obtener los 3 cursos con la mayor cantidad de usuarios: Escribe una consulta que 
-- devuelva los títulos de los 3 cursos que tienen más usuarios asociados. Los resultados 
-- deben estar ordenados en orden descendente por el número de usuarios.

SELECT cursos.titulo, COUNT(usuarios_has_cursos.usuarios_id) AS cantidad_usuarios
FROM cursos
JOIN usuarios_has_cursos 
ON cursos.id = usuarios_has_cursos.cursos_id
JOIN usuarios
ON usuarios.id = usuarios_has_cursos.usuarios_id
GROUP BY cursos.id, cursos.titulo
ORDER BY cantidad_usuarios DESC
LIMIT 3;

-- Obtener el promedio de clases por unidad para cada curso: Escribe una consulta que calcule el
-- promedio de clases por unidad para cada curso. Los resultados deben estar agrupados por el título del curso.

-- cantidad de unidades por curso
SELECT cursos.titulo, COUNT(unidades.id) AS cantidad_unidades_por_curso
FROM cursos
JOIN unidades
ON cursos.id = unidades.cursos_id
GROUP BY cursos.titulo;

-- cantidad de clases por unidad
SELECT unidades.titulo, COUNT(clases.id) AS cantidad_clases_por_unidad
FROM unidades
JOIN clases
ON unidades.id = clases.unidades_id
GROUP BY unidades.titulo;

SELECT cursos.titulo AS Curso, AVG(unidades_clases.cantidad_clases) AS Promedio_Clases_Por_Unidad
FROM cursos
JOIN (
  SELECT unidades.cursos_id, COUNT(clases.id) AS cantidad_clases
  FROM unidades
  JOIN clases 
  ON unidades.id = clases.unidades_id
  GROUP BY unidades.id, unidades.cursos_id  
) AS unidades_clases 
ON cursos.id = unidades_clases.cursos_id
GROUP BY cursos.id, cursos.titulo  
ORDER BY cursos.titulo;

-- Obtener los usuarios con más de 2 cursos que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva los nombres de los usuarios que están asociados a más de 2 cursos
-- que comienzan después de una fecha determinada. Los resultados deben estar ordenados en orden ascendente 
-- por el nombre del usuario.

SELECT usuarios.nombre, COUNT(usuarios_has_cursos.cursos_id) AS cantidad_cursos
FROM usuarios
JOIN usuarios_has_cursos 
ON usuarios.id = usuarios_has_cursos.usuarios_id
JOIN cursos 
ON cursos.id = usuarios_has_cursos.cursos_id
WHERE cursos.fecha_inicio > '2024-01-01'
GROUP BY usuarios.id, usuarios.nombre
HAVING cantidad_cursos > 2
ORDER BY usuarios.nombre ASC;

-- Obtener las 5 últimas unidades que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva las 5 últimas unidades que comienzan después de una 
-- fecha determinada. Los resultados deben estar ordenados en orden descendente por la fecha de inicio.

SELECT unidades.titulo, unidades.descripcion, unidades.fecha_inicio
FROM unidades
WHERE unidades.fecha_inicio > '2024-01-01'
ORDER BY unidades.fecha_inicio DESC
LIMIT 5;

-- Obtener el número de usuarios por categoría para un curso específico: Escribe una consulta que devuelva 
-- el número de usuarios por categoría para un curso específico. Los resultados deben estar agrupados por 
-- la categoría del usuario.

-- CURSO: Introducción a Python
-- CATEGORIA: Estudiante

SELECT categoria.tipo_categoria, COUNT(usuarios.id) AS cantidad_usuarios
FROM usuarios
JOIN categoria 
ON usuarios.categoria_id = categoria.id
JOIN usuarios_has_cursos 
ON usuarios.id = usuarios_has_cursos.usuarios_id
WHERE usuarios_has_cursos.cursos_id = 1 AND categoria.tipo_categoria = 'Estudiante'
GROUP BY categoria.tipo_categoria
ORDER BY cantidad_usuarios DESC;
