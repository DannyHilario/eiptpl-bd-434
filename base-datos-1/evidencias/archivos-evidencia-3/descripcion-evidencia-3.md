# Evidencia 3: Consultas Simples en SQL Server

De manera **individual**, practicarás la escritura y ejecución de consultas simples sobre una base de datos de restaurante ya instalada en SQL Server. Para cada consulta deberás interpretar el enunciado, escribir la sentencia `SELECT` correcta y capturar el resultado desde SSMS. El objetivo es demostrar que puedes recuperar, filtrar y ordenar datos de una tabla usando las cláusulas y funciones vistas en clase.

---

## Base de datos de práctica

Instala **RestauranteDB** siguiendo el plan de instalación incluido en la carpeta [`datos-restaurante/`](datos-restaurante). La base de datos contiene una sola tabla (`Comanda`) con 300 registros del año 2025.

---

## Consultas a realizar

Ejecuta cada una de las siguientes consultas en SSMS y documenta el resultado.

**Consulta 1**
Listar todas las comandas atendidas por el mesero `Tomás Castillo`, mostrando fecha, cliente, mesa y total, ordenadas por fecha de manera descendente.

**Consulta 2**
Mostrar las comandas cuyo total pagado esté entre $300.00 y $600.00, ordenadas de mayor a menor total.

**Consulta 3**
Obtener las 10 comandas con el total pagado más alto, mostrando todos sus campos.

**Consulta 4**
Listar todas las comandas del mes de diciembre de 2025, mostrando fecha, cliente, mesero y total.

**Consulta 5**
Mostrar las comandas cuyo medio de pago sea `Tarjeta de Credito` o `Transferencia`, ordenadas por fecha ascendente.

**Consulta 6**
Listar las comandas de clientes cuyo nombre completo comience con la letra `M`, mostrando cliente, mesero, fecha y total.

**Consulta 7**
Obtener todas las comandas del segundo semestre del año (meses 7 al 12), ordenadas por mes ascendente y total descendente.

**Consulta 8**
Mostrar las comandas que se registraron en la mesa 5 y cuyo medio de pago fue `Efectivo`, ordenadas por fecha.

**Consulta 9**
Listar las 5 comandas más recientes registradas en el sistema, mostrando todos sus campos.

**Consulta 10**
Mostrar las comandas registradas durante el primer trimestre del año (entre el 1 de enero y el 31 de marzo de 2025) cuyo total sea mayor a $400.00, ordenadas por fecha.

---

## Entregables

Un solo archivo **PDF** que contenga las 10 consultas documentadas. Para cada consulta incluye:

1. El número y enunciado de la consulta (por ejemplo: **Consulta 1** — *Listar todas las comandas…*).
2. Una captura de pantalla de SSMS donde se vea claramente:
   - La sentencia SQL escrita.
   - El panel de resultados con la respuesta.

> Si el resultado contiene muchos registros y no caben todos en la pantalla, no hay problema — basta con que en la captura se aprecien **todas las columnas** del resultado.

Nombra tu archivo de la siguiente forma:

```
EV3_ApellidoNombre.pdf
```

*Ejemplo: `EV3_GarcíaCarlos.pdf`*

---

## Forma de Entrega

- **Modalidad:** Individual. Cada alumno debe cargar su propio archivo.
- **Plataforma:** NEXUS. Carga tu archivo en la evidencia *"3.1 - Evidencia de Aprendizaje 3: Práctica ABP"*.
- **Fecha de entrega:** Domingo 3 de mayo de 2026.
- **Hora límite:** 10:00 p.m.

\newpage

## Rúbrica de Evaluación

| CRITERIO / NIVEL DE DOMINIO | Evidencia completa | Evidencia suficiente | Evidencia débil | Sin evidencia |
|-----------------------------|--------------------|---------------------|-----------------|---------------|
| **Conocimientos** — Identifica y aplica la sintaxis de `SELECT` con las cláusulas `WHERE`, `ORDER BY`, `TOP` y funciones de fecha en SQL Server. | **3** — Demuestra dominio claro de la sintaxis: las sentencias están bien escritas, usan correctamente las cláusulas solicitadas y las funciones de fecha donde se requieren. | **2** — Las sentencias son mayormente correctas, pero presentan errores menores de sintaxis o uso incorrecto de alguna cláusula o función de fecha. | **1** — Muestra comprensión parcial de la sintaxis; varias consultas presentan errores que afectan el resultado o no usan las cláusulas indicadas. | **0** — No presenta evidencia de la actividad. |
| **Habilidades** — Ejecuta las 10 consultas obteniendo los resultados correctos en SSMS. | **5** — Presenta las 10 consultas ejecutadas con resultados correctos; las capturas muestran tanto la sentencia como el panel de resultados y se aprecian todas las columnas. | **4** — Presenta las 10 consultas, pero una o dos muestran resultados incorrectos o las capturas no permiten verificar todas las columnas del resultado. | **3** — Presenta menos de 10 consultas, o más de dos muestran resultados incorrectos, o las capturas son ilegibles en varias de ellas. | **0** — No presenta evidencia de la actividad. |
| **Actitudes / Valores** — Muestra responsabilidad y organización en la entrega. | **2** — El PDF está completo, ordenado y es legible; las capturas son claras; entrega en tiempo y forma. | **1** — El PDF está incompleto o las capturas son difíciles de leer, aunque el esfuerzo es visible. | **0** — El PDF es desorganizado o ilegible, lo que impide evaluar el trabajo realizado. | **0** — No presenta evidencia de la actividad. |
