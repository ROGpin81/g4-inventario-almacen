-- DDL 
CREATE database G4Inventario_Almacen;

USE G4Inventario_Almacen;

CREATE TABLE `Usuarios` (
  `id_usuario` INT AUTO_INCREMENT,
  `nombre_completo` VARCHAR(80)NOT NULL,
  `email` VARCHAR(50)NOT NULL,
  `username` VARCHAR(30)NOT NULL,
  `rol` ENUM("Administrador", "Vendedor")NOT NULL,
  `estado` ENUM("Activo", "Inactivo")NOT NULL,
  PRIMARY KEY (`id_usuario`)
);
-- Comentario: almacena información de los usuarios del sistema.

CREATE TABLE `Categorias` (
  `Id_categoria` INT AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(100),
  PRIMARY KEY (`Id_categoria`)
);

-- Comentario: categorías de los productos.

CREATE TABLE `Proveedores` (
  `id_proveedor` INT AUTO_INCREMENT,
  `nombre_razonsocial` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(20),
  `email` VARCHAR(50),
  `direccion_ciudad` VARCHAR(100),
  PRIMARY KEY (`id_proveedor`)
);

-- Comentario: datos de proveedores

CREATE TABLE `Productos` (
  `Id_producto` INT AUTO_INCREMENT,
  `producto` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(120) ,
  `codigo` VARCHAR(120) NOT NULL,
  `precio_compra` VARCHAR(50) NOT NULL,
  `precio_venta` VARCHAR(50) NOT NULL,
  `stock_min` VARCHAR(50) NOT NULL,
  `estado` BOOLEAN NOT NULL,
  `id_categoria` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`Id_producto`),
  FOREIGN KEY (`id_categoria`)
      REFERENCES `Categorias`(`Id_categoria`),
  FOREIGN KEY (`id_proveedor`)
      REFERENCES `Proveedores`(`id_proveedor`)
);

-- Comentario: almacenamiento de todos los productos.

CREATE TABLE `Movimientosinventario` (
  `id_movimiento` INT AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `tipo_movimiento` ENUM("E", "S") NOT NULL, -- E:Entrda | S:Salida
  `cantidad` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `observaciones` VARCHAR(150),
  PRIMARY KEY (`id_movimiento`),
  FOREIGN KEY (`id_producto`)
      REFERENCES `Productos`(`Id_producto`),
  FOREIGN KEY (`id_usuario`)
      REFERENCES `Usuarios`(`id_usuario`)
);
-- Comentario: entradas y salidas de inventario.

CREATE TABLE `Devoluciones` (
  `id_devolucion` INT AUTO_INCREMENT,
  `id_movimiento` INT,
  `motivo` VARCHAR(150) NOT NULL,
  `tipo_devolucion` VARCHAR(20) NOT NULL,
  `fecha_devolucion` DATETIME NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `referencia_documento` VARCHAR(50),
  PRIMARY KEY (`id_devolucion`),
  FOREIGN KEY (`id_movimiento`)
      REFERENCES `Movimientosinventario`(`id_movimiento`)
);
-- Comentario: devoluciones asociadas a movimientos.

