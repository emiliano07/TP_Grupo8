package calificacion

import java.util.Random
import juego.Personaje

class Rampage extends Calificacion {
	
	new(){
		super(100)
	}
	
	override actualizar(Personaje personaje) {
		var int numero = new Random(100).nextInt
		if(personaje.getEstadisticas().luchoCantidadDeVecesEnPosicion(personaje.getPosicionIdeal()) >= 5  && numero > 90)
			return this
		return null
	}
}

//Rampage es cuando tiene experiencia en al menos 5 Duelos jugando con el Personaje en su Posición ideal y además saco un numero al azar mayor a 90