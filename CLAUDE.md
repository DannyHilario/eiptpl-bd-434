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