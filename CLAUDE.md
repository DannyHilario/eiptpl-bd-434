# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Propósito

Repositorio educativo para la enseñanza de bases de datos relacionales usando **Microsoft SQL Server (MSSQL)**. Orientado a estudiantes con conocimientos básicos de programación.

## Estructura del Proyecto

```
eiptpl-bd-434/
├── temas/              # Contenido por unidad temática
│   ├── 01-intro/       # Scripts y ejercicios de cada tema
│   ├── 02-ddl/
│   └── ...
├── proyectos/          # Proyectos integradores
├── soluciones/         # Soluciones a ejercicios (rama separada o carpeta)
└── recursos/           # Diagramas, datasets de ejemplo
```

## Convenciones SQL

- Palabras reservadas SQL en **MAYÚSCULAS** (`SELECT`, `FROM`, `WHERE`, etc.)
- Nombres de tablas en **PascalCase** (`OrdenDeCompra`, `DetalleFactura`)
- Nombres de columnas en **PascalCase**
- Stored procedures con prefijo `usp_` (`usp_ObtenerClientes`)
- Funciones con prefijo `ufn_`
- Vistas con prefijo `vw_`
- Cada script debe incluir comentario de cabecera con: tema, descripción y autor

## Compatibilidad

- Motor objetivo: **SQL Server 2019+**
- Scripts deben funcionar en SQL Server Express (sin features Enterprise)
- Usar sintaxis T-SQL estándar; evitar características exclusivas de ediciones superiores

## Estilo de Archivos SQL

- Encoding: UTF-8
- Un archivo por tema/ejercicio
- Incluir `USE [NombreDB];` al inicio de cada script
- Incluir `GO` como separador de batches
- Los scripts deben ser **idempotentes** cuando sea posible (usar `IF EXISTS` antes de `CREATE`)
