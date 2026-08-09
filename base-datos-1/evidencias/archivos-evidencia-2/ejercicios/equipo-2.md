# Ejercicio 2: Modelado de base de datos

## Contexto

**EduFlow** es una plataforma de cursos en línea que organiza su oferta por categorías: desarrollo de software, diseño, marketing digital y negocios, entre otras. Cada curso tiene un precio fijo por sesión.

Actualmente, la plataforma registra todas sus inscripciones en una hoja de cálculo donde cada fila representa una inscripción. La hoja contiene la siguiente información en columnas:

> Categoría del curso, nombre del curso, precio por sesión, ID del alumno, nombre completo del alumno, correo electrónico del alumno, teléfono del alumno, fecha de inscripción, número de sesiones.

---

## El problema

El equipo de administración ha notado las siguientes situaciones:

- Cuando un alumno se inscribe a un segundo curso, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o correo respecto a su inscripción anterior.
- Cuando el precio de un curso cambia, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con precios contradictorios para el mismo curso.
- Es imposible saber cuántos alumnos únicos tiene la plataforma sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
