# CLAUDE.md

## Propósito

Repositorio educativo para la enseñanza de bases de datos relacionales usando **Microsoft SQL Server (MSSQL)**. Orientado a estudiantes con conocimientos básicos de programación.


## Convenciones SQL

- Palabras reservadas SQL en **MAYÚSCULAS** (`SELECT`, `FROM`, `WHERE`, etc.)
- Nombres de tablas en **PascalCase** (`OrdenDeCompra`, `DetalleFactura`)
- Nombres de tablas y columnas siempre en singular
- Nombres de columnas en **PascalCase**
- Columnas ID son excepción: prefijo `id` + NombreTabla en PascalCase (`idCliente`, `idServicio`)
- Stored procedures con prefijo `usp_` (`usp_ObtenerClientes`)
- Funciones con prefijo `ufn_`
- Vistas con prefijo `vw_`
- Cada script debe incluir comentario de cabecera con: tema, descripción y autor
- En definiciones de tabla, un solo espacio entre columna, tipo y restricciones (sin alineación tabular)
- Los INSERT y SELECT deben tener máximo 5 campos por fila
- `SELECT` y `FROM` siempre en líneas separadas; los campos comienzan en la misma línea del `SELECT`
- Los INSERT siempre deben tener las columnas mencionadas en la sentencia

## Compatibilidad

- Motor objetivo: **SQL Server 2019+**
- Scripts deben funcionar en SQL Server Express (sin features Enterprise)
- Usar sintaxis T-SQL estándar; evitar características exclusivas de ediciones superiores

## Estilo de Archivos SQL

- Encoding: UTF-8
- No usar `GO` en los scripts
- No usar `USE [DB]` en los scripts; los alumnos seleccionan la base de datos desde el dropdown de SSMS

## Alcance del Curso

### Temas cubiertos (SQL válido en ejercicios y consultas)

- `SELECT` simple: `*`, columnas específicas, alias de columna (`AS`)
- Filtros: `WHERE` con `=`, `<>`, `>`, `<`, `>=`, `<=`, `AND`, `OR`, `BETWEEN`, `LIKE`
- Ordenamiento: `ORDER BY` (ASC / DESC, múltiples columnas)
- Límite de filas: `TOP`
- Consultas combinadas: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Detección de ausencias: `LEFT`/`RIGHT JOIN` + `WHERE columna IS NULL`
- Funciones de fecha T-SQL: `MONTH()`, `YEAR()`, `DAY()`
- Concatenación de cadenas: operador `+`
- Conteo básico: `COUNT(*)` sin `GROUP BY` (scripts de validación)

### Temas NO cubiertos (no incluir en ejercicios ni consultas de alumnos)

- `GROUP BY` / `HAVING`
- Funciones de agregación: `SUM`, `AVG`, `MIN`, `MAX`
- `CASE WHEN`
- `DISTINCT`
- Subconsultas / `EXISTS`
- `DATEDIFF`, `GETDATE`, `DATEADD`
- `CONCAT`, `UPPER`, `LOWER` y otras funciones escalares de cadena
- Stored procedures, funciones y vistas (solo se define su nomenclatura)

## Sesiones y Bases de Datos

| Sesión | Base de datos | Descripción |
|--------|---------------|-------------|
| Sesión 7 | CursoDB | DDL y DML — tabla `Alumno` + modelo Hotel Vista (4 tablas) |
| Sesión 8 | ViajeYA | Solución Evidencia 2 — agencia de viajes (5 tablas) |
| Sesión 9 | EscuelaDB | Práctica JOINs — catálogos `Tecnica` y `Alumno` (2 tablas) |
| Sesión 10 | AutoFixDB | Práctica JOINs — taller mecánico (4 tablas) |
| Sesión Final | CineDB | Repaso integral — cine con 8 tablas |

## Referencia de Estilo

Para ver ejemplos de scripts bien formateados y dentro del alcance del curso:

- `sesiones/sesion-final/CineDB/consultas.sql` — consultas de repaso (20 consultas)
- `sesiones/sesion-10/05-Ejercicio-2/instalacion/` — ejemplos de CREATE TABLE e INSERT
- `sesiones/sesion-7/09-Ejercicio-2/instalacion/07-validar.sql` — consultas simples de validación