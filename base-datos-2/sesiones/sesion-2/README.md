# Sesión 2 — Funciones Escalares y Vistas

Continuación de la Etapa 1 (*Funciones de agregado y escalares*). Esta sesión cubre dos temas: **funciones escalares** — funciones que se aplican fila por fila (a diferencia de las de agregado, que colapsan varias filas en una) — y **vistas** — consultas guardadas que se reutilizan como si fueran una tabla — practicando sobre **CineDB**, la base de datos usada en la sesión final de Base de Datos I.

---

## Qué se hizo en esta sesión

| # | Archivo | Contenido |
|---|---------|-----------|
| 01 | [`01-ejercicios-funciones-escalares.sql`](01-ejercicios-funciones-escalares.sql) | Los 10 ejercicios de funciones escalares descritos abajo |
| 02 | [`02-vista-peliculas-clasificacion-genero.sql`](02-vista-peliculas-clasificacion-genero.sql) | `CREATE VIEW vw_PeliculasClasificacionGenero` |
| 03 | [`03-vista-reporte-funciones.sql`](03-vista-reporte-funciones.sql) | `CREATE VIEW vw_ReporteFunciones` |
| 04 | [`04-consultas-con-vistas.sql`](04-consultas-con-vistas.sql) | Consultas de exploración, comparación sin vista/con vista, y `INNER JOIN` de cinco tablas |

---

## Contexto

CineDB tiene 8 tablas; para estos ejercicios solo se usan cuatro, sin necesidad de `JOIN`:

| Tabla | Filas | Columnas relevantes |
|-------|-------|----------------------|
| `Cliente` | 40 | `Nombre`, `PrimerApellido`, `SegundoApellido` (texto) |
| `Pelicula` | 30 | `Nombre`, `Director` (texto), `Duracion`, `AnioEstreno` (numéricos) |
| `Funcion` | 90 | `Precio` (numérico) |
| `Boleto` | 100 | `FechaPago`, `HoraPago` (fecha/hora) |

## Prerequisito

Esta sesión **reutiliza** CineDB tal como quedó instalada en Base de Datos I.

- Si ya la tienes instalada, solo selecciona **CineDB** en el dropdown de SSMS.
- Si no la tienes, sigue el paquete de instalación en [`../../../base-datos-1/sesiones/sesion-final/CineDB/instalacion`](../../../base-datos-1/sesiones/sesion-final/CineDB/instalacion).

---

## Contenido de estudio — sintaxis de funciones escalares

### `UPPER()` — convertir a mayúsculas

```sql
SELECT UPPER(Columna) AS Alias
FROM Tabla
```

### `LOWER()` — convertir a minúsculas

```sql
SELECT LOWER(Columna) AS Alias
FROM Tabla
```

### `ROUND()` — redondear un valor numérico

```sql
SELECT ROUND(Expresion, Decimales) AS Alias
FROM Tabla
```

- `Expresion`: columna o cálculo numérico a redondear.
- `Decimales`: cantidad de decimales a conservar.

### `CAST()` — convertir de un tipo de dato a otro

```sql
SELECT CAST(Columna AS TipoDato) AS Alias
FROM Tabla
```

- `TipoDato`: el tipo destino, por ejemplo `INT`, `VARCHAR(50)`, `DECIMAL(10,2)`.

### `SUBSTRING()` — extraer parte de una cadena

```sql
SELECT SUBSTRING(Columna, Inicio, Longitud) AS Alias
FROM Tabla
```

- `Inicio`: posición donde empieza la extracción (1 = primer carácter).
- `Longitud`: cantidad de caracteres a extraer.

### `LEN()` — longitud de una cadena

```sql
SELECT LEN(Columna) AS Alias
FROM Tabla
```

### Concatenación de cadenas — operador `+`

```sql
SELECT Columna1 + ' ' + Columna2 AS Alias
FROM Tabla
```

- Para concatenar una columna que no sea texto (por ejemplo numérica), primero hay que convertirla con `CAST(Columna AS VARCHAR)`.

---

## Contenido de estudio — sintaxis de vistas

Una **vista** es una consulta guardada bajo un nombre; se consulta como si fuera una tabla, pero no almacena datos propios — cada vez que se lee, ejecuta la consulta original por debajo.

### `CREATE VIEW` — crear una vista

```sql
CREATE VIEW NombreVista
AS
SELECT ...
FROM ...
```

- Una vez creada, se consulta igual que una tabla: `SELECT * FROM NombreVista`.
- Es útil para encapsular un `JOIN` que se repite seguido (por ejemplo, unir `Pelicula` con `Genero` y `Clasificacion`) y así no reescribirlo en cada consulta.

### Ejemplos trabajados en esta sesión

Ambos ejemplos parten de **CineDB**:

- **`vw_PeliculasClasificacionGenero`** ([`02-vista-peliculas-clasificacion-genero.sql`](02-vista-peliculas-clasificacion-genero.sql)): une `Pelicula`, `Genero` y `Clasificacion` para mostrar cada película con su clasificación y género en una sola fila.
- **`vw_ReporteFunciones`** ([`03-vista-reporte-funciones.sql`](03-vista-reporte-funciones.sql)): une `Funcion`, `Pelicula`, `Sala`, `TipoSala` y `Clasificacion` para mostrar el detalle completo de cada función (película, sala, tipo de sala, fecha, hora, precio).

En [`04-consultas-con-vistas.sql`](04-consultas-con-vistas.sql) se compara resolver el mismo reporte (cantidad de películas por género) **sin vista** — repitiendo los `INNER JOIN` — y **con vista** — consultando directamente `vw_PeliculasClasificacionGenero` — para mostrar cómo la vista simplifica la consulta final.

---

## Ejercicios a resolver

Cada ejercicio indica de qué tabla de **CineDB** parte. Sin `WHERE`, el resultado incluye todas las filas de la tabla salvo que se indique lo contrario.

### Ejercicio 1 — Datos de cliente en mayúsculas
**Tabla:** `Cliente`
**Enunciado:** Mostrar `Nombre`, `PrimerApellido` y `SegundoApellido` de cada cliente, los tres convertidos a mayúsculas.
**Función:** `UPPER()`
**Salida esperada:** 3 columnas, 40 filas. Ejemplo (idCliente 1): `Nombre = 'Carlos'` → `CARLOS`, `PrimerApellido = 'García'` → `GARCÍA`, `SegundoApellido = 'López'` → `LÓPEZ`.

### Ejercicio 2 — Títulos de película en minúsculas
**Tabla:** `Pelicula`
**Enunciado:** Mostrar el `Nombre` de cada película convertido a minúsculas.
**Función:** `LOWER()`
**Salida esperada:** 1 columna, 30 filas. Ejemplo: `'Intensamente 2'` → `'intensamente 2'`.

### Ejercicio 3 — Código de cliente
**Tabla:** `Cliente`
**Enunciado:** Mostrar `PrimerApellido` completo junto con un "código" formado por sus primeros 3 caracteres.
**Función:** `SUBSTRING()`
**Salida esperada:** 2 columnas, 40 filas. Ejemplo: `'García'` → código `'Gar'`.

### Ejercicio 4 — Longitud del nombre del director
**Tabla:** `Pelicula`
**Enunciado:** Mostrar `Director` junto con la cantidad de caracteres de su nombre, ordenado de mayor a menor longitud.
**Función:** `LEN()`
**Salida esperada:** 2 columnas, 30 filas, el nombre más largo primero. Ejemplo: `'Kelsey Mann'` → `11`.

### Ejercicio 5 — Precio dividido entre 3
**Tabla:** `Funcion`
**Enunciado:** Mostrar `Precio` y cuánto pagaría cada quien si 3 personas se reparten el costo de un boleto, redondeado a 2 decimales.
**Función:** `ROUND()`
**Salida esperada:** 2 columnas, 90 filas. Ejemplo: una función en sala VIP con `Precio = 220.00` → `MontoPorPersona = 73.33` (220.00 / 3 = 73.333... redondeado).

### Ejercicio 6 — Duración en formato texto
**Tabla:** `Pelicula`
**Enunciado:** Mostrar `Nombre` junto con la `Duracion` convertida a texto, con el sufijo `" min"` (ej. `"96 min"`).
**Funciones:** `CAST()` (a `VARCHAR`) + concatenación con `+`
**Salida esperada:** 2 columnas, 30 filas. Ejemplo: `Duracion = 96` → `'96 min'`.

### Ejercicio 7 — Precio como número entero
**Tabla:** `Funcion`
**Enunciado:** Mostrar `Precio` convertido a número entero (sin decimales).
**Función:** `CAST()` (a `INT`)
**Salida esperada:** 1 columna, 90 filas. Ejemplo: `Precio = 90.00` → `90`.

### Ejercicio 8 — Ficha de película
**Tabla:** `Pelicula`
**Enunciado:** Armar una sola columna de texto con el formato `Nombre dirigida por Director (AnioEstreno)`.
**Funciones:** `CAST()` (a `VARCHAR`) + concatenación con `+`
**Salida esperada:** 1 columna, 30 filas. Ejemplo: `'Intensamente 2 dirigida por Kelsey Mann (2024)'`.

### Ejercicio 9 — Comprobante de compra
**Tabla:** `Boleto`
**Enunciado:** Armar una sola columna de texto con el formato `Compra realizada el FechaPago a las HoraPago`.
**Funciones:** `CAST()` (a `VARCHAR`) + concatenación con `+`
**Salida esperada:** 1 columna, 100 filas. Ejemplo (idBoleto 1): `'Compra realizada el 2026-04-30 a las 20:00'`.

### Ejercicio 10 — Iniciales del cliente
**Tabla:** `Cliente`
**Enunciado:** Mostrar `Nombre`, `PrimerApellido` y una columna con las iniciales de ambos en mayúsculas, formato `"C.G."`.
**Funciones:** `UPPER()` + `SUBSTRING()` + concatenación con `+`
**Salida esperada:** 3 columnas, 40 filas. Ejemplo (idCliente 1): `Nombre = 'Carlos'`, `PrimerApellido = 'García'` → `Iniciales = 'C.G.'`.

---

## Escenarios para seguir practicando

- Combinar `UPPER()` con `SUBSTRING()` sobre `Pelicula.Director` para generar un código de director.
- Usar `CAST()` sobre `Funcion.Fecha` para mostrarla como texto en un formato distinto.
- Filtrar con `WHERE LEN(Nombre) > N` para encontrar películas con títulos largos.
