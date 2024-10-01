package ecommerce.example.demo.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import ecommerce.example.demo.models.Usuario;
import ecommerce.example.demo.services.UsuarioService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
@CrossOrigin(origins = "http://127.0.0.1:5500") 
@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // Método para obtener todos los usuarios (GET)
    @GetMapping
    public Iterable<Usuario> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Método para crear un nuevo usuario (POST)
    @PostMapping
    public Usuario createUsuario(@RequestBody Usuario usuario) {
        return usuarioService.createUsuario(usuario);
    }

    // Método para actualizar un usuario existente (PUT)
    @PutMapping("/{id}")
    public Usuario updateUsuario(@PathVariable Long id, @RequestBody Usuario usuario) {
        Optional<Usuario> usuarioExistente = usuarioService.getUsuarioById(id);

        if (usuarioExistente.isPresent()) {
            Usuario u = usuarioExistente.get();
            u.setNombre(usuario.getNombre());
            u.setEmail(usuario.getEmail());
            u.setContrasena(usuario.getContrasena());
            u.setDireccion(usuario.getDireccion());
            u.setTelefono(usuario.getTelefono());

            return usuarioService.updateUsuario(u);
        } else {
            return null;  // Manejo del error en caso de que el usuario no exista.
        }
    }

    // Método para eliminar un usuario existente (DELETE)
    @DeleteMapping("/{id}")
    public void deleteUsuario(@PathVariable Long id) {
        usuarioService.deleteUsuario(id);
    }
}

