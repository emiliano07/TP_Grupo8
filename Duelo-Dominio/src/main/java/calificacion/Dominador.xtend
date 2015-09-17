package calificacion

import java.util.Random
import juego.Personaje

class Dominador extends Calificacion {
	
	new(){
		super(75)
	}
	
	override actualizar(Personaje personaje) {
		var int numero = new Random(100).nextInt
		if(personaje.getEstadisticas().luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(personaje.getPosicionIdeal()) >= 2 && numero > 70)
			return this
		return null
	}
}

//Dominador es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal y además saco un numero al azar mayor a 70
