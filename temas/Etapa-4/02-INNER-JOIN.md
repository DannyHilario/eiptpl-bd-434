# INNER JOIN

## ¿Qué es?

`INNER JOIN` es el tipo de combinación más común. Devuelve únicamente las filas donde
existe una coincidencia en **ambas** tablas. Si una fila de la tabla A no tiene
correspondencia en la tabla B, esa fila no aparece en el resultado, y viceversa.

El resultado es la **intersección** de los dos conjuntos.

```
     Tabla A              Tabla B
   ╔═════════╗          ╔═════════╗
   ║         ║          ║         ║
   ║    ┌────╫──────────╫────┐    ║
   ║    │    ║  RESULTADO    │    ║
   ║    │    ║  (solo match) │    ║
   ║    └────╫──────────╫────┘    ║
   ║         ║          ║         ║
   ╚═════════╝          ╚═════════╝
```

---

## Sintaxis

```sql
SELECT A.columna1, B.columna2
FROM TablaA AS A
INNER JOIN TablaB AS B ON A.idComun = B.idComun;
```

Puntos importantes:
- Se recomienda siempre usar **alias** (`AS A`, `AS B`) para acortar las referencias a columnas.
- Cuando dos tablas tienen columnas con el mismo nombre, es **obligatorio** calificarlas
  con el alias: `A.idCliente`, no solo `idCliente`.
- En T-SQL, escribir solo `JOIN` equivale a `INNER JOIN`. Se recomienda escribir el tipo
  completo para mayor claridad.

---

## Tablas de ejemplo

Estas tablas se usarán en los ejemplos siguientes:

**Cliente**

| idCliente | NombreCliente    | Contacto   |
|-----------|------------------|------------|
| 1         | Marco García     | 8115623890 |
| 2         | Laura Aranda     | 8153322210 |
| 3         | Efraín Solano    | 8189826350 |
| 4         | Sofia Montemayor | 8124367730 |

**Pedido**

| idPedido | idCliente | Factura |
|----------|-----------|---------|
| 234      | 4         | 160.00  |
| 235      | 2         | 48.00   |
| 236      | 3         | 64.00   |
| 237      | 4         | 92.00   |

La relación entre ellas es `Cliente.idCliente = Pedido.idCliente`.
El cliente con `idCliente = 1` (Marco García) no tiene ningún pedido registrado.

---

## Ejemplo 1 — Clientes con sus pedidos

Obtener el nombre del cliente junto con los datos de sus pedidos:

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Laura Aranda     | 235      | 48.00   |
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

Marco García **no aparece** porque no tiene ningún pedido registrado. Ese es el
comportamiento clave del `INNER JOIN`: si no hay coincidencia en alguno de los dos lados,
la fila se excluye del resultado.

Sofia Montemayor aparece dos veces porque tiene dos pedidos: uno por cada fila en `Pedido`
que coincide con su `idCliente`.

---

## Ejemplo 2 — Empleados y departamentos

**Empleado**

| NombreEmpleado | idDepartamento |
|----------------|----------------|
| Carlos         | 31             |
| Juan           | 33             |
| Héctor         | 33             |
| Robin          | 34             |
| Smith          | 34             |
| Williams       | NULL           |

**Departamento**

| idDepartamento | Nombre        |
|----------------|---------------|
| 31             | Ventas        |
| 33             | Ingeniería    |
| 34             | Comercial     |
| 35             | Mercadotecnia |

Listar empleados con el nombre de su departamento:

```sql
SELECT E.NombreEmpleado, E.idDepartamento, D.Nombre AS NombreDepartamento
FROM Empleado AS E
INNER JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento;
```

**Resultado:**

| NombreEmpleado | idDepartamento | NombreDepartamento |
|----------------|----------------|--------------------|
| Carlos         | 31             | Ventas             |
| Juan           | 33             | Ingeniería         |
| Héctor         | 33             | Ingeniería         |
| Robin          | 34             | Comercial          |
| Smith          | 34             | Comercial          |

- **Williams** no aparece: su `idDepartamento` es `NULL`, no tiene coincidencia en `Departamento`.
- **Mercadotecnia** no aparece: ningún empleado tiene `idDepartamento = 35`.

Esto ilustra que `INNER JOIN` excluye tanto las filas sin coincidencia de la tabla izquierda
como las de la tabla derecha.

---

## Ejemplo 3 — Tres tablas encadenadas

Es posible encadenar más de dos tablas agregando un `INNER JOIN` por cada tabla adicional:

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura, E.NombreEmpleado AS Vendedor
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
INNER JOIN Empleado AS E ON P.idEmpleado = E.idEmpleado;
```

Cada `JOIN` agrega una tabla más a la combinación. El motor construye el resultado
aplicando las condiciones de izquierda a derecha.

---

## Combinar INNER JOIN con otras cláusulas

`INNER JOIN` se puede combinar con todas las cláusulas del `SELECT`:

### Con WHERE

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE P.Factura > 60;
```

### Con ORDER BY

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
ORDER BY C.NombreCliente ASC, P.Factura DESC;
```

### Con GROUP BY y funciones de agregado

```sql
SELECT C.NombreCliente,
       COUNT(P.idPedido) AS TotalPedidos,
       SUM(P.Factura) AS Facturacion
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
GROUP BY C.NombreCliente;
```

**Resultado:**

| NombreCliente    | TotalPedidos | Facturacion |
|------------------|:------------:|:-----------:|
| Efraín Solano    | 1            | 64.00       |
| Laura Aranda     | 1            | 48.00       |
| Sofia Montemayor | 2            | 252.00      |

### Con HAVING

```sql
SELECT C.NombreCliente, COUNT(P.idPedido) AS TotalPedidos
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
GROUP BY C.NombreCliente
HAVING COUNT(P.idPedido) > 1;
```

**Resultado:**

| NombreCliente    | TotalPedidos |
|------------------|:------------:|
| Sofia Montemayor | 2            |

---

## Resumen

- `INNER JOIN` devuelve solo las filas con coincidencia en ambas tablas.
- Las filas sin coincidencia (en cualquiera de los dos lados) quedan fuera del resultado.
- Se pueden encadenar múltiples `INNER JOIN` para combinar tres o más tablas.
- Se combina normalmente con `WHERE`, `ORDER BY`, `GROUP BY` y `HAVING`.
