package calificacion

import juego.Estadisticas

class Manco extends Calificacion {
	
	/*
	Manco:
	Es cuando tiene un Duelo realizado en la mejor posicion y además saco un número al azar mayor a 30
	*/
	
	new(){
		super("Manco",15)
	}
	
	override puedeActualizar(Estadisticas estadisticas) {
		var int numero = Math.round(Math.random()*101).intValue
		if(estadisticas.luchoCantidadDeVecesEnPosicion(estadisticas.personajeAlQuePertenece.getPosicionIdeal()) >= 1 && numero > 30)
			return true
		return false
	}
}