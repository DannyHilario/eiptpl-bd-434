# Ejercicio 2: Modelado de base de datos

## Contexto

**VetCare** es una clínica veterinaria que ofrece servicios de distinto tipo: consulta general, vacunación y cirugía menor, entre otros. Cada tipo de servicio tiene un precio fijo.

Actualmente, la clínica registra todas sus consultas en una hoja de cálculo donde cada fila representa una visita. La hoja contiene la siguiente información en columnas:

> Tipo de servicio, precio del servicio, nombre de la mascota, especie de la mascota, ID del dueño, nombre completo del dueño, teléfono del dueño, correo electrónico del dueño, fecha de consulta, número de sesiones.

---

## El problema

El personal de recepción ha notado las siguientes situaciones:

- Cuando un dueño regresa con su mascota, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o teléfono respecto a su visita anterior.
- Cuando el precio de un tipo de servicio cambia, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con precios contradictorios para el mismo tipo de servicio.
- Es imposible saber cuántas mascotas únicas ha atendido la clínica sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
