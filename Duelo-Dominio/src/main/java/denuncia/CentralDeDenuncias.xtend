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
			var Denuncia denunciaNueva = new AbusoDelSistemaDeDenuncias()
			denuncia.setDescripcion("El jugador intenta denunciar a: " + jugadorDenunciado.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificaci�n suficiente: " + denuncia.getDescripcion())
			jugadorDenunciante.agregarNuevaDenuncia(denunciaNueva)	
			
			jugadorDenunciante.actualizarPuntaje()
			this.sistemaAlQuePertenece.actualizarRanking()
		}
	}
}