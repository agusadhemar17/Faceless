import publicacion.*

class Permiso {

	method puedeVer(usuario, publicacion) {
		return true
	}
	method agregarALista(usuario) {}
	method quitarDeLista(usuario) {}

}

class Publico inherits Permiso {

	override method puedeVer(usuario, publicacion) = true

}

class SoloAmigos inherits Permiso {

	override method puedeVer(usuario, publicacion) = usuario.amigos().contains(publicacion.autor())

}

class PrivadoConLista inherits Permiso{

	var lista = []

	method estaEnLista(usuario) = lista.contains(usuario)

	method noEstaEnLista(usuario) = not lista.contains(usuario)
	
	override method agregarALista(usuario){ lista.add(usuario)}
	override method quitarDeLista(usuario){  lista.remove(usuario)}

}

class PrivadoConListaBlanca inherits PrivadoConLista {

	override method puedeVer(usuario, publicacion) = self.estaEnLista(usuario)

} // los usuarios que pertenezcan a la lista pueden verla
// privado con lista negra: los usuarios que no pertenezcan a la lista pueden verla

object privadoConListaNegra inherits PrivadoConLista{

	override method puedeVer(usuario, publicacion) = self.noEstaEnLista(usuario)

}

