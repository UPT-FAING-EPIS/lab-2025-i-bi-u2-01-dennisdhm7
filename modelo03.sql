-- ============================================================
-- Modelo Estrella (Ejercicio 03 – Gestión de proyectos)
-- ============================================================

CREATE TABLE tiempo (
  id_tiempo INT PRIMARY KEY,
  dia INT NOT NULL,
  mes INT NOT NULL,
  anio INT NOT NULL
);

CREATE TABLE pais (
  id_pais INT PRIMARY KEY,
  nombre_pais VARCHAR(100) NOT NULL
);

CREATE TABLE localidad (
  id_localidad INT PRIMARY KEY,
  nombre_localidad VARCHAR(100) NOT NULL,
  id_pais_fk INT NOT NULL,
  FOREIGN KEY (id_pais_fk) REFERENCES pais(id_pais)
);

CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(100) NOT NULL,
  telefono_cliente VARCHAR(50) NOT NULL,
  email_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE proyecto (
  id_proyecto INT PRIMARY KEY,
  nombre_proyecto VARCHAR(100) NOT NULL
);

CREATE TABLE responsable (
  id_responsable INT PRIMARY KEY,
  nombre_responsable VARCHAR(100) NOT NULL,
  cargo_responsable VARCHAR(100) NOT NULL
);

CREATE TABLE empresa (
  id_empresa INT PRIMARY KEY,
  nombre_empresa VARCHAR(100) NOT NULL,
  rubro_empresa VARCHAR(100) NOT NULL
);

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
