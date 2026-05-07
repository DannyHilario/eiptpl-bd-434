# Ejercicio PIA: Modelado de base de datos

## Contexto

**CineMax** es un videoclub que organiza su catálogo de películas por género: acción, comedia, terror y drama, entre otros. Cada género cuenta con una descripción que orienta al cliente sobre el tipo de contenido que puede esperar.

Actualmente, el encargado registra todas las películas disponibles en una hoja de cálculo donde cada fila representa una película. La hoja contiene la siguiente información en columnas:

> Género, descripción del género, título de la película, director, año de estreno, clasificación de contenido, duración en minutos.

---

## El problema

El encargado ha notado las siguientes situaciones:

- Cuando el nombre de un género cambia, es necesario actualizarlo en cada fila del catálogo que pertenezca a ese género, lo que genera inconsistencias entre registros del mismo género.
- La descripción del género se repite en cada película que le pertenece, ocupando espacio innecesario y dificultando mantener la información coherente.
- No es posible registrar un género nuevo en el catálogo si no se agrega al mismo tiempo al menos una película de ese género.

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

Scripts SQL para crear y poblar la base de datos desde cero. Nómbralos con prefijo numérico que indique el orden de ejecución (por ejemplo: `1_create-database.sql`, `2_create-table-genero.sql`, `3_create-table-pelicula.sql`, `4_insert-genero.sql`, `5_insert-pelicula.sql`).

Los datos son responsabilidad del equipo. Los **catálogos deben tener al menos 5 registros** y las **tablas de hechos al menos 25 registros**.

### 3. `Reversa.ZIP`

Scripts SQL para deshacer por completo la instalación (eliminar tablas y base de datos), nombrados con prefijo numérico en el orden en que deben ejecutarse.

---

Los tres archivos deben cargarse en NEXUS antes del **viernes 15 de mayo a las 11:00pm**.

---

## Preguntas de negocio posibles en clase

Practica estas consultas sobre tu propia base de datos. En clase se harán preguntas similares de forma individual.

- ¿Qué películas pertenecen al género de terror?
- ¿Cuáles son las 5 películas más recientes del catálogo?
- ¿Qué géneros no tienen ninguna película registrada todavía?
- ¿Qué películas tienen una duración mayor a 120 minutos?
- ¿Qué películas tienen clasificación `AA`?
- Muestra todas las películas del catálogo junto con el nombre de su género, ordenadas por género.
