-- 1. Clases con instructor activo
SELECT c.nombre AS clase, c.duracion_minutos, i.nombre AS instructor
FROM clases AS c
INNER JOIN instructores AS i ON c.instructor_id = i.id
WHERE i.activo = TRUE;

-- 2. Miembros inscritos y sus clases
SELECT m.nombre AS miembro, c.nombre AS clase
FROM miembros AS m
INNER JOIN inscripciones_clases AS ic ON m.id = ic.miembro_id
INNER JOIN clases AS c ON ic.clase_id = c.id
ORDER BY m.nombre, c.nombre;

-- 3. Membresias pagadas y sus planes
SELECT m.nombre AS miembro, p.nombre AS plan, p.precio_mensual
FROM miembros AS m
INNER JOIN membresias AS mem ON m.id = mem.miembro_id
INNER JOIN planes AS p ON mem.plan_id = p.id
WHERE mem.pago_realizado = TRUE;

-- 4. Asistencias confirmadas
SELECT m.nombre AS miembro, c.nombre AS clase, ic.fecha_inscripcion
FROM miembros AS m
INNER JOIN inscripciones_clases AS ic ON m.id = ic.miembro_id
INNER JOIN clases AS c ON ic.clase_id = c.id
WHERE ic.asistio = TRUE
ORDER BY ic.fecha_inscripcion, ic.id;

-- 5. Clases que tienen inscritos
SELECT c.nombre AS clase, COUNT(ic.id) AS total_inscritos
FROM clases AS c
INNER JOIN inscripciones_clases AS ic ON c.id = ic.clase_id
GROUP BY c.id, c.nombre
ORDER BY total_inscritos DESC, c.nombre;

-- 6. Miembros sin inscripciones
SELECT m.id, m.nombre
FROM miembros AS m
LEFT JOIN inscripciones_clases AS ic ON m.id = ic.miembro_id
WHERE ic.id IS NULL;

-- 7. Instructores sin clases
SELECT i.nombre, i.especialidad
FROM instructores AS i
LEFT JOIN clases AS c ON i.id = c.instructor_id
WHERE c.id IS NULL;

-- 8. Inscripciones de cada miembro, incluyendo cero
SELECT m.nombre AS miembro, COUNT(ic.id) AS total_clases
FROM miembros AS m
LEFT JOIN inscripciones_clases AS ic ON m.id = ic.miembro_id
GROUP BY m.id, m.nombre
ORDER BY total_clases DESC, m.nombre;

-- 9. Membresias con pago pendiente
SELECT m.nombre AS miembro, mem.plan_id, mem.fecha_inicio, mem.fecha_fin AS fecha_vencimiento
FROM miembros AS m
LEFT JOIN membresias AS mem ON m.id = mem.miembro_id
WHERE mem.pago_realizado = FALSE;

-- 10. Clases sin inscritos
SELECT c.nombre AS clase, c.capacidad_maxima
FROM inscripciones_clases AS ic
RIGHT JOIN clases AS c ON ic.clase_id = c.id
WHERE ic.id IS NULL;

-- 11. Inscritos de cada clase, incluyendo cero
SELECT c.nombre AS clase, COUNT(ic.id) AS total_inscritos
FROM inscripciones_clases AS ic
RIGHT JOIN clases AS c ON ic.clase_id = c.id
GROUP BY c.id, c.nombre
ORDER BY total_inscritos DESC, c.nombre;

-- 12. Todos los miembros y todas las membresias
SELECT m.nombre AS miembro, mem.fecha_inicio
FROM miembros AS m
FULL OUTER JOIN membresias AS mem ON m.id = mem.miembro_id;

-- 13. Instructores y clases sin relacion completa
SELECT i.nombre AS instructor, c.nombre AS clase
FROM instructores AS i
FULL OUTER JOIN clases AS c ON i.id = c.instructor_id
WHERE i.id IS NULL OR c.id IS NULL;

-- 14. Reporte de inscripciones con instructor
SELECT m.nombre AS miembro, c.nombre AS clase, i.nombre AS instructor
FROM miembros AS m
INNER JOIN inscripciones_clases AS ic ON m.id = ic.miembro_id
INNER JOIN clases AS c ON ic.clase_id = c.id
INNER JOIN instructores AS i ON c.instructor_id = i.id
ORDER BY m.nombre, c.nombre;

-- 15. Instructor con mas inscripciones
SELECT i.nombre AS instructor, i.especialidad, COUNT(ic.id) AS total_inscritos
FROM instructores AS i
LEFT JOIN clases AS c ON i.id = c.instructor_id
LEFT JOIN inscripciones_clases AS ic ON c.id = ic.clase_id
GROUP BY i.id, i.nombre, i.especialidad
ORDER BY total_inscritos DESC, i.id
LIMIT 1;

-- 16. Miembros con Premium pagado
SELECT m.nombre AS miembro, m.email, mem.fecha_fin AS fecha_vencimiento
FROM miembros AS m
INNER JOIN membresias AS mem ON m.id = mem.miembro_id
INNER JOIN planes AS p ON mem.plan_id = p.id
WHERE p.nombre = 'Premium' AND mem.pago_realizado = TRUE;

-- 17. Asistentes por clase, incluyendo cero
SELECT c.nombre AS clase, i.nombre AS instructor, COUNT(ic.id) AS total_asistentes
FROM clases AS c
LEFT JOIN instructores AS i ON c.instructor_id = i.id
LEFT JOIN inscripciones_clases AS ic ON c.id = ic.clase_id AND ic.asistio = TRUE
GROUP BY c.id, c.nombre, i.id, i.nombre
ORDER BY total_asistentes DESC, c.nombre;
