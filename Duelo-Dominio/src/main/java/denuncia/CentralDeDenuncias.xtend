package denuncia

import sistema.Jugador
import sistema.Sistema

class CentralDeDenuncias {
	
	var Sistema sistemaAlQuePertenece
	
	def void analizarDenuncia(Jugador jugadorDenunciante, Jugador jugadorDenunciado, Denuncia denuncia) {
		if(denuncia.esValida()){
			jugadorDenunciado.agregarNuevaDenuncia(denuncia)
			jugadorDenunciado.actualizarPuntaje()
			this.sistemaAlQuePertenece.actualizarRanking()
		}
		else{
			jugadorDenunciante.agregarNuevaDenuncia(new AbusoDelSistemaDeDenuncias("El jugador intenta denunciar a: " + jugadorDenunciado.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificaci�n suficiente: " + denuncia.getDescripcion()))	
			jugadorDenunciante.actualizarPuntaje()
			this.sistemaAlQuePertenece.actualizarRanking()
		}
	}
}