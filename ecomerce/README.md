Proyecto E-commerce con Java Spring Boot y MySQL
Este proyecto es una aplicación CRUD básica para gestionar usuarios en un sistema de e-commerce utilizando Spring Boot, MySQL y Postman para pruebas.

Requisitos Previos
Antes de comenzar, asegúrate de tener instalados los siguientes programas en tu sistema:

Java 17
Maven
MySQL
Postman
Spring Boot CLI (opcional)
Configuración del Proyecto
1. Crear la Base de Datos en MySQL
Primero, debemos crear la base de datos en MySQL. Puedes hacerlo usando MySQL Workbench o la terminal de MySQL.

Ejecuta los siguientes comandos:

sql
Copiar código
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
2. Configurar el Proyecto Spring Boot
2.1. Crear el Proyecto
Para crear el proyecto, puedes usar Spring Initializr con las siguientes dependencias:

Spring Web: Para crear la API REST.
Spring Data JPA: Para la integración con JPA y manipular datos.
MySQL Driver: Para conectar el proyecto con la base de datos MySQL.
Configura el proyecto con:
Group: com.example
Artifact: ecommerce
Packaging: jar
Java Version: 17
Descarga el proyecto y descomprímelo.
2.2. Configuración del Archivo application.properties
En el directorio src/main/resources, encuentra el archivo application.properties y añade la configuración de la base de datos MySQL:

properties
Copiar código
# Configuración de MySQL
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce_db
spring.datasource.username=root
spring.datasource.password=your_password

# Configuración de Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
3. Creación de Entidades
En el directorio src/main/java/com/example/ecommerce/models, crea una clase Usuario como la siguiente:

java
Copiar código
package com.example.ecommerce.models;

import jakarta.persistence.*;

@Entity
@Table(name = "usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private String email;
    private String contrasena;
    private String direccion;
    private String telefono;

    // Getters y Setters
}
4. Creación del CRUD
4.1. Repositorio
En el directorio src/main/java/com/example/ecommerce/repositories, crea la interfaz UsuarioRepository:

java
Copiar código
package com.example.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.ecommerce.models.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
4.2. Servicio
En el directorio src/main/java/com/example/ecommerce/services, crea la clase UsuarioService:

java
Copiar código
package com.example.ecommerce.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.ecommerce.models.Usuario;
import com.example.ecommerce.repositories.UsuarioRepository;
import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    public Usuario createUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario updateUsuario(Long id, Usuario usuario) {
        Usuario existingUsuario = usuarioRepository.findById(id).orElse(null);
        if (existingUsuario != null) {
            existingUsuario.setNombre(usuario.getNombre());
            existingUsuario.setEmail(usuario.getEmail());
            existingUsuario.setContrasena(usuario.getContrasena());
            existingUsuario.setDireccion(usuario.getDireccion());
            existingUsuario.setTelefono(usuario.getTelefono());
            return usuarioRepository.save(existingUsuario);
        }
        return null;
    }

    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }
}
4.3. Controlador
En el directorio src/main/java/com/example/ecommerce/controllers, crea la clase UsuarioController:

java
Copiar código
package com.example.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.ecommerce.models.Usuario;
import com.example.ecommerce.services.UsuarioService;
import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public List<Usuario> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    @PostMapping
    public Usuario createUsuario(@RequestBody Usuario usuario) {
        return usuarioService.createUsuario(usuario);
    }

    @PutMapping("/{id}")
    public Usuario updateUsuario(@PathVariable Long id, @RequestBody Usuario usuario) {
        return usuarioService.updateUsuario(id, usuario);
    }

    @DeleteMapping("/{id}")
    public void deleteUsuario(@PathVariable Long id) {
        usuarioService.deleteUsuario(id);
    }
}
5. Pruebas con Postman
Puedes realizar pruebas en Postman para verificar las operaciones CRUD.

5.1. Crear Usuario (POST)
URL: http://localhost:8080/usuarios
Método: POST
Body: JSON (raw)
json
Copiar código
{
  "nombre": "Juan Perez",
  "email": "juan.perez@example.com",
  "contrasena": "12345",
  "direccion": "Calle Falsa 123",
  "telefono": "555-1234"
}
5.2. Obtener Usuarios (GET)
URL: http://localhost:8080/usuarios
Método: GET
5.3. Actualizar Usuario (PUT)
URL: http://localhost:8080/usuarios/{id}
Método: PUT
Body: JSON (raw)
json
Copiar código
{
  "nombre": "Juan Perez",
  "email": "juan.perez@example.com",
  "contrasena": "nueva_contrasena",
  "direccion": "Nueva Calle 456",
  "telefono": "555-5678"
}
5.4. Eliminar Usuario (DELETE)
URL: http://localhost:8080/usuarios/{id}
Método: DELETE
6. Diagrama de Clases
Este proyecto está diseñado para un sistema e-commerce con las siguientes entidades:

Usuario
Carro de Compras
Cliente
Detalles del Pedido
Orden
Puedes expandir las funcionalidades de este proyecto agregando más entidades y relaciones en el futuro.

