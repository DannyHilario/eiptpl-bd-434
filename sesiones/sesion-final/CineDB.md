# Ejercicio: CineDB

## Contexto

**CineDB** es la base de datos de un cine que opera con múltiples salas físicas clasificadas
por tipo: 2D, 3D, IMAX y VIP. Cada tipo de sala tiene un precio de boleto fijo que puede
cambiar con el tiempo; el precio no depende de la película proyectada sino del tipo de sala.

El cine maneja un catálogo de películas organizadas por género. Cada película pertenece a un
solo género y tiene una clasificación (AA, A, B, B-15 o C) que indica el público al que está
dirigida.

El cine programa **funciones**: la proyección de una película específica en una sala específica
en una fecha y hora determinadas. El precio del boleto se toma del tipo de sala en el momento
en que se registra la función y queda fijo — si el precio del tipo de sala cambia después,
las funciones ya programadas conservan el precio original.

Todo comprador debe estar registrado como **cliente**. Cuando un cliente asiste acompañado,
compra un boleto por cada asiento que ocupa su grupo; los acompañantes no necesitan
registrarse. Cada boleto queda vinculado al cliente que lo compró y a la función a la que
corresponde, formando el historial de asistencia del cliente.

---

## El problema

Actualmente el cine lleva dos hojas de cálculo separadas: una para las funciones programadas
y otra para la venta de boletos. La hoja de funciones contiene:

> Nombre de la sala, tipo de sala, precio actual, nombre de la película, género, director,
> duración en minutos, clasificación, año de estreno, fecha de función, hora de inicio.

La hoja de boletos contiene:

> Nombre completo del cliente, teléfono, correo, fecha de nacimiento, nombre de la película,
> nombre de la sala, fecha de función, hora de inicio, precio pagado.

El encargado ha identificado los siguientes problemas:

- Cuando el precio de un tipo de sala cambia, hay que actualizar manualmente todas las filas
  futuras de ese tipo en la hoja de funciones, lo que ha generado precios contradictorios
  para el mismo tipo de sala.
- No es posible saber qué películas forman parte del catálogo si aún no tienen funciones
  programadas.
- No existe forma de consultar qué salas están disponibles en un horario determinado sin
  revisar manualmente toda la hoja.
- Los datos del cliente se repiten en cada boleto que compra, con frecuentes diferencias en
  el teléfono o correo respecto a compras anteriores.
- No hay forma de agrupar los boletos que un cliente compró en una misma visita, ni de saber
  si asistió a diferentes funciones en distintas fechas.

---

## Reglas de negocio

- El precio de un boleto depende del **tipo de sala**, no de la película. Los tipos de sala
  disponibles son: 2D ($90), 3D ($130), IMAX ($180) y VIP ($220).
- El precio se registra en la función al momento de programarse. Si el precio del tipo de
  sala cambia después, las funciones ya registradas conservan el precio original.
- Una sala no puede tener dos funciones con la misma fecha y hora de inicio.
- Todo comprador de boleto debe ser un cliente registrado. Si un cliente va con acompañantes,
  compra un boleto por cada asiento — los acompañantes no necesitan registrarse.
- Las películas tienen una clasificación que indica el público al que están dirigidas:

  | Clasificación | Descripción |
  |---------------|-------------|
  | AA | Apta para todo público |
  | A | Público en general |
  | B | Mayores de 15 años |
  | B-15 | Mayores de 15 años |
  | C | Mayores de 18 años |

## Limitaciones conocidas del modelo

- **Solapamiento de funciones:** el modelo puede detectar cuando dos funciones tienen
  exactamente la misma hora de inicio en la misma sala, pero no cuando se traslapan. Es
  posible registrar una función a las 18:01 en una sala que ya tiene una a las 18:00 con
  duración de dos horas. Resolver esto requeriría lógica adicional fuera del alcance de
  este ejercicio.
- **Clasificación por edad:** el modelo almacena la clasificación de la película y la fecha
  de nacimiento del cliente, pero no valida automáticamente que el cliente cumpla la edad
  requerida al comprar un boleto. Esa validación queda fuera del alcance de este ejercicio.
- **Agrupación de compras en un ticket:** en un sistema real, un cliente podría comprar en
  una sola transacción boletos para funciones distintas (por ejemplo, reservar el viernes y
  el sábado al mismo tiempo). Esto se modela con una tabla intermedia `Ticket` entre
  `Cliente` y `Boleto`, donde cada ticket agrupa un conjunto de boletos de una misma compra.
  Esta extensión está al alcance del modelo relacional visto en el curso, pero se omite para
  mantener el ejercicio manejable.

---
