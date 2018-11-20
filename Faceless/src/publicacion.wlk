class Publicacion {

	const property espacio
	var property permiso
	var property meGusta = [] // lista de Usuarios
	var property autor

	method puedeVerPublicacion(usuario) {
		return permiso.puedeVer(usuario)
	}

}

class Foto inherits Publicacion {

	var property compresion = 0.7
	const property ancho
	const property alto

	override method espacio() = alto * ancho * compresion

}

class Texto inherits Publicacion {

	const property caracteres

	override method espacio() = caracteres

}

class Video inherits Publicacion {

	const property duracion
	var property calidad

	override method espacio() = calidad

}

class VideoCalidadNormal inherits Video {

	override method calidad() = duracion

}

class VideoCalidadHD inherits Video {

	override method calidad() = duracion * 3

}

