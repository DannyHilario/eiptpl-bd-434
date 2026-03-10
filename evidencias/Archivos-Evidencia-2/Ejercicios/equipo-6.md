# Ejercicio 2: Modelado de base de datos

## Contexto

**EventosPro** es una empresa de organización de eventos que cuenta con varios salones disponibles para renta. Los eventos se clasifican por tipo: boda, quinceañera, graduación y corporativo, entre otros. Cada tipo de evento tiene un precio base por hora.

Actualmente, la empresa registra todos sus contratos en una hoja de cálculo donde cada fila representa un evento contratado. La hoja contiene la siguiente información en columnas:

> Tipo de evento, precio base por hora, nombre del salón, capacidad del salón, ID del cliente, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha del evento, número de horas.

---

## El problema

El equipo de ventas ha notado las siguientes situaciones:

- Cuando un cliente contrata un segundo evento, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o correo respecto a su contrato anterior.
- Cuando el precio base de un tipo de evento cambia, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con precios contradictorios para el mismo tipo de evento.
- Es imposible saber cuántos clientes únicos ha atendido la empresa sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
