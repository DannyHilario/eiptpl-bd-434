# Ejercicio PIA: Modelado de base de datos

## Contexto

**CompuStore** es una tienda de artículos de cómputo que organiza su catálogo por categorías: laptops, monitores, teclados, ratones e impresoras, entre otras.

Actualmente, el encargado registra todos los pedidos en una hoja de cálculo donde cada fila representa un pedido. La hoja contiene la siguiente información en columnas:

> Categoría del artículo, nombre del artículo, marca, precio unitario, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha del pedido, cantidad.

---

## El problema

El encargado ha notado las siguientes situaciones:

- Cuando un cliente regresa a hacer otro pedido, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el teléfono o correo respecto a su pedido anterior.
- Cuando el precio de un artículo cambia, es necesario actualizarlo en cada fila histórica que lo contenga, lo que ha generado registros con precios contradictorios para el mismo artículo.
- No es posible registrar una categoría nueva si no tiene al menos un artículo asociado todavía.

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

Scripts SQL para crear y poblar la base de datos desde cero. Nómbralos con prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-categoria.sql`, `3_create-table-articulo.sql`, `4_create-table-cliente.sql`, `5_create-table-pedido.sql`, `6_insert-categoria.sql`, `7_insert-articulo.sql`, `8_insert-cliente.sql`, `9_insert-pedido.sql`).

Los datos son responsabilidad del equipo. Los **catálogos deben tener al menos 5 registros** y las **tablas de hechos al menos 25 registros**.

### 3. `Reversa.ZIP`

Scripts SQL para deshacer por completo la instalación (eliminar tablas y base de datos), nombrados con prefijo numérico en el orden en que deben ejecutarse.

---

Los tres archivos deben cargarse en NEXUS antes del **viernes 15 de mayo a las 11:00pm**.

---

## Preguntas de negocio posibles en clase

Practica estas consultas sobre tu propia base de datos. En clase se harán preguntas similares de forma individual.

- ¿Qué artículos pertenecen a la categoría de laptops?
- ¿Cuáles son los 10 pedidos más recientes?
- ¿Qué clientes no han realizado ningún pedido todavía?
- ¿Qué artículos nunca han sido pedidos?
- ¿Qué pedidos se realizaron en el primer trimestre del año?
- Muestra todos los pedidos con el nombre del cliente, el artículo que compró y la categoría a la que pertenece.
