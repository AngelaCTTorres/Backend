document.getElementById('userForm').addEventListener('submit', function(event) {
       event.preventDefault(); // Evita el envío del formulario
   
       const nombre = document.getElementById('nombre').value;
       const email = document.getElementById('email').value;
       const contrasena = document.getElementById('contrasena').value;
       const direccion = document.getElementById('direccion').value;
       const telefono = document.getElementById('telefono').value;
   
       // Crear el objeto usuario con los datos del formulario
       const usuario = {
           nombre: nombre,
           email: email,
           contrasena: contrasena,
           direccion: direccion,
           telefono: telefono
       };
   
       // Realizar la solicitud POST al backend (API)
       fetch('http://localhost:8080/usuarios', {
           method: 'POST',
           headers: {
               'Content-Type': 'application/json'
           },
           body: JSON.stringify(usuario) // Convertir el objeto a JSON
       })
       .then(response => response.json())
       .then(data => {
           console.log('Usuario creado:', data);
           alert('Usuario creado exitosamente');
       })
       .catch(error => {
           console.error('Error:', error);
           alert('Error al crear usuario');
       });
   });
   