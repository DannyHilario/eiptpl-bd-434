# Base de Datos I y II — Curso continuo

Repositorio del curso de **Base de Datos**, impartido con Microsoft SQL Server en la
Escuela Industrial y Preparatoria Técnica "Pablo Livas" — mismo grupo dando
continuidad al curso a lo largo de dos semestres:

- **Base de Datos I** (`base-datos-1/`) — semestre **Enero-Junio '26**.
- **Base de Datos II** (`base-datos-2/`) — semestre **Agosto-Diciembre '26**.

---

## Estructura del repositorio

```
eiptpl-2026-basededatos/
├── base-datos-1/          # Base de Datos I — semestre Enero-Junio '26
│   ├── temas/             # Apuntes y material teórico por etapa
│   ├── sesiones/          # Scripts SQL organizados por sesión
│   └── evidencias/        # Material de evaluación
└── base-datos-2/          # Base de Datos II — semestre Agosto-Diciembre '26
```

Cada carpeta tiene su propio `README.md` con la estructura de sesiones, temas y
evidencias correspondientes:

- [`base-datos-1/README.md`](base-datos-1/README.md)
- [`base-datos-2/README.md`](base-datos-2/README.md)

Las convenciones de código SQL y el motor objetivo (SQL Server 2019+) son los mismos
para ambos cursos, y el alcance es acumulativo: lo cubierto en Base de Datos I se da
por sabido en Base de Datos II.

---

## Contenido temático

Transcripción informativa del índice del libro de texto oficial (PEMA 2022, UANL).
El temario completo, con el detalle de cada punto, está en
[`base-datos-1/ContenidoTematico.md`](base-datos-1/ContenidoTematico.md) y
[`base-datos-2/ContenidoTematico.md`](base-datos-2/ContenidoTematico.md).

### Base de Datos I (Enero-Junio '26)

- Introducción General
- **Etapa 1 — Panorama general para administrar una base de datos relacional**
  - Introducción a la base de datos
  - Ventajas e inconvenientes de una base de datos
  - Conceptos básicos
  - Definición y componentes de una base de datos relacional
  - Tipos de base de datos: plana y relacional
  - Pasos para diseñar una base de datos
  - Los tres tipos de claves
  - Normalización
  - Tipos de datos
  - Clasificación de los modelos de una base de datos
  - Modelo entidad/relación
  - Cardinalidad (tipo de relaciones)
  - Muchos a muchos (M:M)
- **Etapa 2 — Descripción de los entornos en un SGBD**
  - Gestor de base de datos
  - Lenguaje SQL y Transact-SQL
  - El entorno gráfico SSMS
  - Conectar y desconectar la base de datos
  - Tipos de campos empleados en las bases de datos
  - Crear una nueva tabla (explorador de objetos)
- **Etapa 3 — Sentencia Transact-SQL**
  - Introducción al SQL. Transact-SQL
  - Cláusulas de SQL
  - Renombramiento con alias
- **Etapa 4 — Creación de consultas simples y multitabla**
  - Consultas simples
  - Consultas combinadas
  - Operador de unión — JOIN
  - INNER JOIN
  - OUTER JOIN (combinaciones externas)
  - LEFT JOIN
  - RIGHT JOIN
  - FULL JOIN
- Guía de Aprendizaje

### Base de Datos II (Agosto-Diciembre '26)

- Introducción
- **Etapa 1 — Vistas**
  - Cláusulas SQL
  - Funciones de agregado y escalares
  - Operadores para definir los criterios de consulta
  - Vistas
  - Manipulación de una vista
- **Etapa 2 — Procedimientos almacenados**
  - Procedimientos almacenados
  - Tipos de procedimientos almacenados
  - Crear un procedimiento almacenado
  - Crear y ejecutar un procedimiento almacenado
  - Modificar un procedimiento almacenado
  - Eliminar un procedimiento almacenado
- **Etapa 3 — Funciones y triggers**
  - Funciones SQL
  - Funciones definidas por el usuario
  - Tipos de funciones definidas por el usuario
  - Qué es un trigger SQL
  - Para qué sirve un trigger
  - Cómo crear un trigger SQL
  - Activación y desactivación de triggers
  - Uso de la tabla `Inserted` y `Deleted`
- **Etapa 4 — Introducción a la programación Transact-SQL**
  - Descripción de Transact-SQL para la programación
  - Declaración y asignación de variables
  - Control de flujo T-SQL
  - Sentencia `IF`
  - Sentencia `IF-ELSE`
  - Sentencia `IF EXISTS`
  - Anidamiento de sentencias `IF`/`IF-ELSE`
  - Estructura de control `CASE`
  - `CASE` con `ORDER BY`
  - `CASE` con `GROUP BY`
  - Actualización de datos con `CASE`
  - Inserción de datos con `CASE`
  - Gestión de errores en Transact-SQL
  - Funciones `ERROR_*`
  - Manejo de errores de valor nulo con `TRY CATCH`
  - Transacciones con `TRY CATCH`
  - Manejo de excepciones en procedimientos almacenados
  - `THROW`
- Guía de Aprendizaje

---

## Requisitos

- [SQL Server 2019 o superior](https://www.microsoft.com/es-mx/sql-server/sql-server-downloads) (Express es suficiente)
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms)
