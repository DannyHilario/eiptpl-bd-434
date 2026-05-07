# LEFT JOIN y RIGHT JOIN

## ¿Por qué no siempre alcanza el INNER JOIN?

`INNER JOIN` solo devuelve filas donde existe coincidencia en ambas tablas. Cuando se
necesita ver **todos** los registros de una tabla, independientemente de si tienen
relación con la otra, se usa un **outer join**: `LEFT JOIN` o `RIGHT JOIN`.

Ejemplo típico: listar todos los clientes de la base de datos, incluyendo los que aún no
han realizado ningún pedido. Con `INNER JOIN` esos clientes no aparecerían; con
`LEFT JOIN` sí.

---

## LEFT JOIN

Devuelve **todas** las filas de la tabla izquierda (la que se escribe en el `FROM`),
más las filas coincidentes de la tabla derecha. Cuando una fila de la izquierda no tiene
correspondencia en la derecha, las columnas de la derecha aparecen como `NULL`.

```
     Tabla A              Tabla B
   ╔═════════╗          ╔═════════╗
   ║ ░░░░░░░ ║          ║         ║
   ║ ░░░┌───╫──────────╫────┐    ║
   ║ ░░░│░░░║  coincide │    ║
   ║ ░░░└───╫──────────╫────┘    ║
   ║ ░░░░░░░ ║          ║         ║
   ╚═════════╝          ╚═════════╝
   (░ = siempre aparece)
```

### Sintaxis

```sql
SELECT A.columna1, B.columna2
FROM TablaA AS A
LEFT JOIN TablaB AS B ON A.idComun = B.idComun;
```

### Tablas de ejemplo

**Cliente**

| idCliente | NombreCliente    |
|-----------|------------------|
| 1         | Marco García     |
| 2         | Laura Aranda     |
| 3         | Efraín Solano    |
| 4         | Sofia Montemayor |

**Pedido**

| idPedido | idCliente | Factura |
|----------|-----------|---------|
| 234      | 4         | 160.00  |
| 235      | 2         | 48.00   |
| 236      | 3         | 64.00   |
| 237      | 4         | 92.00   |

### Ejemplo 1 — Todos los clientes, con o sin pedidos

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Marco García     | NULL     | NULL    |
| Laura Aranda     | 235      | 48.00   |
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

Marco García **sí aparece**, con `NULL` en las columnas de `Pedido` porque no tiene
pedidos registrados. Todos los clientes de la tabla izquierda están presentes en el
resultado, con o sin coincidencia.

### Ejemplo 2 — Con ORDER BY

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente
ORDER BY C.NombreCliente ASC;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Efraín Solano    | 236      | 64.00   |
| Laura Aranda     | 235      | 48.00   |
| Marco García     | NULL     | NULL    |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

Marco García aparece en el lugar que le corresponde alfabéticamente, con `NULL` en los
campos de pedido.

### Ejemplo 3 — Detectar registros sin relación (IS NULL)

`LEFT JOIN` combinado con `WHERE columna IS NULL` sirve para encontrar filas que no tienen
ningún registro relacionado en la otra tabla: clientes sin pedidos, categorías sin productos,
etc.

```sql
SELECT C.NombreCliente
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE P.idPedido IS NULL;
```

**Resultado:**

| NombreCliente |
|---------------|
| Marco García  |

El filtro `WHERE P.idPedido IS NULL` retiene únicamente las filas donde no hubo
coincidencia en la tabla derecha. La columna usada en el `IS NULL` debe ser la llave
primaria (o cualquier columna `NOT NULL`) de la tabla derecha, para garantizar que el
`NULL` proviene de la ausencia de relación y no de un valor nulo en los datos.

---

## RIGHT JOIN

Es el opuesto de `LEFT JOIN`. Devuelve **todas** las filas de la tabla derecha (la que se
escribe después del `RIGHT JOIN`), más las filas coincidentes de la tabla izquierda. Cuando
una fila de la derecha no tiene correspondencia en la izquierda, las columnas de la
izquierda aparecen como `NULL`.

```
     Tabla A              Tabla B
   ╔═════════╗          ╔═════════╗
   ║         ║          ║ ░░░░░░░ ║
   ║    ┌────╫──────────╫───░░░   ║
   ║    │    ║  coincide ░░░░░    ║
   ║    └────╫──────────╫───░░░   ║
   ║         ║          ║ ░░░░░░░ ║
   ╚═════════╝          ╚═════════╝
                        (░ = siempre aparece)
```

### Sintaxis

```sql
SELECT A.columna1, B.columna2
FROM TablaA AS A
RIGHT JOIN TablaB AS B ON A.idComun = B.idComun;
```

### Tablas de ejemplo

**Empleado**

| idEmpleado | NombreEmpleado | idDepartamento |
|------------|----------------|----------------|
| 1          | Ana            | 1              |
| 2          | Pedro          | 2              |
| 3          | Luis           | NULL           |

**Departamento**

| idDepartamento | Nombre    |
|----------------|-----------|
| 1              | Sistemas  |
| 2              | Finanzas  |
| 3              | Comercial |

### Ejemplo 1 — Todos los departamentos, con o sin empleados

```sql
SELECT D.Nombre AS Departamento, E.NombreEmpleado
FROM Empleado AS E
RIGHT JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento;
```

**Resultado:**

| Departamento | NombreEmpleado |
|--------------|----------------|
| Sistemas     | Ana            |
| Finanzas     | Pedro          |
| Comercial    | NULL           |

El departamento Comercial aparece aunque no tenga ningún empleado asignado. Luis no
aparece porque su `idDepartamento` es `NULL` y no coincide con ningún registro en
`Departamento`.

### Ejemplo 2 — Detectar registros sin relación (IS NULL)

El mismo patrón `IS NULL` funciona con `RIGHT JOIN`, pero ahora se filtra por columnas
de la tabla **izquierda** para encontrar registros de la derecha sin relación:

```sql
SELECT D.Nombre AS Departamento
FROM Empleado AS E
RIGHT JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento
WHERE E.idEmpleado IS NULL;
```

**Resultado:**

| Departamento |
|--------------|
| Comercial    |

Aquí se obtienen los departamentos que no tienen ningún empleado asignado.

---

## LEFT y RIGHT son intercambiables según el orden de las tablas

Cualquier `RIGHT JOIN` puede reescribirse como un `LEFT JOIN` invirtiendo el orden de las
tablas, y el resultado es idéntico. Lo que cambia es únicamente qué tabla se declara
"a la izquierda" y cuál "a la derecha".

```sql
-- Opción A: todos los departamentos con LEFT JOIN
FROM Departamento AS D
LEFT JOIN Empleado AS E ON E.idDepartamento = D.idDepartamento

-- Opción B: mismo resultado con RIGHT JOIN
FROM Empleado AS E
RIGHT JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento
```

Ambas consultas devuelven exactamente el mismo resultado.

### ¿Cuál usar en la práctica?

Por convención, la mayoría de los desarrolladores prefieren `LEFT JOIN` porque es más
natural: "quiero todo lo de la tabla A, más lo que coincida de la B". Para decidir cuál
usar, identifica primero qué tabla debe aparecer completa en el resultado y ponla en el
`FROM` con `LEFT JOIN`.

`RIGHT JOIN` existe y es válido, pero al encadenar varios JOINs puede hacer el código más
difícil de leer.

---

## Comparativa

| Tipo       | Tabla completa         | Filas sin coincidencia        |
|------------|------------------------|-------------------------------|
| LEFT JOIN  | Izquierda (en `FROM`)  | Aparecen con NULL en la derecha |
| RIGHT JOIN | Derecha (tras el `JOIN`) | Aparecen con NULL en la izquierda |

| Pregunta de negocio | JOIN a usar |
|---------------------|-------------|
| Quiero todos los registros de A, tengan o no relación con B | `FROM A LEFT JOIN B` |
| Quiero todos los registros de B, tengan o no relación con A | `FROM A RIGHT JOIN B` o `FROM B LEFT JOIN A` |
| Quiero encontrar registros de A sin ninguna relación en B | `LEFT JOIN` + `WHERE B.id IS NULL` |
| Quiero encontrar registros de B sin ninguna relación en A | `RIGHT JOIN` + `WHERE A.id IS NULL` |
