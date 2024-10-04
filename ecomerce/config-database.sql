CREATE DATABASE ecommerce_db
USE ecommerce_db
CREATE TABLE usuario
mysql> CREATE TABLE  books 
    -> ( id INT AUTO_INCREMENT NOT NULL,
    -> name VARCHAR(60),
    ->email VARCHAR(60),
    -> contraseña INT,
    -> direccion VARCHAR(60),
     -> telefono INT,
    -> PRIMARY KEY(id));


CREATE TABLE carritodecompras (
    cartId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    cantidad INT
    
);

CREATE TABLE Cliente (
  clienteId INT AUTO_INCREMENT PRIMARY KEY,
  billingAddress VARCHAR(255),
  shippingAddress VARCHAR(255)
);
CREATE TABLE Pedidos (
  pedidoId INT AUTO_INCREMENT PRIMARY KEY,
  clienteId INT,
  orderDate DATE,
  status VARCHAR(50),
  FOREIGN KEY (clienteId) REFERENCES Cliente(clienteId)
);
CREATE TABLE DetallesPedido (
  detalleId INT AUTO_INCREMENT PRIMARY KEY,
  pedidoId INT,
  productId INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (pedidoId) REFERENCES Pedidos(pedidoId)
);

