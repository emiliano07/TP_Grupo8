package denuncia

import juego.Jugador
import org.uqbar.commons.utils.Observable

@Observable
class CentralDeDenuncias {
	
	def Jugador denunciar(Denuncia denuncia) {
		var Jugador denunciado = null
		if(denuncia.esValida()){
			denunciado = denuncia.denunciado
			denunciado.agregarNuevaDenuncia(denuncia)
		}
		else{
			denunciado = denuncia.denunciante
			var Denuncia denunciaNueva = new AbusoDelSistemaDeDenuncias()
			denuncia.setDescripcion("El jugador intenta denunciar a: " + denuncia.denunciante.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificaci�n suficiente: " + denuncia.getDescripcion())
			denuncia.denunciante.agregarNuevaDenuncia(denunciaNueva)	
		}
		denunciado
	}
}