# Producto Integrador de Aprendizaje: Base de datos relacional en SQL Server

En equipo, recibirán un escenario de negocio específico. Deberán diseñar el modelo relacional que lo resuelva e implementarlo en Microsoft SQL Server mediante scripts SQL. El equipo deberá **exponer frente a la clase su modelo relacional y las decisiones de diseño tomadas**, y estar preparado para defender su modelo ante las preguntas del profesor. De forma individual, **cada alumno deberá responder en vivo al menos una consulta SQL** sobre la base de datos de su equipo.

---

## Entregables

1. **`Instalacion.ZIP`** — Archivo comprimido que contiene todos los scripts necesarios para crear y poblar la base de datos desde cero. Los archivos deben nombrarse con un prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-cliente.sql`, `3_insert-cliente.sql`). El equipo es responsable de investigar y definir sus propios datos; **los catálogos deben tener al menos 5 registros** y **las tablas de hechos al menos 25 registros**.

2. **`Reversa.ZIP`** — Archivo comprimido que contiene los scripts necesarios para deshacer por completo la instalación (eliminar tablas y base de datos). Los archivos también deben nombrarse con prefijo numérico en el orden en que deben ejecutarse.

3. **Documento PDF** — Documento de presentación que será expuesto en clase. Puede entregarse en formato vertical (presentación) u horizontal (documento). Debe contener al menos:
   - El modelo relacional diseñado, generado en [dbdiagram.io](https://dbdiagram.io).
   - Una breve descripción del negocio y de la base de datos resultante.
   - El **plan de instalación**: tabla ordenada con el nombre de cada script y una descripción de lo que hace.
   - El **plan de reversa**: tabla ordenada con el nombre de cada script y una descripción de lo que hace, incluyendo la nota de que se debe seleccionar otra base de datos en el dropdown de SSMS antes de eliminar la base de datos.

   > Para el formato y contenido esperado de los planes de instalación y reversa, pueden guiarse con los README incluidos en los ejercicios de las sesiones 9 y 10.

---

## Forma de Entrega

- **Electrónica:** A través de la plataforma NEXUS. Los tres archivos deberán cargarse en **DOS evidencias**:
  - *"4.1 - Evidencia de Aprendizaje 4: Consultas multitabla"*
  - *"Producto Integrador de Aprendizaje: Base de datos"*

  Al menos una persona por equipo deberá cargar los tres archivos en cada evidencia.
- **Fecha de Entrega:** Viernes 15 de Mayo de 2026.
- **Hora de Entrega:** Máximo 11:00pm.

---

## Rúbrica de Evaluación

| CRITERIO / NIVEL DE DOMINIO | Evidencia completa | Evidencia suficiente | Evidencia débil | Sin evidencia |
|-----------------------------|-------------------|---------------------|-----------------|---------------|
| **Conocimientos** — Verifica que el plan de instalación y el plan de reversa funcionen correctamente. | **3** — Ambos planes (instalación y reversa) se ejecutan sin errores; la estructura de la base de datos resultante coincide con el modelo relacional presentado en el PDF. | **2** — Los planes se ejecutan con errores menores que no impiden comprender la estructura general; o el modelo del PDF presenta inconsistencias menores con la implementación. | **1** — Los scripts presentan errores que impiden su ejecución correcta, o la estructura implementada no corresponde al modelo presentado. | **0** — No presenta evidencia de la actividad. |
| **Habilidades** — Cada alumno realiza de forma individual consultas SQL sobre la base de datos de su equipo. | **5** — El alumno responde de forma independiente y correcta todas las consultas asignadas en clase, utilizando T-SQL con los JOINs y filtros apropiados, sin errores. | **4** — El alumno responde correctamente la mayoría de las consultas; comete únicamente errores menores de sintaxis o requiere orientación mínima. | **3** — El alumno responde menos de la mitad de las consultas correctamente, o muestra dificultades significativas para aplicar JOINs o filtros. | **0** — No presenta evidencia de la actividad. |
| **Actitudes / Valores** — Demuestra responsabilidad y organización en la información entregada. | **2** — Los tres archivos entregados son coherentes entre sí y están correctamente organizados. Expone y entrega en el tiempo señalado por el profesor. | **1** — Los archivos entregados presentan inconsistencias entre el modelo del PDF y la implementación en los scripts, o la entrega no es a tiempo. | **0** — Los entregables son incoherentes o están incompletos. | **0** — No presenta evidencia de la actividad. |
