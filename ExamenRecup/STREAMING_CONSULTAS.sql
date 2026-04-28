DROP DATABASE IF EXISTS STREAMING_CONSULTAS;
CREATE DATABASE STREAMING_CONSULTAS;
USE STREAMING_CONSULTAS;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE plataformas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    url VARCHAR(255),
    precio DECIMAL(5,2),
    pais VARCHAR(50)
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_lanzamiento DATE,
    id_plataforma INT NULL,
    genero VARCHAR(50),
    temporadas INT,
    valoracion DECIMAL(3,1),
    FOREIGN KEY (id_plataforma) REFERENCES plataformas(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE suscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_plataforma INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo_pago CHAR(1),
    estado VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (id_plataforma) REFERENCES plataformas(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO usuarios (nombre, apellido, email, ciudad, fecha_registro) VALUES
('Juan', 'Pérez', 'juan.perez@medac.com', 'Madrid', '2023-01-15'),
('Ana', 'López', 'ana.lopez@example.com', 'Sevilla', '2023-03-20'),
('Laura', 'Martínez', 'laura.martinez@example.com', 'Madrid', '2024-02-10'),
('Darío', 'Gómez', 'dario.gomez@example.com', 'Valencia', '2024-06-05'),
('Carlos', 'Fernández', 'carlos.fernandez@medac.com', 'Málaga', '2022-11-30'),
('Celia', 'Macías', 'celia.macias@medac.com', 'Granada', '2024-09-12');

INSERT INTO plataformas (nombre, url, precio, pais) VALUES
('Disney+', 'https://www.disneyplus.com', 8.99, 'Estados Unidos'),
('Netflix', 'https://www.netflix.com', 12.99, 'Estados Unidos'),
('HBO Max', 'https://www.hbomax.com', 9.99, 'Estados Unidos'),
('Amazon Prime', 'https://www.primevideo.com', 6.99, 'Estados Unidos'),
('Filmin', 'https://www.filmin.es', 7.99, 'España');

INSERT INTO series (nombre, fecha_lanzamiento, id_plataforma, genero, temporadas, valoracion) VALUES
('Los Simpson', '1989-12-17', 1, 'Animación', 35, 8.7),
('Arcane', '2021-11-06', 2, 'Animación', 2, 9.0),
('The Last of Us', '2023-01-15', 3, 'Drama', 1, 8.8),
('The Boys', '2019-07-26', 4, 'Acción', 4, 8.7),
('Juego de Tronos', '2011-04-17', 3, 'Fantasía', 8, 9.2),
('Stranger Things', '2016-07-15', 2, 'Ciencia ficción', 4, 8.6),
('Embrujadas', '1998-10-07', NULL, 'Fantasía', 8, 7.1),
('Breaking Bad', '2008-01-20', 2, 'Drama', 5, 9.5),
('The Mandalorian', '2019-11-12', 1, 'Ciencia ficción', 3, 8.5),
('Fleabag', '2016-07-21', 4, 'Comedia', 2, 8.7);

INSERT INTO suscripciones (id_usuario, id_plataforma, fecha_inicio, fecha_fin, tipo_pago, estado) VALUES
(1, 1, '2024-01-01', '2024-12-31', 'A', 'activa'),
(2, 2, '2024-03-01', '2024-04-01', 'M', 'caducada'),
(3, 3, '2024-02-15', '2025-02-14', 'A', 'activa'),
(4, 4, '2024-04-01', '2024-04-30', 'M', 'caducada'),
(1, 2, '2024-01-01', '2024-12-31', 'A', 'activa'),
(2, 1, '2024-05-01', '2024-05-31', 'M', 'activa'),
(2, 3, '2024-05-01', '2025-04-30', 'A', 'activa'),
(3, 2, '2024-06-01', '2024-06-30', 'M', 'caducada'),
(3, 4, '2024-07-01', '2025-06-30', 'A', 'activa'),
(4, 1, '2024-08-01', '2025-07-31', 'A', 'activa'),
(4, 3, '2024-09-01', '2024-09-30', 'M', 'caducada'),
(5, 5, '2024-10-01', '2025-09-30', 'A', 'activa');