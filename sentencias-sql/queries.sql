-- 1. Listado de Stock: Obtener N° de serie, material y color de las piernas derechas
SELECT 
    pf.id AS nro_serie, 
    m.tipo AS material, 
    mp.color
FROM pieza_fisica pf
JOIN modelo_pieza mp ON pf.id_modelo = mp.id
JOIN material m ON mp.id_material = m.id
WHERE mp.tipo = 'Pierna Derecha';

-- Listado de cabezas fabricadas después de una fecha específica
SELECT 
    pf.id AS nro_serie,
    mp.tipo,
    pf.fecha_fabricacion
FROM pieza_fisica pf
JOIN modelo_pieza mp ON pf.id_modelo = mp.id
WHERE mp.tipo = 'Cabeza' 
  AND pf.fecha_fabricacion > '2026-01-01';


-- Listar torsos Mediano o Largo ordenados por material
SELECT 
    pf.id AS nro_serie,
    mp.tipo,
    mp.tamano AS talle,
    m.tipo AS material
FROM pieza_fisica pf
JOIN modelo_pieza mp ON pf.id_modelo = mp.id
JOIN material m ON mp.id_material = m.id
WHERE mp.tipo = 'Torso' 
  AND mp.tamano IN ('M', 'L')
ORDER BY m.tipo ASC;


Realizar un conteo total de cuántas piezas hay en la base de datos agrupadas por su material (ej. cuántas de madera, cuántas de plástico).

SELECT 
    m.tipo AS material, 
    COUNT(pf.id) AS cantidad_total
FROM pieza_fisica pf
JOIN modelo_pieza mp ON pf.id_modelo = mp.id
JOIN material m ON mp.id_material = m.id
GROUP BY m.tipo;

Mostrar el código del Maniquí Completo junto con la fecha de ensamblaje y el ID/serie de la cabeza que se le asignó.

SELECT 
    m.id AS codigo_maniqui,
    e.fecha_union AS fecha_ensamblaje,
    pf.id AS nro_serie_cabeza
FROM maniqui m
JOIN ensamblaje e 
    ON m.id = e.id_maniqui              
JOIN pieza_fisica pf 
    ON e.id_pieza_fisica = pf.id        
JOIN modelo_pieza mp 
    ON pf.id_modelo = mp.id             
WHERE mp.tipo = 'Cabeza';




Buscar todas las piezas (de cualquier tipo) que tengan un color o acabado específico (ej. "Negro Mate").

SELECT 
    pf.id AS nro_serie,
    mp.tipo,
    mp.color
FROM pieza_fisica pf
JOIN modelo_pieza mp ON pf.id_modelo = mp.id
WHERE mp.color = 'Negro';