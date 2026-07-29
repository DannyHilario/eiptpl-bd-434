# INNER JOIN

## ¿Qué es?

Las bases de datos relacionales distribuyen la información en múltiples tablas para evitar
la repetición de datos. Un `SELECT` simple solo puede leer una tabla a la vez. `INNER JOIN`
es la instrucción que permite **combinar dos o más tablas en una sola consulta**, uniendo
sus filas según una columna en común.

`INNER JOIN` devuelve únicamente las filas donde existe una coincidencia en **ambas** tablas.
Si una fila de la tabla A no tiene correspondencia en la tabla B, esa fila no aparece en el
resultado, y viceversa.

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

La cláusula `ON` especifica la condición de combinación: qué columna de la tabla A debe
coincidir con qué columna de la tabla B. Generalmente es la llave foránea de una tabla
apuntando a la llave primaria de la otra.

En T-SQL, escribir solo `JOIN` equivale a `INNER JOIN`. Se recomienda escribir el tipo
completo para mayor claridad.

---

## Alias en consultas multitabla

Cuando se trabaja con más de una tabla, los **alias** son prácticamente obligatorios. Se
declaran después del nombre de la tabla con la palabra `AS`:

```sql
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
```

El alias `C` representa a `Cliente` y `P` a `Pedido`. A partir de ese momento, todas las
columnas deben calificarse con el alias de la tabla a la que pertenecen:
`C.NombreCliente`, `P.Factura`, etc.

Esto es indispensable cuando dos tablas tienen columnas con el mismo nombre. Sin el alias,
SQL Server no sabría a cuál tabla pertenece la columna y lanzaría un error de ambigüedad.

También se puede usar `AS` para renombrar columnas en el resultado:

```sql
SELECT C.NombreCliente AS Cliente,
       P.Factura AS Total
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

---

## Tablas de ejemplo

Estas tablas se usarán en los ejemplos 1 y 2:

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

| idEmpleado | NombreEmpleado | idDepartamento |
|------------|----------------|----------------|
| 1          | Carlos         | 31             |
| 2          | Juan           | 33             |
| 3          | Héctor         | 33             |
| 4          | Robin          | 34             |
| 5          | Smith          | 34             |
| 6          | Williams       | NULL           |

**Departamento**

| idDepartamento | Nombre        |
|----------------|---------------|
| 31             | Ventas        |
| 33             | Ingeniería    |
| 34             | Comercial     |
| 35             | Mercadotecnia |

Listar empleados con el nombre de su departamento:

```sql
SELECT E.NombreEmpleado, D.Nombre AS Departamento
FROM Empleado AS E
INNER JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento;
```

**Resultado:**

| NombreEmpleado | Departamento |
|----------------|--------------|
| Carlos         | Ventas       |
| Juan           | Ingeniería   |
| Héctor         | Ingeniería   |
| Robin          | Comercial    |
| Smith          | Comercial    |

Dos puntos clave:
- **Williams** no aparece: su `idDepartamento` es `NULL`, no tiene coincidencia en
  `Departamento`.
- **Mercadotecnia** no aparece: ningún empleado tiene `idDepartamento = 35`.

`INNER JOIN` excluye tanto las filas sin coincidencia de la tabla izquierda como las de
la tabla derecha.

---

## Ejemplo 3 — Tres tablas encadenadas

Es posible encadenar más de dos tablas agregando un `INNER JOIN` por cada tabla adicional.
Cada `JOIN` une el resultado anterior con la siguiente tabla a través de su columna en común.

Para este ejemplo se usan tres tablas:

**Categoria**

| idCategoria | Nombre      |
|-------------|-------------|
| 1           | Electrónica |
| 2           | Ropa        |
| 3           | Hogar       |

**Producto**

| idProducto | idCategoria | Nombre    | Precio |
|------------|-------------|-----------|--------|
| 10         | 1           | Audífonos | 850.00 |
| 11         | 1           | Teclado   | 650.00 |
| 12         | 2           | Playera   | 320.00 |
| 13         | 3           | Lámpara   | 480.00 |

**DetallePedido**

| idDetalle | idPedido | idProducto | Cantidad |
|-----------|----------|------------|----------|
| 1         | 234      | 10         | 2        |
| 2         | 235      | 12         | 1        |
| 3         | 236      | 11         | 3        |
| 4         | 237      | 13         | 1        |

Mostrar cada pedido con el nombre del cliente, el producto comprado y su categoría:

```sql
SELECT C.NombreCliente, P.idPedido,
       PR.Nombre AS Producto, CA.Nombre AS Categoria,
       DP.Cantidad
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
INNER JOIN DetallePedido AS DP ON P.idPedido = DP.idPedido
INNER JOIN Producto AS PR ON DP.idProducto = PR.idProducto
INNER JOIN Categoria AS CA ON PR.idCategoria = CA.idCategoria;
```

**Resultado:**

| NombreCliente    | idPedido | Producto  | Categoria   | Cantidad |
|------------------|----------|-----------|-------------|----------|
| Sofia Montemayor | 234      | Audífonos | Electrónica | 2        |
| Laura Aranda     | 235      | Playera   | Ropa        | 1        |
| Efraín Solano    | 236      | Teclado   | Electrónica | 3        |
| Sofia Montemayor | 237      | Lámpara   | Hogar       | 1        |

El motor construye el resultado aplicando las condiciones de izquierda a derecha: primero
une `Cliente` con `Pedido`, luego agrega `DetallePedido`, luego `Producto` y finalmente
`Categoria`.

---

## Combinar INNER JOIN con WHERE y ORDER BY

### Con WHERE

El filtro `WHERE` se aplica después del JOIN, sobre el resultado combinado. Puede usar
columnas de cualquiera de las tablas involucradas.

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE P.Factura > 60;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

Laura Aranda queda fuera porque su único pedido es de $48.00, que no cumple la condición.

### Con ORDER BY

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
ORDER BY C.NombreCliente ASC, P.Factura DESC;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Efraín Solano    | 236      | 64.00   |
| Laura Aranda     | 235      | 48.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

### Con WHERE y ORDER BY combinados

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE P.Factura > 60
ORDER BY P.Factura DESC;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |
| Efraín Solano    | 236      | 64.00   |

---

## Errores comunes

### Olvidar calificar columnas con el alias

Si dos tablas tienen una columna con el mismo nombre y se escribe sin alias, SQL Server no
sabe a cuál de las dos se refiere y lanza un error.

```sql
-- INCORRECTO: idCliente existe en ambas tablas, SQL Server no sabe cuál usar
SELECT idCliente, NombreCliente, Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;

-- CORRECTO
SELECT C.idCliente, C.NombreCliente, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

### Escribir mal la condición del ON

La condición `ON` debe conectar la llave foránea de una tabla con la llave primaria de la
otra. Usar la columna incorrecta produce resultados erróneos o vacíos sin ningún mensaje
de error.

```sql
-- INCORRECTO: conecta idPedido con idCliente, no tiene sentido
INNER JOIN Pedido AS P ON C.idCliente = P.idPedido

-- CORRECTO: conecta el idCliente del pedido con el idCliente del cliente
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
```

---

## Resumen

- `INNER JOIN` combina filas de dos tablas donde existe coincidencia en la columna del `ON`.
- Las filas sin coincidencia en cualquiera de los dos lados quedan fuera del resultado.
- Los alias (`AS C`, `AS P`) son prácticamente obligatorios y deben usarse para calificar
  todas las columnas en la consulta.
- Se pueden encadenar múltiples `INNER JOIN` para combinar tres o más tablas.
- Se combina con `WHERE` para filtrar el resultado y con `ORDER BY` para ordenarlo.
