-- ============================================================
-- Ejercicio 03 – Gestión de proyectos
-- ============================================================

-- 1) CREAR LA BASE DE DATOS
CREATE DATABASE gestion_proyectos_dw;
GO

-- Usar la base recién creada
USE gestion_proyectos_dw;
GO

-- 2) TABLA DIMENSIÓN TIEMPO
CREATE TABLE tiempo (
id_tiempo INT PRIMARY KEY,
dia INT NOT NULL,
mes INT NOT NULL,
anio INT NOT NULL
);
GO

-- 3) TABLA DIMENSIÓN PAIS
CREATE TABLE pais (
id_pais INT PRIMARY KEY,
nombre_pais VARCHAR(100) NOT NULL
);
GO

-- 4) TABLA DIMENSIÓN LOCALIDAD
CREATE TABLE localidad (
id_localidad INT PRIMARY KEY,
nombre_localidad VARCHAR(100) NOT NULL,
id_pais_fk INT NOT NULL,
FOREIGN KEY (id_pais_fk) REFERENCES pais(id_pais)
);
GO

-- 5) TABLA DIMENSIÓN CLIENTE
CREATE TABLE cliente (
id_cliente INT PRIMARY KEY,
nombre_cliente VARCHAR(100) NOT NULL,
telefono_cliente VARCHAR(50) NOT NULL,
email_cliente VARCHAR(100) NOT NULL
);
GO

-- 6) TABLA DIMENSIÓN PROYECTO
CREATE TABLE proyecto (
id_proyecto INT PRIMARY KEY,
nombre_proyecto VARCHAR(100) NOT NULL
);
GO

-- 7) TABLA DIMENSIÓN RESPONSABLE
CREATE TABLE responsable (
id_responsable INT PRIMARY KEY,
nombre_responsable VARCHAR(100) NOT NULL,
cargo_responsable VARCHAR(100) NOT NULL
);
GO

-- 8) TABLA DIMENSIÓN EMPRESA
CREATE TABLE empresa (
id_empresa INT PRIMARY KEY,
nombre_empresa VARCHAR(100) NOT NULL,
rubro_empresa VARCHAR(100) NOT NULL
);
GO

-- 9) TABLA DE HECHOS PAQUETE_TRABAJO
CREATE TABLE paquete_trabajo (
id_paquete INT PRIMARY KEY,
id_tiempo_fk INT NOT NULL,
id_proyecto_fk INT NOT NULL,
id_cliente_fk INT NOT NULL,
id_localidad_fk INT NOT NULL,
id_responsable_fk INT NOT NULL,
id_empresa_fk INT NOT NULL,
cantidad_paquetes INT NOT NULL,
costo_total DECIMAL(12,2) NOT NULL,
FOREIGN KEY (id_tiempo_fk) REFERENCES tiempo(id_tiempo),
FOREIGN KEY (id_proyecto_fk) REFERENCES proyecto(id_proyecto),
FOREIGN KEY (id_cliente_fk) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_localidad_fk) REFERENCES localidad(id_localidad),
FOREIGN KEY (id_responsable_fk) REFERENCES responsable(id_responsable),
FOREIGN KEY (id_empresa_fk) REFERENCES empresa(id_empresa)
);
GO
