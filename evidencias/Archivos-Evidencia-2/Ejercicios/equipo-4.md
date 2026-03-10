# Ejercicio 2: Modelado de base de datos

## Contexto

**BarberKing** es una barbería que cuenta con varios barberos, cada uno especializado en distintos tipos de corte: clásico, degradado, navaja y diseño, entre otros. Cada tipo de corte tiene un precio fijo.

Actualmente, la barbería registra todas sus citas en una hoja de cálculo donde cada fila representa una atención. La hoja contiene la siguiente información en columnas:

> Tipo de corte, precio del corte, nombre del barbero, especialidad del barbero, ID del cliente, nombre completo del cliente, teléfono del cliente, fecha de la cita, duración en minutos.

---

## El problema

El encargado del negocio ha notado las siguientes situaciones:

- Cuando un cliente regresa a cortarse el cabello, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o teléfono respecto a su visita anterior.
- Cuando el precio de un tipo de corte cambia, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con precios contradictorios para el mismo tipo de corte.
- Es imposible saber cuántos clientes únicos ha atendido la barbería sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
