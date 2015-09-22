package calificacion

import juego.Estadisticas

class Killing_Spread extends Calificacion {
	
	/*
	Killing_Spread: 
	Es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal 
	y además saco un número al azar mayor a 50
	*/
	
	new(){
		super("Killing_Spread",60)
	}
	
	override puedeActualizar(Estadisticas estadisticas) {
		var int numero = Math.round(Math.random()*101).intValue
		if(estadisticas.luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(estadisticas.personajeAlQuePertenece.getPosicionIdeal()) >= 2 && numero > 50)
			return true
		return false
	}
}