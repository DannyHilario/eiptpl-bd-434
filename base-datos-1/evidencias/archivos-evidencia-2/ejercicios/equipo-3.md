# Ejercicio 2: Modelado de base de datos

## Contexto

**ViajeYA** es una agencia de viajes boutique que comercializa paquetes de distintos tipos: escapada de fin de semana, luna de miel y aventura extrema, entre otros. Cada tipo de paquete tiene un precio base por noche.

Actualmente, la agencia registra todas sus reservaciones en una hoja de cálculo donde cada fila representa una reservación. La hoja contiene la siguiente información en columnas:

> Tipo de paquete, precio base por noche, nombre del destino, país del destino, ID del cliente, nombre completo del cliente, teléfono del cliente, correo electrónico del cliente, fecha de salida, número de noches.

---

## El problema

El equipo de ventas ha notado las siguientes situaciones:

- Cuando un cliente regresa a reservar otro viaje, toda su información personal se vuelve a capturar en una nueva fila, frecuentemente con pequeñas diferencias en el nombre o teléfono respecto a su reservación anterior.
- Cuando el precio base de un tipo de paquete cambia por temporada, es necesario actualizar manualmente cada fila histórica, lo que ha generado registros con precios contradictorios para el mismo tipo de paquete.
- Es imposible saber cuántos clientes únicos ha atendido la agencia sin revisar y limpiar duplicados a mano.

---

## Tu tarea

Con base en la información anterior, propón un modelo de base de datos relacional que elimine la redundancia y los problemas descritos.

Para cada tabla que identifiques, define:

- Nombre de la tabla
- Columnas con su tipo de dato
- Llave primaria
- Llaves foráneas, si aplica
- Constraints relevantes (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
