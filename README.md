# DB-MYSQL-4: consultas JOIN de FitLife

Las 17 respuestas están numeradas en consultas_postgresql.sql. Cada comentario indica el ejercicio que se está resolviendo.

## Archivos
- consultas_postgresql.sql: solución con los JOIN del PDF.
- consultas_mysql.sql: las mismas respuestas para MySQL 8. Los puntos 12 y 13 combinan LEFT JOIN, RIGHT JOIN y UNION ALL porque MySQL no tiene FULL OUTER JOIN.
- base_prueba_postgresql.sql: tablas y datos de ejemplo para comprobar las consultas en una base vacía. Estos datos no son los registros originales del curso.
- base_prueba_mysql.sql: las mismas tablas y datos de ejemplo para MySQL 8.
- RESULTADOS_PRUEBA.md: salida de los 17 ejercicios con esos datos.
- VERIFICACION.md: resultados de la revisión.

## Ejecutar
En pgAdmin, abre Query Tool conectado a tu base FitLife. Ejecuta los ejercicios de consultas_postgresql.sql uno por uno. Si usas MySQL Workbench, selecciona tu base y abre consultas_mysql.sql.

Para practicar desde cero en PostgreSQL, crea una base vacía y ejecuta primero base_prueba_postgresql.sql. No ejecutes ese archivo sobre las tablas del curso.

En MySQL, crea y selecciona una base vacía. Ejecuta base_prueba_mysql.sql y después consultas_mysql.sql. Los archivos de base se ejecutan una sola vez en cada base nueva.

El PDF usa ejemplos de PostgreSQL, aunque la actividad se llama DB-MYSQL-4. La fecha de vencimiento se llama fecha_fin en el taller anterior. Para las inscripciones uso fecha_inscripcion; si tu tabla usa otro nombre, cambia esa columna en el punto 4.

## Detalles de las respuestas
- Punto 3 y punto 16: sigo el filtro pago_realizado = TRUE que pide la guía. No agrego un filtro por fechas; una membresía pagada puede estar vencida.
- Punto 5: solo aparecen clases con inscritos. En el punto 11 también aparecen las clases con cero inscritos.
- Punto 8: cuento inscripciones, siguiendo COUNT(ic.id) de la guía. No filtro por asistencia.
- Punto 9: al filtrar pago_realizado = FALSE, los miembros sin membresía quedan fuera. No tener membresía no significa tener un pago pendiente.
- Punto 12 y punto 13: con claves foráneas obligatorias no puede haber referencias a miembros o instructores inexistentes. La auditoría también sirve si se revisan datos importados sin esas restricciones.
- Punto 15: cuento inscripciones en todas las clases del instructor. Una persona inscrita en dos clases cuenta dos veces. Si hay empate, se muestra el instructor con menor id.
- Punto 16: para mostrar también miembros sin Premium, usaría LEFT JOIN y pondría los filtros de plan y pago en la relación que se une. Si los dejo en WHERE, se pierden las filas sin coincidencia.
- Punto 17: asistio = TRUE está en ON para conservar las clases con cero asistentes. COUNT(ic.id) no cuenta los valores NULL.

El PDF no indica un formato de entrega ni pide repositorio. Este repositorio reúne los scripts para revisión; el medio de entrega final depende de la actividad en Canvas.
