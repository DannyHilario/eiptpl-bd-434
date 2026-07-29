# Consultas Simples y Consultas Combinadas

## Consultas simples

Una consulta simple recupera datos de **una sola tabla**. El resultado de un `SELECT` es
una tabla lógica en memoria: tiene filas y columnas igual que cualquier tabla de la base
de datos, pero se descarta al terminar la ejecución. Cada vez que se ejecuta, el resultado
se recalcula desde cero.

```sql
-- Sintaxis general
SELECT <columnas>
FROM <Tabla>
WHERE <condicion>;
```

### Ejemplo

Consultar todos los productos con precio mayor a 500:

```sql
SELECT idProducto, Nombre, Precio
FROM Producto
WHERE Precio > 500;
```

El resultado contiene únicamente datos de `Producto`. No se cruza con ninguna otra tabla.

---

## Consultas combinadas (multitabla)

Una consulta combinada recupera datos de **dos o más tablas** relacionadas. Para combinarlas
se usa una instrucción `JOIN`, que une las filas de ambas tablas según una columna en común.

Una de las propiedades clave de las bases de datos relacionales es distribuir la información
en varias tablas para evitar la repetición de datos. Las consultas combinadas permiten
reconstruir esa información cuando se necesita mostrarla junta.

```sql
-- Sintaxis general
SELECT <columnas>
FROM <TablaA> AS A
<TIPO> JOIN <TablaB> AS B ON A.<columnaComun> = B.<columnaComun>
WHERE <condicion>;
```

### Ejemplo

Obtener el nombre de cada producto junto con el nombre de su categoría:

```sql
SELECT P.Nombre AS Producto, C.Nombre AS Categoria
FROM Producto AS P
INNER JOIN Categoria AS C ON P.idCategoria = C.idCategoria;
```

Aquí los datos vienen de dos tablas: `Producto` y `Categoria`. La columna `idCategoria`
es la que establece la relación entre ellas.

---

## Diferencia clave

| Característica | Consulta simple | Consulta combinada |
|---|---|---|
| Tablas involucradas | Una | Dos o más |
| Usa JOIN | No | Sí |
| Requiere columna en común | No aplica | Sí (llave foránea / primaria) |
| Alias recomendados | Opcional | Prácticamente obligatorios |

> Una consulta combinada sigue siendo un `SELECT` normal. La única diferencia es que el
> `FROM` incluye más de una tabla unida mediante `JOIN`.
