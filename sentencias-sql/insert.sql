-- 1. Materiales y Depósitos
-- Limitamos a dos tipos de materiales como pediste
INSERT INTO material (tipo) VALUES 
('Plástico'), ('Fibra de Vidrio');

INSERT INTO deposito (lote, fila) VALUES 
('Lote-A', 'Fila-10'), ('Lote-B', 'Fila-05'), ('Showroom', 'Principal');

-- 2. Detalles de Cabeza
INSERT INTO detalle_cabeza (tipo_ojo, tipo_cabello) VALUES 
('Azules', 'Sintético'), ('Negros', 'Castaño'), ('Pintados', 'Rubio');

-- 3. Modelos de Pieza
-- Nombres simplificados y usando solo los 2 materiales definidos
INSERT INTO modelo_pieza (tipo, color, sexo, tamano, id_material, id_cabeza) VALUES 
('Cabeza', 'Piel', 'Mujer', 'S', 1, 1),
('Torso', 'Blanco', 'Mujer', 'M', 1, NULL),
('Torso', 'Negro', 'Hombre', 'L', 2, NULL),
('Brazo Derecho', 'Blanco', 'Mujer', 'S', 1, NULL),
('Brazo Izquierdo', 'Blanco', 'Mujer', 'S', 1, NULL),
('Pierna Derecha', 'Blanco', 'Mujer', 'M', 2, NULL),
('Pierna Izquierda', 'Blanco', 'Mujer', 'M', 2, NULL);

-- 4. Piezas Físicas (10 registros por cada tipo)
-- Cabezas (Modelo 1)
INSERT INTO pieza_fisica (fecha_fabricacion, estado, id_modelo) VALUES 
('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1),
('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1), ('2026-04-20', 'Nueva', 1);

-- Torsos (Modelo 2)
INSERT INTO pieza_fisica (fecha_fabricacion, estado, id_modelo) VALUES 
('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2),
('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2), ('2026-04-21', 'Nueva', 2);

-- Brazos (10 derechos Modelo 3 y 10 izquierdos Modelo 4)
INSERT INTO pieza_fisica (fecha_fabricacion, estado, id_modelo) VALUES 
('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3),
('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3), ('2026-04-22', 'Nueva', 3),
('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4),
('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4), ('2026-04-22', 'Nueva', 4);

-- Piernas (10 derechas Modelo 5 y 10 izquierdas Modelo 6)
INSERT INTO pieza_fisica (fecha_fabricacion, estado, id_modelo) VALUES 
('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5),
('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5), ('2026-04-23', 'Nueva', 5),
('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6),
('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6), ('2026-04-23', 'Nueva', 6);

-- 5. Creación de 5 Maniquíes
INSERT INTO maniqui (fecha_fabricacion, gama, tamano, precio, id_deposito) VALUES 
('2026-04-24', 'Alta', 'Adulto', 45000, 1),
('2026-04-24', 'Alta', 'Adulto', 45000, 1),
('2026-04-24', 'Alta', 'Adulto', 45000, 2),
('2026-04-24', 'Media', 'Adulto', 38000, 2),
('2026-04-24', 'Media', 'Adulto', 38000, 3);

-- 6. Ensamblaje de 5 maniquíes completos
-- Cada maniquí usa: 1 Cabeza, 1 Torso, 1 Brazo Der, 1 Brazo Izq, 1 Pierna Der, 1 Pierna Izq.
INSERT INTO ensamblaje (id_maniqui, id_pieza_fisica) VALUES 
(1, 1), (1, 11), (1, 21), (1, 31), (1, 41), (1, 51),
(2, 2), (2, 12), (2, 22), (2, 32), (2, 42), (2, 52),
(3, 3), (3, 13), (3, 23), (3, 33), (3, 43), (3, 53),
(4, 4), (4, 14), (4, 24), (4, 34), (4, 44), (4, 54),
(5, 5), (5, 15), (5, 25), (5, 35), (5, 45), (5, 55);