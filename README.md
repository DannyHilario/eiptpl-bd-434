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
├── temas/                        # Apuntes y material teórico por etapa
│   ├── Etapa-3/                  # Temas 01–09: fundamentos de SQL
│   └── Etapa-4/                  # Temas 01–04: consultas multitabla (JOINs)
├── sesiones/                     # Scripts SQL organizados por sesión
│   ├── sesion-7/                 # CursoDB — ejercicios de DDL y DML
│   ├── sesion-8/                 # ViajeYA — solución Evidencia 2, Ejercicio 3
│   ├── sesion-9/                 # EscuelaDB — catálogo de técnicas y alumnos
│   └── sesion-10/                # AutoFixDB — taller mecánico con 4 tablas
└── evidencias/                   # Material de evaluación
    ├── Archivos-Evidencia-1/     # Conjuntos de datos y ejemplo resuelto
    ├── Archivos-Evidencia-2/     # Descripción y ejercicios por equipo
    ├── Archivos-Evidencia-3/     # Base de datos RestauranteDB
    └── Archivos-PIA/             # Descripción y ejercicios del PIA por equipo
```

---

## Temas del curso

### Etapa 3 — Fundamentos de SQL

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

### Etapa 4 — Consultas Multitabla

| # | Tema |
|---|------|
| 01 | Diferencia entre consultas simples y combinadas |
| 02 | INNER JOIN |
| 03 | LEFT JOIN y RIGHT JOIN |
| 04 | Ejercicio 1 (EscuelaDB) |

---

## Cómo usar los scripts

1. Abre **SSMS** y conéctate a tu servidor local.
2. Crea o selecciona la base de datos desde el menú desplegable.
3. Abre el archivo `.sql` correspondiente.
4. Ejecuta con **F5** o el botón **Execute**.

> Cada carpeta de sesión incluye un `README.md` con el orden de ejecución de los scripts.

---

## Convenciones del código SQL

- Palabras reservadas en `MAYÚSCULAS` (`SELECT`, `FROM`, `WHERE`)
- Nombres de tablas y columnas en `PascalCase`
- Columnas de llave primaria con prefijo `id` (`idCliente`, `idServicio`)
- Cada script incluye un encabezado con tema, descripción y autor
