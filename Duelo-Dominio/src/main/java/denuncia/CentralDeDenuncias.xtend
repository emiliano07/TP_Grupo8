package denuncia

import sistema.Jugador

class CentralDeDenuncias {
	
	def void analizarDenuncia(Jugador jugadorDenunciante, Jugador jugadorDenunciado, Denuncia denuncia) {
		if(denuncia.esValida())
			jugadorDenunciado.agregarNuevaDenuncia(denuncia)
		else
			jugadorDenunciante.agregarNuevaDenuncia(new AbusoDelSistemaDeDenuncias("El jugador intenta denunciar a: " + jugadorDenunciado.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificación suficiente: " + denuncia.getDescripcion()))	
	}
}