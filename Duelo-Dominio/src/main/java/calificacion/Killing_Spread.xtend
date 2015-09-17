package calificacion

import java.util.Random
import juego.Personaje

	class Killing_Spread extends Calificacion {
	
	new(){
		super(60)
	}
	
	override actualizar(Personaje personaje) {
		var int numero = new Random(100).nextInt
		if(personaje.getEstadisticas().luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(personaje.getPosicionIdeal()) >= 2 && numero > 50)
			return this
		return null
	}
}

//Killing_Spread es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal y además saco un numero al azar mayor a 50
