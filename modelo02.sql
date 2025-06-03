-- ============================================================
-- Ejercicio 02 – Reservas de viaje
-- ============================================================

-- 1) CREAR LA BASE DE DATOS
CREATE DATABASE reserva_dw;
GO

-- Usar la base recién creada
USE reserva_dw;
GO

-- 2) TABLA DIMENSIÓN TIPO_CLIENTE
CREATE TABLE tipo_cliente (
    id_tipo_cliente INT PRIMARY KEY,
    descripcion      VARCHAR(100) NOT NULL
);
GO

-- 3) TABLA DIMENSIÓN CLIENTE
CREATE TABLE cliente (
    id_cliente           INT PRIMARY KEY,
    nombre_cliente       VARCHAR(100) NOT NULL,
    id_tipo_cliente_fk   INT NOT NULL,
    FOREIGN KEY (id_tipo_cliente_fk)
        REFERENCES tipo_cliente(id_tipo_cliente)
);
GO

-- 4) TABLA DIMENSIÓN UBICACION
CREATE TABLE ubicacion (
    id_ubicacion    INT PRIMARY KEY,
    ciudad          VARCHAR(100) NOT NULL,
    pais_ubicacion  VARCHAR(100) NOT NULL
);
GO

-- 5) TABLA DIMENSIÓN OPERADOR
CREATE TABLE operador (
    id_operador     INT PRIMARY KEY,
    nombre_operador VARCHAR(100) NOT NULL
);
GO

-- 6) TABLA DIMENSIÓN PAIS
CREATE TABLE pais (
    id_pais      INT PRIMARY KEY,
    nombre_pais  VARCHAR(100) NOT NULL
);
GO

-- 7) TABLA DIMENSIÓN DESTINO
CREATE TABLE destino (
    id_destino    INT PRIMARY KEY,
    nombre_destino VARCHAR(100) NOT NULL,
    id_pais_fk     INT NOT NULL,
    FOREIGN KEY (id_pais_fk)
        REFERENCES pais(id_pais)
);
GO

-- 8) TABLA DIMENSIÓN AGENCIA
-- (Ahora solo tiene FK a UBICACION, sin FK a OPERADOR)
CREATE TABLE agencia (
    id_agencia       INT PRIMARY KEY,
    nombre_agencia   VARCHAR(100) NOT NULL,
    id_ubicacion_fk  INT NOT NULL,
    FOREIGN KEY (id_ubicacion_fk)
        REFERENCES ubicacion(id_ubicacion)
);
GO

-- 9) TABLA DIMENSIÓN TIEMPO
CREATE TABLE tiempo (
    id_tiempo   INT PRIMARY KEY,
    mes         INT NOT NULL,
    trimestre   INT NOT NULL,
    anio        INT NOT NULL
);
GO

-- 10) TABLA DE HECHOS RESERVA
CREATE TABLE reserva (
    id_reserva        INT PRIMARY KEY,
    id_tiempo_fk      INT NOT NULL,
    id_cliente_fk     INT NOT NULL,
    id_agencia_fk     INT NOT NULL,
    id_operador_fk    INT NOT NULL,
    id_destino_fk     INT NOT NULL,
    FOREIGN KEY (id_tiempo_fk)
        REFERENCES tiempo(id_tiempo),
    FOREIGN KEY (id_cliente_fk)
        REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_agencia_fk)
        REFERENCES agencia(id_agencia),
    FOREIGN KEY (id_operador_fk)
        REFERENCES operador(id_operador),
    FOREIGN KEY (id_destino_fk)
        REFERENCES destino(id_destino)
);
GO
