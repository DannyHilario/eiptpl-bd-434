# Ejercicio PIA: Modelado de base de datos

## Contexto

**RentaAutos** es una empresa de renta de vehículos que organiza su flota por tipo: compacto, sedán, SUV y camioneta, entre otros. Cada tipo de vehículo tiene una tarifa diaria base.

Actualmente, el personal de mostrador registra todas las rentas en una hoja de cálculo donde cada fila representa una renta. La hoja contiene la siguiente información en columnas:

> Tipo de vehículo, tarifa diaria, marca del vehículo, modelo, año, placas, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha de inicio, fecha de devolución.

---

## El problema

El personal de mostrador ha notado las siguientes situaciones:

- Cuando un cliente regresa a rentar otro vehículo, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el teléfono o correo respecto a su renta anterior.
- Cuando la tarifa diaria de un tipo de vehículo cambia, es necesario actualizarla en cada fila histórica correspondiente, lo que ha generado registros con tarifas contradictorias para el mismo tipo.
- No es posible registrar un tipo de vehículo nuevo si no hay al menos un vehículo de ese tipo en la flota todavía.

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

Scripts SQL para crear y poblar la base de datos desde cero. Nómbralos con prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-tipovehiculo.sql`, `3_create-table-vehiculo.sql`, `4_create-table-cliente.sql`, `5_create-table-renta.sql`, `6_insert-tipovehiculo.sql`, `7_insert-vehiculo.sql`, `8_insert-cliente.sql`, `9_insert-renta.sql`).

Los datos son responsabilidad del equipo. Los **catálogos deben tener al menos 5 registros** y las **tablas de hechos al menos 25 registros**.

### 3. `Reversa.ZIP`

Scripts SQL para deshacer por completo la instalación (eliminar tablas y base de datos), nombrados con prefijo numérico en el orden en que deben ejecutarse.

---

Los tres archivos deben cargarse en NEXUS antes del **viernes 15 de mayo a las 11:00pm**.

---

## Preguntas de negocio posibles en clase

Practica estas consultas sobre tu propia base de datos. En clase se harán preguntas similares de forma individual.

- ¿Qué vehículos pertenecen al tipo SUV?
- ¿Cuáles son las 10 rentas más recientes?
- ¿Qué clientes no han realizado ninguna renta todavía?
- ¿Qué vehículos nunca han sido rentados?
- ¿Qué rentas se realizaron en el primer trimestre del año?
- Muestra todas las rentas con el nombre del cliente, el vehículo que rentó y el tipo al que pertenece.
