package ecommerce.example.demo.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ecommerce.example.demo.models.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}