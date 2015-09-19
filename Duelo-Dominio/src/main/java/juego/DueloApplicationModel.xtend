package juego

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DueloApplicationModel {
	
	Duelo duelo
	
	new(Duelo duelo) {
		this.duelo = duelo
	}
	
	def String getRetador() {
		this.duelo.jugador1.nombre
	}
	
	def String getRetado() {
		this.duelo.jugador2.nombre
	}
	
	def Estadisticas getEstadisticasRetado(){
		this.duelo.personaje2.estadisticas
	}
	
	def Estadisticas getEstadisticasRetador(){
		this.duelo.personaje1.estadisticas
	}
	
}