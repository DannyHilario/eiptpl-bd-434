-- Tema:        Base de Datos II - Sesión 1 - Funciones de Agregado
-- Descripción: Consultas de práctica con funciones de agregado (COUNT, SUM, AVG,
--              MIN, MAX), GROUP BY y HAVING sobre la tabla Comanda de RestauranteDB
--              (base de datos reutilizada de Base de Datos I, Evidencia 3).
-- Autor:       Daniel Hilario

-- ============================================================
-- EXPLORACIÓN INICIAL — conocer la tabla antes de agrupar
-- Ver los datos crudos y algunos agregados simples (sin GROUP BY)
-- para tener una idea del volumen y el rango de valores.
-- ============================================================
SELECT *
FROM Comanda

SELECT COUNT(idComanda)
FROM Comanda -- 300

SELECT MIN(FechaComanda)
FROM Comanda -- 2025-01-03

SELECT MAX(FechaComanda)
FROM Comanda -- 2025-12-30

SELECT AVG(TotalPagado)
FROM Comanda -- 371.46

-- ============================================================
-- EJERCICIO 1 — Totales generales
-- Obtener el número total de comandas registradas y la suma
-- total facturada en el año.
-- Temas: COUNT, SUM
-- ============================================================
SELECT COUNT(idComanda) AS TotalComandas,
    SUM(TotalPagado) AS SumaIngresos
FROM Comanda

-- ============================================================
-- EJERCICIO 2 — Ticket promedio por medio de pago
-- Mostrar cada MedioPago junto con el promedio de TotalPagado
-- de las comandas pagadas con ese medio.
-- Temas: AVG, GROUP BY, ROUND
-- ============================================================
SELECT MedioPago, ROUND(AVG(TotalPagado), 2) AS PromedioPagado
FROM Comanda
GROUP BY MedioPago

-- ============================================================
-- EJERCICIO 3 — Desempeño por mesero
-- Mostrar cada Mesero con la cantidad de comandas que atendió
-- y el total que generó en ventas.
-- Temas: COUNT, SUM, GROUP BY
-- ============================================================
SELECT Mesero, COUNT(idComanda) AS CantidadComandas,
    SUM(TotalPagado) AS SumaIngresos
FROM Comanda
GROUP BY Mesero

-- ============================================================
-- EJERCICIO 4 — Meses de mayor recaudación
-- Agrupar las comandas por mes (MONTH(FechaComanda)) y mostrar
-- solo los meses cuya suma total de TotalPagado supere $10,000.
-- Nota: no se puede usar el alias de columna (p. ej. "Mes") dentro
-- de HAVING, hay que repetir la expresión MONTH(FechaComanda).
-- Temas: GROUP BY con función de fecha, HAVING
-- ============================================================
SELECT MONTH(FechaComanda) AS Mes, SUM(TotalPagado) AS SumaIngresos
FROM Comanda
GROUP BY MONTH(FechaComanda)
HAVING SUM(TotalPagado) > 10000

-- ============================================================
-- EJERCICIO 5 — Mesas más ocupadas
-- Mostrar el número de Mesa y la cantidad de comandas registradas
-- en cada una, solo para las mesas con más de 15 comandas.
-- Temas: COUNT, GROUP BY, HAVING
-- ============================================================
SELECT Mesa, COUNT(idComanda) AS CantidadComandas
FROM Comanda
GROUP BY Mesa
HAVING COUNT(idComanda) > 15

-- Verificación manual: contar a mano las comandas de la Mesa 1
-- para confirmar que el HAVING filtró correctamente.
SELECT *
FROM Comanda
WHERE Mesa = 1

-- ============================================================
-- EJERCICIO 6 (EXTRA) — Reporte de ingresos por mes y por medio de pago
-- Ejercicio adicional resuelto en clase: combinar dos dimensiones
-- de agrupación (mes y medio de pago) en un solo reporte.
-- Temas: GROUP BY con múltiples columnas, ORDER BY
-- ============================================================

-- 6a. Reporte por mes
SELECT MONTH(FechaComanda) AS Mes, SUM(TotalPagado) AS SumaIngresos
FROM Comanda
GROUP BY MONTH(FechaComanda)

-- 6b. Reporte por medio de pago
SELECT MedioPago, SUM(TotalPagado) AS SumaIngresos
FROM Comanda
GROUP BY MedioPago

-- 6c. Reporte completo: mes + medio de pago combinados
SELECT MONTH(FechaComanda) AS Mes, MedioPago,
    SUM(TotalPagado) AS SumaIngresos
FROM Comanda
GROUP BY MONTH(FechaComanda), MedioPago
ORDER BY MONTH(FechaComanda)
