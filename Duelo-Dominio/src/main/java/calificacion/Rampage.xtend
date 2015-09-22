package calificacion

import juego.Estadisticas

class Rampage extends Calificacion {
	
	/*
	Rampage:
	Es cuando tiene experiencia en al menos 5 Duelos jugando con el Personaje en su Posición ideal 
	y además saco un número al azar mayor a 90 
	*/
	
	new(){
		super("Rampage",100)
	}
	
	override puedeActualizar(Estadisticas estadisticas) {
		var int numero = Math.round(Math.random()*101).intValue
		if(estadisticas.luchoCantidadDeVecesEnPosicion(estadisticas.personajeAlQuePertenece.getPosicionIdeal()) >= 5  && numero > 90)
			return true
		return false
	}
}