# Verificación

Las 17 consultas se ejecutaron sin errores en PostgreSQL 17 y MySQL 8, en bases de prueba separadas.

Se comprobó que los puntos 5 y 11 se diferencian por la clase sin inscritos, que los miembros sin clases aparecen con cero, que se detectan los pagos pendientes y que el reporte de asistencia incluye las cuatro clases aunque dos tengan cero asistentes.

Los puntos 12 y 13 también se probaron con tablas separadas sin claves foráneas para introducir referencias inexistentes. La versión con UNION ALL mantuvo ambos lados de la auditoría y no eliminó dos filas coincidentes con los mismos valores.

Los datos son ejemplos creados para revisar las consultas. No son los datos originales del curso. Hay que ejecutar los scripts sobre la base de clase para obtener sus resultados finales. Confirma que la fecha de inscripción se llama fecha_inscripcion en esa base.
