# Solución — 2da Oportunidad de Base de Datos I

---

## SECCIÓN A — TEORÍA

---

### Pregunta 1 — Respuesta: B

> SQL Server rechaza la inserción con un error de integridad referencial, ya que `idCliente` en `Vehiculo` es una llave foránea que debe apuntar a un registro existente en `Cliente`.

**Fundamento:**

La columna `idCliente` en `Vehiculo` está definida como llave foránea (FK) que referencia a `Cliente(idCliente)`. Esto significa que SQL Server valida, en el momento del INSERT, que el valor proporcionado exista como llave primaria en la tabla referenciada.

Como no existe ningún cliente con `idCliente = 999`, SQL Server lanza el siguiente error y rechaza la operación:

```
The INSERT statement conflicted with the FOREIGN KEY constraint
"fk_Servicio_Vehiculo". The conflict occurred in database "AutoFixDB",
table "dbo.Cliente", column 'idCliente'.
```

Las opciones incorrectas:
- **A)** Es falsa: que `idCliente` no sea PK de `Vehiculo` no le quita su condición de FK. La restricción aplica igual.
- **C)** Es falsa: SQL Server no convierte valores a NULL automáticamente. Solo lo haría si la columna admitiera NULL y no tuviera FK, pero aquí tiene ambas restricciones.
- **D)** Es falsa: SQL Server nunca crea registros en otras tablas de forma implícita.

---

### Pregunta 2 — Respuesta: B

> No. La llave foránea garantiza que cada servicio apunte a un vehículo que existe, pero un vehículo puede existir sin tener ningún servicio registrado.

**Fundamento:**

La llave foránea es una restricción **unidireccional**: protege la integridad del lado "hijo" (la tabla que contiene la FK), no del lado "padre".

- `Servicio.idVehiculo` FK → `Vehiculo.idVehiculo` significa: *"cada servicio debe apuntar a un vehículo que exista"*.
- No significa lo contrario: *"cada vehículo debe tener al menos un servicio"*.

Un vehículo recién registrado, o uno que nunca entró al taller, tendrá cero filas en `Servicio`. Eso es válido y común. Para detectar esos casos se usa `LEFT JOIN + WHERE IS NULL`, que es precisamente lo que se pide en la Consulta 3 de la Sección B.

Las opciones incorrectas:
- **A)** Es falsa: la FK no "obliga" al padre a tener hijos.
- **C)** Es falsa: `NOT NULL` en `idVehiculo` (dentro de `Servicio`) solo garantiza que el campo no quede vacío al insertar un servicio; no crea obligación en `Vehiculo`.
- **D)** Es falsa: `idVehiculo` en `Servicio` es la FK, no la PK. La PK es `idServicio`.

---

### Pregunta 3 — Respuesta: B

> SQL Server rechaza la inserción con un error porque `NOT NULL` no permite omitir ese campo.

**Fundamento:**

La restricción `NOT NULL` en una columna significa que la columna **siempre debe recibir un valor**. Si se omite en el INSERT y la columna no tiene valor DEFAULT, SQL Server lanza un error:

```
Cannot insert the value NULL into column 'Nombre', table 'EscuelaDB.dbo.Alumno';
column does not allow nulls. INSERT fails.
```

Las opciones incorrectas:
- **A)** Es falsa: "vacío" no es lo mismo que NULL, pero de cualquier modo la columna no puede quedar NULL; SQL Server no permite la inserción.
- **C)** Es falsa: SQL Server no hace inferencia de valores entre columnas. No existe ningún mecanismo que copie `PrimerApellido` a `Nombre` automáticamente.
- **D)** Es falsa: `NOT NULL` aplica en cualquier operación DML (INSERT, UPDATE); no tiene relación con SELECT.

---

### Pregunta 4 — Respuesta: B

> En `Alumno`, porque es la tabla que contiene el campo que apunta a un registro de otra tabla.

**Fundamento:**

La llave foránea **siempre vive en la tabla "hijo"** (la dependiente), que es la que necesita referenciar a la tabla "padre".

En este caso:
- `Tecnica` es la tabla padre: define el catálogo de técnicas disponibles.
- `Alumno` es la tabla hijo: cada alumno pertenece a una técnica.
- `Alumno.idTecnica` es la FK porque es el campo que almacena el identificador de la técnica a la que pertenece ese alumno.

Regla práctica: la FK está en la tabla que tiene la cardinalidad "muchos" de la relación. Muchos alumnos → una técnica.

Las opciones incorrectas:
- **A)** Es falsa: `Tecnica` es la tabla referenciada (padre), no la que contiene la FK.
- **C)** Es falsa: en una relación 1:N estándar, la FK está solo en la tabla hijo.
- **D)** Es falsa: `idTecnica` en `Alumno` no es PK; la PK de `Alumno` es `idAlumno`.

---

### Pregunta 5 — Respuesta: B

> PK: `idServicio` / FK: `idVehiculo`, `idTipoServicio`

**Fundamento:**

Leyendo el DDL:

```sql
idServicio INT NOT NULL IDENTITY(1,1) PRIMARY KEY   -- PK explícita
...
CONSTRAINT fk_Servicio_Vehiculo
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo)      -- FK 1
CONSTRAINT fk_Servicio_TipoServicio
    FOREIGN KEY (idTipoServicio) REFERENCES TipoServicio(idTipoServicio)  -- FK 2
```

- `PRIMARY KEY` en `idServicio` → es la PK.
- Las cláusulas `FOREIGN KEY` nombran explícitamente `idVehiculo` e `idTipoServicio` → son las FK.

Las opciones incorrectas mezclan los roles de las columnas. Ninguna otra columna (`FechaIngreso`, `CostoServicio`) tiene restricción de clave.

---

## SECCIÓN B — PRÁCTICA

---

### Consulta 1 — 15 puntos

**Enunciado:** Platillos con precio actual mayor a $38.00, ordenados de mayor a menor precio.

```sql
SELECT idPlatillo, Nombre, Precio
FROM Platillo
WHERE Precio > 38.00
ORDER BY Precio DESC
```

**Explicación:**

- `FROM Platillo` — el precio vigente está en el catálogo `Platillo`, no en `Servicio`.
- `WHERE Precio > 38.00` — filtra los que superan el umbral. `>` excluye el valor exacto 38.00 (tacos de bistec quedan fuera).
- `ORDER BY Precio DESC` — de mayor a menor.

**Resultado esperado (6 filas):**

| idPlatillo | Nombre | Precio |
|------------|--------|--------|
| 5 | Milanesa de res | 48.00 |
| 1 | Pozole rojo | 45.00 |
| 9 | Chile relleno | 44.00 |
| 4 | Arroz con pollo | 42.00 |
| 2 | Enchiladas verdes | 40.00 |
| 3 | Tacos de bistec | 38.00 |

> **Nota:** Tacos de bistec tiene precio 38.00 exacto y la condición es `> 38.00`, por lo que **no** aparece en el resultado correcto.

---

### Consulta 2 — 15 puntos

**Enunciado:** Servicios de mayo 2026 con nombre del empleado, apellido, platillo consumido y precio cobrado. Ordenado por apellido paterno.

```sql
SELECT s.idServicio, e.Nombre, e.PrimerApellido, p.Nombre AS Platillo, s.Precio
FROM Servicio s
INNER JOIN Empleado e ON s.idEmpleado = e.idEmpleado
INNER JOIN Platillo p ON s.idPlatillo = p.idPlatillo
WHERE MONTH(s.FechaServicio) = 5
  AND YEAR(s.FechaServicio) = 2026
ORDER BY e.PrimerApellido ASC
```

**Explicación:**

- Se necesitan tres tablas: `Servicio` (hechos), `Empleado` (nombre/apellido), `Platillo` (nombre del platillo). Se unen con `INNER JOIN`.
- `s.Precio` — se usa el precio de `Servicio`, no de `Platillo`, porque el enunciado pide el precio cobrado en ese servicio (precio histórico).
- `MONTH()` y `YEAR()` — funciones de fecha vistas en clase para filtrar por mes y año específicos.
- El alias `AS Platillo` evita ambigüedad: tanto `Empleado` como `Platillo` tienen una columna llamada `Nombre`.

---

### Consulta 3 — 20 puntos

**Enunciado:** Empleados que no han consumido ningún platillo. Nombre, apellido paterno y departamento. Ordenado por `idEmpleado` ASC.

```sql
SELECT e.idEmpleado, e.Nombre, e.PrimerApellido, e.Departamento
FROM Empleado e
LEFT JOIN Servicio s ON e.idEmpleado = s.idEmpleado
WHERE s.idEmpleado IS NULL
ORDER BY e.idEmpleado ASC
```

**Explicación:**

Este es el patrón **LEFT JOIN + IS NULL** para detectar registros sin correspondencia:

1. `LEFT JOIN` — incluye **todos** los empleados, tengan o no servicios.
2. Para empleados sin servicios, las columnas de `Servicio` quedan en `NULL`.
3. `WHERE s.idEmpleado IS NULL` — filtra solo los que no tienen ningún servicio.

¿Por qué no se puede usar `INNER JOIN`? Porque `INNER JOIN` excluye precisamente los registros sin correspondencia, que son los que se quiere mostrar.

**Resultado esperado (3 filas):**

| idEmpleado | Nombre | PrimerApellido | Departamento |
|------------|--------|----------------|--------------|
| 23 | Jonathan | Ortiz | Calidad |
| 24 | Pamela | Cruz | Calidad |
| 25 | Miguel | Ríos | Ventas |

