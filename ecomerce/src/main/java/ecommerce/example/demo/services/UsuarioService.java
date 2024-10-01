package ecommerce.example.demo.services;



import ecommerce.example.demo.models.Usuario;
import ecommerce.example.demo.repositories.UsuarioRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    // Método para obtener todos los usuarios
    public Iterable<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por ID
    public Optional<Usuario> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para crear un nuevo usuario
    public Usuario createUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para actualizar un usuario existente
    public Usuario updateUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario existente
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }
}


