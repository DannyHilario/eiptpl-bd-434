# Consultas Simples y Multitablas

## ¿Qué es una consulta simple?

Una consulta simple recupera datos de **una sola tabla**. El resultado de un `SELECT` es
una tabla lógica en memoria: tiene filas y columnas igual que cualquier tabla de la base de
datos, pero se descarta al terminar la ejecución. Cada vez que se ejecuta la consulta, el
resultado se recalcula desde cero.

En la Etapa 3 se cubrieron los fundamentos de `SELECT`, `WHERE` y `ORDER BY`. Esta etapa
parte de esa base y agrega las **consultas multitabla**, que permiten combinar datos
distribuidos en más de una tabla.

---

## Consultas multitabla — el concepto

Una de las propiedades clave de las bases de datos relacionales es distribuir la información
en varias tablas relacionadas por un campo en común, evitando la repetición de datos. Cuando
se necesita mostrar información que viene de más de una tabla, se usan **combinaciones** (JOINs).

Una condición de combinación define cómo se relacionan dos tablas en una consulta:
- Especifica la columna de cada tabla que se usa para la combinación. Generalmente es
  una llave foránea en una tabla y la llave primaria correspondiente en la otra.
- Especifica un operador lógico de comparación (`=`, `<>`, `<`, `>`, etc.).

### Tablas de ejemplo usadas en este tema

Estas dos tablas se usan en todos los ejemplos del tema:

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

### Diagrama de relación

```
┌─────────────────────────┐          ┌──────────────────────────┐
│         Cliente         │          │          Pedido           │
├─────────────────────────┤          ├──────────────────────────┤
│ idCliente  INT  PK ─────┼──────────┼─► idCliente  INT  FK     │
│ NombreCliente VARCHAR   │    1:N   │  idPedido   INT  PK      │
│ Contacto  VARCHAR       │          │  Factura    DECIMAL       │
└─────────────────────────┘          └──────────────────────────┘
```

Un cliente puede tener muchos pedidos (relación 1 a N). El campo `idCliente` de la tabla
`Pedido` es la llave foránea que apunta a la llave primaria de `Cliente`.

---

## Sintaxis general de un JOIN

```sql
SELECT <columnas>
FROM <TablaA> AS A
<TIPO> JOIN <TablaB> AS B ON A.<columnaComun> = B.<columnaComun>
WHERE <condicion>;
```

Consideraciones importantes:
- Se recomienda siempre usar **alias** (`AS A`, `AS B`) para acortar las referencias a columnas.
- Cuando dos tablas tienen columnas con el mismo nombre, es obligatorio calificarlas con el
  nombre de la tabla o su alias: `A.idCliente`, no solo `idCliente`.
- El tipo de JOIN determina qué filas aparecen en el resultado cuando no hay coincidencia.

---

## Tipos de JOIN

```
                   ┌────────────────────────────────────────────────┐
                   │              TIPOS DE JOIN                     │
                   │                                                │
                   │   ┌─────────┐  ┌─────────┐  ┌─────────┐      │
                   │   │  INNER  │  │  LEFT   │  │  RIGHT  │      │
                   │   │  JOIN   │  │  JOIN   │  │  JOIN   │      │
                   │   └────┬────┘  └────┬────┘  └────┬────┘      │
                   │        │            │             │            │
                   │        └────────────┴─────────────┘           │
                   │                     │                          │
                   │               ┌─────┴─────┐                   │
                   │               │   FULL    │                   │
                   │               │   JOIN    │                   │
                   │               └───────────┘                   │
                   └────────────────────────────────────────────────┘
```

| Tipo       | Qué devuelve |
|------------|--------------|
| INNER JOIN | Solo las filas con coincidencia en **ambas** tablas |
| LEFT JOIN  | Todas las filas de la tabla **izquierda** + coincidencias de la derecha |
| RIGHT JOIN | Todas las filas de la tabla **derecha** + coincidencias de la izquierda |
| FULL JOIN  | **Todas** las filas de ambas tablas |

---

## INNER JOIN

### Concepto

Es el tipo de JOIN más común. Devuelve únicamente las filas donde existe una coincidencia en
ambas tablas. Si una fila de la tabla A no tiene correspondencia en la tabla B, esa fila no
aparece en el resultado, y viceversa.

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

### Sintaxis

```sql
SELECT A.columna1, B.columna2
FROM TablaA AS A
INNER JOIN TablaB AS B ON A.idComun = B.idComun;
```

### Ejemplo 1 — Clientes y Pedidos

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

Marco García no aparece porque no tiene ningún pedido registrado. Sofia Montemayor aparece
dos veces porque tiene dos pedidos.

### Ejemplo 2 — Empleados y Departamentos

Tablas de trabajo:

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

Observaciones importantes:
- **Williams** no aparece: su `idDepartamento` es `NULL`, no existe en `Departamento`.
- **Mercadotecnia** no aparece: ningún empleado pertenece al departamento `35`.
- Esto ilustra exactamente lo que hace INNER JOIN: solo muestra la intersección.

### Ejemplo 3 — Tres tablas encadenadas

Es posible encadenar más de dos tablas en un mismo `SELECT`:

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura, E.NombreEmpleado AS Vendedor
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
INNER JOIN Empleado AS E ON P.idEmpleado = E.idEmpleado;
```

Se agrega un segundo `INNER JOIN` a continuación del primero. Cada `JOIN` agrega una tabla
más a la combinación.

---

## LEFT JOIN

### Concepto

Devuelve **todas** las filas de la tabla izquierda (la que se escribe antes del `LEFT JOIN`),
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

Ahora Marco García **sí aparece**, con `NULL` en las columnas de `Pedido` porque no tiene
pedidos registrados. Todos los clientes de la tabla izquierda están presentes en el resultado.

### Ejemplo 2 — Detectar registros sin relación

LEFT JOIN es ideal para encontrar filas huérfanas: clientes sin pedidos, empleados sin
departamento, etc.

```sql
-- Clientes que NO tienen ningún pedido
SELECT C.NombreCliente
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE P.idPedido IS NULL;
```

**Resultado:**

| NombreCliente |
|---------------|
| Marco García  |

El filtro `WHERE P.idPedido IS NULL` retiene solo las filas donde no hubo coincidencia en
la tabla derecha.

### Ejemplo 3 — Con ORDER BY

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente
ORDER BY C.NombreCliente ASC;
```

---

## RIGHT JOIN

### Concepto

Es el opuesto de LEFT JOIN. Devuelve **todas** las filas de la tabla derecha (la que se
escribe después del `RIGHT JOIN`), más las filas coincidentes de la tabla izquierda. Cuando
una fila de la derecha no tiene correspondencia en la izquierda, las columnas de la izquierda
aparecen como `NULL`.

En la práctica, cualquier `RIGHT JOIN` puede reescribirse como un `LEFT JOIN` invirtiendo el
orden de las tablas. Por eso es menos frecuente que `LEFT JOIN`.

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

### Ejemplo 1 — Todos los pedidos, con o sin cliente coincidente

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
RIGHT JOIN Pedido AS P ON C.idCliente = P.idCliente
ORDER BY P.idPedido ASC;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Sofia Montemayor | 234      | 160.00  |
| Laura Aranda     | 235      | 48.00   |
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 237      | 92.00   |

Todos los pedidos aparecen. En este ejemplo todos tienen cliente, por lo que no hay `NULL`.
Si existiera un pedido con `idCliente` que no exista en `Cliente`, aparecería con `NULL` en
`NombreCliente`.

### Ejemplo 2 — Personas y Departamentos

**Persona**

| idPersona | Nombre  | idDepartamento |
|-----------|---------|----------------|
| 1         | Ana     | 1              |
| 2         | Pedro   | 2              |
| 3         | Luis    | NULL           |

**Departamento**

| idDepartamento | Nombre    |
|----------------|-----------|
| 1              | Sistemas  |
| 2              | Finanzas  |
| 3              | Comercial |

```sql
SELECT P.Nombre AS Persona, D.Nombre AS Departamento
FROM Persona AS P
RIGHT JOIN Departamento AS D ON P.idDepartamento = D.idDepartamento;
```

**Resultado:**

| Persona | Departamento |
|---------|--------------|
| Ana     | Sistemas     |
| Pedro   | Finanzas     |
| NULL    | Comercial    |

El departamento Comercial aparece aunque no tenga ninguna persona asignada. Luis no aparece
porque su `idDepartamento` es `NULL` y no coincide con ningún departamento en la tabla derecha.

---

## FULL JOIN (FULL OUTER JOIN)

### Concepto

Combina los resultados de `LEFT JOIN` y `RIGHT JOIN`. Devuelve **todas** las filas de ambas
tablas. Donde no hay coincidencia en alguno de los lados, las columnas del otro lado muestran
`NULL`.

`FULL JOIN` y `FULL OUTER JOIN` son equivalentes en T-SQL.

```
     Tabla A              Tabla B
   ╔═════════╗          ╔═════════╗
   ║ ░░░░░░░ ║          ║ ░░░░░░░ ║
   ║ ░░░┌───╫──────────╫───░░░   ║
   ║ ░░░│░░░║  coincide ░░░░░    ║
   ║ ░░░└───╫──────────╫───░░░   ║
   ║ ░░░░░░░ ║          ║ ░░░░░░░ ║
   ╚═════════╝          ╚═════════╝
   (░ = siempre aparece en ambos lados)
```

### Sintaxis

```sql
SELECT A.columna1, B.columna2
FROM TablaA AS A
FULL JOIN TablaB AS B ON A.idComun = B.idComun;
```

### Ejemplo — Clientes y Pedidos

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
FULL JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

**Resultado:**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Marco García     | NULL     | NULL    |
| Laura Aranda     | 235      | 48.00   |
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

Marco García aparece con `NULL` (no tiene pedidos). Si existiera un pedido sin cliente
válido, aparecería con `NULL` en `NombreCliente`.

### Cuándo usarlo

`FULL JOIN` es útil para auditorías o comparaciones donde se quiere ver el estado completo
de ambas tablas: registros que sí tienen relación y registros que no la tienen en ninguno
de los dos lados.

---

## Comparativa visual de todos los tipos

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│   INNER JOIN           LEFT JOIN           RIGHT JOIN      FULL JOIN    │
│                                                                         │
│   ┌──┬──┐             ┌──┬──┐             ┌──┬──┐         ┌──┬──┐      │
│   │  │██│             │██│  │             │  │██│         │██│██│      │
│   │  │██│             │██│  │             │  │██│         │██│██│      │
│   └──┴──┘             └──┴──┘             └──┴──┘         └──┴──┘      │
│   A    B              A    B              A    B           A    B       │
│                                                                         │
│  Solo el centro    Todo A + centro     Todo B + centro   Todo A y B    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

| Tipo       | Filas de A sin match | Filas de B sin match | Filas con match |
|------------|:--------------------:|:--------------------:|:---------------:|
| INNER JOIN | No                   | No                   | Sí              |
| LEFT JOIN  | Sí (con NULL en B)   | No                   | Sí              |
| RIGHT JOIN | No                   | Sí (con NULL en A)   | Sí              |
| FULL JOIN  | Sí (con NULL en B)   | Sí (con NULL en A)   | Sí              |

---

## Alias en consultas multitabla

Cuando se trabaja con varias tablas, los alias son prácticamente obligatorios para:
- Evitar ambigüedad cuando dos tablas tienen columnas con el mismo nombre.
- Hacer el código más legible y corto.
- Permitir hacer self-joins (unir una tabla consigo misma).

```sql
-- Sin alias — ambiguo si ambas tablas tienen idCliente
SELECT idCliente, NombreCliente, idPedido
FROM Cliente
INNER JOIN Pedido ON Cliente.idCliente = Pedido.idCliente;

-- Con alias — explícito y sin ambigüedad
SELECT C.idCliente, C.NombreCliente, P.idPedido
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

También se puede renombrar columnas en el resultado usando `AS`:

```sql
SELECT C.NombreCliente AS Cliente,
       P.idPedido      AS NumeroPedido,
       P.Factura       AS Total
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

---

## Combinar JOIN con WHERE, ORDER BY y GROUP BY

Los JOINs se pueden combinar con todas las cláusulas de `SELECT`:

### Con WHERE

```sql
-- Solo pedidos de clientes de Monterrey
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
INNER JOIN Pedido AS P ON C.idCliente = P.idCliente
WHERE C.Ciudad = 'Monterrey';
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
-- Total de ventas por cliente
SELECT C.NombreCliente, COUNT(P.idPedido) AS TotalPedidos, SUM(P.Factura) AS Facturacion
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
-- Solo clientes con más de un pedido
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

| Instrucción | Propósito principal | Requiere coincidencia en ambas tablas |
|-------------|---------------------|:-------------------------------------:|
| INNER JOIN  | Obtener datos relacionados que existen en ambas tablas | Sí |
| LEFT JOIN   | Ver todos los registros de la tabla izquierda aunque no tengan relación | No (NULL en derecha) |
| RIGHT JOIN  | Ver todos los registros de la tabla derecha aunque no tengan relación | No (NULL en izquierda) |
| FULL JOIN   | Ver todos los registros de ambas tablas sin excepción | No (NULL en el lado faltante) |

> En T-SQL (SQL Server), el tipo de JOIN por defecto cuando se escribe solo `JOIN` es
> `INNER JOIN`. Es recomendable siempre escribir el tipo completo para mayor claridad.
