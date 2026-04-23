-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS fabrica_db;
USE fabrica_db;

-- 2. Tablas base (sin dependencias)
CREATE TABLE material (
    id INT(11) NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE deposito (
    id INT(11) NOT NULL AUTO_INCREMENT,
    lote VARCHAR(50) NOT NULL,
    fila VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE detalle_cabeza (
    id INT(11) NOT NULL AUTO_INCREMENT,
    tipo_ojo VARCHAR(50) DEFAULT NULL,
    tipo_cabello VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (id)
);

-- 3. Tablas con llaves foráneas
CREATE TABLE maniqui (
    id INT(11) NOT NULL AUTO_INCREMENT,
    fecha_fabricacion DATE DEFAULT NULL,
    gama VARCHAR(50) DEFAULT NULL,
    tamano VARCHAR(50) DEFAULT NULL,
    precio DECIMAL(10,2) DEFAULT NULL,
    id_deposito INT(11) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_maniqui_deposito FOREIGN KEY (id_deposito) REFERENCES deposito (id)
);

CREATE TABLE modelo_pieza (
    id INT(11) NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(100) DEFAULT NULL,
    color VARCHAR(50) DEFAULT NULL,
    sexo VARCHAR(50) DEFAULT NULL,
    tamano VARCHAR(50) DEFAULT NULL,
    id_material INT(11) DEFAULT NULL,
    id_cabeza INT(11) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_modelo_material FOREIGN KEY (id_material) REFERENCES material (id),
    CONSTRAINT fk_modelo_cabeza FOREIGN KEY (id_cabeza) REFERENCES detalle_cabeza (id)
);

CREATE TABLE pieza_fisica (
    id INT(11) NOT NULL AUTO_INCREMENT,
    fecha_fabricacion DATE DEFAULT NULL,
    estado VARCHAR(50) DEFAULT NULL,
    id_modelo INT(11) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pieza_modelo FOREIGN KEY (id_modelo) REFERENCES modelo_pieza (id)
);

CREATE TABLE ensamblaje (
    id INT(11) NOT NULL AUTO_INCREMENT,
    id_maniqui INT(11) DEFAULT NULL,
    id_pieza_fisica INT(11) DEFAULT NULL,
    fecha_union DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (id_pieza_fisica),
    CONSTRAINT fk_ensamblaje_maniqui FOREIGN KEY (id_maniqui) REFERENCES maniqui (id),
    CONSTRAINT fk_ensamblaje_pieza FOREIGN KEY (id_pieza_fisica) REFERENCES pieza_fisica (id)
);