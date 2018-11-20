import publicacion.*

class Usuario {

	var property amigos = [] // lista de Usuarios
	var property meGusta = [] // lista de publicaciones
	var property amigosListaBlanca = [] // Lista de Usuarios
	var property publicaciones = []

	method darMG(publicacion) {
		meGusta.add(publicacion)
		publicacion.meGusta().add(self)
	}

	method esAmigoDe(usuario) = amigos.contains(usuario)

}

