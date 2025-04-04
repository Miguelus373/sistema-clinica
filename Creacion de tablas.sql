-- Tabla Personal
CREATE TABLE Personal (
  id SERIAL PRIMARY KEY,
  cedula VARCHAR(20) UNIQUE NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  telefono VARCHAR(15),
  departamento VARCHAR(50),
  email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Médico
CREATE TABLE Medico (
  id SERIAL PRIMARY KEY,
  cedula VARCHAR(20) UNIQUE NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  especialidad VARCHAR(50) NOT NULL,
  colegiatura VARCHAR(20) UNIQUE NOT NULL,
  telefono VARCHAR(15),
  email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Paciente
CREATE TABLE Paciente (
  id SERIAL PRIMARY KEY,
  cedula VARCHAR(20) UNIQUE NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  direccion VARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  telefono VARCHAR(15),
  email VARCHAR(100) UNIQUE NOT NULL,
  genero VARCHAR(10),
  estado_civil VARCHAR(20)
);

-- Tabla Consulta
CREATE TABLE Consulta (
  id SERIAL PRIMARY KEY,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  motivo VARCHAR(255) NOT NULL,
  paciente_id INT,
  medico_id INT,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(id) ON DELETE CASCADE,
  FOREIGN KEY (medico_id) REFERENCES Medico(id) ON DELETE CASCADE
);

-- Tabla Medicamento
CREATE TABLE Medicamento (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  vencimiento DATE NOT NULL,
  disponibilidad INT NOT NULL
);

-- Tabla Habitación
CREATE TABLE Habitacion (
  id SERIAL PRIMARY KEY,
  piso INT,
  codigo VARCHAR(20) UNIQUE NOT NULL
);

-- Tabla Hospitalización
CREATE TABLE Hospitalizacion (
  id SERIAL PRIMARY KEY,
  fecha_ingreso DATE NOT NULL,
  fecha_alta DATE,
  medico_id INT,
  paciente_id INT,
  habitacion_id INT,
  FOREIGN KEY (medico_id) REFERENCES Medico(id) ON DELETE CASCADE,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(id) ON DELETE CASCADE,
  FOREIGN KEY (habitacion_id) REFERENCES Habitacion(id) ON DELETE CASCADE
);

-- Tabla Medicación
CREATE TABLE Medicacion (
  id SERIAL PRIMARY KEY,
  fecha_administracion DATE NOT NULL,
  medicamento_id INT,
  paciente_id INT,
  FOREIGN KEY (medicamento_id) REFERENCES Medicamento(id) ON DELETE CASCADE,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(id) ON DELETE CASCADE
);

-- Tabla Factura
CREATE TABLE Factura (
  id SERIAL PRIMARY KEY,
  fecha_emision DATE NOT NULL,
  estado VARCHAR(20) NOT NULL,
  paciente_id INT,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(id) ON DELETE CASCADE
);

-- Tabla ItemFactura
CREATE TABLE ItemFactura (
  id SERIAL PRIMARY KEY,
  factura_id INT,
  id_item INT NOT NULL,
  tipo_item VARCHAR(50) NOT NULL,
  paciente_id INT,
  FOREIGN KEY (factura_id) REFERENCES Factura(id) ON DELETE CASCADE,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(id) ON DELETE CASCADE
);