# Paquete de instalación - Sesión 7

Este documento describe el orden de ejecución de los scripts SQL de la sesión 7. Todas las tablas quedan en la base de datos **CursoDB**.

---

## Prerequisito

Asegúrate de tener seleccionada la base de datos **CursoDB** en el dropdown de SSMS antes de ejecutar cualquier script (excepto el primero, que crea la base de datos).

---

## Paso 1 — Crear la base de datos

Ejecuta este script **una sola vez**. Si CursoDB ya existe, omítelo.

```
sesion-7/06-Ejercicio-1/01-create-database.sql
```

> Después de ejecutarlo, selecciona **CursoDB** en el dropdown de SSMS.

---

## Paso 2 — Ejercicio 1: tabla Alumno

Ejecuta los scripts en este orden:

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `sesion-7/06-Ejercicio-1/02-create-table-alumno.sql` | Crea la tabla `Alumno` |
| 2 | `sesion-7/06-Ejercicio-1/03-insert-data-alumno.sql` | Inserta 30 alumnos de prueba |
| 3 | `sesion-7/06-Ejercicio-1/04-consultas.sql` | Consultas de ejemplo sobre `Alumno` |

---

## Paso 3 — Ejercicio 2: modelo Hotel Vista

Ejecuta los scripts en este orden:

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `sesion-7/09-Ejercicio-2/02-create-tables.sql` | Crea las tablas `TipoHabitacion`, `Habitacion`, `Huesped` y `Reservacion` |
| 2 | `sesion-7/09-Ejercicio-2/03-insert-tipohab.sql` | Inserta los tipos de habitación (Sencilla, Doble, Suite) |
| 3 | `sesion-7/09-Ejercicio-2/04-insert-habitacion.sql` | Inserta habitaciones con referencia al tipo |
| 4 | `sesion-7/09-Ejercicio-2/05-insert-huesped.sql` | Inserta huéspedes ficticios |
| 5 | `sesion-7/09-Ejercicio-2/06-insert-reservacion.sql` | Inserta reservaciones con referencia a huésped y habitación |

> El orden importa por las llaves foráneas: primero tipos, luego habitaciones, luego huéspedes, y al final reservaciones.

---

## Resumen de tablas en CursoDB

| Tabla | Ejercicio |
|-------|-----------|
| `Alumno` | Ejercicio 1 |
| `TipoHabitacion` | Ejercicio 2 |
| `Habitacion` | Ejercicio 2 |
| `Huesped` | Ejercicio 2 |
| `Reservacion` | Ejercicio 2 |
