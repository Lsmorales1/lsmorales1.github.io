USE conducar;

SELECT COUNT(*) AS tablas
FROM information_schema.tables
WHERE table_schema = 'conducar';

SELECT 'alumno' AS tabla, COUNT(*) AS registros FROM alumno
UNION ALL SELECT 'categoria_licencia', COUNT(*) FROM categoria_licencia
UNION ALL SELECT 'certificado_aptitud', COUNT(*) FROM certificado_aptitud
UNION ALL SELECT 'certificado_crc', COUNT(*) FROM certificado_crc
UNION ALL SELECT 'clase', COUNT(*) FROM clase
UNION ALL SELECT 'examen', COUNT(*) FROM examen
UNION ALL SELECT 'instructor', COUNT(*) FROM instructor
UNION ALL SELECT 'instructor_categoria', COUNT(*) FROM instructor_categoria
UNION ALL SELECT 'matricula', COUNT(*) FROM matricula
UNION ALL SELECT 'modulo', COUNT(*) FROM modulo
UNION ALL SELECT 'pago', COUNT(*) FROM pago
UNION ALL SELECT 'plan_curso', COUNT(*) FROM plan_curso
UNION ALL SELECT 'vehiculo', COUNT(*) FROM vehiculo;


SELECT constraint_type AS tipo, COUNT(*) AS cantidad
FROM information_schema.table_constraints
WHERE table_schema = 'conducar'
GROUP BY constraint_type
ORDER BY constraint_type;

SELECT table_name AS tabla, column_name AS columna,
       referenced_table_name AS referencia, referenced_column_name AS columna_referencia
FROM information_schema.key_column_usage
WHERE table_schema = 'conducar' AND referenced_table_name IS NOT NULL
ORDER BY table_name, column_name;

SELECT table_name AS tabla, engine AS motor, table_collation AS intercalacion
FROM information_schema.tables
WHERE table_schema = 'conducar'
ORDER BY table_name;

SELECT user AS usuario, host
FROM mysql.user
WHERE user IN ('admin', 'proyecto', 'gestionador', 'consultor')
ORDER BY user;

SHOW GRANTS FOR 'consultor';

SELECT C.id_clase, C.id_instructor, M.codigo_categoria
FROM clase C
JOIN matricula M ON C.id_matricula = M.id_matricula
WHERE (C.id_instructor, M.codigo_categoria) NOT IN
      (SELECT id_instructor, codigo_categoria FROM instructor_categoria);

SELECT C.id_clase, V.placa, V.codigo_categoria AS categoria_vehiculo, M.codigo_categoria AS categoria_matricula
FROM clase C
JOIN vehiculo V ON C.placa = V.placa
JOIN matricula M ON C.id_matricula = M.id_matricula
WHERE V.codigo_categoria <> M.codigo_categoria;
