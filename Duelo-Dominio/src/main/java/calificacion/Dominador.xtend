package calificacion

import java.util.Random
import juego.Estadisticas

class Dominador extends Calificacion {
	
	/*
	Dominador:
	Es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal
	y además saco un número al azar mayor a 70
	*/
	
	new(){
		super("Dominador",75)
	}
	
	override puedeActualizar(Estadisticas estadisticas) {
		var int numero = new Random(100).nextInt
		if(estadisticas.luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(estadisticas.personajeAlQuePertenece.getPosicionIdeal()) >= 2 && numero > 70)
			return true
		return false
	}
}