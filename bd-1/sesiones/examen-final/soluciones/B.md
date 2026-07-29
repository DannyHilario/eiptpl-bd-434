# Solución — Examen Final Versión B

---

## Consulta 1 — Cuentas de tipo Nómina ordenadas por fecha de apertura

**Pregunta:** ¿Qué cuentas de tipo Nómina están registradas en el banco? Muestra el número de cuenta y la fecha de apertura. Ordena de la más antigua a la más reciente.

```sql
SELECT CU.NumeroCuenta, CU.FechaApertura
FROM Cuenta AS CU
WHERE CU.TipoCuenta = 'Nómina'
ORDER BY CU.FechaApertura ASC
```

**Explicación:**

- `WHERE CU.TipoCuenta = 'Nómina'` — filtra las cuentas por su tipo. La tabla `Cuenta` acepta tres valores en esa columna: `'Débito'`, `'Nómina'` y `'Ahorro'`. El texto debe escribirse con acento tal como está almacenado.
- `ORDER BY CU.FechaApertura ASC` — ordena de la fecha más antigua a la más reciente. `ASC` es el orden por defecto, pero escribirlo explícitamente hace la intención más clara. Nota: esta versión pide `ASC`, a diferencia de las versiones A1 y A2 que pedían `DESC`.
- Solo se piden dos columnas en el `SELECT`: `NumeroCuenta` y `FechaApertura`. Incluir columnas adicionales no solicitadas es un error de precisión.

**Diferencia clave con versión A1:** A1 filtra por `Activo = 1` y ordena `DESC`. Esta versión filtra por tipo de cuenta y ordena `ASC`. Leer el enunciado con cuidado determina cuál operador y qué dirección usar.

---

## Consulta 2 — Las 5 transacciones más recientes

**Pregunta:** ¿Cuáles son las 5 transacciones más recientes? Muestra el tipo de transacción, el monto y la fecha.

```sql
SELECT TOP 5 T.TipoTransaccion, T.Monto,
    T.FechaTransaccion
FROM Transaccion AS T
ORDER BY T.FechaTransaccion DESC
```

**Explicación:**

- `SELECT TOP 5` — limita el resultado a 5 filas. En SQL Server, `TOP` actúa sobre las filas ya ordenadas, por eso siempre debe ir acompañado de `ORDER BY`.
- `ORDER BY T.FechaTransaccion DESC` — ordena de la transacción más reciente a la más antigua. `TOP 5` entonces retiene las 5 más recientes. Sin `DESC`, se obtendrían las 5 más antiguas.
- No se necesita `WHERE`: no hay ningún filtro por tipo ni por monto, se quieren todas las transacciones y solo se limita la cantidad de filas devueltas.
- Las tres columnas del `SELECT` son exactamente las que indica el enunciado: `TipoTransaccion`, `Monto` y `FechaTransaccion`. No se pide número de cuenta ni nombre del cliente, por lo tanto no se agrega ningún `JOIN`.

**Error frecuente:** Agregar un `JOIN` con `Cliente` o `Cuenta` no es incorrecto en sí, pero incluir columnas no solicitadas indica que no se leyó el enunciado con precisión.

---

## Consulta 3 — Nombre del cliente y monto de cada transacción

**Pregunta:** Muestra el nombre y apellido paterno del cliente junto con el monto de cada transacción que realizó. Ordena por apellido paterno.

```sql
SELECT C.Nombre, C.PrimerApellido,
    T.Monto
FROM Transaccion AS T
    INNER JOIN Cliente AS C ON C.idCliente = T.idCliente
ORDER BY C.PrimerApellido
```

**Explicación:**

- `FROM Transaccion AS T` — la tabla principal es `Transaccion` porque contiene el monto de cada movimiento.
- `INNER JOIN Cliente AS C ON C.idCliente = T.idCliente` — la tabla `Transaccion` guarda `idCliente`, pero no el nombre. El `INNER JOIN` conecta `Cliente` para poder mostrar `Nombre` y `PrimerApellido`. Solo aparecen las transacciones que tienen un cliente registrado.
- No se necesita `JOIN` con `Cuenta` porque el enunciado no pide el número de cuenta.
- `ORDER BY C.PrimerApellido` — ordena alfabéticamente por apellido paterno en sentido ascendente.

**Por qué solo 2 tablas:** Esta es la consulta de menor complejidad del examen. A diferencia de las versiones A1, A2 y A3 que pedían también el número de cuenta (y requerían un tercer `JOIN` con `Cuenta`), esta versión solo pide datos de dos tablas: el monto viene de `Transaccion` y el nombre viene de `Cliente`.
