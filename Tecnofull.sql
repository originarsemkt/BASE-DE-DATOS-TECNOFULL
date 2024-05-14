create database Tecnofull;
use Tecnofull;

-- Tabla Cliente
CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento VARCHAR(100),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Transporte
CREATE TABLE Transporte (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TipoTransporte VARCHAR(100),
    Descripción TEXT,
    Costo DECIMAL(10, 2)
);

-- tablas referenciadas
CREATE TABLE CategoríaProducto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Marca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Modelo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

 -- Tabla Producto
CREATE TABLE Producto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Precio DECIMAL(10, 2),
    CategoríaID INT,
    MarcaID INT,
    ModeloID INT,
    FOREIGN KEY (CategoríaID) REFERENCES CategoríaProducto(ID),
    FOREIGN KEY (MarcaID) REFERENCES Marca(ID),
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ID)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Costo DECIMAL(10, 2)
);

-- Tabla Sucursal
CREATE TABLE Sucursal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Dueño
CREATE TABLE Dueño (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Encargado
CREATE TABLE Encargado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    SucursalID INT,
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100),
    FOREIGN KEY (SucursalID) REFERENCES Sucursal(ID)
);

CREATE TABLE DetalleCompra (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    FechaCompra DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ID)
);

CREATE TABLE DetalleServicio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ServicioID INT,
    Descripción TEXT,
    Costo DECIMAL(10, 2),
    FechaServicio DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (ServicioID) REFERENCES Servicio(ID)
);

CREATE TABLE DetalleEnvío (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    TransporteID INT,
    DirecciónEntrega VARCHAR(255),
    FechaEnvío DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (TransporteID) REFERENCES Transporte(ID)
);


