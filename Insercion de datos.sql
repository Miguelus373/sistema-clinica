-- Insertar habitaciones
INSERT INTO Habitacion (piso, codigo) VALUES 
(1, 'H101'),
(1, 'H102'),
(2, 'H201'),
(2, 'H202'),
(3, 'H301');

-- Insertar médicos
INSERT INTO Medico (cedula, nombre, apellido, especialidad, colegiatura, telefono, email) VALUES 
('123456789', 'Juan', 'Pérez', 'Pediatría', 'C001', '555-1234', 'juan.perez@hospital.com'),
('987654321', 'Maria', 'Gómez', 'Cardiología', 'C002', '555-5678', 'maria.gomez@hospital.com'),
('456789123', 'Luis', 'Martínez', 'Dermatología', 'C003', '555-8765', 'luis.martinez@hospital.com'),
('789123456', 'Ana', 'Lopez', 'Ginecología', 'C004', '555-4321', 'ana.lopez@hospital.com'),
('321654987', 'Carlos', 'Hernández', 'Neurología', 'C005', '555-1357', 'carlos.hernandez@hospital.com');

-- Insertar pacientes
INSERT INTO Paciente (cedula, nombre, apellido, direccion, fecha_nacimiento, telefono, email, genero, estado_civil) VALUES 
('111222333', 'Pedro', 'Alvarez', 'Calle 1', '1990-01-15', '555-1111', 'pedro.alvarez@paciente.com', 'Masculino', 'Soltero'),
('222333444', 'Laura', 'Fernandez', 'Calle 2', '1985-02-20', '555-2222', 'laura.fernandez@paciente.com', 'Femenino', 'Casada'),
('333444555', 'Jorge', 'Soto', 'Calle 3', '1978-03-25', '555-3333', 'jorge.soto@paciente.com', 'Masculino', 'Divorciado'),
('444555666', 'Ana', 'Torres', 'Calle 4', '1995-04-30', '555-4444', 'ana.torres@paciente.com', 'Femenino', 'Soltera'),
('555666777', 'Luis', 'García', 'Calle 5', '1980-05-05', '555-5555', 'luis.garcia@paciente.com', 'Masculino', 'Viudo'),
('666777888', 'Sofia', 'Jiménez', 'Calle 6', '1988-06-15', '555-6666', 'sofia.jimenez@paciente.com', 'Femenino', 'Soltera'),
('777888999', 'Fernando', 'Castro', 'Calle 7', '1992-07-20', '555-7777', 'fernando.castro@paciente.com', 'Masculino', 'Soltero'),
('888999000', 'María', 'Vásquez', 'Calle 8', '1983-08-25', '555-8888', 'maria.vasquez@paciente.com', 'Femenino', 'Casada'),
('999000111', 'Diego', 'Ramos', 'Calle 9', '1996-09-30', '555-9999', 'diego.ramos@paciente.com', 'Masculino', 'Soltero'),
('000111222', 'Natalia', 'Morales', 'Calle 10', '1989-10-10', '555-1010', 'natalia.morales@paciente.com', 'Femenino', 'Divorciada');

-- Insertar consultas
INSERT INTO Consulta (fecha, hora, motivo, paciente_id, medico_id) VALUES 
('2025-04-05', '09:00:00', 'Control de rutina', 1, 1),
('2025-04-06', '10:00:00', 'Dolor de cabeza', 2, 2),
('2025-04-07', '11:00:00', 'Revisión dermatológica', 3, 3),
('2025-04-08', '14:00:00', 'Chequeo ginecológico', 4, 4),
('2025-04-09', '15:00:00', 'Consulta neurológica', 5, 5);

-- Insertar medicamentos
INSERT INTO Medicamento (nombre, descripcion, vencimiento, disponibilidad) VALUES 
('Paracetamol', 'Analgésico y antipirético', '2026-12-31', 100),
('Ibuprofeno', 'Antiinflamatorio', '2025-11-30', 50),
('Amoxicilina', 'Antibiótico', '2026-05-15', 75),
('Loratadina', 'Antihistamínico', '2025-08-20', 120),
('Metformina', 'Antidiabético', '2026-02-28', 30);

-- Insertar hospitalizaciones
INSERT INTO Hospitalizacion (fecha_ingreso, fecha_alta, medico_id, paciente_id, habitacion_id) VALUES 
('2025-04-01', '2025-04-03', 1, 1, 1),
('2025-04-02', NULL, 2, 2, 2),
('2025-04-03', '2025-04-04', 3, 3, 3),
('2025-04-04', NULL, 4, 4, 4),
('2025-04-05', NULL, 5, 5, 5);

-- Insertar medicaciones
INSERT INTO Medicacion (fecha_administracion, medicamento_id, paciente_id) VALUES 
('2025-04-01', 1, 1),
('2025-04-02', 2, 2),
('2025-04-03', 3, 3),
('2025-04-04', 4, 4),
('2025-04-05', 5, 5);

-- Insertar facturas
INSERT INTO Factura (fecha_emision, estado, paciente_id) VALUES 
('2025-04-05', 'Pendiente', 1),
('2025-04-06', 'Pagada', 2),
('2025-04-07', 'Pendiente', 3),
('2025-04-08', 'Pendiente', 4),
('2025-04-09', 'Pagada', 5);

-- Insertar items de factura (polimórfico)
INSERT INTO ItemFactura (factura_id, id_item, tipo_item, paciente_id) VALUES 
(1, 1, 'Consulta', 1),
(1, 1, 'Medicamento', 1),
(2, 2, 'Consulta', 2),
(3, 3, 'Consulta', 3),
(4, 4, 'Consulta', 4),
(5, 5, 'Consulta', 5);