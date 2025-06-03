-- ============================================================
-- Modelo Estrella (Ejercicio 01 � Env�os)
-- ============================================================

-- 1 CREAR LA BASE DE DATOS
CREATE DATABASE envio_dw;
GO

-- Usar la base reci�n creada
USE envio_dw;
GO

-- 2 TABLA DIMENSI�N TIEMPO
CREATE TABLE tiempo (
id_tiempo_pk INT PRIMARY KEY,
dia INT NOT NULL,
mes INT NOT NULL,
anio INT NOT NULL
);
GO

-- 3 TABLA DIMENSI�N LOTE
CREATE TABLE lote (
id_lote_pk INT PRIMARY KEY,
peso DECIMAL(10,2) NOT NULL,
grupo_lote VARCHAR(100) NOT NULL,
tarifa_exportacion DECIMAL(10,2) NOT NULL,
tarifa_importacion DECIMAL(10,2) NOT NULL,
pais_origen VARCHAR(100) NOT NULL
);
GO

-- 4 TABLA DIMENSI�N DESTINO
CREATE TABLE destino (
id_destino_pk INT PRIMARY KEY,
nombre_destino VARCHAR(100) NOT NULL,
pais_destino VARCHAR(100) NOT NULL
);
GO

-- 5 TABLA DIMENSI�N CENTRO_COSTO
CREATE TABLE centro_costo (
id_centro_costo_pk INT PRIMARY KEY,
responsable VARCHAR(100) NOT NULL,
grupo_centro VARCHAR(100) NOT NULL
);
GO

-- 6 TABLA DIMENSI�N MODO_TRANSPORTE
CREATE TABLE modo_transporte (
id_transporte_pk INT PRIMARY KEY,
tipo_transporte VARCHAR(100) NOT NULL
);
GO

-- 7 TABLA DE HECHOS ENVIO
CREATE TABLE envio (
id_envio_pk INT PRIMARY KEY,
id_tiempo_fk INT NOT NULL,
id_lote_fk INT NOT NULL,
id_destino_fk INT NOT NULL,
id_centro_costo_fk INT NOT NULL,
id_transporte_fk INT NOT NULL,
cantidad_lotes INT NOT NULL,
costo_envio DECIMAL(12,2) NOT NULL,
FOREIGN KEY (id_tiempo_fk) REFERENCES tiempo(id_tiempo_pk),
FOREIGN KEY (id_lote_fk) REFERENCES lote(id_lote_pk),
FOREIGN KEY (id_destino_fk) REFERENCES destino(id_destino_pk),
FOREIGN KEY (id_centro_costo_fk) REFERENCES centro_costo(id_centro_costo_pk),
FOREIGN KEY (id_transporte_fk) REFERENCES modo_transporte(id_transporte_pk)
);
GO

-- Prueba de despliegue automático