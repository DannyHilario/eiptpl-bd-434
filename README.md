# Bases de Datos Relacionales — BD-434

Repositorio del curso de **Bases de Datos Relacionales** impartido con Microsoft SQL Server. Contiene los materiales, scripts y ejercicios de cada sesión.

---

## Requisitos

- [SQL Server 2019 o superior](https://www.microsoft.com/es-mx/sql-server/sql-server-downloads) (Express es suficiente)
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms)

---

## Estructura del repositorio

```
eiptpl-bd-434/
├── temas/          # Apuntes y material teórico de cada tema
├── sesion-7/       # Scripts SQL organizados por ejercicio
│   ├── 06-Ejercicio-1/   # Ejercicio 1: tabla Alumno
│   └── 09-Ejercicio-2/   # Ejercicio 2: sistema de reservaciones Hotel Vista
└── datos-evidencia-1/    # Archivos de evidencia por equipo
```

## Temas del curso

| # | Tema |
|---|------|
| 01 | Introducción a Microsoft SQL Server |
| 02 | Introducción a Servidores |
| 03 | Lenguaje SQL |
| 04 | DDL — Definición de datos |
| 05 | DML — Manipulación de datos |
| 06 | Ejercicio 1 |
| 07 | Constraints e integridad referencial |
| 08 | Modelo Relacional |
| 09 | Ejercicio 2 |

---

## Cómo usar los scripts

1. Abre **SSMS** y conéctate a tu servidor local.
2. Crea o selecciona la base de datos desde el menú desplegable.
3. Abre el archivo `.sql` correspondiente.
4. Ejecuta con **F5** o el botón **Execute**.

> Los scripts están diseñados para ejecutarse en orden (01, 02, 03…).

---

## Convenciones del código SQL

- Palabras reservadas en `MAYÚSCULAS` (`SELECT`, `FROM`, `WHERE`)
- Nombres de tablas y columnas en `PascalCase`
- Columnas de llave primaria con prefijo `id` (`idCliente`, `idOrden`)
- Cada script incluye un encabezado con tema, descripción y autor
