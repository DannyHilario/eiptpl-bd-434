# 2da Oportunidad de Base de Datos I

Matrícula:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grupo: 434

---

**Instrucciones:**

- La sección teórica se responde en este documento (encierra con un círculo la letra correcta).
- Para la sección práctica, ejecuta en orden los scripts de instalación de **ComedorDB** proporcionados por el profesor, luego selecciónala en el dropdown de SSMS.
- Escribe cada consulta en una pestaña nueva de SSMS. No uses funciones, cláusulas ni sintaxis que no se hayan visto en clase.
- El examen es individual. Cualquier copia anula ambos exámenes.

---

## SECCIÓN A — TEORÍA (50 puntos)

---

**Pregunta 1 — 10 puntos**

Considera el modelo de **AutoFixDB** (sesión 10):

| Tabla | Columnas |
|-------|----------|
| `Cliente` | **idCliente** (PK), PrimerApellido, Nombre, Activo |
| `Vehiculo` | **idVehiculo** (PK), idCliente (FK), Marca, Modelo, Anio, Activo |

Un estudiante ejecuta el siguiente INSERT:

```sql
INSERT INTO Vehiculo (idCliente, Marca, Modelo, Anio, Activo)
VALUES (999, 'Toyota', 'Corolla', 2020, 1)
```

No existe ningún cliente con `idCliente = 999`. ¿Qué ocurre?

**A)** El registro se inserta correctamente porque `idCliente` no es la llave primaria de `Vehiculo`.

**B)** SQL Server rechaza la inserción con un error de integridad referencial, ya que `idCliente` en `Vehiculo` es una llave foránea que debe apuntar a un registro existente en `Cliente`.

**C)** El campo `idCliente` queda en `NULL` automáticamente y el registro se inserta.

**D)** El registro se inserta, pero SQL Server crea automáticamente un cliente con `idCliente = 999` en `Cliente`.

---

**Pregunta 2 — 10 puntos**

Un compañero afirma: *"Como `Servicio.idVehiculo` es llave foránea que referencia a `Vehiculo`, es imposible que exista un vehículo sin ningún servicio registrado."* ¿Es correcta esta afirmación?

**A)** Sí. La llave foránea obliga a que cada vehículo tenga al menos un servicio asociado.

**B)** No. La llave foránea garantiza que cada servicio apunte a un vehículo que existe, pero un vehículo puede existir sin tener ningún servicio registrado.

**C)** Sí. La restricción `NOT NULL` en `idVehiculo` garantiza correspondencia en ambas direcciones.

**D)** No. `idVehiculo` dentro de `Servicio` es en realidad la llave primaria de esa tabla.

---

**Pregunta 3 — 10 puntos**

En **EscuelaDB** (sesión 9), un estudiante intenta insertar un alumno:

```sql
INSERT INTO Alumno (idTecnica, PrimerApellido, Sexo, FechaNacimiento)
VALUES (2, 'Morales', 'F', '2008-05-10')
```

La columna `Nombre` tiene restricción `NOT NULL` y no se incluyó en el INSERT. ¿Qué ocurre?

**A)** El registro se inserta y el campo `Nombre` queda vacío.

**B)** SQL Server rechaza la inserción con un error porque `NOT NULL` no permite omitir ese campo.

**C)** El campo `Nombre` toma automáticamente el valor de `PrimerApellido`.

**D)** El registro se inserta correctamente; `NOT NULL` solo aplica en consultas SELECT.

---

**Pregunta 4 — 10 puntos**

En **EscuelaDB** (sesión 9), la tabla `Alumno` tiene el campo `idTecnica` que referencia a la tabla `Tecnica`. ¿En cuál de las dos tablas se encuentra la llave foránea (FK)?

**A)** En `Tecnica`, porque es la tabla principal de la que dependen los demás datos.

**B)** En `Alumno`, porque es la tabla que contiene el campo que apunta a un registro de otra tabla.

**C)** En ambas tablas, ya que las llaves foráneas siempre deben estar en los dos lados de una relación.

**D)** En ninguna; `idTecnica` en `Alumno` funciona como una segunda llave primaria.

---

**Pregunta 5 — 10 puntos**

Observa este fragmento de la instalación de **AutoFixDB**:

```sql
CREATE TABLE Servicio (
    idServicio     INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idVehiculo     INT           NOT NULL,
    idTipoServicio INT           NOT NULL,
    FechaIngreso   DATE          NOT NULL,
    CostoServicio  DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_Servicio_Vehiculo
        FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo),
    CONSTRAINT fk_Servicio_TipoServicio
        FOREIGN KEY (idTipoServicio) REFERENCES TipoServicio(idTipoServicio)
)
```

¿Cuál es la llave primaria (PK) y cuáles son las llaves foráneas (FK) de la tabla `Servicio`?

**A)** PK: `idVehiculo` / FK: `idServicio`, `idTipoServicio`

**B)** PK: `idServicio` / FK: `idVehiculo`, `idTipoServicio`

**C)** PK: `idServicio` / FK: `CostoServicio`, `FechaIngreso`

**D)** PK: `idTipoServicio` / FK: `idServicio`, `idVehiculo`

---

## SECCIÓN B — PRÁCTICA (50 puntos)

El modelo de **ComedorDB**:

| Tabla | Columnas |
|-------|----------|
| `Empleado` | idEmpleado, PrimerApellido, SegundoApellido, Nombre, Departamento, CURP, Sexo, FechaNacimiento |
| `Platillo` | idPlatillo, Nombre, Descripcion, Precio |
| `Servicio` | idServicio, idEmpleado (FK), idPlatillo (FK), FechaServicio, Precio |

---

**Consulta 1 — 15 puntos**

¿Qué platillos del comedor tienen actualmente un precio mayor a $38.00?
Muestra el nombre del platillo y su precio vigente.
Ordena los resultados de mayor a menor precio.

*Los siguientes son solo los 2 primeros registros del resultado esperado — tu consulta debe devolver más filas.*

| idPlatillo | Nombre | Precio |
|------------|--------|--------|
| 5 | Milanesa de res | 48.00 |
| 1 | Pozole rojo | 45.00 |

---

**Consulta 2 — 15 puntos**

Genera un reporte de todos los servicios registrados durante el mes de **mayo de 2026**.
Muestra el nombre del empleado, su apellido paterno, el nombre del platillo que consumió
y el precio que se le cobró en ese servicio.
Ordena los resultados por apellido paterno del empleado.

*Los siguientes son solo los 2 primeros registros del resultado esperado — tu consulta debe devolver más filas.*

| idServicio | Nombre | PrimerApellido | Platillo | Precio |
|------------|--------|----------------|----------|--------|
| 42 | Vanessa | Aguilar | Arroz con pollo | 42.00 |
| 31 | Carlos | García | Pozole rojo | 45.00 |

---

**Consulta 3 — 20 puntos**

¿Qué empleados **no han consumido ningún platillo** en el comedor?
Muestra su nombre, apellido paterno y departamento.
Ordena los resultados por idEmpleado de menor a mayor.

*Los siguientes son solo los 2 primeros registros del resultado esperado — tu consulta debe devolver más filas.*

| idEmpleado | Nombre | PrimerApellido | Departamento |
|------------|--------|----------------|--------------|
| 23 | Jonathan | Ortiz | Calidad |
| 24 | Pamela | Cruz | Calidad |
