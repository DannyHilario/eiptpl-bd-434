# Ejercicio PIA: Modelado de base de datos

## Contexto

**ClínicaSalud** es una clínica médica privada que cuenta con médicos de distintas especialidades: pediatría, cardiología, dermatología y medicina general, entre otras.

Actualmente, el personal de recepción registra todas las consultas en una hoja de cálculo donde cada fila representa una consulta. La hoja contiene la siguiente información en columnas:

> Especialidad del médico, nombre completo del médico, nombre completo del paciente, teléfono del paciente, correo electrónico del paciente, fecha de consulta, motivo de la consulta, costo de la consulta.

---

## El problema

El personal de recepción ha notado las siguientes situaciones:

- Cuando un paciente regresa a consulta, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el teléfono o correo respecto a su visita anterior.
- La especialidad del médico se repite en cada fila de consulta que le corresponde; si un médico cambia de especialidad, hay que corregir manualmente todas sus filas históricas.
- No es posible registrar a un médico en el sistema si no ha atendido ninguna consulta todavía.

---

## Tu tarea

A partir del escenario anterior, diseña e implementa una base de datos relacional en Microsoft SQL Server. Deberás entregar los siguientes tres archivos:

### 1. Documento PDF

Diseña el modelo relacional que elimine la redundancia descrita. Para cada tabla que identifiques, define nombre, columnas con tipo de dato, llave primaria, llaves foráneas y constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`).

Documenta tu diseño en un PDF que incluya:

- El modelo relacional generado en [dbdiagram.io](https://dbdiagram.io).
- Una breve descripción de la base de datos resultante.
- El **plan de instalación**: tabla con cada script en orden de ejecución y una descripción de lo que hace.
- El **plan de reversa**: tabla con cada script en orden de ejecución y una descripción de lo que hace. Incluye la nota de que hay que cambiar la base de datos activa en el dropdown de SSMS antes de ejecutar el script que elimina la base de datos.

Este PDF es el documento que expondrás en clase.

### 2. `Instalacion.ZIP`

Scripts SQL para crear y poblar la base de datos desde cero. Nómbralos con prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-especialidad.sql`, `3_create-table-medico.sql`, `4_create-table-paciente.sql`, `5_create-table-consulta.sql`, `6_insert-especialidad.sql`, `7_insert-medico.sql`, `8_insert-paciente.sql`, `9_insert-consulta.sql`).

Los datos son responsabilidad del equipo. Los **catálogos deben tener al menos 5 registros** y las **tablas de hechos al menos 25 registros**.

### 3. `Reversa.ZIP`

Scripts SQL para deshacer por completo la instalación (eliminar tablas y base de datos), nombrados con prefijo numérico en el orden en que deben ejecutarse.

---

Los tres archivos deben cargarse en NEXUS antes del **viernes 15 de mayo a las 11:00pm**.

---

## Preguntas de negocio posibles en clase

Practica estas consultas sobre tu propia base de datos. En clase se harán preguntas similares de forma individual.

- ¿Qué médicos pertenecen a la especialidad de pediatría?
- ¿Cuáles son las 10 consultas más recientes?
- ¿Qué pacientes no han tenido ninguna consulta registrada todavía?
- ¿Qué médicos no han atendido ninguna consulta todavía?
- ¿Qué consultas se realizaron en el primer semestre del año?
- Muestra todas las consultas con el nombre del paciente, el médico que lo atendió y la especialidad del médico.
