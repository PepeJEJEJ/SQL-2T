-- ============================
-- TABLA PRESIDENTE
-- ============================
CREATE TABLE presidente (
    dni VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    anio_eleccion INT NOT NULL
);

-- ============================
-- TABLA EQUIPO
-- ============================
CREATE TABLE equipo (
    cod_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    nombre_estadio VARCHAR(100) NOT NULL,
    aforo INT NOT NULL,
    anio_fundacion INT NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    dni_presidente VARCHAR(15) UNIQUE, -- un presidente solo puede estar en un equipo
    CONSTRAINT fk_equipo_presidente FOREIGN KEY (dni_presidente)
        REFERENCES presidente(dni)
);

-- ============================
-- TABLA JUGADOR
-- ============================
CREATE TABLE jugador (
    cod_jugador INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    cod_equipo INT NOT NULL,
    CONSTRAINT fk_jugador_equipo FOREIGN KEY (cod_equipo)
        REFERENCES equipo(cod_equipo)
);

-- ============================
-- TABLA PARTIDO
-- ============================
CREATE TABLE partido (
    cod_partido INT PRIMARY KEY,
    fecha DATE NOT NULL,
    goles_local INT NOT NULL,
    goles_visitante INT NOT NULL,
    cod_equipo_local INT NOT NULL,
    cod_equipo_visitante INT NOT NULL,
    CONSTRAINT fk_partido_local FOREIGN KEY (cod_equipo_local)
        REFERENCES equipo(cod_equipo),
    CONSTRAINT fk_partido_visitante FOREIGN KEY (cod_equipo_visitante)
        REFERENCES equipo(cod_equipo)
);

-- ============================
-- TABLA GOL
-- ============================
CREATE TABLE gol (
    cod_gol INT PRIMARY KEY,
    minuto INT NOT NULL,
    descripcion VARCHAR(255),
    cod_partido INT NOT NULL,
    cod_jugador INT NOT NULL,
    CONSTRAINT fk_gol_partido FOREIGN KEY (cod_partido)
        REFERENCES partido(cod_partido),
    CONSTRAINT fk_gol_jugador FOREIGN KEY (cod_jugador)
        REFERENCES jugador(cod_jugador)
);
