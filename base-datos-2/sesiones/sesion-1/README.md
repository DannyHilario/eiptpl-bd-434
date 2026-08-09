# Sesión 1 — Funciones de Agregado

Primera sesión de Base de Datos II. Introduce las funciones de agregado (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) junto con `GROUP BY` y `HAVING`, apoyándose en una tabla ya conocida por el grupo: **`Comanda`**, de la base de datos **RestauranteDB**, usada originalmente en Base de Datos I (Evidencia 3).

---

## Contexto

`Comanda` es una tabla desnormalizada con 300 registros de tickets de un restaurante durante todo 2025: fecha, cliente, mesero, mesa, medio de pago y total pagado. Su tamaño (300 filas) y sus columnas categóricas (`Mesero`, `Mesa`, `MedioPago`) la hacen un buen punto de partida para practicar agregados sin necesitar `JOIN`.

## Prerequisito

Esta sesión **reutiliza** RestauranteDB tal como quedó instalada en Base de Datos I. No se vuelve a instalar aquí.

- Si ya la tienes instalada de Evidencia 3, solo selecciona **RestauranteDB** en el dropdown de SSMS.
- Si no la tienes, sigue el paquete de instalación documentado en [`../../../base-datos-1/evidencias/archivos-evidencia-3/datos-restaurante/README.md`](../../../base-datos-1/evidencias/archivos-evidencia-3/datos-restaurante/README.md).

## Qué se hizo en esta sesión

Se resolvieron 5 ejercicios de funciones de agregado sobre `Comanda`, más un ejercicio extra combinando dos dimensiones de agrupación. Todo el detalle, con comentarios explicando el razonamiento de cada consulta, está en [`consultas.sql`](consultas.sql):

| # | Ejercicio | Funciones/cláusulas practicadas |
|---|-----------|----------------------------------|
| 1 | Total de comandas y suma total facturada | `COUNT`, `SUM` |
| 2 | Promedio de `TotalPagado` por `MedioPago` | `AVG`, `GROUP BY`, `ROUND` |
| 3 | Comandas atendidas y ventas totales por `Mesero` | `COUNT`, `SUM`, `GROUP BY` |
| 4 | Meses cuya recaudación supera $10,000 | `GROUP BY` con `MONTH()`, `HAVING` |
| 5 | Mesas con más de 15 comandas | `COUNT`, `GROUP BY`, `HAVING` |
| 6 (extra) | Reporte de ingresos por mes y por medio de pago | `GROUP BY` con múltiples columnas, `ORDER BY` |

### Puntos importantes que se corrigieron/reforzaron al documentar

- **Alias en `HAVING`**: en T-SQL no se puede filtrar en `HAVING` usando el alias definido en el `SELECT` (por ejemplo `HAVING Mes > ...` no funciona si `Mes` es un alias de `MONTH(FechaComanda)`); hay que repetir la expresión completa. El Ejercicio 4 lo ilustra.
- **Mayúsculas en palabras reservadas**: el script original mezclaba `select`/`SELECT`, `count`/`COUNT`, etc. Se normalizó todo a mayúsculas por convención del repositorio (ver [CLAUDE.md](../../../CLAUDE.md)).
- **Consultas de scratch/exploración**: se conservaron las consultas iniciales de exploración (COUNT, MIN, MAX, AVG sin agrupar) porque ilustran el paso previo natural antes de usar `GROUP BY`, pero se separaron claramente del resto con su propia sección.
- El script original, tal como se escribió en clase, se conserva sin modificar en DBeaver (`Script-2.sql`) — este archivo es la versión corregida y documentada para el repositorio.

## Escenarios para seguir practicando

- Ticket promedio por `Mesero` en lugar de por `MedioPago`.
- Día del mes con más comandas (`GROUP BY FechaComanda`).
- Combinar `Mesero` + `MedioPago` para ver qué mesero cobra más con tarjeta vs. efectivo.
