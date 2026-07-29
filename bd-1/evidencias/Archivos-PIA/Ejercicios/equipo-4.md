# Ejercicio PIA: Modelado de base de datos

## Contexto

**FarmaPlus** es una farmacia que organiza su inventario por tipos de medicamento: analgésicos, antibióticos, vitaminas y antiinflamatorios, entre otros.

Actualmente, el personal de caja registra todas las ventas en una hoja de cálculo donde cada fila representa una venta. La hoja contiene la siguiente información en columnas:

> Tipo de medicamento, nombre del medicamento, marca, presentación, precio unitario, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha de venta, cantidad.

---

## El problema

El personal de caja ha notado las siguientes situaciones:

- Cuando un cliente regresa a comprar, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el teléfono o correo respecto a su compra anterior.
- Cuando el precio de un medicamento cambia, es necesario actualizarlo en cada fila histórica que lo contenga, lo que ha generado registros con precios contradictorios para el mismo producto.
- No es posible registrar un tipo de medicamento nuevo si no tiene al menos un medicamento asociado todavía.

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

Scripts SQL para crear y poblar la base de datos desde cero. Nómbralos con prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-tipomedicamento.sql`, `3_create-table-medicamento.sql`, `4_create-table-cliente.sql`, `5_create-table-venta.sql`, `6_insert-tipomedicamento.sql`, `7_insert-medicamento.sql`, `8_insert-cliente.sql`, `9_insert-venta.sql`).

Los datos son responsabilidad del equipo. Los **catálogos deben tener al menos 5 registros** y las **tablas de hechos al menos 25 registros**.

### 3. `Reversa.ZIP`

Scripts SQL para deshacer por completo la instalación (eliminar tablas y base de datos), nombrados con prefijo numérico en el orden en que deben ejecutarse.

---

Los tres archivos deben cargarse en NEXUS antes del **viernes 15 de mayo a las 11:00pm**.

---

## Preguntas de negocio posibles en clase

Practica estas consultas sobre tu propia base de datos. En clase se harán preguntas similares de forma individual.

- ¿Qué medicamentos pertenecen al tipo analgésico?
- ¿Cuáles son las 10 ventas más recientes?
- ¿Qué clientes no han realizado ninguna compra todavía?
- ¿Qué medicamentos nunca han sido vendidos?
- ¿Qué ventas se realizaron en el primer trimestre del año?
- Muestra todas las ventas con el nombre del cliente, el medicamento que compró y el tipo al que pertenece.
