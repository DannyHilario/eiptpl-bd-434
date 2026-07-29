# CLAUDE.md

## Propósito

Repositorio educativo para la enseñanza de Base de Datos usando **Microsoft SQL Server (MSSQL)**. Orientado a estudiantes con conocimientos básicos de programación.

El curso da continuidad al mismo grupo a lo largo de dos semestres. El repositorio se organiza en:

- `bd-1/` — semestre anterior (BD-434), ya finalizado
- `bd-2/` — semestre en curso, continuación de los mismos temas

Las convenciones, el motor objetivo y el alcance del curso descritos en este archivo aplican por igual a ambas carpetas.


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

El alcance es acumulativo entre semestres: lo cubierto en `bd-1` se da por sabido en `bd-2`. Para el temario completo de cada curso ver `bd-1/ContenidoTematico.md` y `bd-2/ContenidoTematico.md`.

### bd-1 (Base de Datos I)

#### Temas cubiertos (SQL válido en ejercicios y consultas)

- `SELECT` simple: `*`, columnas específicas, alias de columna (`AS`)
- Filtros: `WHERE` con `=`, `<>`, `>`, `<`, `>=`, `<=`, `AND`, `OR`, `BETWEEN`, `LIKE`
- Ordenamiento: `ORDER BY` (ASC / DESC, múltiples columnas)
- Límite de filas: `TOP`
- Consultas combinadas: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Detección de ausencias: `LEFT`/`RIGHT JOIN` + `WHERE columna IS NULL`
- Funciones de fecha T-SQL: `MONTH()`, `YEAR()`, `DAY()`
- Concatenación de cadenas: operador `+`
- Conteo básico: `COUNT(*)` sin `GROUP BY` (scripts de validación)

#### Temas NO cubiertos en bd-1 (no incluir en ejercicios ni consultas de ese curso)

- `GROUP BY` / `HAVING`
- Funciones de agregación: `SUM`, `AVG`, `MIN`, `MAX`
- `CASE WHEN`
- `DISTINCT`
- Subconsultas / `EXISTS`
- `DATEDIFF`, `GETDATE`, `DATEADD`
- `CONCAT`, `UPPER`, `LOWER` y otras funciones escalares de cadena
- Stored procedures, funciones, vistas y triggers (solo se define su nomenclatura)
- Variables, control de flujo (`IF`, `IF EXISTS`) y manejo de errores (`TRY CATCH`, `THROW`)

### bd-2 (Base de Datos II)

Amplía el alcance de bd-1 e incorpora explícitamente los temas que ahí estaban excluidos:

#### Temas cubiertos

- Vistas: `CREATE VIEW` (prefijo `vw_`) y manipulación de una vista
- Funciones de agregado y escalares: `SUM`, `AVG`, `MIN`, `MAX`, `COUNT`
- `GROUP BY` / `HAVING`
- `DISTINCT`
- Procedimientos almacenados: crear, ejecutar, modificar y eliminar (prefijo `usp_`)
- Funciones definidas por el usuario (prefijo `ufn_`)
- Triggers: creación, activación/desactivación, tablas `Inserted` y `Deleted`
- Variables T-SQL: declaración y asignación
- Control de flujo: `IF`, `IF-ELSE`, `IF EXISTS`, anidamiento de `IF`, `CASE WHEN`
- Manejo de errores: funciones `ERROR_*`, `TRY CATCH`, transacciones con `TRY CATCH`, manejo de excepciones en procedimientos almacenados, `THROW`

#### Temas NO cubiertos en bd-2

- No se ha definido restricción adicional; cualquier tema fuera del temario de `bd-2/ContenidoTematico.md` debe confirmarse antes de incluirse en ejercicios.

## Sesiones y Bases de Datos — bd-1 (BD-434, semestre anterior)

| Sesión | Base de datos | Descripción |
|--------|---------------|-------------|
| Sesión 7 | CursoDB | DDL y DML — tabla `Alumno` + modelo Hotel Vista (4 tablas) |
| Sesión 8 | ViajeYA | Solución Evidencia 2 — agencia de viajes (5 tablas) |
| Sesión 9 | EscuelaDB | Práctica JOINs — catálogos `Tecnica` y `Alumno` (2 tablas) |
| Sesión 10 | AutoFixDB | Práctica JOINs — taller mecánico (4 tablas) |
| Sesión Final | CineDB | Repaso integral — cine con 8 tablas |

## Sesiones y Bases de Datos — bd-2 (semestre en curso)

_Pendiente — se irá documentando conforme avancen las sesiones._

## Referencia de Estilo

Para ver ejemplos de scripts bien formateados y dentro del alcance del curso:

- `bd-1/sesiones/sesion-final/CineDB/consultas.sql` — consultas de repaso (20 consultas)
- `bd-1/sesiones/sesion-10/05-Ejercicio-2/instalacion/` — ejemplos de CREATE TABLE e INSERT
- `bd-1/sesiones/sesion-7/09-Ejercicio-2/instalacion/07-validar.sql` — consultas simples de validación