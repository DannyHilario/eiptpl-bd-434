# Sesión 3 — Variables y Procedimientos Almacenados

Introduce **variables T-SQL** (`DECLARE`/`SET`), control de flujo con `IF`/`ELSE`, y **procedimientos almacenados** (`CREATE PROCEDURE`/`ALTER PROCEDURE`), practicando sobre **CineDB**, la base de datos usada en la sesión final de Base de Datos I.

---

## Qué se hizo en esta sesión

| # | Archivo | Contenido |
|---|---------|-----------|
| 01 | [`01-variables-control-flujo.sql`](01-variables-control-flujo.sql) | Declaración de variables, `IF`/`ELSE`, y primer llamado a `sp_obtenerNombreCliente` |
| 02 | [`02-sp-obtener-nombre-cliente.sql`](02-sp-obtener-nombre-cliente.sql) | `CREATE PROCEDURE sp_obtenerNombreCliente` |
| 03 | [`03-consultas-insert-pelicula.sql`](03-consultas-insert-pelicula.sql) | Exploración de `Clasificacion`, `Genero`, `Pelicula`, `Funcion`; `INSERT INTO Pelicula`; primer llamado a `sp_insertarPelicula` |
| 04 | [`04-alter-sp-insertar-pelicula-validacion.sql`](04-alter-sp-insertar-pelicula-validacion.sql) | `ALTER PROCEDURE sp_insertarPelicula` con validación de `idClasificacion` inexistente |

---

## Contexto

Esta sesión reutiliza dos tablas de catálogo de CineDB (`Clasificacion`, `Genero`) y dos tablas principales (`Pelicula`, `Funcion`), además de `Cliente` para los ejemplos de variables.

## Prerequisito

Esta sesión **reutiliza** CineDB tal como quedó instalada en Base de Datos I.

- Si ya la tienes instalada, solo selecciona **CineDB** en el dropdown de SSMS.
- Si no la tienes, sigue el paquete de instalación en [`../../../base-datos-1/sesiones/sesion-final/CineDB/instalacion`](../../../base-datos-1/sesiones/sesion-final/CineDB/instalacion).

---

## Contenido de estudio — variables T-SQL

### `DECLARE` — declarar una o varias variables

```sql
DECLARE @Variable1 TipoDato,
        @Variable2 TipoDato
```

### `SET` — asignar un valor

```sql
SET @Variable1 = Valor
```

### `IF` / `ELSE` — control de flujo

```sql
IF Condicion BEGIN

	-- instrucciones si se cumple

END
ELSE BEGIN

	-- instrucciones si no se cumple

END
```

---

## Contenido de estudio — procedimientos almacenados

### `CREATE PROCEDURE` — crear un procedimiento

```sql
CREATE PROCEDURE usp_NombreProcedimiento
	@p_Parametro1 TipoDato,
	@p_Parametro2 TipoDato
AS
BEGIN

	-- instrucciones

END
```

- Los parámetros de entrada se identifican con el prefijo `@p_`.
- Se ejecuta con `EXECUTE usp_NombreProcedimiento Valor1, Valor2`.

### `ALTER PROCEDURE` — modificar un procedimiento existente

```sql
ALTER PROCEDURE usp_NombreProcedimiento
	@p_Parametro1 TipoDato
AS
BEGIN

	-- nueva definición completa del procedimiento

END
```

- A diferencia de `CREATE`, `ALTER` reemplaza la definición de un procedimiento que ya existe, sin necesidad de eliminarlo primero (`DROP`).

### Ejemplos trabajados en esta sesión

- **`sp_obtenerNombreCliente`** ([`02-sp-obtener-nombre-cliente.sql`](02-sp-obtener-nombre-cliente.sql)): dado un `idCliente`, devuelve su nombre completo concatenado, o un mensaje si no existe.
- **`sp_insertarPelicula`** ([`04-alter-sp-insertar-pelicula-validacion.sql`](04-alter-sp-insertar-pelicula-validacion.sql)): valida que el `idClasificacion` recibido exista antes de continuar con el resto de la lógica del procedimiento.

> **Nota de nomenclatura:** el trabajo de clase usa el prefijo `sp_` para los procedimientos. La convención del repositorio (ver [CLAUDE.md](../../../CLAUDE.md)) es `usp_`; se conserva `sp_` aquí porque es el nombre con el que se creó el objeto en la base de datos durante la sesión.

---

## Escenarios para seguir practicando

- Agregar a `sp_insertarPelicula` la misma validación para `idGenero`.
- Hacer que `sp_obtenerNombreCliente` devuelva también el `PrimerApellido` y `SegundoApellido` por separado usando `OUTPUT` parameters.
- Crear un procedimiento `sp_actualizarPrecioFuncion` que reciba `idFuncion` y `NuevoPrecio`, y valide que el precio no sea negativo antes de actualizar.
