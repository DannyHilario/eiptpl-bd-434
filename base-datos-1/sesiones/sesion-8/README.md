# Paquete de instalación — Sesión 8 · ViajeYA

Este documento describe el orden de ejecución de los scripts SQL de la sesión 8. Todos los scripts corresponden a la solución del **Ejercicio 3 (Evidencia 2): ViajeYA**, una agencia de viajes boutique.

---

## Prerequisito

Asegúrate de tener seleccionada la base de datos **ViajeYA** en el dropdown de SSMS antes de ejecutar cualquier script (excepto el primero, que crea la base de datos).

---

## Instalación

### Paso 1 — Crear la base de datos

Ejecuta este script **una sola vez**. Si ViajeYA ya existe, omítelo.

```
solucion-evidencia-2-ejercicio-3/instalacion/01-create-database.sql
```

> Después de ejecutarlo, selecciona **ViajeYA** en el dropdown de SSMS.

---

### Paso 2 — Crear las tablas

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `instalacion/02-tablas.sql` | Crea las tablas `Pais`, `TipoPaquete`, `Cliente`, `Destino` y `Reservacion` con sus constraints y llaves foráneas |

---

### Paso 3 — Insertar datos de prueba

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `instalacion/03-datos.sql` | Inserta 10 registros en cada tabla respetando el orden de las llaves foráneas |

> El orden de inserción dentro del script es: `Pais` → `TipoPaquete` → `Cliente` → `Destino` → `Reservacion`.

---

## Resumen de tablas en ViajeYA

| Tabla | Descripción |
|-------|-------------|
| `Pais` | Catálogo de países destino |
| `TipoPaquete` | Tipos de paquete con su precio vigente |
| `Cliente` | Datos de los clientes de la agencia |
| `Destino` | Combinación de país y tipo de paquete |
| `Reservacion` | Registro de cada reservación, con precio snapshot y total |

---

## Reversa

Para deshacer todo lo instalado, ejecuta los siguientes scripts **en el orden indicado**.

> Asegúrate de tener seleccionada la base de datos **ViajeYA** en el dropdown de SSMS antes de ejecutar el paso R1.

### Paso R1 — Eliminar las tablas

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `reversa/01-drop-tables.sql` | Elimina `Reservacion`, `Destino`, `Cliente`, `TipoPaquete` y `Pais` en orden inverso a las FK |

### Paso R2 — Eliminar la base de datos

> **Antes de ejecutar este script**, selecciona otra base de datos en el dropdown (por ejemplo: `master`). No puedes eliminar una base de datos a la que estás conectado.

| # | Archivo | Descripción |
|---|---------|-------------|
| 1 | `reversa/02-drop-database.sql` | Elimina la base de datos `ViajeYA` por completo |
