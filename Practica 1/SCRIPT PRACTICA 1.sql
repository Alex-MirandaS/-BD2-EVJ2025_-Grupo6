CREATE DATABASE hotel_reservas;
USE hotel_reservas;

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150),
    correo VARCHAR(75),
    telefono VARCHAR(8)
);

-- Tabla HABITACION
CREATE TABLE HABITACION (
    id_habitacion INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45),
    precio DECIMAL(10,2)
);

-- Tabla RESERVA
CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fecha_entrada DATETIME,
    fecha_salida DATETIME,
    CLIENTE_id_cliente INT,
    HABITACION_id_habitacion INT,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (HABITACION_id_habitacion) REFERENCES HABITACION(id_habitacion)
);

-- Tabla PAGO
CREATE TABLE PAGO (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    fecha_pago DATETIME,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(25),
    RESERVA_id_reserva INT,
    EMPLEADO_id_empleado INT,
    FOREIGN KEY (RESERVA_id_reserva) REFERENCES RESERVA(id_reserva)
    -- Nota: Falta tabla EMPLEADO para poder enlazar la clave foránea
);

-- Tabla LOG_HABITACION
CREATE TABLE LOG_HABITACION (
    timestamp DATETIME,
    status VARCHAR(100),
    HABITACION_id_habitacion INT,
    FOREIGN KEY (HABITACION_id_habitacion) REFERENCES HABITACION(id_habitacion)
);