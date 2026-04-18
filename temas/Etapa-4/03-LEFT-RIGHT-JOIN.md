# LEFT JOIN y RIGHT JOIN

## El concepto base

Tanto `LEFT JOIN` como `RIGHT JOIN` son **outer joins**: a diferencia del `INNER JOIN`,
no descartan las filas que no tienen coincidencia. En cambio, las incluyen en el resultado
con `NULL` en las columnas del lado que no tuvo coincidencia.

La diferencia entre ellos es simplemente **qué lado de la combinación es el "completo"**:
el izquierdo o el derecho.

---

## LEFT JOIN

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

### Ejemplo — Todos los clientes, con o sin pedidos

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

Marco García **sí aparece** aunque no tenga pedidos, con `NULL` en las columnas de `Pedido`.
Todos los clientes de la tabla izquierda están presentes en el resultado.

### Uso práctico: detectar registros sin relación

`LEFT JOIN` combinado con `WHERE columna IS NULL` sirve para encontrar filas huérfanas:
clientes sin pedidos, empleados sin departamento, productos sin categoría, etc.

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

El filtro `WHERE P.idPedido IS NULL` retiene solo las filas donde no hubo coincidencia
en la tabla derecha.

---

## RIGHT JOIN

Es el opuesto de `LEFT JOIN`. Devuelve **todas** las filas de la tabla derecha (la que se
escribe después del `RIGHT JOIN`), más las filas coincidentes de la tabla izquierda. Cuando
una fila de la derecha no tiene correspondencia en la izquierda, las columnas de la izquierda
aparecen como `NULL`.

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

### Ejemplo — Todos los departamentos, con o sin empleados

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

```sql
SELECT E.NombreEmpleado, D.Nombre AS Departamento
FROM Empleado AS E
RIGHT JOIN Departamento AS D ON E.idDepartamento = D.idDepartamento;
```

**Resultado:**

| NombreEmpleado | Departamento |
|----------------|--------------|
| Ana            | Sistemas     |
| Pedro          | Finanzas     |
| NULL           | Comercial    |

El departamento Comercial aparece aunque no tenga ningún empleado asignado. Luis no aparece
porque su `idDepartamento` es `NULL` y no coincide con ningún departamento.

---

## LEFT y RIGHT son intercambiables según el orden de las tablas

Este es un punto importante: **cualquier `RIGHT JOIN` puede reescribirse como un `LEFT JOIN`
invirtiendo el orden de las tablas**, y el resultado es idéntico.

La lógica es simple: lo que cambia es qué tabla se declara "a la izquierda" (en el `FROM`)
y cuál "a la derecha" (después del `JOIN`). El tipo de JOIN solo indica qué lado es el
que siempre aparece completo.

### Sintaxis equivalente

```sql
-- Opción A: LEFT JOIN — Tabla A es la completa
FROM TablaA AS A
LEFT JOIN TablaB AS B ON A.idComun = B.idComun

-- Opción B: RIGHT JOIN — misma consulta, tablas invertidas
FROM TablaB AS B
RIGHT JOIN TablaA AS A ON A.idComun = B.idComun
```

Las dos opciones devuelven exactamente el mismo resultado.

### Ejemplo concreto con las mismas tablas

**Opción A — LEFT JOIN** (todos los clientes):

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Cliente AS C
LEFT JOIN Pedido AS P ON C.idCliente = P.idCliente;
```

**Opción B — RIGHT JOIN** (misma consulta, tablas invertidas):

```sql
SELECT C.NombreCliente, P.idPedido, P.Factura
FROM Pedido AS P
RIGHT JOIN Cliente AS C ON C.idCliente = P.idCliente;
```

**Resultado (idéntico en ambos casos):**

| NombreCliente    | idPedido | Factura |
|------------------|----------|---------|
| Marco García     | NULL     | NULL    |
| Laura Aranda     | 235      | 48.00   |
| Efraín Solano    | 236      | 64.00   |
| Sofia Montemayor | 234      | 160.00  |
| Sofia Montemayor | 237      | 92.00   |

En ambos casos la tabla "completa" es `Cliente`. La diferencia es únicamente cómo se
declara eso en la sintaxis: poniéndola en el `FROM` con `LEFT JOIN`, o después del `JOIN`
con `RIGHT JOIN`.

### ¿Cuál usar en la práctica?

Por convención, la mayoría de los desarrolladores prefieren `LEFT JOIN` porque es más
natural leer "quiero todo lo de la tabla A más lo que coincida de la B". `RIGHT JOIN`
existe y es válido, pero puede hacer el código más difícil de leer cuando se encadenan
varios JOINs, porque obliga a mentalmente "invertir" el orden.

---

## Comparativa

| Tipo       | Tabla completa | Tabla con posibles NULL |
|------------|---------------|-------------------------|
| LEFT JOIN  | Izquierda (`FROM`) | Derecha (después del `JOIN`) |
| RIGHT JOIN | Derecha (después del `JOIN`) | Izquierda (`FROM`) |

| Pregunta | JOIN a usar |
|----------|-------------|
| ¿Quiero todos los registros de A aunque no tengan relación con B? | `FROM A LEFT JOIN B` |
| ¿Quiero todos los registros de B aunque no tengan relación con A? | `FROM A RIGHT JOIN B` o `FROM B LEFT JOIN A` |
| ¿Quiero encontrar registros sin relación? | LEFT JOIN + `WHERE B.id IS NULL` |
