# Paquete de instalación - Sesión 7

Este documento describe el orden de ejecución de los scripts SQL de la sesión 7. Todas las tablas quedan en la base de datos **CursoDB**.

---

## Prerequisito

Asegúrate de tener seleccionada la base de datos **CursoDB** en el dropdown de SSMS antes de ejecutar cualquier script (excepto el primero, que crea la base de datos).

---

## Instalación

### Paso 1 — Crear la base de datos

Ejecuta este script **una sola vez**. Si CursoDB ya existe, omítelo.

```
06-Ejercicio-1/instalacion/01-create-database.sql
```

> Después de ejecutarlo, selecciona **CursoDB** en el dropdown de SSMS.

---

### Paso 2 — Ejercicio 1: tabla Alumno

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `06-Ejercicio-1/instalacion/02-create-table-alumno.sql` | Crea la tabla `Alumno` |
| 2 | `06-Ejercicio-1/instalacion/03-insert-data-alumno.sql` | Inserta 30 alumnos de prueba |
| 3 | `06-Ejercicio-1/instalacion/04-consultas.sql` | Consultas de ejemplo sobre `Alumno` |

---

### Paso 3 — Ejercicio 2: modelo Hotel Vista

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `09-Ejercicio-2/instalacion/02-create-tables.sql` | Crea las tablas `TipoHabitacion`, `Habitacion`, `Huesped` y `Reservacion` |
| 2 | `09-Ejercicio-2/instalacion/03-insert-tipohab.sql` | Inserta los tipos de habitación (Sencilla, Doble, Suite) |
| 3 | `09-Ejercicio-2/instalacion/04-insert-habitacion.sql` | Inserta habitaciones con referencia al tipo |
| 4 | `09-Ejercicio-2/instalacion/05-insert-huesped.sql` | Inserta huéspedes ficticios |
| 5 | `09-Ejercicio-2/instalacion/06-insert-reservacion.sql` | Inserta reservaciones con referencia a huésped y habitación |

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

---

## Reversa

Para deshacer todo lo instalado en esta sesión, ejecuta los siguientes scripts **en el orden indicado**. El orden es el inverso al de la instalación: primero se eliminan las tablas con dependencias, luego las independientes, y al final la base de datos.

> Asegúrate de tener seleccionada la base de datos **CursoDB** en el dropdown de SSMS antes de ejecutar los pasos R1 y R2.

### Paso R1 — Reversa Ejercicio 2: tablas Hotel Vista

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `09-Ejercicio-2/reversa/01-drop-tables.sql` | Elimina `Reservacion`, `Huesped`, `Habitacion` y `TipoHabitacion` |

### Paso R2 — Reversa Ejercicio 1: tabla Alumno

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `06-Ejercicio-1/reversa/01-drop-table.sql` | Elimina la tabla `Alumno` |

### Paso R3 — Eliminar la base de datos

> **Antes de ejecutar este script**, selecciona otra base de datos en el dropdown de SSMS (por ejemplo: `master`). No puedes eliminar una base de datos a la que estás conectado.

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `06-Ejercicio-1/reversa/02-drop-database.sql` | Elimina la base de datos `CursoDB` por completo |
