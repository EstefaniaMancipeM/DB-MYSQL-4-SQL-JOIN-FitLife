CREATE TABLE miembros (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    membresia_activa BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE planes (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    duracion_dias INTEGER NOT NULL,
    precio_mensual NUMERIC(10,2) NOT NULL
);
CREATE TABLE instructores (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(30),
    email VARCHAR(150) UNIQUE,
    activo BOOLEAN DEFAULT TRUE
);
CREATE TABLE clases (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_minutos INTEGER NOT NULL,
    capacidad_maxima INTEGER NOT NULL CHECK (capacidad_maxima > 0),
    instructor_id INTEGER NOT NULL, FOREIGN KEY (instructor_id) REFERENCES instructores(id)
);
CREATE TABLE membresias (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    miembro_id INTEGER NOT NULL, FOREIGN KEY (miembro_id) REFERENCES miembros(id),
    plan_id INTEGER NOT NULL, FOREIGN KEY (plan_id) REFERENCES planes(id),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    pago_realizado BOOLEAN NOT NULL
);
CREATE TABLE inscripciones_clases (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    miembro_id INTEGER NOT NULL, FOREIGN KEY (miembro_id) REFERENCES miembros(id),
    clase_id INTEGER NOT NULL, FOREIGN KEY (clase_id) REFERENCES clases(id),
    fecha_inscripcion TIMESTAMP NOT NULL,
    asistio BOOLEAN NOT NULL,
    UNIQUE (miembro_id, clase_id)
);

INSERT INTO miembros (nombre, email, membresia_activa) VALUES
('Laura Torres', 'laura@example.com', TRUE),
('Daniel Rojas', 'daniel@example.com', TRUE),
('Sofia Ruiz', 'sofia@example.com', FALSE),
('Andres Mora', 'andres@example.com', TRUE),
('Valentina Leon', 'valentina@example.com', TRUE),
('Camila Lopez', 'camila@example.com', FALSE);
INSERT INTO planes (nombre, descripcion, duracion_dias, precio_mensual) VALUES
('Básico', 'Pesas y cardio', 30, 89900),
('Plus', 'Pesas, cardio y clases', 60, 129900),
('Premium', 'Clases y entrenamiento personalizado', 90, 199900);
INSERT INTO instructores (nombre, especialidad, email, activo) VALUES
('Natalia Perez', 'CrossFit', 'natalia@example.com', TRUE),
('Mateo Gomez', 'Yoga', 'mateo@example.com', TRUE),
('Juliana Castro', 'Spinning', 'juliana@example.com', FALSE),
('Felipe Diaz', 'Funcional', 'felipe@example.com', TRUE),
('Paula Vera', 'Yoga', 'paula@example.com', TRUE);
INSERT INTO clases (nombre, descripcion, duracion_minutos, capacidad_maxima, instructor_id) VALUES
('CrossFit Matutino', 'Entrenamiento de la mañana', 60, 20, 1),
('Yoga para principiantes', 'Movilidad y respiración', 45, 15, 2),
('Spinning Intensivo', 'Bicicleta estática', 50, 18, 3),
('Funcional Express', 'Circuito corto', 30, 12, 4);
INSERT INTO membresias (miembro_id, plan_id, fecha_inicio, fecha_fin, pago_realizado) VALUES
(1, 3, '2026-09-01', '2026-11-30', TRUE),
(2, 2, '2026-09-01', '2026-10-31', FALSE),
(3, 1, '2025-01-01', '2025-01-31', TRUE),
(4, 3, '2026-09-01', '2026-11-30', TRUE),
(5, 1, '2026-09-01', '2026-09-30', FALSE);
INSERT INTO inscripciones_clases (miembro_id, clase_id, fecha_inscripcion, asistio) VALUES
(1, 1, '2026-09-01 08:00:00', TRUE),
(2, 1, '2026-09-01 09:00:00', FALSE),
(3, 1, '2026-09-02 08:00:00', TRUE),
(1, 2, '2026-09-02 09:00:00', TRUE),
(4, 2, '2026-09-03 08:00:00', FALSE),
(2, 3, '2026-09-03 09:00:00', FALSE);
