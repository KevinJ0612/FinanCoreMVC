CREATE DATABASE BD_FinanCore;
GO
USE BD_FinanCore;
GO

-- 1. Tabla de Usuarios del Sistema (Ejecutivos y Clientes)
CREATE TABLE tb_usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    nombre_completo NVARCHAR(120) NOT NULL,
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('EJECUTIVO', 'CLIENTE')),
    id_cliente INT NULL , -- Nulo si es empleado del banco
    estado BIT NOT NULL DEFAULT 1
);
-- 2. Tabla de Clientes del Banco
CREATE TABLE tb_clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    dni CHAR(8) NOT NULL UNIQUE,
    nombres NVARCHAR(80) NOT NULL,
    apellidos NVARCHAR(80) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15) NULL,
    score_crediticio INT NOT NULL DEFAULT 700 CHECK (score_crediticio BETWEEN 0 AND 1000),
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE(),
    estado BIT NOT NULL DEFAULT 1
);