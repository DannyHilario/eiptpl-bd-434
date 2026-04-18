# Paquete de instalación - Sesión 9

Este documento describe el orden de ejecución de los scripts SQL de la sesión 9. Todos los scripts crean la base de datos **EscuelaDB**.

---

## Prerequisito

Asegúrate de tener seleccionada la base de datos **EscuelaDB** en el dropdown de SSMS antes de ejecutar cualquier script (excepto el primero, que crea la base de datos).

---

## Instalación

### Paso 1 — Crear la base de datos

Ejecuta este script **una sola vez**. Si EscuelaDB ya existe, omítelo.

```
04-Ejercicio-1/instalacion/01-create-database.sql
```

> Después de ejecutarlo, selecciona **EscuelaDB** en el dropdown de SSMS.

---

### Paso 2 — Crear las tablas

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `04-Ejercicio-1/instalacion/02-create-tables.sql` | Crea las tablas `Tecnica` y `Alumno` con sus constraints y llave foránea |

---

### Paso 3 — Insertar datos de prueba

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `04-Ejercicio-1/instalacion/03-insert-tecnica.sql` | Inserta las 8 técnicas del catálogo |
| 2 | `04-Ejercicio-1/instalacion/04-insert-alumno.sql` | Inserta 200 alumnos distribuidos en las 8 técnicas |

> El orden importa por la llave foránea: primero técnicas, luego alumnos.

---

## Resumen de tablas en EscuelaDB

| Tabla | Descripción |
|-------|-------------|
| `Tecnica` | Catálogo de carreras técnicas con baja lógica |
| `Alumno` | Alumnos inscritos, cada uno asignado a una técnica |

---

## Reversa

Para deshacer todo lo instalado en esta sesión, ejecuta los siguientes scripts **en el orden indicado**.

> Asegúrate de tener seleccionada la base de datos **EscuelaDB** en el dropdown de SSMS antes de ejecutar el paso R1.

### Paso R1 — Eliminar las tablas

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `04-Ejercicio-1/reversa/01-drop-tables.sql` | Elimina `Alumno` y luego `Tecnica` (en orden inverso a las FK) |

### Paso R2 — Eliminar la base de datos

> **Antes de ejecutar este script**, selecciona otra base de datos en el dropdown (por ejemplo: `master`). No puedes eliminar una base de datos a la que estás conectado.

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `04-Ejercicio-1/reversa/02-drop-database.sql` | Elimina la base de datos `EscuelaDB` por completo |
