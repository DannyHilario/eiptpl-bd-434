# Ejercicio 2: Modelado de base de datos

## Contexto

**AutoFix** es un taller mecánico que ofrece servicios de distinto tipo: afinación, cambio de aceite, frenos y suspensión, entre otros. Cada tipo de servicio tiene un costo fijo.

Actualmente, el taller registra todas sus órdenes de servicio en una hoja de cálculo donde cada fila representa una atención. La hoja contiene la siguiente información en columnas:

> Tipo de servicio, costo del servicio, placa del vehículo, marca del vehículo, modelo del vehículo, ID del cliente, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha de ingreso, días estimados de entrega.

---

## El problema

El administrador del taller ha notado las siguientes situaciones:

- Cuando un cliente lleva su vehículo a un nuevo servicio, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o teléfono respecto a su visita anterior.
- Cuando el costo de un tipo de servicio cambia, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con costos contradictorios para el mismo tipo de servicio.
- Es imposible saber cuántos clientes únicos ha atendido el taller, ni cuántos vehículos distintos han ingresado, sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
