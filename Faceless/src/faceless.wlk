import publicacion.*
import Usuarios.*
import permisos.*

object faceless {

	var gente = []

//1. Saber cuánto espacio ocupa el total de las publicaciones de un usuario.
	method espacioPublicaciones(usuario) = usuario.publicaciones().map({ publicacion => publicacion.espacio() }).sum()

//2 Poder darle me gusta a una publicación, y conocer cuántas veces fue votada de esta forma.
	method cantidadMG(publicacion) = publicacion.meGusta().size()

//3. Saber si un usuario es más amistoso que otro: esto ocurre cuando tiene más amigos
	method elMasAmistoso(usuario1, usuario2) = if (usuario1.amigos().size() > usuario2.amigos().size()) usuario1 else {
		usuario2
	}

//4. Saber si un usuario puede ver una publicacion (porque tiene permisos).
	method puedeVerPublicacion(usuario, publicacion) {
		return publicacion.puedeVerPublicacion(usuario)
	}

//5. Determinar los mejores amigos de un usuario. Esto es, según la gente de faceless,
//el conjunto de sus amigos que pueden ver todas sus publicaciones.
	method puedeVerTodas(usuario, publicacion) { // amigos que puede ver una publicacion
		return usuario.amigos().all({ amigo => self.puedeVerPublicacion(amigo, publicacion) })
	}//probar de pasar este metodo a usuario y dejar el de abajo

	// lista de amigos ue pueden ver todas mis publicaciones
	method mejoresAmigos(usuario) {
		return usuario.publicaciones().filter({ publicacion => self.puedeVerTodas(usuario, publicacion) })
	// return usuario.publicaiones().filter({publicacion => publicacion.puedeVerTodas(usuario)})
	}

}

//6. Saber cual es el amigo más popular que tiene un usuario. Es decir, el amigo que
//tiene mas me gusta entre todas sus publicaciones.
//7. Saber si un usuario stalkea a otro. Lo cual ocurre si el stalker le dio me gusta a
//más del 90 % de sus publicaciones.
